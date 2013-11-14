#!/bin/bash
# Upgrade script for OpenConext.
#

# Base directory where the scripts (and config etc) is stored.
OC_BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. && pwd )"
OC_SCRIPTDIR=$OC_BASEDIR/scripts

source $OC_SCRIPTDIR/common.sh

CURRENT_VERSION=`grep openconext-version= $NODE_PROPS | sed -e 's/.*=//g'`
OC_DOMAIN=`grep openconext-domain= $NODE_PROPS | sed -e 's/.*=//g'`

if [[ "$CURRENT_VERSION" == "" ]]
then
  echo "Cannot determine current version of OpenConext. Cannot run an upgrade. Please upgrade your OpenConext instance manually."
  echo "Upgrades are supported from Release 45 onwards. Upgrades from/to 'master' are not supported."
  exit 1
fi

# get the new versions of the components
source $OC_SCRIPTDIR/version.sh

# Used by component scripts to distinguish between clean installs and upgrades
UPGRADE=true

# If tomcat is available we need to stop it before upgrades
if rpm -qi tomcat6 > /dev/null
then
  service tomcat6 stop
fi

# Certificate / key data, needed by property replacements in upgrade of components.
# These oneliners are copied from engineblock.sh and openconext_custom_certificates.sh
ENGINEBLOCK_CERT=`sed '1d;$d' /etc/surfconext/engineblock.crt | tr -d '\n'`
OC_CERT=`sed -e '1d;$d' /etc/httpd/keys/openconext.pem | tr -d '\n'`
OC_KEY=`sed -e '1d;$d' /etc/httpd/keys/openconext.key | tr -d '\n'`

START_DIR=`pwd`

ALL_NEXT_VERSIONS=`echo -n $ALL_ORDERED_VERSIONS | sed -e "s/^.*$CURRENT_VERSION//g"`
for FIRST_NEXT_VERSION in $ALL_NEXT_VERSIONS
do
  echo "Running version update from $CURRENT_VERSION to $FIRST_NEXT_VERSION..."
  # define versions of all components.
  source $OC_SCRIPTDIR/versions/$FIRST_NEXT_VERSION
  OC_VERSION=$FIRST_NEXT_VERSION

  # the actual upgrade script
  source $OC_SCRIPTDIR/upgrades/${CURRENT_VERSION}_to_${FIRST_NEXT_VERSION}.sh

  # Reset working directory to starting directory
  cd $START_DIR
  CURRENT_VERSION=$FIRST_NEXT_VERSION
  if [[ $CURRENT_VERSION == $VERSION_TO ]]
  then
    break
  fi
done

# starting tomcat again after all upgrade actions are performed
if rpm -qi tomcat6 > /dev/null
then
  service tomcat6 start
fi
echo "Version $VERSION_TO reached. Ready."