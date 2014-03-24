#!/bin/sh
##########################
# Install Static content #
##########################

if [ ! -h /opt/www/static ]
then
    cd /opt/www
    $GITCLONE git://github.com/OpenConext/OpenConext-static.git /opt/www/OpenConext-static
    cd /opt/www/OpenConext-static
    $GITCHECKOUT ${STATIC_VERSION}
    cd ..
    ln -sf /opt/www/OpenConext-static /opt/www/static
fi

cat $OC_BASEDIR/configs/httpd/conf.d/static.conf  | \
  sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" > \
  /etc/httpd/conf.d/static.conf

echo "Created vhost static for storing common html and javascript libratries in use for OpenConext"
