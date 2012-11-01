#!/bin/sh
##########################
# Install Static content #
##########################

if [ ! -h /opt/www/static ]
then
    cd /opt/www &&
    git clone --branch ${STATIC_VERSION} git://github.com/OpenConext/OpenConext-static.git /opt/www/OpenConext-static
    ln -sf /opt/www/OpenConext-static /opt/www/static
fi
