#!/bin/bash
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

# Build one huge line for all the components
# ToDo: adapt this list based on teh components choosen
COMPONENTS="db ldap grouper serviceregistry engine profile manage teams static mujina-sp mujina-idp teams api cruncher apis csa welcome db"
for comp in $COMPONENTS
do
  HOSTSLINE="$HOSTSLINE $comp.$OC_DOMAIN"
done

# Add the hosts itself to the hostline (for the welcome page)
HOSTSLINE="$HOSTSLINE $OC_DOMAIN"

# Replace the current line with the new one
sed -i "s/$IP_ADDR.*$/$IP_ADDR $HOSTSLINE/" /etc/hosts

