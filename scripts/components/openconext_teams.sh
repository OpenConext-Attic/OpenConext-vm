#!/bin/sh

source /vagrant/scripts/versions.sh

if [ ! -d /usr/share/tomcat6/webapps/teams.demo.openconext.org ];
then
    cd /tmp
    git clone git://github.com/OpenConext/OpenConext-teams.git
    cd /tmp/OpenConext-teams
    git checkout ${TEAMS_VERSION}
    mvn -q clean install -DskipTests    

		# extract deployable artifact
		tar -zxf coin-teams-dist/target/*-bin.tar.gz -C coin-teams-dist/target
		
		# remove old deployed war
    rm /usr/share/tomcat6/wars/coin-teams-war-*.war 2> /dev/null        
		# copy new war to Tomcat
    cp /tmp/OpenConext-teams/coin-teams-dist/target/coin-teams-dist*/tomcat/webapps/*.war /usr/share/tomcat6/wars
    
		cp /tmp/OpenConext-teams/coin-teams-dist/target/coin-teams-dist*/tomcat/conf/classpath_properties/*.vm /usr/share/tomcat6/conf/classpath_properties/
		# strip off the .vm extension
		for i in $(ls /usr/share/tomcat6/conf/classpath_properties/*.vm)
		do
			mv $i `dirname $i`/`basename $i .vm`
		done

   	# create Tomcat-specific context configuration file
		TEAMS_WAR=`basename /usr/share/tomcat6/wars/coin-teams-*.war`    
    mkdir -p /usr/share/tomcat6/conf/Catalina/teams.demo.openconext.org
    echo "<Context path=\"/teams\" docBase=\"/usr/share/tomcat6/wars/$TEAMS_WAR\"/>" > \
        /usr/share/tomcat6/conf/Catalina/teams.demo.openconext.org/teams.xml
    
    echo "create database teams default charset utf8 default collate utf8_unicode_ci;" | mysql -u root --password=c0n3xt
		mysql -u root --password=c0n3xt teams < /vagrant/data/teams.sql
      
    mkdir -p /usr/share/tomcat6/webapps/teams.demo.openconext.org
    chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/
		rm -rf /tmp/OpenConext-teams
fi
