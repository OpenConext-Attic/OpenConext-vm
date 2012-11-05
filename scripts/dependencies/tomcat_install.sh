#!/bin/sh

yum -y -q install tomcat6 mysql-connector-java

CATALINA_HOME=/usr/share/tomcat6

if [ ! -d $CATALINA_HOME/conf/classpath_properties ];
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

## TODO replace with something simple: the ca cert can be found in /etc/httpd/keys
echo |openssl s_client -connect api.demo.openconext.org:443 2>&1 |sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' | sudo keytool -import -trustcacerts -alias "api cacert" -keystore /usr/java/jdk1.6.0_32/jre/lib/security/cacerts -storepass changeit -noprompt

service tomcat6 stop
sleep 5
if ps faxuww | grep tomcat | grep -v grep > /dev/null
then
  killall -9 java
fi
sleep 2

# Fill in domain name placeholder
sed -i "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" $CATALINA_HOME/conf/server.xml


# Remove possibly previously installed webapps and caches
rm -Rf $CATALINA_HOME/webapps/*
rm -Rf $CATALINA_HOME/work/*
rm -Rf $CATALINA_HOME/conf/Catalina/*

service tomcat6 start
