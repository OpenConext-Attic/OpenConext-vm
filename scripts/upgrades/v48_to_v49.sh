#!/bin/bash

$YUM -y install php-pecl-apc

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

if [ -d /opt/www/OpenConext-teams ]
then
  echo "Upgrading Teams..."
  source $OC_SCRIPTDIR/components/teams.sh
fi

setOpenConextVersion v49