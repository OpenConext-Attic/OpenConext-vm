#!/bin/sh
##########################
# Install Static content #
##########################

if [ ! -h /opt/www/static ]
then
    cd /opt/www &&
    $GITCLONE --branch ${STATIC_VERSION} git://github.com/OpenConext/OpenConext-static.git /opt/www/OpenConext-static
    ln -sf /opt/www/OpenConext-static /opt/www/static
fi

cat $OC_BASEDIR/configs/httpd/conf.d/static.conf  | \
  sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" > \
  /etc/httpd/conf.d/static.conf

service httpd reload