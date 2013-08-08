#!/bin/bash

if [ ! -d /opt/www/OpenConext-cruncher ]
then
  cd /opt/www
  $GITCLONE git://github.com/OpenConext/OpenConext-cruncher.git
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

    mysql -uroot -pc0n3xt apis -e "REPLACE INTO resourceserver (id, contactEmail,  contactName, resourceServerName, resourceServerKey, secret, owner, thumbNailUrl)
    VALUES (99981, 'john.doe@example.com','john doe','Cruncher','cruncher', 'cruncher-secret', null, '')"

#    RESOURCESERVER_ID=`mysql -uroot -pc0n3xt apis -e "select id from resourceserver where resourceServerKey = 'cruncher'"`
fi
