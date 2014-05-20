#! /bin/bash
##################################################################################################
#                                                                                                #
# Configuration and Credentials file for OpenConext                                              #
#                                                                                                #
##################################################################################################
#    
#
# This file holds the default configuration and credentials.
# Passwords are set with standard values in this script, THIS IS NOT SAFE!!!, 
# change them either to values you configured previously, or run script 'oc_setpasswds.sh'
# to seed the values with random values

OC_VERSION=
DOMAIN="demo.openconext.org"

# By default the OpenConext VM will try to update the OS to teh latest version of available software 
# If you do not want the setup to touch configuration, set UPDATE_OS to FALSE
UPDATE_OS="FALSE"

# By default the OpenConext VM will be set up with ssh (22) and https (443) open for all. 
# If you do not want the setup to touch your firewall configuration, set SETUP_FIREWALL to FALSE
SETUP_FIREWALL="TRUE"

# When installing OpenConext a new CA is created. The passsword for the CA private key is set here
CA_KEY_PASSWORD="mysecret"

# The Admin name and email adress for this installation to use as default mail adress
OC__ADMIN_NAME="OpenConext Administrator"
OC__ADMIN_EMAIL="openconext@example.org"

# Default timezone
OC__TIMEZONE="Europe/Amsterdam"


##################################################################################################
#                                                                                                #    
# MySQL database users and passwords                                                             #
#                                                                                                #
##################################################################################################
#
# This section defines username and passwords for various components that need the mysql database. 
# For a decription of the various components see https://www.openconext.org

# New MySQL root password
OC__ROOT_DB_PASS="c0n3xt"

# New MySQL engine user and password
OC__ENGINE_DB_USER="engine2mysql"
OC__ENGINE_DB_PASS="enginepass"

# New MySQL serviceregistry (JANUS) user and password
OC__SERVICEREGISTRY_DB_USER="sr2mysql"
OC__SERVICEREGISTRY_DB_PASS="srpass"

# New MySQL manage user and password
OC__MANAGE_DB_USER="manage2mysql"
OC__MANAGE_DB_PASS="managepass"

# New MySQL teams user and password
OC__TEAMS_DB_USER="teams2mysql"
OC__TEAMS_DB_PASS="teamspass"

# New MySQL api user and password
OC__API_DB_USER="api2mysql"
OC__API_DB_PASS="apipass"

##################################################################################################
#                                                                                                #    
# ServiceRegistry (JANUS)                                                                        #
#                                                                                                #
##################################################################################################
#
# This section sets the credentials for the simplesaml install that is the basis for ServiceRegistry (Janus)
# 
# This section also sets the credentials for the ServiceRegistry REST API clients
# These users will be set in MySQL database 'serviceregistry.janus__user'

# Serviceregistry (JANUS) local admin password
# The adminpass is the localadmin login for JANUS (simplesamlphp)
# Local admin login can only be used when authsource is set to 'auth' -> 'admin' and 'useridattr' -> 'user'
# This can be done in /etc/surfconext/serviceregistry.module_janus.php and is already preconfigured
OC__JANUSADMIN_PASS="januspass"

# This is a secret salt used by simpleSAMLphp (JANUS) when it needs to generate a secure hash of a value.
# Use a strong secret salt, this can be a valid string of any length
OC__JANUS_SECRETSALT="janussecret"

# Serviceregistry (JANUS) API user for 'engineblock'
# Warning: do not change the value of engineblock_janusapi_user, value has to be "engine" in current script!
OC__ENGINE_JANUSAPI_USER="engine"
OC__ENGINE_JANUSAPI_PASS="engineblock"


# Serviceregistry (JANUS) API user for 'api'
# Warning: api user is at the moment also named 'engine' user because api user doesn't exist yet.
OC__API_JANUSAPI_USER="engine"
OC__API_JANUSAPI_PASS="engineblock"

##################################################################################################
#                                                                                                #    
# Grouper (client) users and passwords                                                           #
#                                                                                                #
##################################################################################################
#
# Grouper is used by engine, api and teams to store group information
# Client credentials are stored in tomcat's tomcat-users.xml file
OC__GROUPER_SYSTEM_USER="GrouperSystem"
OC__GROUPER_SYSTEM_PASS="Ah75DGe8Ef"

OC__GROUPER_ENGINE_USER="engine"
OC__GROUPER_ENGINE_PASS="KJ75DFeg32a"

OC__GROUPER_API_USER="api"
OC__GROUPER_API_PASS="apiPassword"

OC__GROUPER_UNIT_TEST_USER="gadget"
OC__GROUPER_UNIT_TEST_PASS="7453E1E58216"


##################################################################################################
#                                                                                                #    
# LDAP users and passwords                                                                       #
#                                                                                                #
##################################################################################################
#
# LDAP is used by engine, grouper and api to store user profile information

OC__LDAPADMIN_USER="cn=admin,dc=surfconext,dc=nl"
OC__LDAPADMIN_PASS="ldappass"

OC__LDAP_USER="cn=ro,dc=surfconext,dc=nl"
OC__LDAP_PASS="ldappass"

OC__LDAP_ENGINE_USER="cn=engine,dc=surfconext,dc=nl"
OC__LDAP_ENGINE_PASS="jf7RH4Hj20De"


##################################################################################################
#                                                                                                #    
# Software Install Locations                                                                     #
#                                                                                                #
##################################################################################################
#
# By default the installer uses the OpenConext Github repositories (http://github.com/openconext)
# to install components. For deploying development versions of individual components, these may 
# be pointed to other locations.
# Do not change the locations unless YOU KNOW WHAT YOU ARE DOING. Errors will break the install!

OC__API_REPO="https://github.com/OpenConext/OpenConext-api.git"
OC__APIS_REPO="https://github.com/OpenConextApps/apis.git"
OC__CRUNCHER_REPO="https://github.com/OpenConext/OpenConext-cruncher.git"
OC__CSA_REPO="https://github.com/OpenConext/OpenConext-csa.git"
OC__MANAGE_REPO="https://github.com/OpenConext/OpenConext-manage.git"
OC__MUJINA_REPO="https://github.com/OpenConext/Mujina.git"
OC__SELFSERVICE_REPO="https://github.com/OpenConext/OpenConext-selfservice.git"
OC__SERVICEREGISTRY_REPO="https://github.com/OpenConext/OpenConext-serviceregistry.git"
OC__TEAMS_REPO="https://github.com/OpenConext/OpenConext-teams.git"


