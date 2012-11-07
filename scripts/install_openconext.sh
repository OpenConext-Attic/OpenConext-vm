#!/bin/bash
#
# Installation script for OpenConext
# Run with -i for interactive setup.
#
#


# Verify that user root runs this script
ROOT_UID=0   # Root has $UID 0.
if [ $UID -ne ${ROOT_UID} ]
then
  echo "You must be root to run this install script, as it installs system packages and configures service."
  exit 1
fi

# Do not prompt for overwrites etc.
unalias cp rm mv


# Base directory where the scripts (and config etc) is stored.
OC_BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. && pwd )"
OC_SCRIPTDIR=$OC_BASEDIR/scripts


# Defaults
# TODO: Read from cached file, in case installation script is run again later on.
OC_DOMAIN=demo.openconext.org
OC_VERSION=versions_v2.10.sh
OC_COMPONENTS="EB SR MANAGE API TEAMS MUJINA GROUPER"
MVN_VERSION=3.0.4
VERBOSE=true


## Suppress output of various commands by default
MVN="mvn -q"
YUM="yum -q"
GITCLONE="git clone -q"
GITCHECKOUT="git checkout -q"

if [ $VERBOSE == "true" ]
then
  echo "Verbose is true, will not suppress output from mvn/yum/git"
  MVN=mvn
  YUM=yum
  GITCHECKOUT="git checkout"
  GITCLONE="git clone"
fi


# interactive run?
INTERACTIVE=false
if [ "$1" == "-i" ]
then
  INTERACTIVE=true
  echo "Running in interactive mode."
else
  echo "Running in non-interactive mode. Defaults to be used are:"
  echo "Base domain: " $OC_DOMAIN
  echo "Version file: " $OC_VERSION
fi

if [ $INTERACTIVE == "true" ]
then
  echo ""
  echo "You will be asked some questions before installation. Defaults will be provided."
  echo ""

  echo "1. Hostname"
  echo "What is the base domain of the OpenConext instance? This will be used in all URLs as well as in SSL certificates (to be setup later on)."
  echo -n "Base domain: [$OC_DOMAIN] "
  read OC_HOSTNAME

  echo ""
  echo "2. Components"
  echo "You can either install all components, or a subset of them."
  echo "Possible options are:"
  echo "a. All (EngineBlock, Service registry, Manage, API, Teams, SelfService, Mujina IDP/SP)"
  echo "b. EngineBlock, Service registry, Mujina IDP/SP"
  echo "c. Mix and match (experts only)"
  read COMPONENTCHOICE
  case "$COMPONENTCHOICE" in
    "a" ) OC_COMPONENTS="EB SR MANAGE API TEAMS MUJINA GROUPER";;
    "b" ) OC_COMPONENTS="EB SR MUJINA";;
    * )
        OC_COMPONENTS=""
        for component in EB SR MANAGE GROUPER API TEAMS MUJINA
        do
          echo Install $component? [Y/n]
          read answer
          case $answer in
          "" | "Y" | "y" ) OC_COMPONENTS="$OC_COMPONENTS $component";;
          * ) ;;
          esac
        done
        echo "List of components chosen: " $OC_COMPONENTS
        ;;
  esac

  echo ""
  ALLVERSIONFILES=$(cd $OC_SCRIPTDIR && ls versions*.sh)
  echo "3. Component versions"
  echo "The recommended version of OpenConext to run is the currently 'stable' one, which is: $OC_VERSION."
  echo "Other options are: " $ALLVERSIONFILES
  echo -n "Version: [$OC_VERSION] "
  read OC_VERSION

  while [ ! -f $OC_SCRIPTDIR/$OC_VERSION ]
  do
    echo "Version file $OC_VERSION does not exist."
    echo "The options are: " $ALLVERSIONFILES
    echo -n "Version: "
    read OC_VERSION
  done

fi



# Set the component versions as variables, for use in later scripts
source $OC_SCRIPTDIR/$OC_VERSION


# Dependencies of components

for COMPONENT in $OC_COMPONENTS
do
  if [[ COMPONENT == "SR" ]]
  then
    DEP_PHP=true
    DEP_MYSQL=true
  fi
  if [[ COMPONENT == "EB" ]]
  then
    DEP_PHP=true
    DEP_MYSQL=true
    DEP_MEMCACHED=true
    DEP_LDAP=true
  fi

  if [[ COMPONENT == "API" || COMPONENT == "MUJINA" || COMPONENT == "TEAMS" || COMPONENT == "GROUPER" ]]
  then
    DEP_TOMCAT=true
    DEP_MAVEN=true
  fi

  if [[ COMPONENT == "API" || COMPONENT == "TEAMS" || COMPONENT == "GROUPER" ]]
  then
    DEP_MYSQL=true
  fi

  if [[ COMPONENT == "TEAMS" || COMPONENT == "GROUPER" ]]
  then
    DEP_SHIBBOLETH=true
  fi
done


# Global dependencies, infra-related
# TODO: only do actual infra-stuff. Component-specific stuff belongs in component-install-scripts
for subscript in \
  base_packages.sh \
  hosts_install.sh \
  iptables.sh \
  openconext_logging.sh \
  openconext_configuration.sh \
  samba_install.sh \
  openconext_infra_httpd.sh \
  openconext_custom_certificates.sh \
  openconext_static.sh
do
  echo "Running dependency script $subscript..."
  source $OC_SCRIPTDIR/dependencies/$subscript
done

if [[ $DEP_MAVEN -eq "true" ]]
then
  echo "Installing Maven..."
  source $OC_SCRIPTDIR/dependencies/maven_install.sh
fi
if [[ $DEP_TOMCAT -eq "true" ]]
then
  echo "Installing Tomcat..."
  source $OC_SCRIPTDIR/dependencies/tomcat_install.sh
fi

if [[ $DEP_MEMCACHED -eq "true" ]]
then
  echo "Installing memcached..."
  source $OC_SCRIPTDIR/dependencies/memcached_install.sh
fi
if [[ $DEP_PHP -eq "true" ]]
then
  echo "Installing PHP..."
  source $OC_SCRIPTDIR/dependencies/php_install.sh
fi
if [[ $DEP_MYSQL -eq "true" ]]
then
  echo "Installing MySQL..."
  source $OC_SCRIPTDIR/dependencies/mysql_install.sh
fi
if [[ $DEP_LDAP -eq "true" ]]
then
  echo "Installing OpenLDAP..."
  source $OC_SCRIPTDIR/dependencies/openldap_install.sh
  source $OC_SCRIPTDIR/dependencies/openconext_ldap.sh
fi
if [[ $DEP_SHIBBOLETH -eq "true" ]]
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

service httpd restart
if [[ $DEP_TOMCAT -eq "true" ]]
then
  echo "Starting Tomcat..."
  service tomcat6 start
fi

echo; echo
echo "Install script is done."

# Line for use in the hosts-file of the VM-host and potential other systems.
COMPONENTS="db ldap grouper serviceregistry engine profile manage teams static testidp mujina-sp mujina-idp teams api"
HOSTSLINE="$OC_DOMAIN" # the domain itself
for comp in $COMPONENTS
do
  HOSTSLINE="$HOSTSLINE $comp.$OC_DOMAIN"
done

echo "The hosts-file of computers that want to use this OpenConext instance should contain the following entry: "
echo "-----"
echo "IP_ADDRESS $HOSTSLINE"
echo "-----"
echo "Where IP_ADDRESS is an IP address of this system that is reachable from the outside."

echo
echo "Next step: go to this URL with your browser: http://$OC_DOMAIN/"
echo