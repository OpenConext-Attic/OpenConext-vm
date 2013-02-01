#!/bin/bash

#######################
# Install EngineBlock #
#######################
if [ ! -h /opt/www/engineblock ]
then
    $GITCLONE git://github.com/OpenConext/OpenConext-engineblock.git /opt/www/OpenConext-engineblock
    ln -sf /opt/www/OpenConext-engineblock /opt/www/engineblock
fi
cd /opt/www/engineblock
$GITCHECKOUT ${ENGINEBLOCK_VERSION}

./bin/composer.phar install

cp -Rf $OC_BASEDIR/configs/attribute-manipulations /opt/www

# Create database
mysql -u root --password=c0n3xt -e "drop database if exists engineblock; create database engineblock default charset utf8 default collate utf8_unicode_ci;"
cat $OC_BASEDIR/data/engineblock.sql | \
  sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" | \
  mysql -u root --password=c0n3xt engineblock


#############################################
# Modify the EngineBlock configuration file #
#############################################

if [ ! -f /etc/surfconext/engineblock.ini ]
then
    mkdir -p /etc/surfconext/
    sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" $OC_BASEDIR/configs/surfconext/engineblock.ini > /etc/surfconext/engineblock.ini
fi

# Edit the profile.sh file to set correct environment variable
echo 'export ENGINEBLOCK_ENV="demo"' > /etc/profile.d/openconext.sh

chmod +x /etc/profile.d/openconext.sh
source /etc/profile.d/openconext.sh

if [ ! -f /etc/surfconext/engineblock.crt ];
then

    # Generate Self Signed Certificate for EngineBlock and add it to the configuration
    cd /tmp &&
    openssl req -subj '/CN=EngineBlock/OU=Services/O=SURFnet/C=NL/' -newkey rsa:2048 -new -x509 -days 3652 -nodes -out example.org.crt -keyout example.org.pem > /dev/null
    EB_CRT=`cat example.org.crt` &&
    EB_KEY=`cat example.org.pem` &&
    EB_CRT_NO_HEADERS=`sed '1d;$d' example.org.crt` &&
    echo "" >> /etc/surfconext/engineblock.ini &&
    echo "encryption.key.public = \"${EB_CRT}\"" >> /etc/surfconext/engineblock.ini &&
    echo "encryption.key.private = \"${EB_KEY}\"" >> /etc/surfconext/engineblock.ini &&
    echo "auth.simplesamlphp.idp.cert       = \"${EB_CRT_NO_HEADERS}\"" >> /etc/surfconext/engineblock.ini
    cp example.org.crt /etc/surfconext/engineblock.crt &&
    rm example.org.crt example.org.pem &&
    cd -
fi

mkdir -p /var/log/surfconext
# TODO: is this chmod really neccessary?
chmod o+w /var/log/surfconext
touch /var/log/surfconext/engineblock.log
chmod o+w /var/log/surfconext/engineblock.log

cd /opt/www/engineblock/
./bin/migrate


# Updating LDAP schema some more...
ldapmodify -x -D cn=admin,cn=config -w c0n3xt -f /opt/www/engineblock/ldap/changes/addDeprovisionWarningSentAttributes.ldif
ldapmodify -x -D cn=admin,cn=config -w c0n3xt -f /opt/www/engineblock/ldap/changes/addCollabPersonUUID.ldif

cat $OC_BASEDIR/configs/httpd/conf.d/engine.conf  | \
  sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
  /etc/httpd/conf.d/engine.conf
cat $OC_BASEDIR/configs/httpd/conf.d/engine-internal.conf  | \
  sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
  /etc/httpd/conf.d/engine-internal.conf
cat $OC_BASEDIR/configs/httpd/conf.d/profile.conf  | \
  sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
  /etc/httpd/conf.d/profile.conf

# Make public key available for other components
ENGINEBLOCK_CERT=`sed '1d;$d' /etc/surfconext/engineblock.crt | tr -d '\n'`

