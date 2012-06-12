#!/bin/sh

yum -y -q install tomcat6

if [ ! -d /usr/share/tomcat6/conf/classpath_properties ];
then
	mkdir -p /usr/share/tomcat6/conf/classpath_properties
    cp /vagrant/configs/tomcat6/conf/classpath_properties/*.properties /usr/share/tomcat6/conf/classpath_properties/
fi

if [ ! -f /usr/share/java/mysql-connector-java.jar ];
then
	mkdir -p /usr/share/tomcat6/shared/lib/
	ln -s /usr/share/java/mysql-connector-java.jar /usr/share/tomcat6/shared/lib/mysql-connector-java.jar
fi

mkdir -p /usr/share/tomcat6/wars

cp -f /vagrant/configs/tomcat6/conf/catalina.properties /usr/share/tomcat6/conf/catalina.properties
cp -f /vagrant/configs/tomcat6/conf/server.xml /usr/share/tomcat6/conf/server.xml

mkdir -p /usr/share/tomcat6/conf/classpath_properties
cp /vagrant/configs/tomcat6/conf/classpath_properties/*.properties /usr/share/tomcat6/conf/classpath_properties/

service tomcat6 restart
