#!/bin/sh

#
# OpenConext PHP software
#
# This script configures a CentOS system for OpenConext. It performs
# the installation and configuration of PHP modules of the OpenConext platform.
#

LAUNCH_DIR=`pwd`
TEMP_DIR="/opt/tmp"
APACHE_PHP_CONFIG_DIR=${TEMP_DIR}/apache_php_config

function getRepository {
	if [ -d $2 ]
	then
		svn up $2
	else
		mkdir -p $2
		svn co $1 $2
	fi
}

# software
getRepository "https://svn.surfnet.nl/svn/coin-eb/static/trunk" \
	      "/opt/www/static"
getRepository "https://svn.surfnet.nl/svn/coin-eb/engineblock/trunk" \
              "/opt/www/engineblock"
getRepository "https://svn.surfnet.nl/svn/coin-eb/serviceregistry/trunk" \
              "/opt/www/serviceregistry"
getRepository "https://svn.surfnet.nl/svn/coin-eb/attribute-manipulations/trunk" \
              "/opt/www/attribute-manipulations"
getRepository "https://svn.surfnet.nl/svn/coin-manage/trunk" \
              "/opt/www/manage"
getRepository "http://simplesamlphp.googlecode.com/svn/branches/simplesamlphp-1.8" \
              "/opt/www/testidp"

# configuration files
getRepository "https://svn.surfnet.nl/svn/coin-os/coin-infra/trunk/coin-infra-dist/src/main/httpd/conf.d/php/dev" \
              ${APACHE_PHP_CONFIG_DIR}

# copy configuration files (does NOT overwrite!)
cp -n ${APACHE_PHP_CONFIG_DIR}/* /etc/httpd/conf.d
rm /etc/httpd/conf.d/*diy* # remove DIY
sed -i 's/dev.surfconext.nl/demo.openconext.org/g' /etc/httpd/conf.d/*

# install the SSL certificates
mkdir -p /etc/httpd/keys/
cp -n ${LAUNCH_DIR}/certs/star.demo.openconext.org.key /etc/httpd/keys/
cp -n ${LAUNCH_DIR}/certs/star.demo.openconext.org.pem /etc/httpd/keys/
cp -n ${LAUNCH_DIR}/certs/star.os.demo.openconext.org.key /etc/httpd/keys/
cp -n ${LAUNCH_DIR}/certs/star.os.demo.openconext.org.pem /etc/httpd/keys/

cp -n ${LAUNCH_DIR}/certs/openconext.pem /etc/httpd/keys/star.demo.openconext.org_cabundle.pem
cp -n ${LAUNCH_DIR}/certs/openconext.pem /etc/httpd/keys/star.os.demo.openconext.org_cabundle.pem



