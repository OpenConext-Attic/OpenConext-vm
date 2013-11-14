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
source $OC_SCRIPTDIR/versions.sh

# Used by component scripts to distinguish between clean installs and upgrades
UPGRADE=true

# If tomcat is available we need to stop it before upgrades
service tomcat6 status 2> /dev/null && service tomcat6 stop > /dev/null

# Certificate / key data, needed by property replacements in upgrade of components.
# These oneliners are copied from engineblock.sh and openconext_custom_certificates.sh
ENGINEBLOCK_CERT=`sed '1d;$d' /etc/surfconext/engineblock.crt | tr -d '\n'`
OC_CERT=`sed -e '1d;$d' /etc/httpd/keys/openconext.pem | tr -d '\n'`
OC_KEY=`sed -e '1d;$d' /etc/httpd/keys/openconext.key | tr -d '\n'`


if [ -d /opt/www/OpenConext-engineblock ]
then
  echo "Upgrading Engineblock..."
  source $OC_SCRIPTDIR/components/engineblock.sh
fi

if [ -d /opt/www/OpenConext-serviceregistry ]
then
  echo "Upgrading Service Registry..."
  source $OC_SCRIPTDIR/components/serviceregistry.sh
fi

if [ -d /opt/www/OpenConext-manage ]
then
  echo "Upgrading Manage..."
  source $OC_SCRIPTDIR/components/manage.sh
fi

if [ -d /opt/www/OpenConext-api ]
then
  echo "Upgrading API..."
  source $OC_SCRIPTDIR/components/api.sh
fi

if [ -d /opt/www/OpenConext-cruncher ]
then
  echo "Upgrading Cruncher..."
  source $OC_SCRIPTDIR/components/cruncher.sh
fi

# starting tomcat again after all upgrade actions are performed
if rpm -qi tomcat6 > /dev/null
then
  service tomcat6 start
fi

setOpenConextVersion v61
echo "Version v61 reached. Ready."