#!/bin/bash

# install needed packages
$YUM -y groupinstall "X Window System"
$YUM -y install xorg-x11-fonts-Type1 xorg-x11-fonts-misc
$YUM -y install twm xterm firefox

# checkout the regression test suite
# this currently should be performed manually, because the regression tests
# are part of a private repo
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

# In order to make X11 with TWM work from the command line
# we need to set the locale and language to "C" instead of "UTF-8"
echo LANG="C" > /etc/sysconfig/i18n
echo SYSFONT="latarcyrheb-sun16" >> /etc/sysconfig/i18n

#replace the URL that firefox is looking at
sed -i "s~/usr/bin/firefox /usr/share/doc/HTML/index.html~/usr/bin/firefox http://welcome.$OC_DOMAIN~" /etc/X11/xinit/Xclients