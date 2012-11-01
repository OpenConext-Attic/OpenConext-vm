#!/bin/sh

source /vagrant/scripts/versions.sh

if [ ! -d /usr/share/tomcat6/webapps/api.demo.openconext.org ]
then
    cd /tmp    
    git clone git://github.com/OpenConext/OpenConext-api.git
    cd /tmp/OpenConext-api
    git checkout ${API_VERSION}
    mvn -q clean install -DskipTests

		# extract deployable artifact
		tar -zxf coin-api-dist/target/*-bin.tar.gz -C coin-api-dist/target
		
		# remove old deployed war
    rm /usr/share/tomcat6/wars/coin-api-*.war 2> /dev/null
		# copy new war to Tomcat
    cp /tmp/OpenConext-api/coin-api-dist/target/coin-api-dist*/tomcat/webapps/*.war /usr/share/tomcat6/wars

		cp /tmp/OpenConext-api/coin-api-dist/target/coin-api-dist*/tomcat/conf/classpath_properties/*.vm /usr/share/tomcat6/conf/classpath_properties/
		# strip off the .vm extension
		for i in $(ls /usr/share/tomcat6/conf/classpath_properties/*.vm)
		do
			mv $i `dirname $i`/`basename $i .vm`
		done

   	# create Tomcat-specific context configuration file
    API_WAR=`basename /usr/share/tomcat6/wars/coin-api-*.war`
    mkdir -p /usr/share/tomcat6/conf/Catalina/api.demo.openconext.org
    echo "<Context path=\"/v1\" docBase=\"/usr/share/tomcat6/wars/$API_WAR\"/>" > \
        /usr/share/tomcat6/conf/Catalina/api.demo.openconext.org/v1.xml

    echo "create database api default charset utf8 default collate utf8_unicode_ci;" | mysql -u root --password=c0n3xt

    mkdir -p /usr/share/tomcat6/webapps/api.demo.openconext.org
    chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/

		# clean up afterwards
    rm -rf /tmp/OpenConext-api
fi
