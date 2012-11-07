#!/bin/bash

cd /tmp
curl -O https://build.surfconext.nl/repository/public/releases/org/surfnet/coin/grouper-dist/${GROUPER_VERSION}/grouper-dist-${GROUPER_VERSION}-bin.tar.gz
tar zxf grouper-dist-*-bin.tar.gz

cp -f tomcat/webapps/*.war /usr/share/tomcat6/wars

# Here we use the .dev versions. There is no .vm version and they would be the same anyway.
cp -f tomcat/conf/classpath_properties/*.dev /usr/share/tomcat6/conf/classpath_properties/
cp -f tomcat/conf/classpath_properties/grouper.properties /usr/share/tomcat6/conf/classpath_properties/
cp -f tomcat/conf/classpath_properties/log4j.properties /usr/share/tomcat6/conf/classpath_properties/
# strip off the .dev extension
for i in $(ls /usr/share/tomcat6/conf/classpath_properties/*.dev)
do
  mv $i `dirname $i`/`basename $i .dev`
done

mkdir -p /usr/share/tomcat6/conf/Catalina/grouper.$OC_DOMAIN
mkdir -p /usr/share/tomcat6/webapps/grouper.$OC_DOMAIN
chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/grouper.$OC_DOMAIN

GROUPER_WS_WAR=`basename /usr/share/tomcat6/wars/grouper-ws-*.war`
GROUPER_WAR=`basename /usr/share/tomcat6/wars/grouper-*.war`

echo "<Context path=\"/grouper-ws\" docBase=\"/usr/share/tomcat6/wars/$GROUPER_WS_WAR\" debug=\"1\"></Context>" > \
  /usr/share/tomcat6/conf/Catalina/grouper.$OC_DOMAIN/grouper-ws.xml
echo "<Context path=\"/grouper\" docBase=\"/usr/share/tomcat6/wars/$GROUPER_WAR\" debug=\"1\"></Context>" > \
  /usr/share/tomcat6/conf/Catalina/grouper.$OC_DOMAIN/grouper.xml

rm -rf /tmp/grouper-dist-*-bin.tar.gz
rm -rf /tmp/tomcat

cat $OC_BASEDIR/configs/httpd/conf.d/grouper.conf  | \
  sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" > \
  /etc/httpd/conf.d/grouper.conf

    SERVERXMLLINE='<Host name="grouper.'$OC_DOMAIN'" appBase="webapps/grouper.'$OC_DOMAIN'"/>'
    sed -i "s#</Engine>#$SERVERXMLLINE\n</Engine>#" /usr/share/tomcat6/conf/server.xml

service httpd reload