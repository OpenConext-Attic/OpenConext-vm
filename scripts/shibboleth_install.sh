#!/bin/sh
# Add Shibboleth repository (Java SAML Service Provider)

yum -q list shibboleth > /dev/null
if [ $? -ne 0 ]
then
    cd /etc/yum.repos.d/
    wget http://download.opensuse.org/repositories/security://shibboleth/RHEL_6/security:shibboleth.repo
    cd -

    # install non-CentOS packages
    yum -y -q install shibboleth
    
    # start shibboleth in runlevel 5
    chkconfig --level 5 shibd on

    rm -vf /etc/yum.repos.d/security\:shibboleth.repo
    
    cp -f /vagrant/configs/shibboleth/* /etc/shibboleth/
    
    service shibd restart
    sleep 5
    service shibd restart
fi
