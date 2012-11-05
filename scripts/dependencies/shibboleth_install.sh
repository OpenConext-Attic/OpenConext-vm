#!/bin/sh
# Add Shibboleth repository (Java SAML Service Provider)

if rpm -qi shibboleth > /dev/null
then
  echo "Shibboleth is already installed"
else
  REPO_FILE=/etc/yum.repos.d/security:shibboleth.repo
  # install non-CentOS packages
  curl -s -o $REPO_FILE http://download.opensuse.org/repositories/security://shibboleth/RHEL_6/security:shibboleth.repo
  yum -y -q install shibboleth
  # Cleanup
  rm -vf $REPO_FILE
fi

# start shibboleth in runlevel 235
chkconfig --level 235 shibd on

cp -f $OC_BASEDIR/configs/shibboleth/* /etc/shibboleth/

service shibd restart

# httpd config is covered by RPM installation