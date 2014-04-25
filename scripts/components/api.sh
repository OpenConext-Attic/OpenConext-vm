#!/bin/bash

if [ ! -d /opt/www/OpenConext-api ]
then
  cd /opt/www
  $GITCLONE $OC__API_REPO
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

  backupFile /usr/share/tomcat6/conf/classpath_properties/coin-api.properties
  perl $OC_SCRIPTDIR/tools/replaceProperties/replaceProperties.pl /tmp/coin-api.properties /usr/share/tomcat6/conf/classpath_properties/coin-api.properties

else

  cp $API_DIST_BASEDIR/tomcat/conf/classpath_properties/api-logback.xml.vm /usr/share/tomcat6/conf/classpath_properties/api-logback.xml
  cp $API_DIST_BASEDIR/tomcat/conf/classpath_properties/api-ehcache.xml.vm /usr/share/tomcat6/conf/classpath_properties/api-ehcache.xml
  cp /tmp/coin-api.properties /usr/share/tomcat6/conf/classpath_properties/

  # Apply db credentials to file coin-api.properties
  sed -i "s/_OC__ENGINE_DB_USER_/$OC__ENGINE_DB_USER/g" /opt/tomcat/conf/classpath_properties/coin-api.properties
  sed -i "s/_OC__ENGINE_DB_PASS_/$OC__ENGINE_DB_PASS/g" /opt/tomcat/conf/classpath_properties/coin-api.properties
  sed -i "s/_OC__TEAMS_DB_USER_/$OC__TEAMS_DB_USER/g" /opt/tomcat/conf/classpath_properties/coin-api.properties
  sed -i "s/_OC__TEAMS_DB_PASS_/$OC__TEAMS_DB_PASS/g" /opt/tomcat/conf/classpath_properties/coin-api.properties
  sed -i "s/_OC__API_DB_USER_/$OC__API_DB_USER/g" /opt/tomcat/conf/classpath_properties/coin-api.properties
  sed -i "s/_OC__API_DB_PASS_/$OC__API_DB_PASS/g" /opt/tomcat/conf/classpath_properties/coin-api.properties

  # Apply ldap credentials to file coin-api.properties
  sed -i "s/_OC__LDAP_USER_/$OC__LDAP_USER/g" /opt/tomcat/conf/classpath_properties/coin-api.properties
  sed -i "s/_OC__LDAP_PASS_/$OC__LDAP_PASS/g" /opt/tomcat/conf/classpath_properties/coin-api.properties

  # Apply Serviceregistry (Janus) API credentials to file coin-api.properties
  sed -i "s/_OC__API_JANUSAPI_USER_/$OC__API_JANUSAPI_USER/g" /opt/tomcat/conf/classpath_properties/coin-api.properties
  sed -i "s/_OC__API_JANUSAPI_PASS_/$OC__API_JANUSAPI_PASS/g" /opt/tomcat/conf/classpath_properties/coin-api.properties

  install -d /usr/share/tomcat6/webapps/api.$OC_DOMAIN
  chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/

  SERVERXMLLINE='<Host name="api.'$OC_DOMAIN'" appBase="webapps/api.'$OC_DOMAIN'"/>'
  sed -i "s#</Engine>#$SERVERXMLLINE\n</Engine>#" /usr/share/tomcat6/conf/server.xml

  mysql -u root --password=$OC__ROOT_DB_PASS -e "create database if not exists api default charset utf8 default collate utf8_unicode_ci;"

  # Create api user/pass
  mysql -uroot -p$OC__ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON api.* TO $OC__API_DB_USER@localhost IDENTIFIED BY '$OC__API_DB_PASS'"
  mysql -uroot -p$OC__ROOT_DB_PASS -e "FLUSH PRIVILEGES"

  success=`mysqladmin -u$OC__API_DB_USER -p$OC__API_DB_PASS ping | grep -c "mysqld is alive"`
  if [[ $success == '1' ]]
  then
    echo -e "\nValidating new MySQL API password: SUCCESS!\n"     
  else
    echo -e "\nValidating new MySQL API password: FAILED\n"
    exit
  fi

  cat $OC_BASEDIR/configs/httpd/conf.d/api.conf  | \
    sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
    /etc/httpd/conf.d/api.conf
fi
