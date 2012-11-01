#!/bin/sh
if [ ! -d /etc/surfconext ];
then
    mkdir -p /etc/surfconext/
    cp -dpRf $OC_BASEDIR/configs/surfconext/* /etc/surfconext/
fi