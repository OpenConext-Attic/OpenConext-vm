#!/bin/bash

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

if [ -d /opt/www/OpenConext-api ]
then
  echo "Upgrading API..."
  source $OC_SCRIPTDIR/components/api.sh
fi

setOpenConextVersion v51