#!/bin/bash

if [ ! -d /opt/www/OpenConext-selfservice ]
then
  cd /opt/www
  $GITCLONE git://github.com/OpenConext/OpenConext-selfservice.git
fi

cd /opt/www/OpenConext-selfservice
$GITRESET # revert potential changes
$GITFETCH
$GITCHECKOUT ${SELFSERVICE_VERSION}
$MVN -DskipTests clean install

# extract deployable artifact
tar -zxf dashboard-dist/target/*-bin.tar.gz -C dashboard-dist/target

DASHBOARD_DIST_BASEDIR=/opt/www/OpenConext-selfservice/dashboard-dist/target/dashboard-dist-*

# remove old deployed war
rm -f /usr/share/tomcat6/wars/dashboard-*.war 2> /dev/null
# copy new war to Tomcat
cp $DASHBOARD_DIST_BASEDIR/tomcat/webapps/*.war /usr/share/tomcat6/wars

# Copy Tomcat-specific context configuration file
install -d /usr/share/tomcat6/conf/Catalina/dashboard.$OC_DOMAIN
cp $DASHBOARD_DIST_BASEDIR/tomcat/conf/context/*.xml /usr/share/tomcat6/conf/Catalina/dashboard.$OC_DOMAIN/
# In the VM, we do not distinguish between 'normal' and 'low' tomcat instances
sed -i -e 's/tomcat6-low/tomcat6/' /usr/share/tomcat6/conf/Catalina/dashboard.$OC_DOMAIN/*


sed \
  -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" \
  -e "s~wayf.certificate=.*$~wayf.certificate=$ENGINEBLOCK_CERT~" \
  $DASHBOARD_DIST_BASEDIR/tomcat/conf/classpath_properties/dashboard.properties.vm \
  > /tmp/dashboard.properties

if $UPGRADE
then
  rm -rf /usr/share/tomcat6/work/Catalina
  rm -rf /usr/share/tomcat6/webapps/*/*

  backupFile /usr/share/tomcat6/conf/classpath_properties/dashboard.properties
  perl $OC_SCRIPTDIR/tools/replaceProperties/replaceProperties.pl /tmp/dashboard.properties /usr/share/tomcat6/conf/classpath_properties/dashboard.properties

else

  cp $DASHBOARD_DIST_BASEDIR/tomcat/conf/classpath_properties/dashboard-logback.xml.vm /usr/share/tomcat6/conf/classpath_properties/dashboard-logback.xml
  cp $DASHBOARD_DIST_BASEDIR/tomcat/conf/classpath_properties/metadata.dashboard.properties.vm /usr/share/tomcat6/conf/classpath_properties/metadata.dashboard.properties
  cp /tmp/dashboard.properties /usr/share/tomcat6/conf/classpath_properties/

  install -d /usr/share/tomcat6/webapps/dashboard.$OC_DOMAIN
  chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/

  SERVERXMLLINE='<Host name="dashboard.'$OC_DOMAIN'" appBase="webapps/dashboard.'$OC_DOMAIN'"/>'
  sed -i "s#</Engine>#$SERVERXMLLINE\n</Engine>#" /usr/share/tomcat6/conf/server.xml

  cat $OC_BASEDIR/configs/httpd/conf.d/dashboard.conf  | \
    sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
    /etc/httpd/conf.d/dashboard.conf

fi