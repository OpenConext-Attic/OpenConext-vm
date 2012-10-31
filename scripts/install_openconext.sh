#!/bin/bash
#
# Installation script for OpenConext
# Run with -i for interactive setup.
#
#
#
# TODO: check git


# Verify that user root runs this script
ROOT_UID=0   # Root has $UID 0.
if [ $UID -ne ${ROOT_UID} ]
then
  echo "You must be root to run this install script, as it installs some system packages."
  exit 1
fi



# Defaults
# TODO: Read from cached file, in case installation script is run again later on.
OC_HOSTNAME=demo.openconext.org
OC_VERSION=version_v2.5.sh


# interactive run?
INTERACTIVE=false
if [ "$1" == "-i" ]
then
  INTERACTIVE=true
  echo "Running in interactive mode."
else
  echo "Running in non-interactive mode. Defaults to be used are:"
  echo "Hostname: " $OC_HOSTNAME
  echo "Version file: " $OC_VERSION
fi

if [ $INTERACTIVE == "true" ]
then
  echo ""
  echo "You will be asked some questions before installation. Defaults will be provided."
  echo ""

  echo "1. Hostname"
  echo "What is the hostname of the OpenConext instance? This will be used in all URLs as well as in SSL certificates (to be setup later on)."
  echo -n "Hostname: [$OC_HOSTNAME] "
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
        for component in EB SR MANAGE GROUPER API TEAMS SELFSERVICE MUJINA
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
  ALLVERSIONFILES=versions*.sh
  echo "3. Component versions"
  echo "The recommended version of OpenConext to run is the currently 'stable' one, which is: $OC_VERSION."
  echo "Other options are: " $ALLVERSIONFILES
  echo -n "Version: [$OC_VERSION] "
  read OC_VERSION

  while [ ! -f $OC_VERSION ]
  do
    echo "Version file $OC_VERSION does not exist."
    echo "The options are: " $ALLVERSIONFILES
    echo -n "Version: "
    read OC_VERSION
  done

fi


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

  if [[ COMPONENT == "TEAMS" ]]
  then
    DEP_SHIBBOLETH=true
  fi
done


# Global dependencies, infra-related
# TODO: only do actual infra-stuff. Component-specific stuff belongs in component-install-scripts
for subscript in \
  httpd_install.sh \
  hosts_install.sh \
  firewall_disable.sh \
  openconext_www.sh \
  openconext_logging.sh \
  openconext_configuration.sh \
  samba_install.sh \
  openconext_static.sh \
  chown_www.sh \
  openconext_infra_httpd.sh \
  certificates.sh
do
  echo "Running global prerequisite installscript $subscript..."
  echo bash $subscript
done

if [[ $DEP_MAVEN -eq "true" ]]
then
  echo "Installing Maven..."
  echo bash maven_install.sh
fi
if [[ $DEP_MEMCACHED -eq "true" ]]
then
  echo "Installing memcached..."
  echo bash memcached_install.sh
fi
if [[ $DEP_PHP -eq "true" ]]
then
  echo "Installing PHP..."
  echo bash php_install.sh
fi
if [[ $DEP_MYSQL -eq "true" ]]
then
  echo "Installing MySQL..."
  echo bash mysql_install.sh
fi
if [[ $DEP_TOMCAT -eq "true" ]]
then
  echo "Installing Tomcat..."
  echo bash tomcat_install.sh
fi
if [[ $DEP_LDAP -eq "true" ]]
then
  echo "Installing OpenLDAP..."
  echo bash openldap_install.sh
  echo bash openconext_ldap_install.sh
fi
if [[ $DEP_SHIBBOLETH -eq "true" ]]
then
  echo "Installing Shibboleth..."
  echo bash shibboleth_install.sh
fi

echo "Done installing dependencies."


# Components

if echo $OC_COMPONENTS | grep -q GROUPER
then
  echo "Installing Grouper..."
  echo bash grouper.sh
fi

if echo $OC_COMPONENTS | grep -q SR
then
  echo "Installing Service registry..."
  echo bash openconext_serviceregistry_install.sh
fi

if echo $OC_COMPONENTS | grep -q EB
then
  echo "Installing EngineBlock..."
  echo bash openconext_engine_install.sh
fi

if echo $OC_COMPONENTS | grep -q MANAGE
then
  echo "Installing Manage..."
  echo bash openconext_manage_install.sh
fi

if echo $OC_COMPONENTS | grep -q MUJINA
then
  echo "Installing Mujina IDP/SP..."
  echo bash mujina_install.sh
fi

if echo $OC_COMPONENTS | grep -q API
then
  echo "Installing API..."
  echo bash openconext_api.sh
fi

if echo $OC_COMPONENTS | grep -q TEAMS
then
  echo "Installing Teams..."
  echo bash openconext_teams.sh
fi
