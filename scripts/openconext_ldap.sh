#!/bin/sh
if [ ! -f /etc/openldap/schema/collab.schema ];
then
    # Remove existing schemas and entries
    service slapd stop &&
    rm -rf /var/lib/ldap/* &&
    service slapd start &&

    # Install schemas and configuration
    cd /tmp &&
    svn co https://svn.surfnet.nl/svn/coin-os/vendor/grouper/1.6.3/src/main/resources/ &&
    cp resources/ldap/eduperson-200412.ldif /etc/openldap/schema/ &&
    cp resources/ldap/nleduperson.schema    /etc/openldap/schema/ &&
    cp resources/ldap/collab.schema         /etc/openldap/schema/ &&
    cp resources/ldap/slapd.conf            /etc/openldap &&
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
    ldapadd -x -D cn=admin,dc=surfconext,dc=nl -w c0n3xt -f resources/ldap/ldap-entries.ldif &&

    # Updating schema some more...
    ldapmodify -x -D cn=admin,cn=config -w c0n3xt -f /opt/www/engineblock/ldap/changes/addDeprovisionWarningSentAttributes.ldif &&
    ldapmodify -x -D cn=admin,cn=config -w c0n3xt -f /opt/www/engineblock/ldap/changes/addCollabPersonUUID.ldif &&
    ldapadd -x -D cn=admin,dc=surfconext,dc=nl -w c0n3xt -f /opt/www/engineblock/ldap/changes/versAccount.ldif
fi