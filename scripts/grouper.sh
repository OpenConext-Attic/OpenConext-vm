#!/bin/sh
if [ ! -d /usr/share/tomcat6/conf/Catalina/grouper.demo.openconext.org ]
then
	cd /tmp
	cp /vagrant/grouper-dist-1.8.1-bin.tar.gz .
	tar xvfz grouper-dist-1.8.1-bin.tar.gz
	cp -f tomcat/webapps/*.war /usr/share/tomcat6/wars

	mkdir -p /usr/share/tomcat6/conf/Catalina/grouper.demo.openconext.org
	mkdir -p /usr/share/tomcat6/webapps/grouper.demo.openconext.org
	chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/grouper.demo.openconext.org

	echo '<Context path="/grouper-ws" docBase="/opt/tomcat/wars/grouper-ws-1.6.3.war" debug="1"></Context>' > \
	  /usr/share/tomcat6/conf/Catalina/grouper.demo.openconext.org/grouper-ws.xml
	echo '<Context path="/grouper" docBase="/opt/tomcat/wars/grouper-1.6.3.war" debug="1"></Context>' > \
	  /usr/share/tomcat6/conf/Catalina/grouper.demo.openconext.org/grouper.xml
	  
	service tomcat6 restart
fi
