#!/bin/bash

#######################
# Install EngineBlock #
#######################
if [ ! -h /opt/www/engineblock ]
then
    $GITCLONE https://github.com/OpenConext/OpenConext-engineblock.git /opt/www/OpenConext-engineblock
    ln -sf /opt/www/OpenConext-engineblock /opt/www/engineblock
fi
cd /opt/www/engineblock
$GITRESET # revert potential changes
$GITFETCH
$GITCHECKOUT ${ENGINEBLOCK_VERSION}

./bin/composer.phar --prefer-dist --no-interaction install
# Restore SELinux labels, due to bug? in Composer (https://github.com/composer/composer/issues/1714)
restorecon -r vendor

if $UPGRADE
then
  source /etc/profile.d/openconext.sh
    
else
  # Create database
  mysql -u root --password=$OC__ROOT_DB_PASS -e "drop database if exists engineblock; create database engineblock default charset utf8 default collate utf8_unicode_ci;"
  cat $OC_BASEDIR/data/engineblock.sql | \
    sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" | \
    mysql -u root --password=$OC__ROOT_DB_PASS engineblock

  # Set database creadentials for engine
  mysql -uroot -p$OC__ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON engineblock.* TO $OC__ENGINE_DB_USER@localhost IDENTIFIED BY '$OC__ENGINE_DB_PASS'"
  success=`mysqladmin -u$OC__ENGINE_DB_USER -p$OC__ENGINE_DB_PASS ping | grep -c "mysqld is alive"`
  if [[ $success == '1' ]]
  then
    echo -e "\nValidating new MySQL Engine password: SUCCESS!\n"     
  else
    echo -e "\nValidating new MySQL Engine password: FAILED\n"
    exit
  fi

  #############################################
  # Modify the EngineBlock configuration file #
  #############################################
  if [ -f /etc/surfconext/engineblock.ini ]
  then
    backupFile /etc/surfconext/engineblock.ini
  fi
  install -d /etc/surfconext/
  sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" $OC_BASEDIR/configs/surfconext/engineblock.ini > /etc/surfconext/engineblock.ini

  echo "Apply db credentials to file engineblock.ini"
  sed -i "s/__OC__ENGINE_DB_USER__/$OC__ENGINE_DB_USER/g" /etc/surfconext/engineblock.ini
  sed -i "s/__OC__ENGINE_DB_PASS__/$OC__ENGINE_DB_PASS/g" /etc/surfconext/engineblock.ini

  # Apply janus api credentials to file engineblock.ini
  sed -i "s/__OC__ENGINE_JANUSAPI_USER__/$OC__ENGINE_JANUSAPI_USER/g" /etc/surfconext/engineblock.ini
  sed -i "s/__OC__ENGINE_JANUSAPI_PASS__/$OC__ENGINE_JANUSAPI_PASS/g" /etc/surfconext/engineblock.ini

  # Apply ldap credentials to file engineblock.ini
  sed -i "s/__OC__LDAP_ENGINE_USER__/$OC__LDAP_ENGINE_USER/g" /etc/surfconext/engineblock.ini
  sed -i "s/__OC__LDAP_ENGINE_PASS__/$OC__LDAP_ENGINE_PASS/g" /etc/surfconext/engineblock.ini

  # Apply timezone to file engineblock.ini
  sed -i "s|__OC__TIMEZONE__|$OC__TIMEZONE|g" /etc/surfconext/engineblock.ini

  # Edit the profile.sh file to set correct environment variable
  echo 'export ENGINEBLOCK_ENV="demo"' > /etc/profile.d/openconext.sh

  chmod +x /etc/profile.d/openconext.sh
  source /etc/profile.d/openconext.sh

  if [ -f /etc/surfconext/engineblock.crt ]
  then
    backupFile /etc/surfconext/engineblock.crt
  fi
  # Generate Self Signed Certificate for EngineBlock and add it to the configuration
  cd /tmp &&
    openssl req -subj '/CN=Engine/OU=Services/O=OpenConext/C=NL/' -newkey rsa:2048 -new -x509 -days 3652 -nodes -out example.org.crt -keyout example.org.pem > /dev/null
  EB_CRT=`cat example.org.crt` &&
  EB_KEY=`cat example.org.pem` &&
  EB_CRT_NO_HEADERS=`sed '1d;$d' example.org.crt` &&
  echo "" >> /etc/surfconext/engineblock.ini &&
  echo "encryption.key.public = \"${EB_CRT}\"" >> /etc/surfconext/engineblock.ini &&
  echo "encryption.key.private = \"${EB_KEY}\"" >> /etc/surfconext/engineblock.ini &&
  echo "auth.simplesamlphp.idp.cert       = \"${EB_CRT_NO_HEADERS}\"" >> /etc/surfconext/engineblock.ini
  cp example.org.crt /etc/surfconext/engineblock.crt &&
  rm example.org.crt example.org.pem

  install -d /var/log/surfconext
  # TODO: is this chmod really neccessary?
  chmod o+w /var/log/surfconext
  touch /var/log/surfconext/engineblock.log
  chmod o+w /var/log/surfconext/engineblock.log

    # Updating LDAP schema some more...
  ldapmodify -x -D cn=admin,cn=config -h localhost -w $OC__LDAP_PASS -f /opt/www/engineblock/ldap/changes/addDeprovisionWarningSentAttributes.ldif
  ldapmodify -x -D cn=admin,cn=config -h localhost -w $OC__LDAP_PASS -f /opt/www/engineblock/ldap/changes/addCollabPersonUUID.ldif

  # Apply LDAP credentials to file engineblock.ini
  sed -i "s/__OC__ENGINE_LDAP_PASSWD__/$OC__LDAP_PASS/g" /etc/surfconext/engineblock.ini

  # Update apache conf
  cat $OC_BASEDIR/configs/httpd/conf.d/engine.conf  | \
    sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
    /etc/httpd/conf.d/engine.conf
  cat $OC_BASEDIR/configs/httpd/conf.d/engine-internal.conf  | \
    sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
    /etc/httpd/conf.d/engine-internal.conf
  cat $OC_BASEDIR/configs/httpd/conf.d/profile.conf  | \
    sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
    /etc/httpd/conf.d/profile.conf

  # Make public key available for other components
  ENGINEBLOCK_CERT=`sed '1d;$d' /etc/surfconext/engineblock.crt | tr -d '\n'`
fi

cd /opt/www/engineblock/
./bin/migrate
