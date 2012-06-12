#!/bin/sh
# Apache Configuration
rm -f /etc/httpd/conf.d/* &&
cp -f /vagrant/configs/httpd/conf.d/*  /etc/httpd/conf.d/ &&

###########################
# Install SSL certificate #
###########################

rm -rf /etc/httpd/keys &&
mkdir -p /etc/httpd/keys/ &&
cp /vagrant/certs/*.* /etc/httpd/keys/ &&

service httpd restart