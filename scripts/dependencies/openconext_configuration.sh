#!/bin/sh
if [ ! -d /etc/surfconext ];
then
    mkdir -p /etc/surfconext/
    cp -dpRf $OC_BASEDIR/configs/surfconext/* /etc/surfconext/
    sed -i "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" /etc/surfconext/*.ini
    sed -i "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" /etc/surfconext/*.php
fi