#!/bin/sh

source /vagrant/scripts/versions.sh

mvn -v > /dev/null
if [ $? -ne 0 ]
then
    cd /opt &&
    wget -q http://apache.cs.uu.nl/dist/maven/maven-3/${MVN_VERSION}/binaries/apache-maven-${MVN_VERSION}-bin.tar.gz &&
    tar -xzf apache-maven-${MVN_VERSION}-bin.tar.gz &&
    rm apache-maven-${MVN_VERSION}-bin.tar.gz &&
    ln -sf apache-maven-${MVN_VERSION} maven &&
    ln -sf /opt/maven/bin/mvn /usr/bin/
    cd -
fi
