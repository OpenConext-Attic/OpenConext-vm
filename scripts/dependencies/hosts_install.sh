#!/bin/sh
# configure some OpenConext DNS entries on this machine

# Arbitrary loopback address.
IP_ADDR=127.0.167.2

if grep $IP_ADDR /etc/hosts > /dev/null
then
  echo "/etc/hosts already filled, will update it."
else
	# add the ip address, as a placeholder only at first
	echo $IP_ADDR >> /etc/hosts
fi

# Build one huge line
COMPONENTS="db ldap grouper serviceregistry engine profile manage teams static mujina-sp mujina-idp teams api cruncher apis"
for comp in $COMPONENTS
do
  HOSTSLINE="$HOSTSLINE $comp.$OC_DOMAIN"
done

# Replace the current line with the new one
sed -i "s/$IP_ADDR.*$/$IP_ADDR $HOSTSLINE/" /etc/hosts

