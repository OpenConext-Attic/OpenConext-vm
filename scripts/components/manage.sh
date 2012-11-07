#!/bin/sh

if [ ! -h /opt/www/manage ];
then
    cd /opt/www/
    $GITCLONE git://github.com/OpenConext/OpenConext-manage.git
    ln -s OpenConext-manage manage
    cd -
    cd /opt/www/manage
    $GITCHECKOUT ${MANAGE_VERSION}
    cd -

    echo "create database manage default charset utf8 default collate utf8_unicode_ci;" | mysql -u root --password=c0n3xt

    CRT_NO_HEADERS=`sed '1d;$d' /etc/surfconext/engineblock.crt` &&
    echo "auth.simplesamlphp.idp.cert = \"${CRT_NO_HEADERS}\"" >> /etc/surfconext/manage.ini

    cat $OC_BASEDIR/configs/httpd/conf.d/manage.conf  | \
      sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
      /etc/httpd/conf.d/manage.conf
    cat $OC_BASEDIR/configs/httpd/conf.d/vomanage.conf  | \
      sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
      /etc/httpd/conf.d/vomanage.conf

fi
