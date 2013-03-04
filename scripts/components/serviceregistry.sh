#!/bin/sh
###########################
# Install ServiceRegistry #
###########################

if [ ! -h /opt/www/serviceregistry ]
then
    cd /opt/www/
    $GITCLONE git://github.com/OpenConext/OpenConext-serviceregistry.git
    ln -s OpenConext-serviceregistry serviceregistry
    cd -
fi
cd /opt/www/serviceregistry
$GITCHECKOUT ${SERVICEREGISTRY_VERSION}
cd -

mysql -u root --password=c0n3xt -e "drop database if exists serviceregistry; create database serviceregistry default charset utf8 default collate utf8_unicode_ci;"

#############################
# ServiceRegistry Bootstrap #
#############################

cat $OC_BASEDIR/data/serviceregistry.sql | \
  sed \
    -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" \
    -e "s~_OPENCONEXT_CERT_~$OC_CERT~" | \
  mysql -u root --password=c0n3xt serviceregistry




if [ -f /etc/surfconext/serviceregistry.config.php ]
then
  backupFile /etc/surfconext/serviceregistry.config.php
fi
cp $OC_BASEDIR/configs/surfconext/serviceregistry*.php /etc/surfconext/
sed -i "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" /etc/surfconext/serviceregistry*.php

cd /opt/www/serviceregistry/
./bin/migrate

# Install EngineBlock's certificate for ServiceRegistry
install -d  /etc/surfconext/serviceregistry-certs/
cp /etc/surfconext/engineblock.crt /etc/surfconext/serviceregistry-certs/engineblock.crt


sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" $OC_BASEDIR/configs/httpd/conf.d/serviceregistry.conf > \
  /etc/httpd/conf.d/serviceregistry.conf
