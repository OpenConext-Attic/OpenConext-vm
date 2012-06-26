#!/bin/sh
if [ ! -d /etc/surfconext ];
then
    mkdir -p /etc/surfconext/
    cp -dpRf /vagrant/configs/surfconext/* /etc/surfconext/
fi