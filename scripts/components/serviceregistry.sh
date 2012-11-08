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


cd /opt/www/serviceregistry/
./bin/migrate
cd -

# Install EngineBlock's certificate for ServiceRegistry
cp /etc/surfconext/engineblock.crt /etc/surfconext/serviceregistry-certs/engineblock.crt


cat $OC_BASEDIR/configs/httpd/conf.d/serviceregistry.conf  | \
  sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" > \
  /etc/httpd/conf.d/serviceregistry.conf
