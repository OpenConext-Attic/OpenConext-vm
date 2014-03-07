#!/bin/bash
#
# Installation script for OpenConext
# Run with -i for interactive setup.
#
#

# Base directory where the scripts (and config etc) is stored.
OC_BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. && pwd )"
OC_SCRIPTDIR=$OC_BASEDIR/scripts
source $OC_SCRIPTDIR/common.sh



# Defaults
# TODO: Read from cached file, in case installation script is run again later on.
DEFAULT_DOMAIN=demo.openconext.org

# this is the default set of components in an install
DEFAULT_OC_COMPONENTS="EB SR MANAGE API TEAMS MUJINA GROUPER"


# Override defaults with variables from invoking shell.
# To use this, call like this:
# $ DOMAIN=mydomain.com OC_COMPONENTS="EB SR MANAGE" bash install_openconext.sh
OC_COMPONENTS=$([ "x$OC_COMPONENTS" == "x" ] && echo "$DEFAULT_OC_COMPONENTS" || echo "$OC_COMPONENTS")
OC_DOMAIN=$([ "x$DOMAIN" == "x" ] && echo "$DEFAULT_DOMAIN" || echo "$DOMAIN")


if [ $VERBOSE == "true" ]
then
  echo "Verbose is true, will not suppress output from mvn/yum/git"
  MVN=mvn
  YUM=yum
  GITCHECKOUT="git checkout"
  GITCLONE="git clone"
fi

UPGRADE=false

# interactive run?
INTERACTIVE=false
if [ $# -gt 0 -a "$1" == "-i" ]
then
  INTERACTIVE=true
  echo "Running in interactive mode."
else
  echo "Running in non-interactive mode. Defaults to be used are:"
  echo "Base domain: " $OC_DOMAIN
  echo "Components that are installed: " $OC_COMPONENTS
fi

if [ $INTERACTIVE == "true" ]
then
  echo ""
  echo "You will be asked some questions before installation. Defaults will be provided."
  echo ""

  echo "1. Hostname"
  echo "What is the base domain of the OpenConext instance? This will be used in all URLs as well as in SSL certificates (to be setup later on)."
  echo -n "Base domain: [$OC_DOMAIN] "
  read OC_DOMAINCHOICE
  if [ "$OC_DOMAINCHOICE" != "" ]
  then
    OC_DOMAIN=$OC_DOMAINCHOICE
  fi
  # else, use default

  echo ""
  echo "2. Components"
  echo "You can either install all components, or a subset of them."
  echo "Possible options are:"
  echo "1. Core Components (default) [EngineBlock, Service registry, Manage, API, Teams, Mujina IDP/SP]"
  echo "2. All Components [EngineBlock, Service registry, Manage, API, Teams, Mujina IDP/SP, Cruncher, Apis, CSA]"
  echo "3. Minimal Components [EngineBlock, Service registry, Mujina IDP/SP]"
  echo "4. Mix and match (experts only)"
  echo
  echo -n "Component choice: [1]: "
  read COMPONENTCHOICE
  case "$COMPONENTCHOICE" in
    "1" | "" ) OC_COMPONENTS="EB SR MANAGE API TEAMS MUJINA GROUPER";;
    "2" ) OC_COMPONENTS="EB SR MANAGE API TEAMS MUJINA GROUPER APIS CRUNCHER CSA DASHBOARD";;
    "3" ) OC_COMPONENTS="EB SR MUJINA";;
    * )
        OC_COMPONENTS=""
        for component in EB SR MANAGE API TEAMS MUJINA GROUPER APIS CRUNCHER CSA DASHBOARD
        do
          echo Install $component? [Y/n]
          read answer
          case $answer in
          "" | "Y" | "y" ) OC_COMPONENTS="$OC_COMPONENTS $component";;
          * ) ;;
          esac
        done
        ;;
  esac
  echo "List of components chosen: " $OC_COMPONENTS

  # Selenium tests are (by default) not installed, we do not want to bother the user with this
  # this can be turned on via the command line
  if [[ ! $INSTALL_TESTS ]]
  then
    INSTALL_TESTS="false";
  fi
  
  echo; echo;
  echo "For HTTP over SSL and SAML signing/encryption, a set of self-signed, default keys and certificates are installed. You can customize this now, if you want to."
  echo
  echo "1. Generate a new set, based on the chosen base domain ($OC_DOMAIN)"
  echo "2. Bring your own certificates, (including trust chain)"

  read CERTCHOICE
  
fi

# Set the component versions as variables, for use in later scripts
source $OC_SCRIPTDIR/versions.sh


# Dependencies of components

for COMPONENT in $OC_COMPONENTS
do
  if [[ $COMPONENT == "SR" ]]
  then
    DEP_PHP=true
    DEP_MYSQL=true
  fi
  if [[ $COMPONENT == "EB" ]]
  then
    DEP_PHP=true
    DEP_MYSQL=true
    DEP_MEMCACHED=true
    DEP_LDAP=true
  fi

  if [[ $COMPONENT == "API" || $COMPONENT == "MUJINA" || $COMPONENT == "TEAMS" || $COMPONENT == "GROUPER" || $COMPONENT == "CRUNCHER" || $COMPONENT == "APIS" || $COMPONENT == "CSA"  ]]
  then
    DEP_TOMCAT=true
    DEP_MAVEN=true
  fi

  if [[ $COMPONENT == "API" || $COMPONENT == "TEAMS" || $COMPONENT == "GROUPER"  || $COMPONENT == "CRUNCHER" || $COMPONENT == "APIS" || $COMPONENT == "CSA" ]]
  then
    DEP_MYSQL=true
  fi

  if [[ $COMPONENT == "TEAMS" || $COMPONENT == "GROUPER" ]]
  then
    DEP_SHIBBOLETH=true
  fi
