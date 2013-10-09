#!/bin/sh

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

#remove the old config and generate a new one from the slapd.conf file
service slapd start
service slapd stop
sleep 2
rm -rf /etc/openldap/slapd.d/*
sudo -u ldap /usr/sbin/slaptest -f /etc/openldap/slapd.conf -F /etc/openldap/slapd.d

service slapd start
sleep 2

# Import needed entries
ldapadd -x -D cn=admin,dc=surfconext,dc=nl -h localhost -w c0n3xt -f $OC_BASEDIR/configs/ldap/ldap-entries.ldif

# restart ldap
service slapd restart