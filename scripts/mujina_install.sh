#!/bin/sh

if [ ! -d /usr/share/tomcat6/webapps/mujina-sp.demo.openconext.org ];
then
    cd /tmp
    git clone git://github.com/OpenConext/Mujina.git
    cd -
    cd /tmp/Mujina
    mvn -q clean install

    mkdir -p /usr/share/tomcat6/wars
    cp /tmp/Mujina/mujina-sp/target/*.war  /usr/share/tomcat6/wars
    cp /tmp/Mujina/mujina-idp/target/*.war /usr/share/tomcat6/wars
    rm -rf /tmp/Mujina
    #mkdir -p /usr/share/tomcat6/shared/lib/
    #ln -s /usr/share/java/mysql-connector-java.jar /usr/share/tomcat6/shared/lib/mysql-connector-java.jar

    mkdir -p /usr/share/tomcat6/conf/Catalina/mujina-sp.demo.openconext.org
    mkdir -p /usr/share/tomcat6/conf/Catalina/mujina-idp.demo.openconext.org
    echo '<Context path="/" docBase="/usr/share/tomcat6/wars/mujina-sp-2.6.0-SNAPSHOT.war"/>' >  /usr/share/tomcat6/conf/Catalina/mujina-sp.demo.openconext.org/ROOT.xml
    echo '<Context path="/" docBase="/usr/share/tomcat6/wars/mujina-idp-2.6.0-SNAPSHOT.war"/>' >  /usr/share/tomcat6/conf/Catalina/mujina-idp.demo.openconext.org/ROOT.xml

    cp /vagrant/configs/tomcat6/conf/server.xml /usr/share/tomcat6/conf/server.xml

    mkdir -p /usr/share/tomcat6/webapps/mujina-sp.demo.openconext.org
    mkdir -p /usr/share/tomcat6/webapps/mujina-idp.demo.openconext.org
    chown -Rf tomcat /usr/share/tomcat6/webapps

    mkdir -p /usr/share/tomcat6/conf/classpath_properties
    cp /vagrant/configs/tomcat6/conf/classpath_properties/*.properties /usr/share/tomcat6/conf/classpath_properties/

    service tomcat6 restart
fi