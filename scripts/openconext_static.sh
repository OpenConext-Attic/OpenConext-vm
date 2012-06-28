#!/bin/sh
##########################
# Install Static content #
##########################

source /vagrant/scripts/versions.sh

if [ ! -h /opt/www/static ];
then
    cd /opt/www &&
    git clone git://github.com/OpenConext/OpenConext-static.git
    ln -sf OpenConext-static static
    cd -
    cd /opt/www/static
    git checkout ${STATIC_VERSION}
    cd -
fi
