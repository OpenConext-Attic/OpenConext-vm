#!/bin/sh

# Install java-1.6.0-openjdk to overrule the default gcj, which is horribly broken for us.
$YUM -y install java-1.6.0-openjdk java-1.6.0-openjdk-devel

export JAVA_HOME=/etc/alternatives/jre
echo "export JAVA_HOME=/etc/alternatives/jre" > /etc/profile.d/java_home.sh

if $MVN -v >> /dev/null 2>&1
then
  echo "Maven is already installed."
else
  MVN_URL=http://apache.cs.uu.nl/dist/maven/maven-3/${MVN_VERSION}/binaries/apache-maven-${MVN_VERSION}-bin.tar.gz
  MVN_LOCALTARBALL=`mktemp`
  MVN_INSTALLDIR=/opt
  MVN_HOME=$MVN_INSTALLDIR/apache-maven-${MVN_VERSION}

  MVN_SYMLINK=/opt/maven

  install -d $MVN_INSTALLDIR &&
  curl -s $MVN_URL -o $MVN_LOCALTARBALL &&
  tar -xzf $MVN_LOCALTARBALL -C $MVN_INSTALLDIR

  rm $MVN_LOCALTARBALL
  ln -sf $MVN_HOME $MVN_SYMLINK &&
  ln -sf $MVN_SYMLINK/bin/mvn /usr/bin/mvn

fi
