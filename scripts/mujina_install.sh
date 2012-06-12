#!/bin/sh

if [ ! -d /usr/share/tomcat6/webapps/mujina-sp.demo.openconext.org ];
then
    cd /tmp
    git clone git://github.com/OpenConext/Mujina.git
    cd -
    cd /tmp/Mujina
    mvn -q clean install -DskipTests

    rm /usr/share/tomcat6/wars/mujina-*.war
    cp /tmp/Mujina/mujina-sp/target/*.war /usr/share/tomcat6/wars
    cp /tmp/Mujina/mujina-idp/target/*.war /usr/share/tomcat6/wars
    
    MUJINA_SP_WAR=`basename mujina-sp/target/*.war`
    MUJINA_IDP_WAR=`basename mujina-idp/target/*.war`
    
    rm -rvf /tmp/Mujina
    
    mkdir -p /usr/share/tomcat6/conf/Catalina/mujina-sp.demo.openconext.org
    mkdir -p /usr/share/tomcat6/conf/Catalina/mujina-idp.demo.openconext.org
    echo "<Context path=\"/\" docBase=\"/usr/share/tomcat6/wars/$MUJINA_SP_WAR\"/>" > \
		/usr/share/tomcat6/conf/Catalina/mujina-sp.demo.openconext.org/ROOT.xml
    echo "<Context path=\"/\" docBase=\"/usr/share/tomcat6/wars/$MUJINA_IDP_WAR\"/>" > \
		/usr/share/tomcat6/conf/Catalina/mujina-idp.demo.openconext.org/ROOT.xml

    mkdir -p /usr/share/tomcat6/webapps/mujina-sp.demo.openconext.org
    mkdir -p /usr/share/tomcat6/webapps/mujina-idp.demo.openconext.org
    chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps

    service tomcat6 restart
fi
