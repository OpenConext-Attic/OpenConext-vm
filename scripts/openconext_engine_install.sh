#!/bin/sh

source /vagrant/scripts/versions.sh

#######################
# Install EngineBlock #
#######################
if [ ! -h /opt/www/engineblock ];
then
    mkdir -p /opt/www/ &&
    cd /opt/www/ &&
    git clone git://github.com/OpenConext/OpenConext-engineblock.git
    ln -sf OpenConext-engineblock engineblock &&    
    cd -
    cd /opt/www/engineblock
    git checkout ${ENGINEBLOCK_VERSION}
    cd -

    cp -Rf /vagrant/configs/attribute-manipulations /opt/www

    # Create database
    echo "create database engineblock default charset utf8 default collate utf8_unicode_ci;" | mysql -u root --password=c0n3xt
    mysql -u root --password=c0n3xt engineblock < /vagrant/data/engineblock.sql
fi

#############################################
# Modify the EngineBlock configuration file #
#############################################

if [ ! -f /etc/surfconext/engineblock.crt ];
then
    # Edit the profile.sh file to set correct environment variable
    echo 'export ENGINEBLOCK_ENV="demo"' > /etc/profile.d/openconext.sh

    chmod +x /etc/profile.d/openconext.sh
    source /etc/profile.d/openconext.sh

    # Generate Self Signed Certificate for EngineBlock and add it to the configuration
    cd /tmp &&
    openssl req -subj '/CN=EngineBlock/OU=Services/O=SURFnet/C=NL/' -newkey rsa:2048 -new -x509 -days 3652 -nodes -out example.org.crt -keyout example.org.pem > /dev/null
    CRT=`cat example.org.crt` &&
    PEM=`cat example.org.pem` &&
    CRT_NO_HEADERS=`sed '1d;$d' example.org.crt` &&
    echo "" >> /etc/surfconext/engineblock.ini &&
    echo "encryption.key.public = \"${CRT}\"" >> /etc/surfconext/engineblock.ini &&
    echo "encryption.key.private = \"${PEM}\"" >> /etc/surfconext/engineblock.ini &&
    echo "auth.simplesamlphp.idp.cert       = \"${CRT_NO_HEADERS}\"" >> /etc/surfconext/engineblock.ini
    cp example.org.crt /etc/surfconext/engineblock.crt &&
    rm example.org.crt example.org.pem &&
    cd -
fi

cd /opt/www/engineblock/
./bin/migrate
cd -
