#!/bin/sh

#
# OpenConext Java software
#
# This script configures a CentOS system for OpenConext. It performs
# the installation and configuration of Java modules of the OpenConext platform.
#

OPENCONEXT_PARENT_VERSION='coin-master-2.1.0 coin-master-2.1.1'
OPENSOCIAL_JAVA_CLIENT_VERSION='opensocial-java-client-2.1.0-coin'
OPENCONEXT_TEST_VERSION='coin-test-2.1.0 coin-test-2.2.0'
OPENCONEXT_API_VERSION='coin-api-parent-2.1.0'
OPENCONEXT_SHARED_VERSION='coin-shared-2.1.0'
OPENCONEXT_OPENSOCIAL_VERSION='coin-opensocial-2.1.0'
OPENCONEXT_TEAMS_VERSION='coin-teams-parent-2.1.0'

LAUNCH_DIR=`pwd`
TEMP_DIR="/opt/tmp"

JAVA_DIR=/opt/OpenConext/java
MVN_DIR=/opt/maven
MVN_VERSION=3.0.4

mkdir -p ${JAVA_DIR} ${MVN_DIR} ${TEMP_DIR}

function getGitRepository {
	if [ -d $2 ]
	then
		git pull $2
	else
		mkdir -p $2
		git clone $1 $2
	fi
}

function getRepository {
	if [ -d $2 ]
	then
		svn up $2
	else
		mkdir -p $2
		svn co $1 $2
	fi
}

# We need Sun's Java for now unfortunately due to OpenJDK bug(s)
# See http://bugs.openjdk.java.net/show_bug.cgi?id=100167
if [ -f /tmp/jdk-rpm.bin ]
then 
	echo "Oracle Java already assumed installed."

else
	wget -c -O /tmp/jdk-rpm.bin -N http://download.oracle.com/otn-pub/java/jdk/6u31-b04/jdk-6u31-linux-x64-rpm.bin
	sh /tmp/jdk-rpm.bin -noregister

	# set Oracle Java as default
	rm -f /etc/alternatives/java
	ln -s /usr/java/latest/bin/java /etc/alternatives/java
	rm -f /etc/alternatives/javac
	ln -s /usr/java/latest/bin/javac /etc/alternatives/javac
fi


# Add Shibboleth repository
wget -c -O /etc/yum.repos.d/shib.repo http://download.opensuse.org/repositories/security://shibboleth/RHEL_6/security:shibboleth.repo

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
grep 'export PATH=$PATH:/opt/maven/bin' /etc/profile.d/openconext.sh > /dev/null
if [ $? -ge 1 ]
then
	echo 'export PATH=$PATH:/opt/maven/bin' >> /etc/profile.d/openconext.sh
fi
source /etc/profile.d/openconext.sh

# OPENCONEXT-PARENT
getGitRepository "git://github.com/OpenConext/OpenConext-parent.git" "${JAVA_DIR}/OpenConext-parent"
cd ${JAVA_DIR}/OpenConext-parent
for V in ${OPENCONEXT_PARENT_VERSION}
do
	git checkout $V
	mvn clean install || exit
done

# OPENSOCIAL-JAVA-CLIENT
getRepository "https://svn.surfnet.nl/svn/coin-os/vendor/opensocial-java-client/tags/" "${JAVA_DIR}/opensocial-java-client"
cd "${JAVA_DIR}/opensocial-java-client"
for V in ${OPENSOCIAL_JAVA_CLIENT_VERSION}
do
	cd ${JAVA_DIR}/opensocial-java-client/${V}
	mvn clean install || exit
done

# OPENCONEXT-TEST
getGitRepository "git://github.com/OpenConext/OpenConext-test.git" "${JAVA_DIR}/OpenConext-test"
cd ${JAVA_DIR}/OpenConext-test
for V in ${OPENCONEXT_TEST_VERSION}
do
	git checkout $V
	mvn clean install || exit
done

# OPENCONEXT-API
getGitRepository "git://github.com/OpenConext/OpenConext-api.git" "${JAVA_DIR}/OpenConext-api"
cd ${JAVA_DIR}/OpenConext-api
for V in ${OPENCONEXT_API_VERSION}
do
	git checkout $V
	mvn clean install || exit
done

# OPENCONEXT-SHARED
getRepository "https://svn.surfnet.nl/svn/coin-gui/coin-shared/tags/" "${JAVA_DIR}/OpenConext-shared"
cd "${JAVA_DIR}/OpenConext-shared"
for V in ${OPENCONEXT_SHARED_VERSION}
do
	cd ${JAVA_DIR}/OpenConext-shared/${V}
	mvn clean install || exit
done

# OPENCONEXT-OPENSOCIAL
getRepository "https://svn.surfnet.nl/svn/coin-gui/coin-opensocial/tags/" "${JAVA_DIR}/OpenConext-opensocial"
cd "${JAVA_DIR}/OpenConext-opensocial"
for V in ${OPENCONEXT_OPENSOCIAL_VERSION}
do
	cd ${JAVA_DIR}/OpenConext-opensocial/${V}
	mvn clean install || exit
done

# OPENCONEXT-TEAMS
getGitRepository "git://github.com/OpenConext/OpenConext-teams.git" "${JAVA_DIR}/OpenConext-teams"
cd ${JAVA_DIR}/OpenConext-teams
for V in ${OPENCONEXT_TEAMS_VERSION}
do
	git checkout $V
	mvn clean install || exit
done

