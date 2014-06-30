#!/bin/bash
# oc_setpasswds.sh updates all paswword fields in oc_config with ramdom, strong values
# the following methode is used for generating passwords
# tr -c -d '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' </dev/urandom | dd bs=20 count=1 2>/dev/null;echo

CONFIG_FILE=oc_config.sh

# create a backup of the config file
`cp $CONFIG_FILE $CONFIG_FILE.bak`

# Find generic passowrds (start with OC__, end with _PASS)
pw_entries=`cat $CONFIG_FILE | grep "_PASS" | grep "OC__"`

for pw_entry in $pw_entries
do
  key=$(echo $pw_entry | cut -f1 -d=)
  newvalue=`tr -cd '[:alnum:]' < /dev/urandom | fold -w20 | head -n1`
  newkeyvaluepair="$key=\"$newvalue\""
  
  echo -e "Setting "$key" = \""$newvalue"\""

  `sed -i "/$key/c\$newkeyvaluepair" $CONFIG_FILE`
done


# Now update some specific passwords and keys
# CA private key
ca_key=`tr -cd '[:alnum:]' < /dev/urandom | fold -w20 | head -n1`
`sed -i "/CA_KEY_PASSWORD/c\CA_KEY_PASSWORD=\"$ca_key\"" $CONFIG_FILE`
echo -e "Setting CA_KEY_PASSWORD = \""$ca_key"\""

# ServiceRegistry (Janus) SALT
salt=`tr -cd '[:alnum:]' < /dev/urandom | fold -w40 | head -n1`
`sed -i "/OC__JANUS_SECRETSALT/c\OC__JANUS_SECRETSALT=\"$salt\"" $CONFIG_FILE`
echo -e "Setting OC__JANUS_SECRETSALT = \""$salt"\""