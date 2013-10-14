#!/bin/bash


if [ -d /opt/www/OpenConext-api ]
then
  echo "Upgrading API..."
  source $OC_SCRIPTDIR/components/api.sh
fi

# Install cruncher, csa, apis
# These are not upgrades, so the 'install' part of these scripts should be executed
UPGRADE=false
echo "Installing Apis"
source $OC_SCRIPTDIR/components/apis.sh
echo "Installing Cruncher"
source $OC_SCRIPTDIR/components/cruncher.sh
echo "Installing CSA"
source $OC_SCRIPTDIR/components/csa.sh
UPGRADE=true

setOpenConextVersion v52