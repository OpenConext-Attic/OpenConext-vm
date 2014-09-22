#!/bin/bash

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

echo "Set Admin User"
sed -i "s|__OC__LDAPADMIN_USER__|$OC__LDAPADMIN_USER|g" /etc/openldap/slapd.conf

oc_ldapadmin_suffix=`echo $OC__LDAPADMIN_USER | awk 'match($0,",") { print substr($0,RSTART+1) }'`
echo "set Admin user suffix: " $oc_ldapadmin_suffix
sed -i "s|__OC__LDAPADMIN_SUFFIX__|$oc_ldapadmin_suffix|g" /etc/openldap/slapd.conf

echo "Set Engine User"
sed -i "s|__OC__LDAP_ENGINE_USER__|$OC__LDAP_ENGINE_USER|g" /etc/openldap/slapd.conf

echo "Create a new LDAP passwds for slapd.conf based on co_config"
slapd_pass=`slappasswd -n -s $OC__LDAP_PASS`
echo "RootDN: " $slapd_pass
sed -i "s|__OC__SLAPD_PASS__|$slapd_pass|g" /etc/openldap/slapd.conf

slapd_admin_pass=`slappasswd -n -s $OC__LDAPADMIN_PASS`
echo "Admin: " $slapd_admin_pass
sed -i "s|__OC__LDAPADMIN_PASS__|$slapd_admin_pass|g" /etc/openldap/slapd.conf

#remove the old config and generate a new one from the slapd.conf file
service slapd start
service slapd stop
sleep 2
rm -rf /etc/openldap/slapd.d/*
sudo -u ldap /usr/sbin/slaptest -f /etc/openldap/slapd.conf -F /etc/openldap/slapd.d

service slapd start
sleep 2

echo "set organization DN in ldif: " $oc_ldapadmin_suffix
sed -i "s|__OC__LDAPADMIN_SUFFIX__|$oc_ldapadmin_suffix|g" $OC_BASEDIR/configs/ldap/ldap-entries.ldif

oc_ldapadmin_org=`echo $OC__LDAPADMIN_USER | awk -v RS=',' -v FS='=' '$1=="dc"{print $2}' |  awk 'NR==1'` 
echo "set organization (dc, o) in ldif: " $oc_ldapadmin_org
sed -i "s|__OC__LDAPADMIN_ORG__|$oc_ldapadmin_org|g" $OC_BASEDIR/configs/ldap/ldap-entries.ldif

echo "Set Grouper unit test user in LDAP:" $OC__GROUPER_UNIT_TEST_USER
sed -i "s|__OC__GROUPER_UNIT_TEST_USER__|$OC__GROUPER_UNIT_TEST_USER|g" $OC_BASEDIR/configs/ldap/ldap-entries.ldif

oc_ldapuser_cn=`echo $OC__LDAP_USER | awk -v RS=',' -v FS='=' '$1=="cn"{print $2}' |  awk 'NR==1'` 
echo "set ldap user cn in ldif: " $oc_ldapuser_cn
sed -i "s|__OC__LDAPUSER_CN__|$oc_ldapuser_cn|g" $OC_BASEDIR/configs/ldap/ldap-entries.ldif

oc_ldapuser_pass=`slappasswd -n -s $OC__LDAP_PASS`
echo "set ldap user pass in ldif: " $oc_ldapuser_pass
sed -i "s|__OC__LDAPUSER_PASS__|$oc_ldapuser_pass|g" $OC_BASEDIR/configs/ldap/ldap-entries.ldif


oc_ldapuser_engine_cn=`echo $OC__LDAP_ENGINE_USER | awk -v RS=',' -v FS='=' '$1=="cn"{print $2}' |  awk 'NR==1'`; 
echo "set ldap engine user cn in ldif: " $oc_ldapuser_engine_cn
sed -i "s|__OC__LDAPUSER_ENGINE_CN__|$oc_ldapuser_engine_cn|g" $OC_BASEDIR/configs/ldap/ldap-entries.ldif

oc_ldapuser__engine_pass=`slappasswd -n -s $OC__LDAP_ENGINE_PASS`
echo "set ldap engine user pass in ldif: " $oc_ldapuser__engine_pass
sed -i "s|__OC__LDAPUSER_ENGINE_PASS__|$oc_ldapuser__engine_pass|g" $OC_BASEDIR/configs/ldap/ldap-entries.ldif

echo "Importing needed OpenConext entries"
ldapadd -x -D $OC__LDAPADMIN_USER -h localhost -w $OC__LDAPADMIN_PASS -f $OC_BASEDIR/configs/ldap/ldap-entries.ldif


# restart ldap
service slapd restart