done


# Global dependencies, infra-related
for subscript in \
  base_packages.sh \
  hosts_install.sh \
  iptables.sh \
  openconext_infra_httpd.sh \
  samba_install.sh \
  openconext_custom_certificates.sh \
  openconext_static.sh
do
  echo "Running dependency script $subscript..."
  source $OC_SCRIPTDIR/dependencies/$subscript
done

if [[ $DEP_MAVEN == "true" ]]
then
  echo "Installing Maven..."
  source $OC_SCRIPTDIR/dependencies/maven_install.sh
fi
if [[ $DEP_TOMCAT == "true" ]]
then
  echo "Installing Tomcat..."
  source $OC_SCRIPTDIR/dependencies/tomcat_install.sh
fi

if [[ $DEP_MEMCACHED == "true" ]]
then
  echo "Installing memcached..."
  source $OC_SCRIPTDIR/dependencies/memcached_install.sh
fi
if [[ $DEP_PHP == "true" ]]
then
  echo "Installing PHP..."
  source $OC_SCRIPTDIR/dependencies/php_install.sh
fi
if [[ $DEP_MYSQL == "true" ]]
then
  echo "Installing MySQL..."
  source $OC_SCRIPTDIR/dependencies/mysql_install.sh
fi
if [[ $DEP_LDAP == "true" ]]
then
  echo "Installing OpenLDAP..."
  source $OC_SCRIPTDIR/dependencies/openldap_install.sh
  source $OC_SCRIPTDIR/dependencies/openconext_ldap.sh
fi
if [[ $DEP_SHIBBOLETH == "true" ]]
then
  echo "Installing Shibboleth..."
  source $OC_SCRIPTDIR/dependencies/shibboleth_install.sh
fi

echo "Done installing dependencies."

# Components

if echo $OC_COMPONENTS | grep -q GROUPER
then
  echo "Installing Grouper..."
  source $OC_SCRIPTDIR/components/grouper.sh
fi

if echo $OC_COMPONENTS | grep -q EB
then
  echo "Installing EngineBlock..."
  source $OC_SCRIPTDIR/components/engineblock.sh
fi

if echo $OC_COMPONENTS | grep -q SR
then
  echo "Installing Service registry..."
  source $OC_SCRIPTDIR/components/serviceregistry.sh
fi

if echo $OC_COMPONENTS | grep -q MANAGE
then
  echo "Installing Manage..."
  source $OC_SCRIPTDIR/components/manage.sh
fi

if echo $OC_COMPONENTS | grep -q MUJINA
then
  echo "Installing Mujina IDP/SP..."
  source $OC_SCRIPTDIR/components/mujina.sh
fi

if echo $OC_COMPONENTS | grep -q API
then
  echo "Installing API..."
  source $OC_SCRIPTDIR/components/api.sh
fi

if echo $OC_COMPONENTS | grep -q TEAMS
then
  echo "Installing Teams..."
  source $OC_SCRIPTDIR/components/teams.sh
fi

if echo $OC_COMPONENTS | grep -q APIS
then
  echo "Installing Apis..."
  source $OC_SCRIPTDIR/components/apis.sh
fi

if echo $OC_COMPONENTS | grep -q CRUNCHER
then
  echo "Installing Cruncher..."
  source $OC_SCRIPTDIR/components/cruncher.sh
fi

if echo $OC_COMPONENTS | grep -q CSA
then
  echo "Installing CSA..."
  source $OC_SCRIPTDIR/components/csa.sh
fi

if echo $OC_COMPONENTS | grep -q DASHBOARD
then
  echo "Installing Dashboard..."
  source $OC_SCRIPTDIR/components/selfservice.sh
fi

# stop if running
if service httpd status > /dev/null
then
  service httpd stop
fi
service httpd start

if [[ "$DEP_TOMCAT" == "true" ]]
then
  service tomcat6 start
fi

if [[ "$DEP_SHIBBOLETH" == "true" ]]
then
  service shibd start
fi


# pacakges for testing with selenium
if [[ $INSTALL_TESTS == "true" ]]
then
  echo "Installing tools for testing..."
  source $OC_SCRIPTDIR/components/selenium.sh
fi

echo "Installing node properties file for OpenConext (useful for future upgrades): $NODE_PROPS"
install -d /etc/openconext
cat > $NODE_PROPS <<EOF
openconext-version=$OC_VERSION
openconext-domain=$OC_DOMAIN
EOF

echo; echo
echo "Installation of OpenConext is complete."

# Line for use in the hosts-file of the VM-host and potential other systems.
COMPONENTS="db ldap grouper serviceregistry engine profile manage teams static mujina-sp mujina-idp api apis cruncher csa welcome dashboard"
HOSTS="$OC_DOMAIN" # the domain itself
for comp in $COMPONENTS
do
  HOSTS="$HOSTS $comp.$OC_DOMAIN"
done

echo "The hosts-file of computers (other than this VM) that want to use this OpenConext instance should contain the following entries: "
echo "-----"
echo -n "IP_ADDRESS "

count=1
for host in $HOSTS
do
  if (( $count % 3 == 0 ))
  then
    echo "$host"
    echo -n "IP_ADDRESS "
    count=1
  else
    echo -n "$host "
    let "count=$count + 1"
  fi
done
echo " "
echo "-----"
echo "Where IP_ADDRESS is an IP address of this system that is reachable from the outside."

echo
echo "Next step: go to this URL with your browser: http://$OC_DOMAIN/"
echo

echo
echo "A complete log of this installation can be found in /var/log/openconext-vm.log"
echo
