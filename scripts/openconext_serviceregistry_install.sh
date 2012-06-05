#!/bin/sh
###########################
# Install ServiceRegistry #
###########################

if [ ! -h /opt/www/serviceregistry ];
then
    cd /opt/www/
    git clone git://github.com/OpenConext/OpenConext-serviceregistry.git
    ln -s OpenConext-serviceregistry serviceregistry
    cd -

    echo "create database serviceregistry default charset utf8 default collate utf8_unicode_ci;" | mysql -u root --password=c0n3xt
fi

if [ ! -f  /etc/surfconext/serviceregistry.module_janus.php ];
then
    cp -r /opt/www/serviceregistry/docs/etc/* /etc/surfconext/
    sed -i "s/'username'  => ''/'username'  => 'root'/g" /etc/surfconext/serviceregistry.module_janus.php
    sed -i "s/'password'  => ''/'password'  => 'c0n3xt'/g" /etc/surfconext/serviceregistry.module_janus.php
    sed -i "s/engineblock.example.edu/engine.demo.openconext.org/g" /etc/surfconext/serviceregistry.saml20-idp-remote.php
    cd /opt/www/serviceregistry/
    ./bin/migrate

    # Install EngineBlock's certificate for ServiceRegistry
    cp /etc/surfconext/engineblock.crt /etc/surfconext/serviceregistry-certs/engineblock.crt

    cd -

    #############################
    # ServiceRegistry Bootstrap #
    #############################

    # Add TestIdP (as IdP) and serviceregistry (as SP) and engine (as SP) to serviceregistry DB
    # and configure the TestIdP "employee" user as ServiceRegistry "admin"
    # we need to figure out the SSL cert of engine, or be smart about updating it!!!
    #mysql -u root --password=c0n3xt serviceregistry < ${CURDIR}/sr_bootstrap.sql

    # Have ServiceRegistry use EngineBlock for authentication
    sed -i "s/^\$config\['auth'\] = 'admin';/\#\$config\['auth'\] = 'admin';/g" /etc/surfconext/serviceregistry.module_janus.php
    sed -i "s/^\#\$config\['auth'\] = 'default-sp';/\$config\['auth'\] = 'default-sp';/g" /etc/surfconext/serviceregistry.module_janus.php

    # Set correct attribute for userid in ServiceRegistry
    sed -i "s/\\$config['useridattr'] = 'user';/\\$config['useridattr'] = 'nameid';/g" /etc/surfconext/serviceregistry.module_janus.php
fi