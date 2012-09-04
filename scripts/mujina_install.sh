#!/bin/sh

source /vagrant/scripts/versions.sh

if [ ! -d /usr/share/tomcat6/webapps/mujina-sp.demo.openconext.org ];
then
    cd /tmp
    git clone git://github.com/OpenConext/Mujina.git
    cd /tmp/Mujina
    git checkout ${MUJINA_VERSION}
    git checkout xsw-dev
    mvn -q clean install -DskipTests


    rm /usr/share/tomcat6/wars/mujina-*.war
    
		# extract deployable artifact
		tar -zxf mujina-idp-dist/target/*-bin.tar.gz -C mujina-idp-dist/target
		tar -zxf mujina-sp-dist/target/*-bin.tar.gz -C mujina-sp-dist/target
		
		# copy war
    cp mujina-idp-dist/target/mujina-idp-dist*/tomcat/webapps/*.war /usr/share/tomcat6/wars
    cp mujina-sp-dist/target/mujina-sp-dist*/tomcat/webapps/*.war /usr/share/tomcat6/wars
    
		# copy over properties
		cp mujina-idp-dist/target/mujina-idp-dist*/tomcat/conf/classpath_properties/*.vm /usr/share/tomcat6/conf/classpath_properties/
		cp mujina-sp-dist/target/mujina-sp-dist*/tomcat/conf/classpath_properties/*.vm /usr/share/tomcat6/conf/classpath_properties/

		# strip off the .vm extension
		for i in $(ls /usr/share/tomcat6/conf/classpath_properties/*.vm)
		do
			mv $i `dirname $i`/`basename $i .vm`
		done


		
    MUJINA_SP_WAR=`basename /usr/share/tomcat6/wars/mujina-sp-*.war`
    MUJINA_IDP_WAR=`basename /usr/share/tomcat6/wars/mujina-idp-*.war`
    

		    
    mkdir -p /usr/share/tomcat6/conf/Catalina/mujina-sp.demo.openconext.org
    echo "<Context path=\"/\" docBase=\"/usr/share/tomcat6/wars/$MUJINA_SP_WAR\"/>" > \
		/usr/share/tomcat6/conf/Catalina/mujina-sp.demo.openconext.org/ROOT.xml
	
	mkdir -p /usr/share/tomcat6/conf/Catalina/mujina-idp.demo.openconext.org
    echo "<Context path=\"/\" docBase=\"/usr/share/tomcat6/wars/$MUJINA_IDP_WAR\"/>" > \
		/usr/share/tomcat6/conf/Catalina/mujina-idp.demo.openconext.org/ROOT.xml

    mkdir -p /usr/share/tomcat6/webapps/mujina-sp.demo.openconext.org
    mkdir -p /usr/share/tomcat6/webapps/mujina-idp.demo.openconext.org
    chown -R tomcat:tomcat /usr/share/tomcat6/webapps/

    rm -rf /tmp/Mujina

    service tomcat6 restart
fi
