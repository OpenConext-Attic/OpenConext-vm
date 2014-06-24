#!/bin/sh
###########################
# Install ServiceRegistry #
###########################

if [ ! -h /opt/www/serviceregistry ]
then
    cd /opt/www/
    $GITCLONE https://github.com/OpenConext/OpenConext-serviceregistry.git
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
  cp $OC_BASEDIR/configs/surfconext/serviceregistry* /etc/surfconext/
  ln -sf /etc/surfconext/serviceregistry.module_janus.parameters.yml parameters.yml
  sed -i "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" /etc/surfconext/serviceregistry*.php
  sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" $OC_BASEDIR/configs/httpd/conf.d/serviceregistry.conf > \
    /etc/httpd/conf.d/serviceregistry.conf

  # Install EngineBlock's certificate for ServiceRegistry
  install -d  /etc/surfconext/serviceregistry-certs/
  cp /etc/surfconext/engineblock.crt /etc/surfconext/serviceregistry-certs/engineblock.crt

  # Create cache directories for ServiceRegistry
  echo "creating cache and log directories for SR"
  mkdir -p /tmp/janus/snapshots
  chown -R apache:apache /tmp/janus
  mkdir -p /var/cache/janus-ssp/janus
  chown -R apache:apache /var/cache/janus-ssp
  mkdir -p /var/log/janus-ssp/janus
  chown -R apache:apache /var/log/janus-ssp

  # selinux magic
  echo "allowing SR to write to cache and log directory"
  checkmodule -M -m -o $OC_BASEDIR/configs/selinux/ServiceRegistry.mod $OC_BASEDIR/configs/selinux/ServiceRegistry.te
  semodule_package -o $OC_BASEDIR/configs/selinux/ServiceRegistry.pp -m $OC_BASEDIR/configs/selinux/ServiceRegistry.mod
  semodule -i $OC_BASEDIR/configs/selinux/ServiceRegistry.pp

fi

./bin/composer.phar --prefer-dist --no-interaction install

# Perform database migration
./bin/migrate

#sometimes the permission are reset, because migrate runs as root
chown -R apache:apache /tmp/janus
chown -R apache:apache /var/log/janus-ssp
