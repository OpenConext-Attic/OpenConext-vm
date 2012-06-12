#!/bin/sh

if [ ! -d /usr/share/tomcat6/webapps/teams.demo.openconext.org ];
then
    mysql -u root --password=c0n3xt teams < /vagrant/data/teams.sql

    cd /tmp
    git clone git://github.com/OpenConext/OpenConext-teams.git
    cd -
    cd /tmp/OpenConext-teams
    mvn -q clean install -DskipTests    
    cd -
    
    rm /usr/share/tomcat6/wars/coin-teams-war-*.war    
    cp /tmp/OpenConext-teams/coin-teams-war/target/*.war /usr/share/tomcat6/wars
    TEAMS_WAR=`basename /usr/share/tomcat6/wars/coin-teams-*.war`
    
    rm -rf /tmp/OpenConext-teams
    
    mkdir -p /usr/share/tomcat6/conf/Catalina/teams.demo.openconext.org
    echo "<Context path=\"/\" docBase=\"/usr/share/tomcat6/wars/$TEAMS_WAR\"/>" > \
        /usr/share/tomcat6/conf/Catalina/teams.demo.openconext.org/ROOT.xml

    mkdir -p /usr/share/tomcat6/webapps/teams.demo.openconext.org
    chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/

    service tomcat6 restart
fi
