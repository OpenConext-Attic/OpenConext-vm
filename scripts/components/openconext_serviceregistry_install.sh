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
    cd /opt/www/serviceregistry
    git checkout ${SERVICEREGISTRY_VERSION}
    cd -

    echo "create database serviceregistry default charset utf8 default collate utf8_unicode_ci;" | mysql -u root --password=c0n3xt

    #############################
    # ServiceRegistry Bootstrap #
    #############################

    # Add TestIdP (as IdP) and serviceregistry (as SP) and engine (as SP) to serviceregistry DB
    # and configure the TestIdP "employee" user as ServiceRegistry "admin"
    # we need to figure out the SSL cert of engine, or be smart about updating it!!!
    mysql -u root --password=c0n3xt serviceregistry < $OC_BASEDIR/data/serviceregistry.sql
fi


cd /opt/www/serviceregistry/
./bin/migrate
cd -

# Install EngineBlock's certificate for ServiceRegistry
cp /etc/surfconext/engineblock.crt /etc/surfconext/serviceregistry-certs/engineblock.crt
