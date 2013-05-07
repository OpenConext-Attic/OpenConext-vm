#!/bin/bash

# Create node.properties here, with v46 as version. Will be updated later on, after upgrade.
echo "Installing node properties file for OpenConext (useful for future upgrades): $NODE_PROPS"
install -d /etc/openconext
cat > $NODE_PROPS <<EOF
openconext-version=v46
openconext-domain=$OC_DOMAIN
EOF



if [ -d /opt/www/OpenConext-serviceregistry ]
then
  echo "Upgrading Service Registry..."
  source $OC_SCRIPTDIR/components/serviceregistry.sh
fi

if [ -d /opt/www/OpenConext-engineblock ]
then
  echo "Upgrading Engineblock..."
  source $OC_SCRIPTDIR/components/engineblock.sh
fi

setOpenConextVersion v48
