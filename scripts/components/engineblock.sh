#!/bin/bash

# Make sure Ansible is installed
yum install -y ansible &&

# Run Ansible playbook
ansible-playbook -i tools/ansible/inventory/demo.openconext.org.ini tools/ansible/provision-engine.yml \
  -e "version=$ENGINEBLOCK_VERSION" \
  -e "domain=$OC_DOMAIN" \
  -e "engine_db_name=engineblock" \
  -e "engine_db_host=localhost" \
  -e "engine_db_port=3306" \
  -e "engine_db_user=$OC__ENGINE_DB_USER" \
  -e "engine_db_password=$OC__ENGINE_DB_PASS" \
  -e "admin_db_user=root" \
  -e "admin_db_password=$OC__ROOT_DB_PASS" \
  -e "serviceregistry_url=https://serviceregistry.$OC_DOMAIN" \
  -e "serviceregistry_user=$OC__ENGINE_JANUSAPI_USER" \
  -e "serviceregistry_pass=$OC__ENGINE_JANUSAPI_PASS" \
  -e "engine_ldap_binddn=cn:engine,dc:surfconext,dc:nl" \
  -e "engine_ldap_password=$OC__LDAP_PASS"

EB_CRT=`cat /etc/openconext/engineblock.default.pem.crt` &&
EB_KEY=`cat /etc/openconext/engineblock.default.pem.key` &&
EB_CRT_NO_HEADERS=`sed '1d;$d' /etc/openconext/engineblock.default.pem.crt` &&
ENGINEBLOCK_CERT=`sed '1d;$d' /etc/surfconext/engineblock.crt | tr -d '\n'`