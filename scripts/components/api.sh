#!/bin/bash

if [ ! -d /opt/www/OpenConext-api ]
then
  cd /opt/www
  $GITCLONE git://github.com/OpenConext/OpenConext-api.git
fi

cd /opt/www/OpenConext-api
$GITCHECKOUT ${API_VERSION}
$MVN clean install -DskipTests

# extract deployable artifact
tar -zxf coin-api-dist/target/*-bin.tar.gz -C coin-api-dist/target

# remove old deployed war
rm /usr/share/tomcat6/wars/coin-api-*.war 2> /dev/null
# copy new war to Tomcat
cp coin-api-dist/target/coin-api-dist*/tomcat/webapps/*.war /usr/share/tomcat6/wars

cp coin-api-dist/target/coin-api-dist*/tomcat/conf/classpath_properties/*.vm /usr/share/tomcat6/conf/classpath_properties/
# strip off the .vm extension
for i in $(ls /usr/share/tomcat6/conf/classpath_properties/*.vm)
do
  mv $i `dirname $i`/`basename $i .vm`
done


sed -i \
  -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" \
  -e "s~spCertificate=.*$~spCertificate=$OC_CERT~" \
  -e "s~idpCertificate=.*$~idpCertificate=$ENGINEBLOCK_CERT~" \
  -e "s~spPrivateKey=.*$~spPrivateKey=$OC_KEY~" \
  /usr/share/tomcat6/conf/classpath_properties/coin-api.properties


# Copy Tomcat-specific context configuration file
mkdir -p /usr/share/tomcat6/conf/Catalina/api.$OC_DOMAIN
cp coin-api-dist/target/coin-api-dist*/tomcat/conf/context/*.xml /usr/share/tomcat6/conf/Catalina/api.$OC_DOMAIN/

mkdir -p /usr/share/tomcat6/webapps/api.$OC_DOMAIN
chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/

SERVERXMLLINE='<Host name="api.'$OC_DOMAIN'" appBase="webapps/api.'$OC_DOMAIN'"/>'
sed -i "s#</Engine>#$SERVERXMLLINE\n</Engine>#" /usr/share/tomcat6/conf/server.xml

mysql -u root --password=c0n3xt -e "drop database if exists api; create database api default charset utf8 default collate utf8_unicode_ci;"

cat $OC_BASEDIR/configs/httpd/conf.d/api.conf  | \
  sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
  /etc/httpd/conf.d/api.conf
