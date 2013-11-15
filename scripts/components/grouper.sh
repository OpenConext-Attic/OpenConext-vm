#!/bin/bash

cd /tmp
if [ ! -f grouper-dist-${GROUPER_VERSION}-bin.tar.gz ]
then
  ## Only download if not exists yet. Optimization in case script is run successively.
  curl -O https://build.surfconext.nl/repository/public/releases/org/surfnet/coin/grouper-dist/${GROUPER_VERSION}/grouper-dist-${GROUPER_VERSION}-bin.tar.gz
fi
tar zxf grouper-dist-*-bin.tar.gz

# Delete
rm -f /usr/share/tomcat6/wars/grouper-*.war

cp -f tomcat/webapps/*.war /usr/share/tomcat6/wars

cp -f tomcat/conf/classpath_properties/sources.xml.vm /usr/share/tomcat6/conf/classpath_properties/sources.xml
cp -f tomcat/conf/classpath_properties/grouper.hibernate.properties.vm /usr/share/tomcat6/conf/classpath_properties/grouper.hibernate.properties
cp -f tomcat/conf/classpath_properties/grouper.properties /usr/share/tomcat6/conf/classpath_properties/
cp -f tomcat/conf/classpath_properties/log4j.properties /usr/share/tomcat6/conf/classpath_properties/

sed -i "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" /usr/share/tomcat6/conf/classpath_properties/sources.xml
sed -i "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" /usr/share/tomcat6/conf/classpath_properties/grouper.hibernate.properties

if $UPGRADE
then
  rm -Rf /usr/share/tomcat6/work/Catalina/grouper*
  rm -Rf /usr/share/tomcat6/webapps/grouper.*/*
else

  # Initialize Grouper schema
  # Uses the same schema as Teams right now. This same statement is issued by teams-script, but running twice won't do harm.
  mysql -u root --password=c0n3xt -e "create database if not exists teams;"

  echo "Downloading and installing Grouper Shell in /opt/www/grouper-shell..."
  cd /opt/www
  curl -O http://www.internet2.edu/grouper/release/2.1.5/grouper.apiBinary-2.1.5.tar.gz
  tar zxf grouper.apiBinary-2.1.5.tar.gz

  # Substitute database parameters in hibernate configuration
  sed -i grouper.apiBinary-2.1.5/conf/grouper.hibernate.properties \
  -e "s~^hibernate.connection.url.*~hibernate.connection.url=jdbc:mysql://db.$OC_DOMAIN/teams~" \
  -e "s~^hibernate.connection.username.*~hibernate.connection.username=root~" \
  -e "s~^hibernate.connection.password.*~hibernate.connection.password=c0n3xt~"

  # Set properties in grouper props to
  # 1. autocreate the admin groups
  # 2. add a 'wheel' group (that is: etc:sysadmingroup) to enable users in that group to obtain admin privileges
  sed -i grouper.apiBinary-2.1.5/conf/grouper.properties \
  -e "s~^configuration.autocreate.system.groups.*~configuration.autocreate.system.groups=true~" \
  -e "s~^groups.wheel.use.*~groups.wheel.use=true~"
  ln -s /opt/www/grouper.apiBinary-2.1.5 /opt/www/grouper-shell

  cd /opt/www/grouper-shell
  # Run the registry initialization script
  bin/gsh -registry -runscript -noprompt

  # Run the following with sourceId == 'surfnet', this is the ldap source from Engineblock
  sed -i conf/sources.xml -e 's~<id>jdbc</id>~<id>surfnet</id>~'

  GSH_SCRIPT=`mktemp`
cat << EOS > $GSH_SCRIPT
// Provision the admin user @ mujina up front
addSubject("urn:collab:person:example.com:admin","person","The admin user at Mujina IdP")

// Make Mujina user 'admin' member of the wheel group 'etc:sysadmingroup'
addMember("etc:sysadmingroup","urn:collab:person:example.com:admin");
EOS
  bin/gsh $GSH_SCRIPT

  # Run the following with sourceId == 'applications', which is what Teams/Api expect
  sed -i conf/sources.xml -e 's~<id>surfnet</id>~<id>applications</id>~'
  GSH_SCRIPT=`mktemp`
cat << EOS > $GSH_SCRIPT
// Basic users (applications) of the system
addSubject("gadget", "person", "gadget")
addMember("etc:sysadmingroup","gadget");

addSubject("engine", "person", "engine")
addMember("etc:sysadmingroup","engine");
EOS
  bin/gsh $GSH_SCRIPT

  # Change sourceId back to jdbc
    sed -i conf/sources.xml -e 's~<id>jdbc</id>~<id>jdbc</id>~'

  cd /tmp

  install -d /usr/share/tomcat6/conf/Catalina/grouper.$OC_DOMAIN
  install -d /usr/share/tomcat6/webapps/grouper.$OC_DOMAIN
  chown -Rf tomcat:tomcat /usr/share/tomcat6/webapps/grouper.$OC_DOMAIN

  cat $OC_BASEDIR/configs/httpd/conf.d/grouper.conf  | \
    sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/" > \
    /etc/httpd/conf.d/grouper.conf

  SERVERXMLLINE='<Host name="grouper.'$OC_DOMAIN'" appBase="webapps/grouper.'$OC_DOMAIN'"/>'
  sed -i "s#</Engine>#$SERVERXMLLINE\n</Engine>#" /usr/share/tomcat6/conf/server.xml
fi

GROUPER_WS_WAR=`basename /usr/share/tomcat6/wars/grouper-ws-*.war`
GROUPER_WAR=`basename /usr/share/tomcat6/wars/grouper-*.war`

echo "<Context path=\"/grouper-ws\" docBase=\"/usr/share/tomcat6/wars/$GROUPER_WS_WAR\" debug=\"1\"></Context>" > \
  /usr/share/tomcat6/conf/Catalina/grouper.$OC_DOMAIN/grouper-ws.xml
echo "<Context path=\"/grouper\" docBase=\"/usr/share/tomcat6/wars/$GROUPER_WAR\" debug=\"1\"></Context>" > \
  /usr/share/tomcat6/conf/Catalina/grouper.$OC_DOMAIN/grouper.xml
