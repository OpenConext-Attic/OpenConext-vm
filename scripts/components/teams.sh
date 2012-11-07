#!/bin/sh


if [ ! -d /usr/share/tomcat6/webapps/teams.$OC_DOMAIN ];
then
    cd /tmp
    $GITCLONE git://github.com/OpenConext/OpenConext-teams.git
    cd /tmp/OpenConext-teams
    $GITCHECKOUT ${TEAMS_VERSION}
    $MVN clean install -DskipTests

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
    mkdir -p /usr/share/tomcat6/conf/Catalina/teams.$OC_DOMAIN
    echo "<Context path=\"/teams\" docBase=\"/usr/share/tomcat6/wars/$TEAMS_WAR\"/>" > \
        /usr/share/tomcat6/conf/Catalina/teams.$OC_DOMAIN/teams.xml
    
    echo "create database teams default charset utf8 default collate utf8_unicode_ci;" | mysql -u root --password=c0n3xt
		mysql -u root --password=c0n3xt teams < $OC_BASEDIR/data/teams.sql
      
    mkdir -p /usr/share/tomcat6/webapps/teams.$OC_DOMAIN
    chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/

    SERVERXMLLINE='<Host name="teams.'$OC_DOMAIN'" appBase="webapps/teams.'$OC_DOMAIN'"/>'
    sed -i "s#</Engine>#$SERVERXMLLINE\n</Engine>#" /usr/share/tomcat6/conf/server.xml

		rm -rf /tmp/OpenConext-teams

    cat $OC_BASEDIR/configs/httpd/conf.d/teams.conf  | \
      sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
      /etc/httpd/conf.d/teams.conf

fi
