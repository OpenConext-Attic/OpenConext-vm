#!/bin/sh
###########################
# Install ServiceRegistry #
###########################

if [ ! -h /opt/www/serviceregistry ];
then
    cd /opt/www/
    $GITCLONE git://github.com/OpenConext/OpenConext-serviceregistry.git
    ln -s OpenConext-serviceregistry serviceregistry
    cd -
    cd /opt/www/serviceregistry
    $GITCHECKOUT ${SERVICEREGISTRY_VERSION}
    cd -

    echo "create database serviceregistry default charset utf8 default collate utf8_unicode_ci;" | mysql -u root --password=c0n3xt

    #############################
    # ServiceRegistry Bootstrap #
    #############################

    cat $OC_BASEDIR/data/serviceregistry.sql | \
      sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" | \
      mysql -u root --password=c0n3xt serviceregistry

fi

if [ ! -f /etc/surfconext/serviceregistry.config.php ]
then
  cp $OC_BASEDIR/configs/surfconext/serviceregistry*.php /etc/surfconext/
  sed -i "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" /etc/surfconext/serviceregistry*.php
fi

cd /opt/www/serviceregistry/
./bin/migrate
cd -

# Install EngineBlock's certificate for ServiceRegistry
mkdir -p  /etc/surfconext/serviceregistry-certs/
cp /etc/surfconext/engineblock.crt /etc/surfconext/serviceregistry-certs/engineblock.crt


sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" $OC_BASEDIR/configs/httpd/conf.d/serviceregistry.conf > \
  /etc/httpd/conf.d/serviceregistry.conf
