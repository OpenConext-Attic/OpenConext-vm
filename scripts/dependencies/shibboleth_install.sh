#!/bin/bash
# Add Shibboleth repository (Java SAML Service Provider)

if rpm -qi shibboleth > /dev/null
then
  echo "Shibboleth is already installed"
  service shibd stop
else
  REPO_FILE=/etc/yum.repos.d/security:shibboleth.repo
  # install non-CentOS packages
  curl -s -o $REPO_FILE http://download.opensuse.org/repositories/security://shibboleth/RHEL_6/security:shibboleth.repo
  $YUM -y install shibboleth
  # Cleanup
  rm -vf $REPO_FILE
fi

# start shibboleth in runlevel 235
chkconfig --level 235 shibd on

cp -Rf $OC_BASEDIR/configs/shibboleth/* /etc/shibboleth/
sed -i "s/_OPENCONEXT_DOMAIN_/$OC_DOMAIN/g" /etc/shibboleth/shibboleth2.xml
chown -R shibd:shibd /etc/shibboleth/

# Not starting Shibd here. Metadata is only available for fetching once all components have been installed.

# httpd config is covered by RPM installation

if ! sestatus | grep -q "disabled"
then

echo "Allowing httpd/shibboleth interaction in SELinux..."

	cat > /tmp/audit <<EOF
type=AVC msg=audit(1352298653.415:568): avc:  denied  { write } for  pid=15174 comm="httpd" name="shibd.sock" dev=dm-0 ino=20422 scontext=unconfined_u:system_r:httpd_t:s0 tcontext=unconfined_u:object_r:var_run_t:s0 tclass=sock_file
type=AVC msg=audit(1352299235.662:570): avc:  denied  { connectto } for  pid=15178 comm="httpd" path="/var/run/shibboleth/shibd.sock" scontext=unconfined_u:system_r:httpd_t:s0 tcontext=unconfined_u:system_r:initrc_t:s0 tclass=unix_stream_socket
EOF
	# Using these two captured audit lines from a non-working setup, we can construct a policy that allows exactly what is blocked here.
	cat /tmp/audit  | audit2allow -M httpd-shibd > /dev/null
	semodule -i httpd-shibd.pp
	rm httpd-shibd.pp httpd-shibd.te /tmp/audit

fi
