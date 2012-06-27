#!/bin/sh

if [ ! -d /usr/share/tomcat6/webapps/api.demo.openconext.org ];
then
    cd /tmp    
    git clone git://github.com/OpenConext/OpenConext-api.git
    cd -
    cd /tmp/OpenConext-api
    # git checkout xxx
    mvn -q clean install -DskipTests    
    cd -
    
    rm /usr/share/tomcat6/wars/coin-api-*.war 2> /dev/null    
    cp /tmp/OpenConext-api/coin-api-war/target/*.war /usr/share/tomcat6/wars
    API_WAR=`basename /usr/share/tomcat6/wars/coin-api-*.war`
    
    rm -rf /tmp/OpenConext-api
    
    mkdir -p /usr/share/tomcat6/conf/Catalina/api.demo.openconext.org
    echo "<Context path=\"/v1\" docBase=\"/usr/share/tomcat6/wars/$API_WAR\"/>" > \
        /usr/share/tomcat6/conf/Catalina/api.demo.openconext.org/v1.xml

    echo "create database api default charset utf8 default collate utf8_unicode_ci;" | mysql -u root --password=c0n3xt

    mkdir -p /usr/share/tomcat6/webapps/api.demo.openconext.org
    chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/
fi
