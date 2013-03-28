#!/bin/bash

# Create node.properties here, with v46 as version. Will be updated later on, after upgrade.
echo "Installing node properties file for OpenConext (useful for future upgrades): $NODE_PROPS"
install -d /etc/openconext
cat > $NODE_PROPS <<EOF
openconext-version=v46
openconext-domain=$OC_DOMAIN
EOF

# Release 47 only contained an upgrade for selfservice, which is not part of OpenConext.
# So no componets upgrades here.

setOpenConextVersion v47
