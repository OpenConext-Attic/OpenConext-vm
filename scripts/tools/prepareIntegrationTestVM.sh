#!/bin/bash
#
# This script can be used to prepare a clean (CentOS) VM for VM usage.
# It is NOT required to run before regular VM installs,it only pre-installs
# some RPMs and prefills the maven repo of the local root user.
#
# as bamboo@build: ssh-copy-id root@integratie.dev.surfconext.nl

cd /tmp
echo "Installing base packages..."

yum -y install git subversion policycoreutils-python ntp sudo java-1.7.0-openjdk java-1.7.0-openjdk-devel mysql mysql-server \
  mysql-connector-java httpd mod_ssl openldap-servers openldap-clients php php-pecl-apc php-cli php-curl php-devel php-ldap \
  php-mbstring php-mcrypt php-mysql php-pecl-memcache php-soap php-xml samba tomcat6 mysql-connector-java

echo "Checking out and building some java packages, to prefill local maven repo..."

MVN_VERSION=3.0.5

## Maven part copied from main vm script
export JAVA_HOME=/etc/alternatives/jre
echo "export JAVA_HOME=/etc/alternatives/jre" > /etc/profile.d/java_home.sh
MVN_URL=http://apache.cs.uu.nl/dist/maven/maven-3/${MVN_VERSION}/binaries/apache-maven-${MVN_VERSION}-bin.tar.gz
MVN_LOCALTARBALL=`mktemp`
MVN_INSTALLDIR=/tmp
MVN_HOME=$MVN_INSTALLDIR/apache-maven-${MVN_VERSION}

install -d $MVN_INSTALLDIR &&
curl -s $MVN_URL -o $MVN_LOCALTARBALL &&
tar -xzf $MVN_LOCALTARBALL -C $MVN_INSTALLDIR
rm -f $MVN_LOCALTARBALL
## End of mvn part copy

git clone https://github.com/OpenConext/OpenConext-csa.git
git clone https://github.com/OpenConext/OpenConext-api.git
git clone https://github.com/OpenConext/OpenConext-teams.git

for component in csa teams api
do
  cd OpenConext-$component
  $MVN_HOME/bin/mvn clean package
  cd ..
done

echo "Cleaning up..."
rm -Rf $MVN_HOME