#!/bin/bash

# Make sure Ansible is installed cleanly
sudo yum erase -y ansible &&
sudo yum install -y ansible MySQL-python patch python-lxml &&

# Patch Ansible for: #8050: ini_file module still changes all option names to lower case.
# -b = backup, -N = assume merged if failed, -u = Unified format, -p0 = 0 leading lines, -d chdir to dir before apply.
sudo patch -b -N -u -p0 -d /usr/share/ansible/files < $OC_BASEDIR/patches/ansible/ansible/ini_file_keep_key_casing-issue_8050-ansible_1.6.2.diff

# Run Ansible playbook
sudo ansible-playbook \
  -v \
  -i /vagrant/tools/ansible/inventory/demo.openconext.org.ini \
  -e "openconext_domain=demo.openconext.org" \
  -e "api_version=feature/ansible" \
  -e "api_db_name=api" \
  -e "api_db_host=localhost" \
  -e "api_db_port=3306" \
  -e "api_db_user=api" \
  -e "api_db_password=api" \
  -e "engine_db_name=engineblock" \
  -e "engine_db_host=localhost" \
  -e "engine_db_port=3306" \
  -e "engine_db_user=root" \
  -e "engine_db_password=c0n3xt" \
  -e "teams_db_name=" \
  -e "teams_db_user=" \
  -e "teams_db_password=" \
  -e "openconext_error_mail=" \
  -e "engine_idp_cert_string=abcdef1234567890" \
  -e "api_sp_key_string=abcdef1234567890" \
  -e "api_sp_cert_string=abcdef1234567890" \
  -e "api_ldap_bind_dn=ldap" \
  -e "api_ldap_password=ldap" \
  -e "db_admin_user=root" \
  -e "db_admin_password=c0n3xt" \
  -e "api_janus_url=https://serviceregistry.demo.openconext.org/simplesaml/module.php/janus/services/rest/" \
  -e "api_janus_user=engine" \
  -e "api_janus_password=engine" \
  /vagrant/tools/ansible/api.yml