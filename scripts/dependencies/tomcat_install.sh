#!/bin/sh

echo "Installing packages for Tomcat. This may take several minutes. (depending on available bandwidth)"
# Install java-1.6.0-openjdk to overrule the default gcj, which is horribly broken for us.
yum -y -q install java-1.6.0-openjdk tomcat6 mysql-connector-java


CATALINA_HOME=/usr/share/tomcat6

ln -s $CATALINA_HOME /opt/tomcat

if [ ! -d $CATALINA_HOME/conf/classpath_properties ]
then
	mkdir -p $CATALINA_HOME/conf/classpath_properties
    cp $OC_BASEDIR/configs/tomcat6/conf/classpath_properties/* $CATALINA_HOME/conf/classpath_properties/
fi

if [ ! -h $CATALINA_HOME/shared/lib/mysql-connector-java.jar ]
then
  mkdir -p $CATALINA_HOME/shared/lib/
  ln -s /usr/share/java/mysql-connector-java.jar $CATALINA_HOME/shared/lib/mysql-connector-java.jar
fi

mkdir -p $CATALINA_HOME/wars

cp -f $OC_BASEDIR/configs/tomcat6/conf/catalina.properties $CATALINA_HOME/conf/catalina.properties
cp -f $OC_BASEDIR/configs/tomcat6/conf/server.xml $CATALINA_HOME/conf/server.xml
cp -f $OC_BASEDIR/configs/tomcat6/conf/tomcat6.conf $CATALINA_HOME/conf/tomcat6.conf
cp -f $OC_BASEDIR/configs/tomcat6/conf/tomcat-users.xml $CATALINA_HOME/conf/tomcat-users.xml

mkdir -p $CATALINA_HOME/conf/classpath_properties
cp -f $OC_BASEDIR/configs/tomcat6/conf/classpath_properties/* $CATALINA_HOME/conf/classpath_properties/


keytool -delete -alias "openconext cacert" \
  -keystore /etc/pki/java/cacerts -storepass changeit -noprompt

keytool -import -file /etc/httpd/keys/openconext_cabundle.pem \
  -trustcacerts -alias "openconext cacert" \
  -keystore /etc/pki/java/cacerts -storepass changeit -noprompt

service tomcat6 stop
sleep 5
if ps faxuww | grep tomcat | grep -v grep > /dev/null
then
  killall -9 java
fi
sleep 2

# Remove possibly previously installed webapps and caches
rm -Rf $CATALINA_HOME/webapps/*
rm -Rf $CATALINA_HOME/work/*
rm -Rf $CATALINA_HOME/conf/Catalina/*

service tomcat6 start
