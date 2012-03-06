#
# Install OpenConext from scratch on a CentOS/RHEL 6.x system
#
# This script assumes:
#
# - it is run as root
# - a CentOS / RHEL 6.x installation
#
# This script was tested on an installation to disk of the CentOS 6.2 x86_64 Live ISO
#

CURDIR=`pwd`

# make cp, mv and rm not as for confirmation...
alias cp='cp'
alias mv='mv'
alias rm='rm'

# Define versions of projects
COIN_TESTSP_VERSION=2.1.0-SNAPSHOT


# disable SELINUX (requires reboot!)
sed -i 's/^SELINUX=enforcing$/SELINUX=disabled/g' /etc/selinux/config

# Add Shibboleth repository (Java Service Provider)
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/security://shibboleth/RHEL_6/security:shibboleth.repo
cd $CURDIR

# update the CentOS/RHEL system
yum -y update

# install required packages
yum -y install tomcat6 httpd php-cli php php-mysql php-curl svn telnet \
	mod_ssl mysql-server openldap-servers php-ldap php-xml wget \
	firefox mysql-connector-java memcached openldap-clients \
	php-pecl-memcache nss-tools java-1.6.0-openjdk-devel gcc \
	kernel-devel git

# install non-CentOS packages
yum -y install shibboleth

# remove existing MySQL databases
service mysqld stop
rm -rf /var/lib/mysql

# Enable PHP short open tag for non-conforming PHP code
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php.ini

# Start some services and configure them to automatically start on system boot 
chkconfig httpd on && service httpd start
chkconfig mysqld on && service mysqld start
chkconfig memcached on && service memcached start

# configure MySQL (WARNING: this is insecure!)
mysqladmin -u root password 'c0n3xt'
echo "grant all privileges on *.* to 'root'@'%' identified by 'c0n3xt';" | mysql -u root --password=c0n3xt mysql
service mysqld restart

# configure some OpenConext DNS entries on this machine
grep openconext /etc/hosts > /dev/null
if [ $? -eq 1 ]
then
	# add DNS entries to hosts file
	echo "# OpenConext" >> /etc/hosts
	echo "127.5.0.1  db.openconext.local" >> /etc/hosts
	echo "127.5.0.2  ldap.openconext.local" >> /etc/hosts
	echo "127.5.0.3  grouper.openconext.local" >> /etc/hosts
	echo "127.5.0.4  serviceregistry.openconext.local" >> /etc/hosts
	echo "127.5.0.5  engine.openconext.local" >> /etc/hosts
	echo "127.5.0.6  manage.openconext.local" >> /etc/hosts
	echo "127.5.0.7  guestidp.openconext.local" >> /etc/hosts
	echo "127.5.0.8  portal.openconext.local" >> /etc/hosts
	echo "127.5.0.9  teams.openconext.local" >> /etc/hosts
	echo "127.5.0.10 os.openconext.local" >> /etc/hosts
	echo "127.5.0.11 testsp.openconext.local" >> /etc/hosts
	echo "127.5.0.12 static.openconext.local" >> /etc/hosts
	echo "127.5.0.13 testidp.openconext.local" >> /etc/hosts
fi

# Remove earlier installation files
rm -rf /etc/surfconext/
rm -rf /opt/www/
rm -rf ~/repos
rm -rf /var/log/surfconext/

mkdir -p /var/log/surfconext
chmod o+w /var/log/surfconext
touch /var/log/surfconext/engineblock.log
chmod o+w /var/log/surfconext/engineblock.log

mkdir ~/repos
cd ~/repos
# Get COIN stuff
svn co https://svn.surfnet.nl/svn/coin-os/coin-infra/trunk/coin-infra-dist/src/main/ > /dev/null

