#!/bin/bash

### Constants
NODE_PROPS=/etc/openconext/node.properties


MVN_VERSION=3.0.5
VERBOSE=false

## Suppress output of various commands by default
MVN="mvn -q"
YUM="yum -q"
GITCLONE="git clone -q"
GITCHECKOUT="git checkout -q"
GITFETCH="git fetch -q"


### Settings, sanity checks

# errors are fatal
set -e

# Verify that user root runs this script
ROOT_UID=0   # Root has $UID 0.
if [ $UID -ne ${ROOT_UID} ]
then
  echo "You must be root to run this install script, as it installs system packages and configures service."
  exit 1
fi

# Catch ctrl-c and quit, instead of rambling on
trap "echo \"caught signal, will exit installation script\"; exit" INT TERM



### Functions

# Create a backup of the given file (complete path)
# Will suffix with the current date and a sequence number
function backupFile()
{
  FILENAME="$1"
  DATE=`date +%Y%m%d`
  SEQ=1
  while [[ -f $FILENAME.$DATE.$SEQ ]]
  do
     SEQ=`expr $SEQ + 1`
  done
  NEW_FILENAME=$FILENAME.$DATE.$SEQ

  cp -p $FILENAME $NEW_FILENAME
}

# Set a version in the node properties
function setOpenConextVersion() {
  NEW_VERSION="$1"

  # OpenConext VMs older than r47 do not have a node.properties
  if [ -f $NODE_PROPS ]
  then
    sed -i $NODE_PROPS -e "s/openconext-version=.*/openconext-version=$NEW_VERSION/"
  fi
}


### Logging

LOGFILE=/var/log/openconext-vm.log
if [ -f $LOGFILE ]
then
  backupFile $LOGFILE
fi
exec > >(tee $LOGFILE)
exec 2> >(tee -a $LOGFILE)
echo "Logging all output to $LOGFILE"
