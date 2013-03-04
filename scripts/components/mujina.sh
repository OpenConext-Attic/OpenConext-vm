#!/bin/sh

if [ ! -d /opt/www/Mujina ]
then
  cd /opt/www
  $GITCLONE git://github.com/OpenConext/Mujina.git
fi

cd /opt/www/Mujina
$GITPULL
$GITCHECKOUT ${MUJINA_VERSION}
$MVN clean install -DskipTests

rm -f /usr/share/tomcat6/wars/mujina-*.war

# extract deployable artifact
tar -zxf mujina-idp-dist/target/*-bin.tar.gz -C mujina-idp-dist/target
tar -zxf mujina-sp-dist/target/*-bin.tar.gz -C mujina-sp-dist/target

# copy war
cp mujina-idp-dist/target/mujina-idp-dist*/tomcat/webapps/*.war /usr/share/tomcat6/wars
cp mujina-sp-dist/target/mujina-sp-dist*/tomcat/webapps/*.war /usr/share/tomcat6/wars

# copy over properties
cp mujina-idp-dist/target/mujina-idp-dist*/tomcat/conf/classpath_properties/*.vm /usr/share/tomcat6/conf/classpath_properties/
cp mujina-sp-dist/target/mujina-sp-dist*/tomcat/conf/classpath_properties/*.vm /usr/share/tomcat6/conf/classpath_properties/

# strip off the .vm extension
for i in $(ls /usr/share/tomcat6/conf/classpath_properties/*.vm)
do
  mv $i `dirname $i`/`basename $i .vm`
done



MUJINA_SP_WAR=`basename /usr/share/tomcat6/wars/mujina-sp-*.war`
MUJINA_IDP_WAR=`basename /usr/share/tomcat6/wars/mujina-idp-*.war`


# Copy Tomcat-specific context configuration files
install -d /usr/share/tomcat6/conf/Catalina/mujina-sp.$OC_DOMAIN
install -d /usr/share/tomcat6/conf/Catalina/mujina-idp.$OC_DOMAIN
cp mujina-sp-dist/target/mujina-sp-dist*/tomcat/conf/context/*.xml /usr/share/tomcat6/conf/Catalina/mujina-sp.$OC_DOMAIN/
cp mujina-idp-dist/target/mujina-idp-dist*/tomcat/conf/context/*.xml /usr/share/tomcat6/conf/Catalina/mujina-idp.$OC_DOMAIN/

install -d /usr/share/tomcat6/webapps/mujina-sp.$OC_DOMAIN
install -d /usr/share/tomcat6/webapps/mujina-idp.$OC_DOMAIN
chown -R tomcat:tomcat /usr/share/tomcat6/webapps/

SERVERXMLLINE1='<Host name="mujina-idp.'$OC_DOMAIN'" appBase="webapps/mujina-idp.'$OC_DOMAIN'"/>'
sed -i "s#</Engine>#$SERVERXMLLINE1\n</Engine>#" /usr/share/tomcat6/conf/server.xml
SERVERXMLLINE2='<Host name="mujina-sp.'$OC_DOMAIN'" appBase="webapps/mujina-sp.'$OC_DOMAIN'"/>'
sed -i "s#</Engine>#$SERVERXMLLINE2\n</Engine>#" /usr/share/tomcat6/conf/server.xml

cat $OC_BASEDIR/configs/httpd/conf.d/mujina-sp.conf  | \
  sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
  /etc/httpd/conf.d/mujina-sp.conf
cat $OC_BASEDIR/configs/httpd/conf.d/mujina-idp.conf  | \
  sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
  /etc/httpd/conf.d/mujina-idp.conf
