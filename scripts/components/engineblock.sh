#!/bin/bash

# Make sure Ansible is installed
yum install -y ansible &&

# Run Ansible playbook
ansible-playbook -i tools/ansible/inventory/demo.openconext.org tools/ansible/provision-engine.yml \
  -e "version=$ENGINEBLOCK_VERSION" \
  -e "engine_db_name=engineblock" \
  -e "engine_db_host=localhost" \
  -e "engine_db_port=3306" \
  -e "engine_db_user=$OC__ENGINE_DB_USER" \
  -e "engine_db_password=$OC__ENGINE_DB_PASS" \
  -e "admin_db_user=root" \
  -e "admin_db_password=$OC__ROOT_DB_PASS" \
  -e "serviceregistry_url=https://serviceregistry.$OC_DOMAIN"
  -e "serviceregistry_user=$OC__ENGINE_JANUSAPI_USER"
  -e "serviceregistry_pass=$OC__ENGINE_JANUSAPI_PASS"
  -e "engine_ldap_binddn=cn:engine,dc:surfconext,dc:nl"
  -e "engine_ldap_password=$OC__LDAP_PASS"



if $UPGRADE
then
  source /etc/profile.d/openconext.sh
    
else

  if [ -f /etc/surfconext/engineblock.crt ]
  then
    backupFile /etc/surfconext/engineblock.crt
  fi
  # Generate Self Signed Certificate for EngineBlock and add it to the configuration
  cd /tmp &&
    openssl req -subj '/CN=Engine/OU=Services/O=OpenConext/C=NL/' -newkey rsa:2048 -new -x509 -days 3652 -nodes -out example.org.crt -keyout example.org.pem > /dev/null
  EB_CRT=`cat example.org.crt` &&
  EB_KEY=`cat example.org.pem` &&
  EB_CRT_NO_HEADERS=`sed '1d;$d' example.org.crt` &&
  echo "" >> /etc/surfconext/engineblock.ini &&
  echo "encryption.key.public = \"${EB_CRT}\"" >> /etc/surfconext/engineblock.ini &&
  echo "encryption.key.private = \"${EB_KEY}\"" >> /etc/surfconext/engineblock.ini &&
  echo "auth.simplesamlphp.idp.cert       = \"${EB_CRT_NO_HEADERS}\"" >> /etc/surfconext/engineblock.ini
  cp example.org.crt /etc/surfconext/engineblock.crt &&
  rm example.org.crt example.org.pem

    # Updating LDAP schema some more...
  ldapmodify -x -D cn=admin,cn=config -h localhost -w "$OC__LDAP_PASS" -f /opt/www/engineblock/ldap/changes/addDeprovisionWarningSentAttributes.ldif
  ldapmodify -x -D cn=admin,cn=config -h localhost -w "$OC__LDAP_PASS" -f /opt/www/engineblock/ldap/changes/addCollabPersonUUID.ldif

  # Apply LDAP credentials to file engineblock.ini
  sed -i "s/__OC__ENGINE_LDAP_PASSWD__/$OC__LDAP_PASS/g" /etc/surfconext/engineblock.ini

  # Update apache conf
  cat $OC_BASEDIR/configs/httpd/conf.d/engine.conf  | \
    sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
    /etc/httpd/conf.d/engine.conf
  cat $OC_BASEDIR/configs/httpd/conf.d/engine-internal.conf  | \
    sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
    /etc/httpd/conf.d/engine-internal.conf
  cat $OC_BASEDIR/configs/httpd/conf.d/profile.conf  | \
    sed -e "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" > \
    /etc/httpd/conf.d/profile.conf

  # Make public key available for other components
  ENGINEBLOCK_CERT=`sed '1d;$d' /etc/surfconext/engineblock.crt | tr -d '\n'`
fi

cd /opt/www/engineblock/
./bin/migrate
