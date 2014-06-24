#!/bin/bash
###########################
# Install ServiceRegistry #
###########################

if [ ! -h /opt/www/serviceregistry ]
then
    cd /opt/www/
    $GITCLONE $OC__SERVICEREGISTRY_REPO
    ln -s OpenConext-serviceregistry serviceregistry
fi
cd /opt/www/serviceregistry
$GITRESET # revert potential changes
$GITFETCH
$GITCHECKOUT ${SERVICEREGISTRY_VERSION}


if ! $UPGRADE
then
  mysql -u root --password=$OC__ROOT_DB_PASS -e "create database if not exists serviceregistry default charset utf8 default collate utf8_unicode_ci;"

  cat $OC_BASEDIR/data/serviceregistry.sql | \
    sed \
      -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" \
      -e "s~_OPENCONEXT_CERT_~$OC_CERT~" | \
    mysql -u root --password=$OC__ROOT_DB_PASS serviceregistry

  # Create serviceregistry user/pass
  mysql -uroot -p$OC__ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON serviceregistry.* TO $OC__SERVICEREGISTRY_DB_USER@localhost IDENTIFIED BY '$OC__SERVICEREGISTRY_DB_PASS'"
  echo "User for database 'serviceregistry' updated sucessfully"

  # Modify JANUS API access user for 'engine'
  mysql -uroot -p$OC__ROOT_DB_PASS -e "UPDATE serviceregistry.janus__user SET secret='$OC__ENGINE_JANUSAPI_PASS' WHERE userid='$OC__ENGINE_JANUSAPI_USER'"
  echo "User for JANUS API access from 'engine' updated sucessfully"

  # Modify JANUS API access user for 'api' ('api' is OpenConext API)
  mysql -uroot -p$OC__ROOT_DB_PASS -e "UPDATE serviceregistry.janus__user SET secret='$OC__API_JANUSAPI_PASS' WHERE userid='$OC__API_JANUSAPI_USER'"
  echo "User for JANUS API access from 'api' updated sucessfully"

  mysql -uroot -p$OC__ROOT_DB_PASS -e "FLUSH PRIVILEGES"

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

  # Use oc_config settings for admin passwd and secret salt for ssp
  sed -i "s/__OC__JANUSADMIN_PASS__/$OC__JANUSADMIN_PASS/g" /etc/surfconext/serviceregistry.config.php
  sed -i "s/__OC__JANUS_SECRETSALT__/$OC__JANUS_SECRETSALT/g" /etc/surfconext/serviceregistry.config.php

  # Use oc_config settings for timezone ssp
  sed -i "s|__OC__TIMEZONE__|$OC__TIMEZONE|g" /etc/surfconext/serviceregistry.config.php

  # Set name admin email
  sed -i "s/__OC__ADMIN_EMAIL__/$OC__ADMIN_EMAIL/g" /etc/surfconext/serviceregistry.module_janus.php
  sed -i "s/__OC__ADMIN_NAME__/$OC__ADMIN_NAME/g" /etc/surfconext/serviceregistry.config.php
  sed -i "s/__OC__ADMIN_EMAIL__/$OC__ADMIN_EMAIL/g" /etc/surfconext/serviceregistry.config.php

  # Apply database credentials to file serviceregistry.module_janus.php
  sed -i "s/__OC__SERVICEREGISTRY_DB_USER__/$OC__SERVICEREGISTRY_DB_USER/g" /etc/surfconext/serviceregistry.module_janus.php
  sed -i "s/__OC__SERVICEREGISTRY_DB_PASS__/$OC__SERVICEREGISTRY_DB_PASS/g" /etc/surfconext/serviceregistry.module_janus.php

fi

./bin/composer.phar --prefer-dist --no-interaction install

# Perform database migration
./bin/migrate

#sometimes the permission are reset, because migrate runs as root
chown -R apache:apache /tmp/janus
chown -R apache:apache /var/log/janus-ssp
