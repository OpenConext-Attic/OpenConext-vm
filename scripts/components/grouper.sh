#!/bin/bash

cd /tmp
if [ ! -f grouper-dist-*-bin.tar.gz ]
then
  ## Only download if not exists yet. Optimization in case script is run successively.
  curl -O https://build.surfconext.nl/repository/public/releases/org/surfnet/coin/grouper-dist/${GROUPER_VERSION}/grouper-dist-${GROUPER_VERSION}-bin.tar.gz
fi
tar zxf grouper-dist-*-bin.tar.gz

# Delete
rm -f /usr/share/tomcat6/wars/grouper-*.war

cp -f tomcat/webapps/*.war /usr/share/tomcat6/wars

cp -f tomcat/conf/classpath_properties/sources.xml.vm /usr/share/tomcat6/conf/classpath_properties/sources.xml
cp -f tomcat/conf/classpath_properties/grouper.hibernate.properties.vm /usr/share/tomcat6/conf/classpath_properties/grouper.hibernate.properties
cp -f tomcat/conf/classpath_properties/grouper.properties /usr/share/tomcat6/conf/classpath_properties/
cp -f tomcat/conf/classpath_properties/log4j.properties /usr/share/tomcat6/conf/classpath_properties/

sed -i "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" /usr/share/tomcat6/conf/classpath_properties/sources.xml
sed -i "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" /usr/share/tomcat6/conf/classpath_properties/grouper.hibernate.properties

if $UPGRADE
then
  rm -Rf /usr/share/tomcat6/work/Catalina/grouper*
  rm -Rf /usr/share/tomcat6/webapps/grouper.*/*
else
  install -d /usr/share/tomcat6/conf/Catalina/grouper.$OC_DOMAIN
  install -d /usr/share/tomcat6/webapps/grouper.$OC_DOMAIN
  chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/grouper.$OC_DOMAIN

  cat $OC_BASEDIR/configs/httpd/conf.d/grouper.conf  | \
    sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" > \
    /etc/httpd/conf.d/grouper.conf

  SERVERXMLLINE='<Host name="grouper.'$OC_DOMAIN'" appBase="webapps/grouper.'$OC_DOMAIN'"/>'
  sed -i "s#</Engine>#$SERVERXMLLINE\n</Engine>#" /usr/share/tomcat6/conf/server.xml
fi

GROUPER_WS_WAR=`basename /usr/share/tomcat6/wars/grouper-ws-*.war`
GROUPER_WAR=`basename /usr/share/tomcat6/wars/grouper-*.war`

echo "<Context path=\"/grouper-ws\" docBase=\"/usr/share/tomcat6/wars/$GROUPER_WS_WAR\" debug=\"1\"></Context>" > \
  /usr/share/tomcat6/conf/Catalina/grouper.$OC_DOMAIN/grouper-ws.xml
echo "<Context path=\"/grouper\" docBase=\"/usr/share/tomcat6/wars/$GROUPER_WAR\" debug=\"1\"></Context>" > \
  /usr/share/tomcat6/conf/Catalina/grouper.$OC_DOMAIN/grouper.xml
