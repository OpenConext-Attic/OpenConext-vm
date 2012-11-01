#!/bin/sh

if mvn -v >> /dev/null 2>&1
then
  echo "Maven is already installed."
else
  MVN_URL=http://apache.cs.uu.nl/dist/maven/maven-3/${MVN_VERSION}/binaries/apache-maven-${MVN_VERSION}-bin.tar.gz
  MVN_LOCALTARBALL=`mktemp`
  MVN_INSTALLDIR=/opt/apache-maven-${MVN_VERSION}
  MVN_SYMLINK=/opt/maven

  mkdir -p $MVN_INSTALLDIR &&
  curl -s $MVN_URL -o $MVN_LOCALTARBALL &&
  tar -xzf $MVN_LOCALTARBALL -C $MVN_INSTALLDIR &&
  rm $MVN_LOCALTARBALL
  ln -sf $MVN_INSTALLDIR $MVN_SYMLINK &&
  ln -sf $MVN_SYMLINK/bin/mvn /usr/bin/mvn

fi
