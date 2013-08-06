#!/bin/sh

rm -f /etc/openldap/schema/collab.schema

# Remove existing schemas and entries
service slapd stop &&
rm -rf /var/lib/ldap/* &&
chkconfig slapd on &&
service slapd start &&

cp $OC_BASEDIR/configs/ldap/eduperson-200412.ldif /etc/openldap/schema/ &&
cp $OC_BASEDIR/configs/ldap/nleduperson.schema    /etc/openldap/schema/ &&
cp $OC_BASEDIR/configs/ldap/collab.schema         /etc/openldap/schema/ &&
cp $OC_BASEDIR/configs/ldap/slapd.conf            /etc/openldap &&
sed -i 's/^rootpw.*/rootpw c0n3xt/g' /etc/openldap/slapd.conf &&

# Migrate RHEL/CentOS 5.x config to RHEL/CentOS 6.x
# See http://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6/html-single/Migration_Planning_Guide/index.html#id4334890

rm -rf /etc/openldap/slapd.d/* &&
slaptest -f /etc/openldap/slapd.conf -F /etc/openldap/slapd.d &&
chown -R ldap:ldap /etc/openldap/slapd.d &&
chmod -R 000 /etc/openldap/slapd.d &&
chmod -R u+rwX /etc/openldap/slapd.d &&
chkconfig slapd on && service slapd restart &&

# Add entries...
ldapadd -x -D cn=admin,dc=surfconext,dc=nl -w c0n3xt -f $OC_BASEDIR/configs/ldap/ldap-entries.ldif
