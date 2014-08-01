#!/bin/bash

if [ ! -d /opt/www/apis ]
then
  cd /opt/www
  $GITCLONE $OC__APIS_REPO
fi

cd /opt/www/apis
$GITRESET # revert potential changes
$GITFETCH
$GITCHECKOUT ${APIS_VERSION}
$MVN clean install -DskipTests

# extract deployable artifact
tar -zxf apis-authorization-server-dist/target/*-bin.tar.gz -C apis-authorization-server-dist/target

APIS_DIST_BASEDIR=/opt/www/apis/apis-authorization-server-dist/target/apis-authorization-server-dist-*/

# remove old deployed war
rm -f /usr/share/tomcat6/wars/apis-*.war 2> /dev/null
# copy new war to Tomcat
cp $APIS_DIST_BASEDIR/tomcat/webapps/*.war /usr/share/tomcat6/wars

# Copy Tomcat-specific context configuration file
install -d /usr/share/tomcat6/conf/Catalina/apis.$OC_DOMAIN
cp $APIS_DIST_BASEDIR/tomcat/conf/context/*.xml /usr/share/tomcat6/conf/Catalina/apis.$OC_DOMAIN/
# In the VM, we do not distinguish between 'normal' and 'low' tomcat instances
sed -i -e 's/tomcat6-low/tomcat6/' /usr/share/tomcat6/conf/Catalina/apis.$OC_DOMAIN/*


sed \
  -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" \
  $APIS_DIST_BASEDIR/tomcat/conf/classpath_properties/apis.application.properties.vm \
  > /tmp/apis.application.properties

sed \
  -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" \
  -e "s~spCertificate=.*$~spCertificate=$OC_CERT~" \
  -e "s~idpCertificate=.*$~idpCertificate=$ENGINEBLOCK_CERT~" \
  -e "s~spPrivateKey=.*$~spPrivateKey=$OC_KEY~" \
  $APIS_DIST_BASEDIR/tomcat/conf/classpath_properties/surfconext.authn.properties.vm \
  > /tmp/surfconext.authn.properties

if $UPGRADE
then
  rm -rf /usr/share/tomcat6/work/Catalina
  rm -rf /usr/share/tomcat6/webapps/*/*

  backupFile /usr/share/tomcat6/conf/classpath_properties/apis.application.properties
  backupFile /usr/share/tomcat6/conf/classpath_properties/surfconext.authn.properties
  perl $OC_SCRIPTDIR/tools/replaceProperties/replaceProperties.pl /tmp/apis.application.properties /usr/share/tomcat6/conf/classpath_properties/apis.application.properties
  perl $OC_SCRIPTDIR/tools/replaceProperties/replaceProperties.pl /tmp/surfconext.authn.properties /usr/share/tomcat6/conf/classpath_properties/surfconext.authn.properties

else

  # Apply db credentials to file apis.application.properties
  sed -i "s/__OC__APIS_DB_USER__/$OC__APIS_DB_USER/g" /tmp/apis.application.properties
  sed -i "s/__OC__APIS_DB_PASS__/$OC__APIS_DB_PASS/g" /tmp/apis.application.properties

  cp $APIS_DIST_BASEDIR/tomcat/conf/classpath_properties/apis-logback.xml.vm /usr/share/tomcat6/conf/classpath_properties/apis-logback.xml
  cp /tmp/apis.application.properties /usr/share/tomcat6/conf/classpath_properties/
  cp /tmp/surfconext.authn.properties /usr/share/tomcat6/conf/classpath_properties/

  install -d /usr/share/tomcat6/webapps/apis.$OC_DOMAIN
  chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/

  SERVERXMLLINE='<Host name="apis.'$OC_DOMAIN'" appBase="webapps/apis.'$OC_DOMAIN'"/>'
  sed -i "s#</Engine>#$SERVERXMLLINE\n</Engine>#" /usr/share/tomcat6/conf/server.xml

  mysql -u root --password=$OC__ROOT_DB_PASS -e "CREATE DATABASE IF NOT EXISTS apis DEFAULT CHARSET utf8 DEFAULT COLLATE utf8_unicode_ci;"
  mysql -u root --password=$OC__ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON apis.* TO $OC__APIS_DB_USER@localhost IDENTIFIED BY '$OC__APIS_DB_PASS'"

  cat $OC_BASEDIR/configs/httpd/conf.d/apis.conf  | \
    sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
    /etc/httpd/conf.d/apis.conf

  echo "Will startup Tomcat to execute queries that can only be done after initial filling of database tables."
  service tomcat6 start
  echo "Waiting for Tomcat startup to finish..."
  timeout 300 grep -q 'INFO: Server startup in' <(tail -n 0 -f /opt/tomcat/logs/catalina.out)
  if [ $? -eq 0 ] # If timeout did not occur.
  then
    echo "Importing data into APIS database"
    cat $OC_BASEDIR/data/apis.sql | \
    sed \
      -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" | \
    mysql -u root --password=$OC__ROOT_DB_PASS apis

    service tomcat6 stop
  else
    echo "Did not see Tomcat start up within reasonable time. Could not perform queries that had to be executed after startup"
  fi

fi
