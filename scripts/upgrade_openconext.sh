#!/bin/bash
# Upgrade script for OpenConext.
#

# Base directory where the scripts (and config etc) is stored.
OC_BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. && pwd )"
OC_SCRIPTDIR=$OC_BASEDIR/scripts

source $OC_SCRIPTDIR/common.sh

# TODO: Get from version files? (sort with 'sort')
ALL_ORDERED_VERSIONS="v45 v46 v47 v48 master"

DEFAULT_VERSION_TO="v48"


if [ -f $NODE_PROPS ]
then
  CURRENT_VERSION=`grep openconext-version= $NODE_PROPS | sed -e 's/.*=//g'`
  OC_DOMAIN=`grep openconext-domain= $NODE_PROPS | sed -e 's/.*=//g'`
else
  # Temporary way to determine node properties.
  # For newer versions of OpenConext, these are stored in the $NODE_PROPS file.
  OC_DOMAIN=`grep -m 1 ServerName /etc/httpd/conf.d/_01welcome.conf  | sed -e 's/.*ServerName \(.*\):.*$/\1/'`
  EB_VERSION=`cd /opt/www/OpenConext-engineblock && git describe`
  case $EB_VERSION in
          "3.0.3" ) CURRENT_VERSION="v45";;
          "3.1.0" ) CURRENT_VERSION="v46";;
          * ) ;;
          esac
fi

if [[ "$CURRENT_VERSION" == "" ]]
then
  echo "Cannot determine current version of OpenConext. Cannot run an upgrade. Please upgrade your OpenConext instance manually."
  echo "Upgrades are supported from Release 45 onwards."
fi


VERSION_TO=""
while [ "$VERSION_TO" == "" ]
do
  echo -n "Which version do you want to upgrade to? [$DEFAULT_VERSION_TO] "
  read INPUT_VERSION_TO
  if [[ "$INPUT_VERSION_TO" == "" ]]
  then
    INPUT_VERSION_TO=$DEFAULT_VERSION_TO
  fi

  if [ -f $OC_SCRIPTDIR/versions/$INPUT_VERSION_TO ]
  then
    VERSION_TO=$INPUT_VERSION_TO
  else
    echo "Version file $INPUT_VERSION_TO does not exist."
  fi
done


# Used by component scripts to distinguish between clean installs and upgrades
UPGRADE=true


START_DIR=`pwd`

ALL_NEXT_VERSIONS=`echo -n $ALL_ORDERED_VERSIONS | sed -e "s/^.*$CURRENT_VERSION//g"`
for FIRST_NEXT_VERSION in $ALL_NEXT_VERSIONS
do
  echo "Running version update from $CURRENT_VERSION to $FIRST_NEXT_VERSION..."
  # define versions of all components.
  source $OC_SCRIPTDIR/versions/$FIRST_NEXT_VERSION

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
echo "Version $VERSION_TO reached. Ready."