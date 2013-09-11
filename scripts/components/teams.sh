#!/bin/bash

if [ ! -d /opt/www/OpenConext-teams ]
then
  cd /opt/www
  $GITCLONE git://github.com/OpenConext/OpenConext-teams.git
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

  if [[ "$OC_VERSION" == "v46" ]]
  then
    cp $TEAMS_DIST_BASEDIR/tomcat/conf/classpath_properties/teams-logback.xml.vm /usr/share/tomcat6/conf/classpath_properties/teams-logback.xml
  fi

  backupFile /usr/share/tomcat6/conf/classpath_properties/coin-teams.properties
  perl $OC_SCRIPTDIR/tools/replaceProperties/replaceProperties.pl /tmp/coin-teams.properties /usr/share/tomcat6/conf/classpath_properties/coin-teams.properties

else

  if [[ "$OC_VERSION" > "v45" ]]
  then
    cp $TEAMS_DIST_BASEDIR/tomcat/conf/classpath_properties/teams-logback.xml.vm /usr/share/tomcat6/conf/classpath_properties/teams-logback.xml
  fi
  cp /tmp/grouper.client.properties /usr/share/tomcat6/conf/classpath_properties/grouper.client.properties
  cp /tmp/coin-teams.properties /usr/share/tomcat6/conf/classpath_properties/coin-teams.properties


  if [[ "$OC_VERSION" < "v46" ]]
  then
    sed -i \
      -e "s~teamsURL=.*~teamsURL=https://teams.$OC_DOMAIN/teams~" \
      /usr/share/tomcat6/conf/classpath_properties/coin-teams.properties
  fi

  if [[ "$OC_VERSION" < "v49" ]]
  then
  # This is fixed for new installations only; existing installations probably already have teams configured. We do not want to touch those.
    sed -i \
      -e "s/group-name-context=urn:collab:group:dev.surfteams.nl:/group-name-context=urn:collab:group:$OC_DOMAIN:/" \
      /usr/share/tomcat6/conf/classpatmyh_properties/coin-teams.properties
  fi

  mysql -u root --password=c0n3xt -e "create database if not exists teams default charset utf8 default collate utf8_unicode_ci;"
  mysql -u root --password=c0n3xt teams < $OC_BASEDIR/data/teams.sql

  install -d /usr/share/tomcat6/webapps/teams.$OC_DOMAIN
  chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/

  SERVERXMLLINE='<Host name="teams.'$OC_DOMAIN'" appBase="webapps/teams.'$OC_DOMAIN'"/>'
  sed -i "s#</Engine>#$SERVERXMLLINE\n</Engine>#" /usr/share/tomcat6/conf/server.xml

  cat $OC_BASEDIR/configs/httpd/conf.d/teams.conf  | \
    sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
    /etc/httpd/conf.d/teams.conf
fi
