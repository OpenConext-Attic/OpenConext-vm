#!/bin/bash

if [ ! -d /opt/www/OpenConext-csa ]
then
  cd /opt/www
  $GITCLONE git://github.com/OpenConext/OpenConext-csa.git
fi

cd /opt/www/OpenConext-csa
#$GITRESET # revert potential changes
#$GITFETCH
#$GITCHECKOUT ${CSA_VERSION}
$MVN -DskipTests clean install

# extract deployable artifact
tar -zxf csa-dist/target/*-bin.tar.gz -C csa-dist/target

CSA_DIST_BASEDIR=/opt/www/OpenConext-csa/csa-dist/target/csa-dist-*

# remove old deployed war
rm -f /usr/share/tomcat6/wars/csa-*.war 2> /dev/null
# copy new war to Tomcat
cp $CSA_DIST_BASEDIR/tomcat/webapps/*.war /usr/share/tomcat6/wars

# Copy Tomcat-specific context configuration file
install -d /usr/share/tomcat6/conf/Catalina/csa.$OC_DOMAIN
cp $CSA_DIST_BASEDIR/tomcat/conf/context/*.xml /usr/share/tomcat6/conf/Catalina/csa.$OC_DOMAIN/
# In the VM, we do not distinguish between 'normal' and 'low' tomcat instances
sed -i -e 's/tomcat6-low/tomcat6/' /usr/share/tomcat6/conf/Catalina/csa.$OC_DOMAIN/*


sed \
  -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" \
  -e "s~wayf.certificate=.*$~wayf.certificate=$ENGINEBLOCK_CERT~" \
  $CSA_DIST_BASEDIR/tomcat/conf/classpath_properties/csa.properties.vm \
  > /tmp/csa.properties

if $UPGRADE
then
  rm -rf /usr/share/tomcat6/work/Catalina
  rm -rf /usr/share/tomcat6/webapps/*/*

  backupFile /usr/share/tomcat6/conf/classpath_properties/csa.properties
  perl $OC_SCRIPTDIR/tools/replaceProperties/replaceProperties.pl /tmp/csa.properties /usr/share/tomcat6/conf/classpath_properties/csa.properties

else

  cp $CSA_DIST_BASEDIR/tomcat/conf/classpath_properties/csa-logback.xml.vm /usr/share/tomcat6/conf/classpath_properties/csa-logback.xml
  cp $CSA_DIST_BASEDIR/tomcat/conf/classpath_properties/csa-ehcache.xml.vm /usr/share/tomcat6/conf/classpath_properties/csa-ehcache.xml
  cp $CSA_DIST_BASEDIR/tomcat/conf/classpath_properties/metadata.csa.properties.vm /usr/share/tomcat6/conf/classpath_properties/metadata.csa.properties
  cp /tmp/csa.properties /usr/share/tomcat6/conf/classpath_properties/

  install -d /usr/share/tomcat6/webapps/csa.$OC_DOMAIN
  chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/

  SERVERXMLLINE='<Host name="csa.'$OC_DOMAIN'" appBase="webapps/csa.'$OC_DOMAIN'"/>'
  sed -i "s#</Engine>#$SERVERXMLLINE\n</Engine>#" /usr/share/tomcat6/conf/server.xml

  mysql -u root --password=c0n3xt -e "create database if not exists csa default charset utf8 default collate utf8_unicode_ci;"

  cat $OC_BASEDIR/configs/httpd/conf.d/csa.conf  | \
    sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
    /etc/httpd/conf.d/csa.conf

fi