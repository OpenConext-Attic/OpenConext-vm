#!/bin/sh

if [ ! -d /usr/share/tomcat6/webapps/api.$OC_DOMAIN ]
then
    cd /tmp    
    $GITCLONE git://github.com/OpenConext/OpenConext-api.git
    cd /tmp/OpenConext-api
    $GITCHECKOUT ${API_VERSION}
    $MVN clean install -DskipTests

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


    sed -i \
      -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" \
      -e "s~spCertificate=.*$~spCertificate=$OC_CERT~" \
      -e "s~idpCertificate=.*$~idpCertificate=$ENGINEBLOCK_CERT~" \
      -e "s~spPrivateKey=.*$~spPrivateKey=$OC_KEY~" \
      /usr/share/tomcat6/conf/classpath_properties/coin-api.properties


    # create Tomcat-specific context configuration file
    API_WAR=`basename /usr/share/tomcat6/wars/coin-api-*.war`
    mkdir -p /usr/share/tomcat6/conf/Catalina/api.$OC_DOMAIN
    echo "<Context path=\"/v1\" docBase=\"/usr/share/tomcat6/wars/$API_WAR\"/>" > \
        /usr/share/tomcat6/conf/Catalina/api.$OC_DOMAIN/v1.xml

    mkdir -p /usr/share/tomcat6/webapps/api.$OC_DOMAIN
    chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/

    SERVERXMLLINE='<Host name="api.'$OC_DOMAIN'" appBase="webapps/api.'$OC_DOMAIN'"/>'
    sed -i "s#</Engine>#$SERVERXMLLINE\n</Engine>#" /usr/share/tomcat6/conf/server.xml

    echo "create database api default charset utf8 default collate utf8_unicode_ci;" | mysql -u root --password=c0n3xt


		# clean up afterwards
    rm -rf /tmp/OpenConext-api

    cat $OC_BASEDIR/configs/httpd/conf.d/api.conf  | \
      sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
      /etc/httpd/conf.d/api.conf

fi
