#!/bin/bash

if [ ! -d /opt/www/OpenConext-cruncher ]
then
  cd /opt/www
  $GITCLONE https://github.com/OpenConext/OpenConext-cruncher.git
fi

cd /opt/www/OpenConext-cruncher
$GITRESET # revert potential changes
$GITFETCH
$GITCHECKOUT ${CRUNCHER_VERSION}
$MVN clean install -DskipTests

# extract deployable artifact
tar -zxf cruncher-dist/target/*-bin.tar.gz -C cruncher-dist/target

CRUNCHER_DIST_BASEDIR=/opt/www/OpenConext-cruncher/cruncher-dist/target/cruncher-dist-*/

# remove old deployed war
rm -f /usr/share/tomcat6/wars/cruncher-*.war 2> /dev/null
# copy new war to Tomcat
cp $CRUNCHER_DIST_BASEDIR/tomcat/webapps/*.war /usr/share/tomcat6/wars

# Copy Tomcat-specific context configuration file
install -d /usr/share/tomcat6/conf/Catalina/cruncher.$OC_DOMAIN
cp $CRUNCHER_DIST_BASEDIR/tomcat/conf/context/*.xml /usr/share/tomcat6/conf/Catalina/cruncher.$OC_DOMAIN/
# In the VM, we do not distinguish between 'normal' and 'low' tomcat instances
sed -i -e 's/tomcat6-low/tomcat6/' /usr/share/tomcat6/conf/Catalina/cruncher.$OC_DOMAIN/*



sed \
  -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" \
  $CRUNCHER_DIST_BASEDIR/tomcat/conf/classpath_properties/cruncher.properties.vm \
  > /tmp/cruncher.properties

if $UPGRADE
then
  rm -rf /usr/share/tomcat6/work/Catalina
  rm -rf /usr/share/tomcat6/webapps/*/*

  backupFile /usr/share/tomcat6/conf/classpath_properties/cruncher.properties
  perl $OC_SCRIPTDIR/tools/replaceProperties/replaceProperties.pl /tmp/cruncher.properties /usr/share/tomcat6/conf/classpath_properties/cruncher.properties

else

  cp $CRUNCHER_DIST_BASEDIR/tomcat/conf/classpath_properties/cruncher-logback.xml.vm /usr/share/tomcat6/conf/classpath_properties/cruncher-logback.xml
  cp /tmp/cruncher.properties /usr/share/tomcat6/conf/classpath_properties/


  install -d /usr/share/tomcat6/webapps/cruncher.$OC_DOMAIN
  chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/

  SERVERXMLLINE='<Host name="cruncher.'$OC_DOMAIN'" appBase="webapps/cruncher.'$OC_DOMAIN'"/>'
  sed -i "s#</Engine>#$SERVERXMLLINE\n</Engine>#" /usr/share/tomcat6/conf/server.xml

  mysql -u root --password=c0n3xt -e "create database if not exists cruncher default charset utf8 default collate utf8_unicode_ci;"

  cat $OC_BASEDIR/configs/httpd/conf.d/cruncher.conf  | \
    sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
    /etc/httpd/conf.d/cruncher.conf
    
  echo "Will startup Tomcat to execute queries that can only be done after initial filling of database tables."
  service tomcat6 start
  echo "Waiting for Tomcat startup to finish..."
  timeout 300 grep -q 'INFO: Server startup in' <(tail -n 0 -f /opt/tomcat/logs/catalina.out)
  if [ $? -eq 0 ] # If timeout did not occur.
  then
    echo "enabling the cruncher for the VM environment"
    mysql -u root --password=c0n3xt cruncher -e "update aggregate_meta_data set active=0;"
    service tomcat6 stop
  else
    echo "Did not see Tomcat start up within reasonable time. Could not perform queries that had to be executed after startup"
  fi
    
fi
