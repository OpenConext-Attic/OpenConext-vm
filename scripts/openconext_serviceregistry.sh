#!/bin/sh
###########################
# Install ServiceRegistry #
###########################

cd /opt/www/
git clone git://github.com/OpenConext/OpenConext-serviceregistry.git
ln -s OpenConext-serviceregistry serviceregistry

echo "create database serviceregistry default charset utf8 default collate utf8_unicode_ci;" | mysql -u root --password=c0n3xt

cp -r docs/etc/* /etc/surfconext/
touch modules/janus/enable
sed -i "s/'username'  => ''/'username'  => 'root'/g" /etc/surfconext/serviceregistry.module_janus.php
sed -i "s/'password'  => ''/'password'  => 'c0n3xt'/g" /etc/surfconext/serviceregistry.module_janus.php
sed -i "s/engineblock.example.edu/engine.openconext.local/g" /etc/surfconext/serviceregistry.saml20-idp-remote.php
cd bin/
./migrate
cd ..
./bin/apply_janus_patches.sh

# Install EngineBlock's certificate for ServiceRegistry
cp ${CURDIR}/example.org.crt /etc/surfconext/serviceregistry-certs/engineblock.crt
rm ${CURDIR}/example.org.pem ${CURDIR}/example.org.crt