#!/bin/sh

echo "Installing httpd if not present. Will enable in runlevel 2,3,5."
$YUM -y install httpd mod_ssl &&
chkconfig --level 235 httpd on &&

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
sed -i "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" /opt/www/welcome/index.html

###########################
# Install SSL certificate #
###########################

rm -rf /etc/httpd/keys/* &&
mkdir -p /etc/httpd/keys &&
cp $OC_BASEDIR/certs/*.* /etc/httpd/keys/
