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

if [ -d /opt/www/Mujina ]
then
  echo "Upgrading Mujina..."
  source $OC_SCRIPTDIR/components/mujina.sh
fi

if [ -d /opt/www/OpenConext-cruncher ]
then
  echo "Upgrading Cruncher..."
  source $OC_SCRIPTDIR/components/cruncher.sh
fi

if [ -d /opt/www/OpenConext-csa ]
then
  echo "Upgrading CSA..."
  source $OC_SCRIPTDIR/components/csa.sh
fi

setOpenConextVersion v57