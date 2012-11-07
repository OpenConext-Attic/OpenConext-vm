#!/bin/sh

echo "Installing httpd if not present. Will enable in runlevel 2,3,5."
$YUM -y install httpd mod_ssl &&
chkconfig --level 235 httpd on &&

# TODO: what about the components' config files? Only the _ ones are copied here now.
cp -f $OC_BASEDIR/configs/httpd/conf.d/_*  /etc/httpd/conf.d

for httpdConfigFile in /etc/httpd/conf.d/*
do
  sed -i "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" $httpdConfigFile
done

# DocumentRoots
mkdir -p /opt/www
mkdir -p /var/www/html/default
mkdir -p /opt/www/catchall
mkdir -p /opt/www/welcome

cp -Rf $OC_BASEDIR/data/catchall/* /opt/www/catchall/
cp -Rf $OC_BASEDIR/data/welcome/* /opt/www/welcome/

echo "This domain is not (yet) configured for OpenConext. Perhaps a not-installed component?" > /opt/www/catchall/index.html
###########################
# Install SSL certificate #
###########################

rm -rf /etc/httpd/keys/* &&
mkdir -p /etc/httpd/keys &&

service httpd restart
