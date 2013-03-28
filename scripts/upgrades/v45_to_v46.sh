#!/bin/bash

. upgrade_includes.sh

echo "doing all kinds of things for v46"

if [ -d /opt/www/OpenConext-serviceregistry ]
then
  echo "Upgrading Service Registry..."
  source $OC_SCRIPTDIR/components/serviceregistry.sh
fi

if [ -d /opt/www/OpenConext-engineblock ]
then
  echo "Upgrading EngineBlock..."
  source $OC_SCRIPTDIR/components/engineblock.sh
fi

if rpm -qi tomcat6 > /dev/null
then
  service tomcat6 stop
fi

if [ -d /opt/www/OpenConext-api ]
then
  echo "Upgrading API..."
  source $OC_SCRIPTDIR/components/api.sh
fi

if [ -d /opt/www/OpenConext-teams ]
then
  echo "Upgrading Teams..."
  source $OC_SCRIPTDIR/components/teams.sh
fi

if rpm -qi tomcat6 > /dev/null
then
  service tomcat6 start
fi

echo "upgrading to v46 done."
