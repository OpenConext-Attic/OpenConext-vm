#!/bin/sh

if [ ! -h /opt/www/manage ]
then
    cd /opt/www/
    $GITCLONE git://github.com/OpenConext/OpenConext-manage.git
    ln -s OpenConext-manage manage
fi

cd /opt/www/manage
$GITFETCH
$GITCHECKOUT ${MANAGE_VERSION}

mysql -u root --password=c0n3xt -e "drop database if exists manage; create database manage default charset utf8 default collate utf8_unicode_ci;"


cat $OC_BASEDIR/configs/httpd/conf.d/manage.conf  | \
  sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
  /etc/httpd/conf.d/manage.conf
cat $OC_BASEDIR/configs/httpd/conf.d/vomanage.conf  | \
  sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
  /etc/httpd/conf.d/vomanage.conf

if [ -f /etc/surfconext/manage.ini ]
then
  backupFile /etc/surfconext/manage.ini
fi

install -d /etc/surfconext/
sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" $OC_BASEDIR/configs/surfconext/manage.ini > /etc/surfconext/manage.ini

CRT_NO_HEADERS=`sed '1d;$d' /etc/surfconext/engineblock.crt` &&
echo "auth.simplesamlphp.idp.cert = \"${CRT_NO_HEADERS}\"" >> /etc/surfconext/manage.ini
