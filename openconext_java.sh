#!/bin/sh

#
# OpenConext Java software
#
# This script configures a CentOS system for OpenConext. It performs
# the installation and configuration of Java modules of the OpenConext platform.
#

LAUNCH_DIR=`pwd`
TEMP_DIR="/opt/tmp"

MVN_DIR=/opt/maven
MVN_VERSION=3.0.4

# We need Sun's Java for now unfortunately due to OpenJDK bug(s)
# See http://bugs.openjdk.java.net/show_bug.cgi?id=100167
wget -c -O /tmp/jdk-rpm.bin -N http://download.oracle.com/otn-pub/java/jdk/6u31-b04/jdk-6u31-linux-x64-rpm.bin
sh /tmp/jdk-rpm.bin -noregister

# set Oracle Java as default
rm -f /etc/alternatives/java
ln -s /usr/java/latest/bin/java /etc/alternatives/java
rm -f /etc/alternatives/javac
ln -s /usr/java/latest/bin/javac /etc/alternatives/javac

# Add Shibboleth repository
wget -N -O /etc/yum.repos.d/shib.repo http://download.opensuse.org/repositories/security://shibboleth/RHEL_6/security:shibboleth.repo

# install non-CentOS packages
yum -y install shibboleth

# Maven
cd /opt
wget -c -O ${TEMP_DIR}/apache-maven-${MVN_VERSION}-bin.tar.gz http://apache.cs.uu.nl/dist//maven/binaries/apache-maven-${MVN_VERSION}-bin.tar.gz
cd /opt
tar -xzf ${TEMP_DIR}/apache-maven-${MVN_VERSION}-bin.tar.gz
ln -s apache-maven-${MVN_VERSION} maven
cd ${LAUNCH_DIR}

# add Maven to PATH
grep "/opt/maven/bin" /etc/profile.d/openconext.sh > /dev/null
if [ $? -ge 1 ]
then
	echo 'export PATH=$PATH:/opt/maven/bin' >> /etc/profile.d/openconext.sh
	chmod +x /etc/profile.d/openconext.sh
fi
source /etc/profile.d/openconext.sh


