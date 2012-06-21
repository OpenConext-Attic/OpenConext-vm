#!/bin/sh
if [ ! -d /usr/share/tomcat6/conf/Catalina/grouper.demo.openconext.org ]
then
	cd /tmp
	cp /vagrant/grouper-dist-1.8.1-bin.tar.gz .
	tar xvfz grouper-dist-1.8.1-bin.tar.gz
	rm -f /usr/share/tomcat6/wars/grouper-ws-*.war
	rm -f /usr/share/tomcat6/wars/grouper-*.war	
	cp -f tomcat/webapps/*.war /usr/share/tomcat6/wars

	mkdir -p /usr/share/tomcat6/conf/Catalina/grouper.demo.openconext.org
	mkdir -p /usr/share/tomcat6/webapps/grouper.demo.openconext.org
	chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/grouper.demo.openconext.org
	
	GROUPER_WS_WAR=`basename /usr/share/tomcat6/wars/grouper-ws-*.war`
	GROUPER_WAR=`basename /usr/share/tomcat6/wars/grouper-*.war`

	echo "<Context path=\"/grouper-ws\" docBase=\"/usr/share/tomcat6/wars/$GROUPER_WS_WAR\" debug=\"1\"></Context>" > \
	  /usr/share/tomcat6/conf/Catalina/grouper.demo.openconext.org/grouper-ws.xml
	echo "<Context path=\"/grouper\" docBase=\"/usr/share/tomcat6/wars/$GROUPER_WAR\" debug=\"1\"></Context>" > \
	  /usr/share/tomcat6/conf/Catalina/grouper.demo.openconext.org/grouper.xml
	
	rm -rf /tmp/grouper-dist-1.8.1-bin.tar.gz
	rm -rf /tmp/tomcat
	
	service tomcat6 restart
fi
