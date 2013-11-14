#!/bin/bash

# Base directory where the scripts (and config etc) is stored.
OC_BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. && pwd )"
OC_SCRIPTDIR=$OC_BASEDIR/scripts

#import commons variables and functions
source $OC_SCRIPTDIR/common.sh

CURRENT_VERSION=$(grep openconext-version= $NODE_PROPS | sed -e 's/.*=//g');
BRANCH_VERSION=$(git status | grep "# On branch" | awk '{print $4}');
NEXT_VERSION="v61";

#this should handle outdated git repos
$GITRESET
$GITFETCH

if [[ $(git status | grep -i "Your branch is behind") ]]
then
  $GITPULL
  bash $OC_SCRIPTDIR/upgrade.sh
fi

if [[ "$CURRENT_VERSION" == "$BRANCH_VERSION" && "$NEXT_VERSION" == "" ]]
then
  echo "you are on the most recent version";
else
  if [[ "$CURRENT_VERSION" == "$BRANCH_VERSION" && "$NEXT_VERSION" != "" ]]
  then
    $GITCHECKOUT $NEXT_VERSION;
    if [[ $(git status | grep -i "Your branch is behind") ]]
    then
      $GITPULL
    fi
    echo "Do you want to upgrade to version $NEXT_VERSION? (y/n)";
    read CONTINUE
    if [[ "$CONTINUE" == "N" || "$CONTINUE" == "n" ]]
    then
      echo "stopping upgrades (note I may have left you on another git branch)";
      exit 0
    fi
    bash $OC_SCRIPTDIR/do_upgrade.sh
    bash $OC_SCRIPTDIR/upgrade_openconext.sh
  else
     echo "Cannot handle version $CURRENT_VERSION, I can only upgrade from version $BRANCH_VERSION to $NEXT_VERSION";
  fi
fi