#!/bin/sh

me=`basename $0`
echo -e  "Running $me\n"

# Remove existing schemas and entries
service slapd stop
rm -f /etc/openldap/schema/collab.schema
rm -rf /var/lib/ldap/*

# make sure LDAP will start at system start up
chkconfig slapd on

cp $OC_BASEDIR/configs/ldap/eduperson-200412.ldif /etc/openldap/schema/
cp $OC_BASEDIR/configs/ldap/nleduperson.schema    /etc/openldap/schema/
cp $OC_BASEDIR/configs/ldap/collab.schema         /etc/openldap/schema/
cp $OC_BASEDIR/configs/ldap/slapd.conf            /etc/openldap

echo "Create a new LDAP passwds for slapd.conf based on co_config"
slapd_pass=`slappasswd -n -s $OC__LDAP_PASS`
echo "RootDN: " $slapd_pass
sed -i "s|_OC__SLAPD_PASS_|$slapd_pass|g" /etc/openldap/slapd.conf

slapd_admin_pass=`slappasswd -n -s $OC__LDAPADMIN_PASS`
echo "Admin: " $slapd_admin_pass
sed -i "s|_OC__LDAPADMIN_PASS_|$slapd_admin_pass|g" /etc/openldap/slapd.conf

#remove the old config and generate a new one from the slapd.conf file
service slapd start
service slapd stop
sleep 2
rm -rf /etc/openldap/slapd.d/*
sudo -u ldap /usr/sbin/slaptest -f /etc/openldap/slapd.conf -F /etc/openldap/slapd.d

service slapd start
sleep 2

echo "Importing needed OpenConext entries"
ldapadd -x -D $OC__LDAPADMIN_USER -h localhost -w $OC__LDAPADMIN_PASS -f $OC_BASEDIR/configs/ldap/ldap-entries.ldif


# restart ldap
service slapd restart
