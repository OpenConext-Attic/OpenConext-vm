#!/bin/sh

echo "Installing packages for Tomcat. This may take several minutes. (depending on available bandwidth)"
# Install java-1.7.0-openjdk to overrule the default gcj, which is horribly broken for us.
$YUM -y install java-1.7.0-openjdk tomcat6 mysql-connector-java

chkconfig --level 235 tomcat6 on

CATALINA_HOME=/usr/share/tomcat6

ln -fs $CATALINA_HOME /opt/tomcat

install -d $CATALINA_HOME/conf/classpath_properties

if [ ! -h $CATALINA_HOME/shared/lib/mysql-connector-java.jar ]
then
  install -d $CATALINA_HOME/shared/lib/
  ln -s /usr/share/java/mysql-connector-java.jar $CATALINA_HOME/shared/lib/mysql-connector-java.jar
fi

install -d $CATALINA_HOME/wars

cp -f $OC_BASEDIR/configs/tomcat6/conf/catalina.properties $CATALINA_HOME/conf/catalina.properties
cp -f $OC_BASEDIR/configs/tomcat6/conf/server.xml $CATALINA_HOME/conf/server.xml
cp -f $OC_BASEDIR/configs/tomcat6/conf/tomcat6.conf $CATALINA_HOME/conf/tomcat6.conf
cp -f $OC_BASEDIR/configs/tomcat6/conf/tomcat-users.xml $CATALINA_HOME/conf/tomcat-users.xml

# Applying credentials from oc_config
sed -i "s/GrouperSystem/$GROUPER_SYSTEM_USER/g" $CATALINA_HOME/conf/tomcat-users.xml
sed -i "s/GrouperSystemPassword/$GROUPER_SYSTEM_PASS/g" $CATALINA_HOME/conf/tomcat-users.xml

sed -i "s/engineUser/$GROUPER_ENGINE_USER/g" $CATALINA_HOME/conf/tomcat-users.xml
sed -i "s/engineUserPassword/$GROUPER_ENGINE_PASS/g" $CATALINA_HOME/conf/tomcat-users.xml

sed -i "s/unitTestUser/$GROUPER_UNIT_TEST_USER/g" $CATALINA_HOME/conf/tomcat-users.xml
sed -i "s/unitTestUserPassword/$GROUPER_UNIT_TEST_PASS/g" $CATALINA_HOME/conf/tomcat-users.xml

sed -i "s/apiUser/$GROUPER_API_USER/g" $CATALINA_HOME/conf/tomcat-users.xml
sed -i "s/apiUserPassword/$GROUPER_API_PASS/g" $CATALINA_HOME/conf/tomcat-users.xml


if keytool -list -alias 'openconext cacert' -keystore /etc/pki/java/cacerts \
    -storepass changeit -noprompt > /dev/null
then
    keytool -delete -alias "openconext cacert" \
      -keystore /etc/pki/java/cacerts -storepass changeit -noprompt > /dev/null
fi

keytool -import -file /etc/httpd/keys/openconext_ca.pem \
  -trustcacerts -alias "openconext cacert" \
  -keystore /etc/pki/java/cacerts -storepass changeit -noprompt

if service tomcat6 status > /dev/null
then
  service tomcat6 stop
  sleep 5
fi
if ps faxuww | egrep -a '^tomcat '
then
  killall -q -9 -u tomcat  java
fi
sleep 2

# Remove possibly previously installed webapps and caches
rm -Rf $CATALINA_HOME/webapps/*
rm -Rf $CATALINA_HOME/work/*
rm -Rf $CATALINA_HOME/conf/Catalina/*
