#!/bin/sh


if [ ! -d /opt/www/OpenConext-teams ]
then
    cd /opt/www
    $GITCLONE git://github.com/OpenConext/OpenConext-teams.git
fi

cd /opt/www/OpenConext-teams
$GITPULL
$GITCHECKOUT ${TEAMS_VERSION}
$MVN clean install -DskipTests

# extract deployable artifact
tar -zxf coin-teams-dist/target/*-bin.tar.gz -C coin-teams-dist/target

# remove old deployed war
rm -f /usr/share/tomcat6/wars/coin-teams-war-*.war 2> /dev/null
# copy new war to Tomcat
cp coin-teams-dist/target/coin-teams-dist*/tomcat/webapps/*.war /usr/share/tomcat6/wars

cp coin-teams-dist/target/coin-teams-dist*/tomcat/conf/classpath_properties/*.vm /usr/share/tomcat6/conf/classpath_properties/
# strip off the .vm extension
for i in $(ls /usr/share/tomcat6/conf/classpath_properties/*.vm)
do
  mv $i `dirname $i`/`basename $i .vm`
done

sed -i \
  -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" \
  /usr/share/tomcat6/conf/classpath_properties/coin-teams.properties \
  /usr/share/tomcat6/conf/classpath_properties/grouper.client.properties


# Copy Tomcat-specific context configuration files
install -d /usr/share/tomcat6/conf/Catalina/teams.$OC_DOMAIN
cp coin-teams-dist/target/coin-teams-dist*/tomcat/conf/context/*.xml /usr/share/tomcat6/conf/Catalina/teams.$OC_DOMAIN/



mysql -u root --password=c0n3xt -e "drop database if exists teams; create database teams default charset utf8 default collate utf8_unicode_ci;"
mysql -u root --password=c0n3xt teams < $OC_BASEDIR/data/teams.sql

install -d /usr/share/tomcat6/webapps/teams.$OC_DOMAIN
chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/

SERVERXMLLINE='<Host name="teams.'$OC_DOMAIN'" appBase="webapps/teams.'$OC_DOMAIN'"/>'
sed -i "s#</Engine>#$SERVERXMLLINE\n</Engine>#" /usr/share/tomcat6/conf/server.xml

cat $OC_BASEDIR/configs/httpd/conf.d/teams.conf  | \
  sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
  /etc/httpd/conf.d/teams.conf
