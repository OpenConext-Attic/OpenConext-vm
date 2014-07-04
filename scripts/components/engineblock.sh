#!/bin/bash

# Make sure Ansible is installed
yum install -y ansible MySQL-python &&

# Run Ansible playbook
ansible-playbook \
  -v \
  -i $OC_BASEDIR/tools/ansible/inventory/demo.openconext.org.ini \
  -e "openconext_domain=$OC_DOMAIN" \
  -e "engine_version=$ENGINEBLOCK_VERSION" \
  -e "engine_db_name=engineblock" \
  -e "engine_db_host=localhost" \
  -e "engine_db_port=3306" \
  -e "engine_db_user=$OC__ENGINE_DB_USER" \
  -e "engine_db_password=$OC__ENGINE_DB_PASS" \
  -e "engine_ldap_binddn=cn:engine,dc:surfconext,dc:nl" \
  -e "engine_ldap_password=$OC__LDAP_PASS" \
  -e "db_admin_user=root" \
  -e "db_admin_password=$OC__ROOT_DB_PASS" \
  -e "serviceregistry_url=https://serviceregistry.$OC_DOMAIN/simplesaml/module.php/janus/services/rest/" \
  -e "serviceregistry_user=$OC__ENGINE_JANUSAPI_USER" \
  -e "serviceregistry_secret=$OC__ENGINE_JANUSAPI_PASS" \
  $OC_BASEDIR/tools/ansible/provision-engine.yml

ENGINEBLOCK_CERT=`sed '1d;$d' /etc/surfconext/engineblock.crt | tr -d '\n'`