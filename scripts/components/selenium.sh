#!/bin/bash

# install needed packages
$YUM -y groupinstall "X Window System"
$YUM -y install xorg-x11-fonts-Type1 xorg-x11-fonts-misc
$YUM -y install twm xterm firefox

# checkout the regression test suite
#if [ ! -e /opt/regression ]
#then
#  $GITCLONE git@github.com:SURFnet/SURFnet-Regressie-test-Service-Registry.git /opt/OpenConext-integration-test
#fi
#cd /opt/OpenConext-integration-test
#$GITRESET
#$GITFETCH
#$GITCHECKOUT master

# generate a new dbus id to prevent problem on first startup of X
dbus-uuidgen > /var/lib/dbus/machine-id

# start the X environment
/usr/bin/xinit /usr/bin/twm &

#wait for 3 seconds for X to come up
sleep 3

#set X display
export DISPLAY=:0

#start firefox pointed toward the Selenium IDE install
/usr/bin/firefox http://release.seleniumhq.org/selenium-ide/2.0.0/selenium-ide-2.0.0.xpi &