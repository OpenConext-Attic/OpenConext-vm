#!/bin/sh
cd /tmp &&
svn export -q https://svn.surfnet.nl/svn/coin-os/coin-infra/trunk/coin-infra-dist/src/main/ infra

# Apache Configuration
rm -f /etc/httpd/conf.d/* &&
cp -f infra/httpd/conf.d/php/demo/*  /etc/httpd/conf.d/ &&
cp -f infra/httpd/conf.d/java/demo/* /etc/httpd/conf.d/ &&
rm -rf infra &&

cd - &&

###########################
# Install SSL certificate #
###########################

# The certificates were generated using the XCA tool, the DB file is included
# as well as "openconext.xdb".

rm -rf /etc/httpd/keys &&
mkdir -p /etc/httpd/keys/ &&
cp /vagrant/certs/* /etc/httpd/keys/ &&

service httpd restart