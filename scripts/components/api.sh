#!/bin/bash

# Make sure Ansible is installed cleanly
sudo yum erase -y ansible &&
sudo yum install -y ansible MySQL-python patch python-lxml &&

# Patch Ansible for: #8050: ini_file module still changes all option names to lower case.
# -b = backup, -N = assume merged if failed, -u = Unified format, -p0 = 0 leading lines, -d chdir to dir before apply.
sudo patch -b -N -u -p0 -d /usr/share/ansible/files < $OC_BASEDIR/patches/ansible/ansible/ini_file_keep_key_casing-issue_8050-ansible_1.6.2.diff

# Run Ansible playbook
echo "Provisioning API with Ansible..."
sudo ansible-playbook \
  -v \
  -i /vagrant/tools/ansible/inventory/demo.openconext.org.ini \
  -e "api_version=$API_VERSION" \
  -e "api_db_name=api" \
  -e "api_db_host=localhost" \
  -e "api_db_port=3306" \
  -e "api_db_user=$OC__API_DB_USER" \
  -e "api_db_password=$OC__API_DB_PASS" \
  -e "api_janus_url=https://serviceregistry.$OC_DOMAIN/simplesaml/module.php/janus/services/rest/" \
  -e "api_janus_user=$OC__API_JANUSAPI_USER" \
  -e "api_janus_secret=$OC__API_JANUSAPI_PASS" \
  -e "api_sp_key_string=$OC_KEY" \
  -e "api_sp_cert_string=$OC_CERT" \
  -e "api_ldap_bind_dn=$OC__LDAP_USER" \
  -e "api_ldap_password=$OC__LDAP_PASS" \
  -e "db_admin_user=root" \
  -e "db_admin_password=$OC__ROOT_DB_PASS" \
  -e "engine_db_name=engineblock" \
  -e "engine_db_host=localhost" \
  -e "engine_db_port=3306" \
  -e "engine_db_user=$OC__ENGINE_DB_USER" \
  -e "engine_db_password=$OC__ENGINE_DB_PASS" \
  -e "engine_idp_cert_string=$ENGINEBLOCK_CERT" \
  -e "openconext_domain=$OC_DOMAIN" \
  -e "openconext_error_mail=" \
  -e "teams_db_name=" \
  -e "teams_db_user=" \
  -e "teams_db_password=" \
  $OC_BASEDIR/tools/ansible/api.yml