# Apache Configuration
# PHP
cp main/httpd/conf.d/php/dev/* /etc/httpd/conf.d/
# Java
cp main/httpd/conf.d/java/dev/* /etc/httpd/conf.d/

# Rename all domains mentioned in the files to openconext.local
cd /etc/httpd/conf.d/
sed -i 's/dev.surfconext.nl/openconext.local/g' *

# remove "Do It Yourself" stuff, not needed for this installation
rm /etc/httpd/conf.d/*diy*
service httpd restart

###########################
# Install SSL certificate #
###########################

# The certificates are generated using the XCA tool, the DB file is included
# as well as "openconext.xdb".

cd ${CURDIR}
mkdir -p /etc/httpd/keys/
cp certs/star.openconext.local.key /etc/httpd/keys/
cp certs/star.openconext.local.pem /etc/httpd/keys/
cp certs/star.os.openconext.local.key /etc/httpd/keys/
cp certs/star.os.openconext.local.pem /etc/httpd/keys/

cp certs/openconext.pem /etc/httpd/keys/star.openconext.local_cabundle.pem
cp certs/openconext.pem /etc/httpd/keys/star.os.openconext.local_cabundle.pem

service httpd restart

##########################
# Install Static content #
##########################
mkdir -p /opt/www/static
cd /opt/www/static
svn co https://svn.surfnet.nl/svn/coin-eb/static/trunk .  > /dev/null

#######################
# Install EngineBlock #
#######################
mkdir -p /opt/www/engineblock
cd /opt/www/engineblock
svn co https://svn.surfnet.nl/svn/coin-eb/engineblock/trunk/ . > /dev/null
echo "create database engineblock default charset utf8 default collate utf8_unicode_ci;" | mysql -u root --password=c0n3xt

#############################################
# Modify the EngineBlock configuration file #
#############################################

mkdir -p /etc/surfconext/
cp docs/example.engineblock.ini /etc/surfconext/engineblock.ini
sed -i 's/^\[ENV : base\]/\[dev : base\]/g' /etc/surfconext/engineblock.ini
sed -i 's/database.master1.user     = ""/database.master1.user     = "root"/g' /etc/surfconext/engineblock.ini
sed -i 's/database.master1.password = ""/database.master1.password = "c0n3xt"/g' /etc/surfconext/engineblock.ini
# we really need Mail writerName otherwise the migrate script below b0rks...
echo '' >> /etc/surfconext/engineblock.ini
echo '; logs' >> /etc/surfconext/engineblock.ini
echo 'logs.mail.writerName = "Mail"' >> /etc/surfconext/engineblock.ini
echo 'logs.mail.writerNamespace = "EngineBlock_Log_Writer"' >> /etc/surfconext/engineblock.ini
echo 'logs.mail.filterName = "Priority"' >> /etc/surfconext/engineblock.ini
echo 'logs.mail.filterParams.priority = 3 ; Errors' >> /etc/surfconext/engineblock.ini
echo 'logs.mail.writerParams.filterValues[] = "encryption.key.private"' >> /etc/surfconext/engineblock.ini
echo 'logs.mail.writerParams.filterValues[] = "ldap.password"' >> /etc/surfconext/engineblock.ini
echo 'logs.mail.writerParams.filterValues[] = "serviceRegistry.user_secret"' >> /etc/surfconext/engineblock.ini
echo 'logs.mail.writerParams.filterValues[] = "database.master1.password"' >> /etc/surfconext/engineblock.ini
echo 'logs.mail.writerParams.filterValues[] = "grouper.password"' >> /etc/surfconext/engineblock.ini
echo 'logs.mail.writerParams.filterValues[] = "hz.auth.consumerSecret"' >> /etc/surfconext/engineblock.ini
echo 'logs.mail.writerParams.from.email = "noreply@surfnet.nl"' >> /etc/surfconext/engineblock.ini
echo 'logs.mail.writerParams.from.name  = "SURFconext EngineBlock"' >> /etc/surfconext/engineblock.ini

# configure LDAP
sed -i 's/ldap.host               = ""/ldap.host               = "ldap.openconext.local"/g' /etc/surfconext/engineblock.ini
sed -i 's/ldap.password           = ""/ldap.password           = "jf7RH4Hj20De"/g' /etc/surfconext/engineblock.ini
echo 'ldap.useSsl = false' >> /etc/surfconext/engineblock.ini

echo 'phpSettings.display_errors = true' >> /etc/surfconext/engineblock.ini
sed -i 's/serviceregistry.example.com/serviceregistry.openconext.local/g' /etc/surfconext/engineblock.ini
sed -i 's/ksD76Fh2Sj3e3/engineblock/g' /etc/surfconext/engineblock.ini
sed -i 's/cookie.lang.domain = "dev.surfconext.nl"/cookie.lang.domain = "openconext.local"/g' /etc/surfconext/engineblock.ini
sed -i 's/static.host         = "static.dev.surfconext.nl"/static.host         = "static.openconext.local"/g' /etc/surfconext/engineblock.ini

# Edit the profile.sh file to set correct environment variable
echo 'export ENGINEBLOCK_ENV="dev"' > /etc/profile.d/openconext.sh
echo 'export PATH=$PATH:/opt/maven/bin' >> /etc/profile.d/openconext.sh

chmod +x /etc/profile.d/openconext.sh
source /etc/profile.d/openconext.sh

# Generate Self Signed Certificate for EngineBlock and add it to the configuration
cd $CURDIR
openssl req -subj '/CN=EngineBlock/OU=Services/O=SURFnet/C=NL/' -newkey rsa:2048 -new -x509 -days 3652 -nodes -out example.org.crt -keyout example.org.pem
CRT=`cat example.org.crt`
PEM=`cat example.org.pem`
echo "" >> /etc/surfconext/engineblock.ini
echo "encryption.key.public = \"${CRT}\"" >> /etc/surfconext/engineblock.ini
echo "encryption.key.private = \"${PEM}\"" >> /etc/surfconext/engineblock.ini

##############
# setup LDAP #
##############

# first remove all old stuff...
service slapd stop
rm -rf /var/lib/ldap/*
service slapd start
cd ~/repos 
svn co https://svn.surfnet.nl/svn/coin-os/vendor/grouper/1.6.3/src/main/resources/  > /dev/null
cp resources/ldap/eduperson-200412.ldif /etc/openldap/schema/
cp resources/ldap/nleduperson.schema /etc/openldap/schema/
cp resources/ldap/collab.schema /etc/openldap/schema/
cp resources/ldap/slapd.conf /etc/openldap
sed -i 's/^rootpw.*/rootpw c0n3xt/g' /etc/openldap/slapd.conf

