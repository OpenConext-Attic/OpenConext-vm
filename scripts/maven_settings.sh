#!/bin/sh

if [ ! -f ~/.m2/settings.xml ];
then
  mkdir -p ~/.m2
  cp /vagrant/settings.xml ~/.m2/settings.xml
fi
