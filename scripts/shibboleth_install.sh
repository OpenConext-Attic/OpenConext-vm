# Add Shibboleth repository (Java Service Provider)
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/security://shibboleth/RHEL_6/security:shibboleth.repo
cd -

# install non-CentOS packages
yum -y install shibboleth

rm -vf /etc/yum.repos.d/security\:shibboleth.repo