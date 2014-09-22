#!/bin/bash

if [ ! -h /opt/www/manage ]
then
    cd /opt/www/
    $GITCLONE $OC__MANAGE_REPO
    ln -s OpenConext-manage manage
fi

cd /opt/www/manage
$GITRESET # revert potential changes
$GITFETCH
$GITCHECKOUT ${MANAGE_VERSION}

mysql -u root --password=$OC__ROOT_DB_PASS -e "drop database if exists manage; create database manage default charset utf8 default collate utf8_unicode_ci;"

# Create manage user/pass
mysql -uroot -p$OC__ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON manage.* TO $OC__MANAGE_DB_USER@localhost IDENTIFIED BY '$OC__MANAGE_DB_PASS'"
mysql -uroot -p$OC__ROOT_DB_PASS -e "FLUSH PRIVILEGES"
echo "User for database 'manage' updated sucessfully"


cat $OC_BASEDIR/configs/httpd/conf.d/manage.conf  | \
  sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
  /etc/httpd/conf.d/manage.conf

if [ -f /etc/surfconext/manage.ini ]
then
  backupFile /etc/surfconext/manage.ini
fi

install -d /etc/surfconext/
sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" $OC_BASEDIR/configs/surfconext/manage.ini > /etc/surfconext/manage.ini

# Apply credentials to file manage.ini
sed -i "s/__OC__MANAGE_DB_USER__/$OC__MANAGE_DB_USER/g" /etc/surfconext/manage.ini
sed -i "s/__OC__MANAGE_DB_PASS__/$OC__MANAGE_DB_PASS/g" /etc/surfconext/manage.ini
sed -i "s/__OC__ENGINE_DB_USER__/$OC__ENGINE_DB_USER/g" /etc/surfconext/manage.ini
sed -i "s/__OC__ENGINE_DB_PASS__/$OC__ENGINE_DB_PASS/g" /etc/surfconext/manage.ini
sed -i "s/__OC__SERVICEREGISTRY_DB_USER__/$OC__SERVICEREGISTRY_DB_USER/g" /etc/surfconext/manage.ini
sed -i "s/__OC__SERVICEREGISTRY_DB_PASS__/$OC__SERVICEREGISTRY_DB_PASS/g" /etc/surfconext/manage.ini


# When manage.ini still contains the default root password of the DB, change it to the oc_config value.
sed -i "s~c0n3xt~$OC__ROOT_DB_PASS~g" /etc/surfconext/manage.ini

CRT_NO_HEADERS=`sed '1d;$d' /etc/surfconext/engineblock.crt` &&
echo "auth.simplesamlphp.idp.cert = \"${CRT_NO_HEADERS}\"" >> /etc/surfconext/manage.ini


