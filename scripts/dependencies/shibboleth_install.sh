#!/bin/sh
# Add Shibboleth repository (Java SAML Service Provider)

yum -q list shibboleth > /dev/null
if rpm -qi shibboleth > /dev/null
then
  echo "Shibboleth is already installed"
else

  # install non-CentOS packages
  cd /etc/yum.repos.d/
  curl -s -O http://download.opensuse.org/repositories/security://shibboleth/RHEL_6/security:shibboleth.repo
  cd -
  yum -y -q install shibboleth
  # Cleanup
  rm -vf /etc/yum.repos.d/security\:shibboleth.repo
fi

# start shibboleth in runlevel 235
chkconfig --level 235 shibd on

cp -f $OC_BASEDIR/configs/shibboleth/* /etc/shibboleth/

service shibd restart