#!/bin/sh

echo "Installing httpd if not present. Will enable in runlevel 2,3,5."
yum -y -q install httpd mod_ssl &&
chkconfig --level 235 httpd on &&

cp -f $OC_BASEDIR/configs/httpd/conf.d/*  /etc/httpd/conf.d

for httpdConfigFile in /etc/httpd/conf.d/*
do
  sed -i "s/_OPENCONEXT_DOMAIN_/$OC_HOSTNAME/" httpdConfigFile
done

# DocumentRoots
mkdir -p /opt/www
mkdir -p /var/www/html/default

###########################
# Install SSL certificate #
###########################

rm -rf /etc/httpd/keys/* &&
cp $OC_BASEDIR/certs/*.* /etc/httpd/keys/


service httpd restart
