#!/bin/bash

. upgrade_includes.sh

echo "doing all kinds of things for release 47"

# Create node.properties here, with v46 as version. Will be updated later on, after upgrade.
echo "Installing node properties file for OpenConext (useful for future upgrades): $NODE_PROPS"
install -d /etc/openconext
cat > $NODE_PROPS <<EOF
openconext-version=v46
openconext-domain=$OC_DOMAIN
EOF



setOpenConextVersion v47
