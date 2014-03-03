#!/bin/bash

if [ ! -d /opt/www/OpenConext-api ]
then
  cd /opt/www
  $GITCLONE https://github.com/OpenConext/OpenConext-api.git
fi

cd /opt/www/OpenConext-api
$GITRESET # revert potential changes
$GITFETCH
$GITCHECKOUT ${API_VERSION}
$MVN clean install -DskipTests

# extract deployable artifact
tar -zxf coin-api-dist/target/*-bin.tar.gz -C coin-api-dist/target

API_DIST_BASEDIR=/opt/www/OpenConext-api/coin-api-dist/target/coin-api-dist-*/

# remove old deployed war
rm -f /usr/share/tomcat6/wars/coin-api-*.war 2> /dev/null
# copy new war to Tomcat
cp $API_DIST_BASEDIR/tomcat/webapps/*.war /usr/share/tomcat6/wars

# Copy Tomcat-specific context configuration file
install -d /usr/share/tomcat6/conf/Catalina/api.$OC_DOMAIN
cp $API_DIST_BASEDIR/tomcat/conf/context/*.xml /usr/share/tomcat6/conf/Catalina/api.$OC_DOMAIN/



sed \
  -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" \
  -e "s~spCertificate=.*$~spCertificate=$OC_CERT~" \
  -e "s~idpCertificate=.*$~idpCertificate=$ENGINEBLOCK_CERT~" \
  -e "s~spPrivateKey=.*$~spPrivateKey=$OC_KEY~" \
  $API_DIST_BASEDIR/tomcat/conf/classpath_properties/coin-api.properties.vm \
  > /tmp/coin-api.properties

if $UPGRADE
then
  rm -rf /usr/share/tomcat6/work/Catalina
  rm -rf /usr/share/tomcat6/webapps/*/*

  if [[ "$OC_VERSION" == "v46" ]]
  then
    cp $API_DIST_BASEDIR/tomcat/conf/classpath_properties/api-logback.xml.vm /usr/share/tomcat6/conf/classpath_properties/api-logback.xml
  fi

  backupFile /usr/share/tomcat6/conf/classpath_properties/coin-api.properties
  perl $OC_SCRIPTDIR/tools/replaceProperties/replaceProperties.pl /tmp/coin-api.properties /usr/share/tomcat6/conf/classpath_properties/coin-api.properties

else

  if [[ "$OC_VERSION" > "v45" || "$OC_VERSION" == "master" ]]
  then
    cp $API_DIST_BASEDIR/tomcat/conf/classpath_properties/api-logback.xml.vm /usr/share/tomcat6/conf/classpath_properties/api-logback.xml
  fi
  cp $API_DIST_BASEDIR/tomcat/conf/classpath_properties/api-ehcache.xml.vm /usr/share/tomcat6/conf/classpath_properties/api-ehcache.xml
  cp /tmp/coin-api.properties /usr/share/tomcat6/conf/classpath_properties/

  # ToDo: How to set these values in api-properties?? as we have no handle
  # Apply credentials to file coin-api.properties
  sed -i "s/\[ENGINEBLOCK_DB_USER\]/$engineblock_db_user/g" /opt/tomcat/conf/classpath_properties/coin-api.properties
  sed -i "s/\[ENGINEBLOCK_DB_PASS\]/$engineblock_db_pass/g" /opt/tomcat/conf/classpath_properties/coin-api.properties
  sed -i "s/\[TEAMS_DB_USER\]/$teams_db_user/g" /opt/tomcat/conf/classpath_properties/coin-api.properties
  sed -i "s/\[TEAMS_DB_PASS\]/$teams_db_pass/g" /opt/tomcat/conf/classpath_properties/coin-api.properties
  sed -i "s/\[API_DB_USER\]/$api_db_user/g" /opt/tomcat/conf/classpath_properties/coin-api.properties
  sed -i "s/\[API_DB_PASS\]/$api_db_pass/g" /opt/tomcat/conf/classpath_properties/coin-api.properties
  sed -i "s/\[API_JANUSAPI_USER\]/$api_janusapi_user/g" /opt/tomcat/conf/classpath_properties/coin-api.properties
  sed -i "s/\[API_JANUSAPI_PASS\]/$api_janusapi_pass/g" /opt/tomcat/conf/classpath_properties/coin-api.properties

  install -d /usr/share/tomcat6/webapps/api.$OC_DOMAIN
  chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/

  SERVERXMLLINE='<Host name="api.'$OC_DOMAIN'" appBase="webapps/api.'$OC_DOMAIN'"/>'
  sed -i "s#</Engine>#$SERVERXMLLINE\n</Engine>#" /usr/share/tomcat6/conf/server.xml

  mysql -u root --password=$ROOT_DB_PASS -e "create database if not exists api default charset utf8 default collate utf8_unicode_ci;"

  cat $OC_BASEDIR/configs/httpd/conf.d/api.conf  | \
    sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
    /etc/httpd/conf.d/api.conf
fi
