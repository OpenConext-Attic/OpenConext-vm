#!/bin/bash

if [ ! -d /opt/www/OpenConext-teams ]
then
  cd /opt/www
  $GITCLONE https://github.com/OpenConext/OpenConext-teams.git
fi

cd /opt/www/OpenConext-teams
$GITRESET
$GITFETCH
$GITCHECKOUT ${TEAMS_VERSION}
$MVN clean install -DskipTests

# extract deployable artifact
tar -zxf coin-teams-dist/target/*-bin.tar.gz -C coin-teams-dist/target

TEAMS_DIST_BASEDIR=/opt/www/OpenConext-teams/coin-teams-dist/target/coin-teams-dist-*/


# remove old deployed war
rm -f /usr/share/tomcat6/wars/coin-teams-war-*.war 2> /dev/null
# copy new war to Tomcat
cp $TEAMS_DIST_BASEDIR/tomcat/webapps/*.war /usr/share/tomcat6/wars

# Copy Tomcat-specific context configuration files
install -d /usr/share/tomcat6/conf/Catalina/teams.$OC_DOMAIN
cp $TEAMS_DIST_BASEDIR/tomcat/conf/context/*.xml /usr/share/tomcat6/conf/Catalina/teams.$OC_DOMAIN/

cp $TEAMS_DIST_BASEDIR/tomcat/conf/classpath_properties/coin-teams.properties.vm /tmp/coin-teams.properties
cp $TEAMS_DIST_BASEDIR/tomcat/conf/classpath_properties/grouper.client.properties.vm /tmp/grouper.client.properties

sed -i \
  -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" \
  /tmp/coin-teams.properties \
  /tmp/grouper.client.properties


if $UPGRADE
then
  rm -rf /usr/share/tomcat6/work/Catalina
  rm -rf /usr/share/tomcat6/webapps/*/*

  backupFile /usr/share/tomcat6/conf/classpath_properties/coin-teams.properties
  perl $OC_SCRIPTDIR/tools/replaceProperties/replaceProperties.pl /tmp/coin-teams.properties /usr/share/tomcat6/conf/classpath_properties/coin-teams.properties

else

  cp $TEAMS_DIST_BASEDIR/tomcat/conf/classpath_properties/teams-logback.xml.vm /usr/share/tomcat6/conf/classpath_properties/teams-logback.xml
  cp /tmp/grouper.client.properties /usr/share/tomcat6/conf/classpath_properties/grouper.client.properties
  cp /tmp/coin-teams.properties /usr/share/tomcat6/conf/classpath_properties/coin-teams.properties

  # Uses the same schema as Grouper right now. This same statement is issued by teams-script, but running twice won't do harm.
  mysql -u root --password=c0n3xt -e "create database if not exists teams;"
  mysql -u root --password=c0n3xt teams < $OC_BASEDIR/data/teams.sql


  GSH_SCRIPT=`mktemp`
cat << EOS > $GSH_SCRIPT

  // Create Default stems
stems = getStems("nl:surfnet:diensten")
if (stems.size() == 0) {  addRootStem("nl","nl"); addStem("nl","surfnet","surfnet");  addStem("nl:surfnet","diensten","diensten"); }

EOS
  cd /opt/www/grouper-shell ; bin/gsh $GSH_SCRIPT ; cd -

  install -d /usr/share/tomcat6/webapps/teams.$OC_DOMAIN
  chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/

  SERVERXMLLINE='<Host name="teams.'$OC_DOMAIN'" appBase="webapps/teams.'$OC_DOMAIN'"/>'
  sed -i "s#</Engine>#$SERVERXMLLINE\n</Engine>#" /usr/share/tomcat6/conf/server.xml

  cat $OC_BASEDIR/configs/httpd/conf.d/teams.conf  | \
    sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
    /etc/httpd/conf.d/teams.conf
fi
