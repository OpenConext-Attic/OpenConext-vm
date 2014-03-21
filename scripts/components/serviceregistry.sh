#!/bin/sh
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
  cp $OC_BASEDIR/configs/surfconext/serviceregistry*.php /etc/surfconext/
  sed -i "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" /etc/surfconext/serviceregistry*.php
  sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" $OC_BASEDIR/configs/httpd/conf.d/serviceregistry.conf > \
    /etc/httpd/conf.d/serviceregistry.conf

  # Install EngineBlock's certificate for ServiceRegistry
  install -d  /etc/surfconext/serviceregistry-certs/
  cp /etc/surfconext/engineblock.crt /etc/surfconext/serviceregistry-certs/engineblock.crt

  # Use oc_config settings for admin passwd and secret salt for ssp
  sed -i "s/_OC__JANUSADMIN_PASS_/$OC__JANUSADMIN_PASS/g" /etc/surfconext/serviceregistry.config.php
  sed -i "s/_OC__JANUS_SECRETSALT_/$OC__JANUS_SECRETSALT/g" /etc/surfconext/serviceregistry.config.php

  # Use oc_config settings for timezone ssp
  sed -i "s/_OC__TIMEZONE_/$OC__TIMEZONE/g" /etc/surfconext/serviceregistry.config.php

  # Set name admin email
  sed -i "s/_OC__ADMIN_EMAIL_/$OC__ADMIN_EMAIL/g" /etc/surfconext/serviceregistry.module_janus.php
  sed -i "s/_OC__ADMIN_NAME_/$OC__ADMIN_NAME/g" /etc/surfconext/serviceregistry.config.php
  sed -i "s/_OC__ADMIN_EMAIL_/$OC__ADMIN_EMAIL/g" /etc/surfconext/serviceregistry.config.php

  # Apply database credentials to file serviceregistry.module_janus.php
  sed -i "s/_OC__SERVICEREGISTRY_DB_USER_/$OC__SERVICEREGISTRY_DB_USER/g" /etc/surfconext/serviceregistry.module_janus.php
  sed -i "s/_OC__SERVICEREGISTRY_DB_PASS_/$OC__SERVICEREGISTRY_DB_PASS/g" /etc/surfconext/serviceregistry.module_janus.php


fi

./bin/composer.phar install
# Restore SELinux labels, due to bug? in Composer (https://github.com/composer/composer/issues/1714)
restorecon -r vendor

# Perform database migration
./bin/migrate
