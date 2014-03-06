#/bin/bash 
# oc_setpasswds.sh updates all paswword fields in oc_config with ramdom, strong values
# the following methode is used for generating passwords
# tr -c -d '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' </dev/urandom | dd bs=20 count=1 2>/dev/null;echo

config_file=oc_config

# create a backup of the config file
`cp $config_file $config_file.bak`

# Find config params to change
pw_entries=`cat $config_file | grep "_PASS" | grep "OC__"`

for pw_entry in $pw_entries
do
  key=$(echo $pw_entry | cut -f1 -d=)
  newvalue=`tr -cd '[:alnum:]' < /dev/urandom | fold -w15 | head -n1`
  newkeyvaluepair="$key=\"$newvalue\""
  
  echo -e "Setting "$key" = \""$newvalue"\""

  `sed -i "/$key/c\$newkeyvaluepair       # This line was updated by oc_setpasswds.sh." $config_file`
done