# Migrate RHEL/CentOS 5.x config to RHEL/CentOS 6.x
# See http://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6/html-single/Migration_Planning_Guide/index.html#id4334890

rm -rf /etc/openldap/slapd.d/* 
slaptest -f /etc/openldap/slapd.conf -F /etc/openldap/slapd.d 
chown -R ldap:ldap /etc/openldap/slapd.d 
chmod -R 000 /etc/openldap/slapd.d 
chmod -R u+rwX /etc/openldap/slapd.d 
chkconfig slapd on && service slapd restart

# Add entries...
ldapadd -x -D cn=admin,dc=surfconext,dc=nl -w c0n3xt -f resources/ldap/ldap-entries.ldif

# Updating schema some more...
ldapmodify -x -D cn=admin,cn=config -w c0n3xt -f /opt/www/engineblock/ldap/changes/addDeprovisionWarningSentAttributes.ldif
ldapmodify -x -D cn=admin,cn=config -w c0n3xt -f /opt/www/engineblock/ldap/changes/addCollabPersonUUID.ldif
ldapadd -x -D cn=admin,dc=surfconext,dc=nl -w c0n3xt -f /opt/www/engineblock/ldap/changes/versAccount.ldif

# Update EngineBlock LDAP,DB, etc.
cd /opt/www/engineblock
# Run migrate a few times to be sure :)
cd bin && ./migrate && ./migrate && ./migrate && cd ..

###########################
# Install ServiceRegistry #
###########################
echo "create database serviceregistry default charset utf8 default collate utf8_unicode_ci;" | mysql -u root --password=c0n3xt
mkdir -p /opt/www/serviceregistry
cd /opt/www/serviceregistry
svn co https://svn.surfnet.nl/svn/coin-eb/serviceregistry/trunk/ . > /dev/null
mkdir -p /etc/surfconext
cp -r docs/etc/* /etc/surfconext/
touch modules/janus/enable
sed -i "s/'username'  => ''/'username'  => 'root'/g" /etc/surfconext/serviceregistry.module_janus.php
sed -i "s/'password'  => ''/'password'  => 'c0n3xt'/g" /etc/surfconext/serviceregistry.module_janus.php
sed -i "s/engineblock.example.edu/engine.openconext.local/g" /etc/surfconext/serviceregistry.saml20-idp-remote.php
cd bin/
./migrate
cd ..
./bin/apply_janus_patches.sh

# Install EngineBlock's certificate for ServiceRegistry
cp ${CURDIR}/example.org.crt /etc/surfconext/serviceregistry-certs/engineblock.crt
rm ${CURDIR}/example.org.pem ${CURDIR}/example.org.crt

###################################
# Install Attribute Manipulations #
###################################

mkdir -p /opt/www/attribute-manipulations
cd /opt/www/attribute-manipulations
svn co https://svn.surfnet.nl/svn/coin-eb/attribute-manipulations/trunk/ .

# enable attribute manipulations in EngineBlock
echo 'attributeManipulator.file.location = "../attribute-manipulations"' >> /etc/surfconext/engineblock.ini

######################
# Install a Test IdP #
######################
mkdir -p /opt/www/testidp
cd /opt/www/testidp
svn checkout http://simplesamlphp.googlecode.com/svn/branches/simplesamlphp-1.8 . > /dev/null
cp -ar config-templates/* config/
cp -ar metadata-templates/* metadata/
touch modules/exampleauth/enable
patch -p1 < ${CURDIR}/testidp_config.diff
# Install Test IdP apache config
cp ${CURDIR}/testidp.conf /etc/httpd/conf.d/testidp.conf
service httpd restart

#############################
# ServiceRegistry Bootstrap #
#############################

# Add TestIdP (as IdP) and serviceregistry (as SP) and engine (as SP) to serviceregistry DB
# and configure the TestIdP "employee" user as ServiceRegistry "admin"
# we need to figure out the SSL cert of engine, or be smart about updating it!!!
mysql -u root --password=c0n3xt serviceregistry < ${CURDIR}/sr_bootstrap.sql

# Have ServiceRegistry use EngineBlock for authentication
sed -i "s/^\$config\['auth'\] = 'admin';/\#\$config\['auth'\] = 'admin';/g" /etc/surfconext/serviceregistry.module_janus.php
sed -i "s/^\#\$config\['auth'\] = 'default-sp';/\$config\['auth'\] = 'default-sp';/g" /etc/surfconext/serviceregistry.module_janus.php

# Set correct attribute for userid in ServiceRegistry
sed -i "s/\\$config['useridattr'] = 'user';/\\$config['useridattr'] = 'nameid';/g" /etc/surfconext/serviceregistry.module_janus.php

##################
# Install Manage #
##################
mkdir -p /opt/www/manage
cd /opt/www/manage
svn co https://svn.surfnet.nl/svn/coin-manage/trunk/ .
cp docs/example.manage.ini /etc/surfconext/manage.ini

# Configure Manage
sed -i "s/serviceregistry.surfconext.nl/serviceregistry.openconext.local/g" /etc/surfconext/manage.ini
sed -i "s/portal.surfconext.nl/portal.openconext.local/g" /etc/surfconext/manage.ini
sed -i "s/engine.surfconext.nl/engine.openconext.local/g" /etc/surfconext/manage.ini
service httpd restart

#################
# Install Maven #
#################

MVN_VERSION=3.0.4
mkdir -p /opt
cd /opt
wget http://apache.cs.uu.nl/dist//maven/binaries/apache-maven-${MVN_VERSION}-bin.tar.gz
tar -xzf apache-maven-${MVN_VERSION}-bin.tar.gz
ln -s apache-maven-${MVN_VERSION} maven
PATH=$PATH:/opt/maven/bin
export PATH
cd ${CURDIR}

##################
# Install TestSP #
##################

# install opensocial-java-client
# FIXME: we should probably take the trunk version instead of tagged version
cd ~/repos/
svn co https://svn.surfnet.nl/svn/coin-os/vendor/opensocial-java-client/trunk/ opensocial-java-client
cd opensocial-java-client/
mvn clean install

# install json-taglib
cd ~/repos/
svn checkout https://json-taglib.svn.sourceforge.net/svnroot/json-taglib/tags/0.4.1 json-taglib-0.4.1
cd json-taglib-0.4.1
mvn clean install

# install coin-test
cd ~/repos/
svn co https://svn.surfnet.nl/svn/coin-gui/coin-test/trunk/ coin-test
cd coin-test
mvn clean install

# get and configure TestSP
cd ~/repos/
svn co https://svn.surfnet.nl/svn/coin-gui/coin-testsp/trunk/ coin-testsp-parent
cd coin-testsp-parent
mvn clean install

# deploy TestSP
service tomcat6 stop

# symlink tomcat
rm /opt/tomcat
ln -s /usr/share/tomcat6 /opt/tomcat

# FIXME: change the configuration to point to openconext.local
cd ~/repos/
tar -xzf coin-testsp-parent/coin-testsp-dist/target/coin-testsp-dist-${COIN_TESTSP_VERSION}-bin.tar.gz

cd /usr/share/tomcat6
mkdir wars
mkdir -p /usr/share/tomcat6/conf/classpath_properties/
cp ~/repos/coin-testsp-dist-${COIN_TESTSP_VERSION}/tomcat/conf/classpath_properties/coin-testsp.properties.dev /usr/share/tomcat6/conf/classpath_properties/coin-testsp.properties
mkdir -p /usr/share/tomcat6/conf/Catalina/testsp.openconext.local/
cp ~/repos/coin-testsp-dist-${COIN_TESTSP_VERSION}/tomcat/conf/context/testsp.xml /usr/share/tomcat6/conf/Catalina/testsp.openconext.local/testsp.xml
cp ~/repos/coin-testsp-dist-${COIN_TESTSP_VERSION}/tomcat/webapps/coin-testsp-war-${COIN_TESTSP_VERSION}.war /usr/share/tomcat6/wars

service tomcat6 start

# configure Shibboleth


cp ~/repos/main/shibboleth/accessError.html /etc/shibboleth
cp ~/repos/main/shibboleth/attribute-map.xml /etc/shibboleth
cp ~/repos/main/shibboleth/attribute-policy.xml /etc/shibboleth
cp ~/repos/main/shibboleth/globalLogout.html /etc/shibboleth
cp ~/repos/main/shibboleth/localLogout.html /etc/shibboleth
cp ~/repos/main/shibboleth/metadataError.html /etc/shibboleth
cp ~/repos/main/shibboleth/partialLogout.html /etc/shibboleth
cp ~/repos/main/shibboleth/sessionError.html /etc/shibboleth
cp ~/repos/main/shibboleth/sslError.html /etc/shibboleth
cp ~/repos/main/shibboleth/shibboleth2.xml.dev /etc/shibboleth/shibboleth2.xml

sed -i "s/dev.surfconext.nl/openconext.local/g" /etc/shibboleth/shibboleth2.xml

cp ~/repos/main/tomcat/conf/catalina.properties /usr/share/tomcat6/conf
cp ~/repos/main/tomcat/conf/log4j.xml /usr/share/tomcat6/conf
#cp ~/repos/main/tomcat/conf/tomcat-env.sh /usr/share/tomcat6/conf
cp ~/repos/main/tomcat/conf/server.xml.dev /usr/share/tomcat6/conf/server.xml

sed -i "s/dev.surfconext.nl/openconext.local/g" /usr/share/tomcat6/conf/server.xml

cd /usr/share/tomcat6/conf
mkdir -p classpath_properties
mkdir -p classpath_properties/keys

chkconfig shibd on
service shibd start

###################
# Install Grouper #
###################

# ...


###################
# Install Shindig #
###################

# ...


####################
# Browser Settings #
####################
echo 'pref("browser.startup.homepage", "data:text/plain,browser.startup.homepage=https://serviceregistry.openconext.local");' > /usr/lib64/firefox/defaults/preferences/localprefs.js



