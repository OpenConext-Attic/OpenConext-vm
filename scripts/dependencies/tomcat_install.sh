#!/bin/sh

yum -y -q install tomcat6 mysql-connector-java

if [ ! -d /usr/share/tomcat6/conf/classpath_properties ];
then
	mkdir -p /usr/share/tomcat6/conf/classpath_properties
    cp $OC_BASEDIR/configs/tomcat6/conf/classpath_properties/* /usr/share/tomcat6/conf/classpath_properties/
fi

if [ ! -h /usr/share/tomcat6/shared/lib/mysql-connector-java.jar ]
then
  mkdir -p /usr/share/tomcat6/shared/lib/
  ln -s /usr/share/java/mysql-connector-java.jar /usr/share/tomcat6/shared/lib/mysql-connector-java.jar
fi

mkdir -p /usr/share/tomcat6/wars

cp -f $OC_BASEDIR/configs/tomcat6/conf/catalina.properties /usr/share/tomcat6/conf/catalina.properties
cp -f $OC_BASEDIR/configs/tomcat6/conf/server.xml /usr/share/tomcat6/conf/server.xml
cp -f $OC_BASEDIR/configs/tomcat6/conf/tomcat6.conf /usr/share/tomcat6/conf/tomcat6.conf
cp -f $OC_BASEDIR/configs/tomcat6/conf/tomcat-users.xml /usr/share/tomcat6/conf/tomcat-users.xml

mkdir -p /usr/share/tomcat6/conf/classpath_properties
cp -f $OC_BASEDIR/configs/tomcat6/conf/classpath_properties/* /usr/share/tomcat6/conf/classpath_properties/


echo |openssl s_client -connect api.demo.openconext.org:443 2>&1 |sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' | sudo keytool -import -trustcacerts -alias "api cacert" -keystore /usr/java/jdk1.6.0_32/jre/lib/security/cacerts -storepass changeit -noprompt
service tomcat6 stop
killall -9 java
sleep 15
service tomcat6 start
