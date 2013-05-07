#!/bin/sh
###########################
# Install ServiceRegistry #
###########################

if [ ! -h /opt/www/serviceregistry ]
then
    cd /opt/www/
    $GITCLONE git://github.com/OpenConext/OpenConext-serviceregistry.git
    ln -s OpenConext-serviceregistry serviceregistry
fi
cd /opt/www/serviceregistry
$GITRESET # revert potential changes
$GITFETCH
$GITCHECKOUT ${SERVICEREGISTRY_VERSION}


if ! $UPGRADE
then
  mysql -u root --password=c0n3xt -e "create database if not exists serviceregistry default charset utf8 default collate utf8_unicode_ci;"

  cat $OC_BASEDIR/data/serviceregistry.sql | \
    sed \
      -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" \
      -e "s~_OPENCONEXT_CERT_~$OC_CERT~" | \
    mysql -u root --password=c0n3xt serviceregistry

  if [ -f /etc/surfconext/serviceregistry.config.php ]
  then
    backupFile /etc/surfconext/serviceregistry.config.php
  fi
  cp $OC_BASEDIR/configs/surfconext/serviceregistry*.php /etc/surfconext/
  sed -i "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" /etc/surfconext/serviceregistry*.php
  sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" $OC_BASEDIR/configs/httpd/conf.d/serviceregistry.conf > \
    /etc/httpd/conf.d/serviceregistry.conf

  # Install EngineBlock's certificate for ServiceRegistry
  install -d  /etc/surfconext/serviceregistry-certs/
  cp /etc/surfconext/engineblock.crt /etc/surfconext/serviceregistry-certs/engineblock.crt

fi

cd /opt/www/serviceregistry/

if [[ "$OC_VERSION" == "v46" ]]
then
  # Apply fix for broken dbpatch in R46
  git cherry-pick -n 59df00dff1daef0cfeae72982471a687bf8fd9fb
fi
./bin/migrate

if [[ "$OC_VERSION" > "v47" ]]
then
  # Using composer, beginning with R48,
  cd modules/janus
  ./bin/composer.phar install
  # Restore SELinux labels, due to bug? in Composer (https://github.com/composer/composer/issues/1714)
  restorecon -r vendor
fi