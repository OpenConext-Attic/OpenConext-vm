#!/bin/bash

### Constants
NODE_PROPS=/etc/openconext/oc_config.sh

# The default domain will be used as the base domain for all components.
# Components will be named XYZ.DEFAULT_DOMAIN, so e.g. engine.demo.openconext.org
DEFAULT_DOMAIN=demo.openconext.org

# This is the default set of components in an install
# Available components are: EB SR MANAGE API TEAMS MUJINA GROUPER APIS CRUNCHER CSA DASHBOARD
# (v62, 2014-03-03)
DEFAULT_OC_COMPONENTS="EB SR MANAGE API TEAMS MUJINA GROUPER"

MVN_VERSION=3.0.5
VERBOSE=false

## Suppress output of various commands by default
MVN="mvn -q"
YUM="yum -q"
GITCLONE="git clone -q"
GITCHECKOUT="git checkout -q"
GITFETCH="git fetch -q"
GITRESET="git reset --hard -q"

### Settings, sanity checks

# errors are fatal
set -e

# Verify that user root runs this script
ROOT_UID=0   # Root has $UID 0.
if [ $UID -ne ${ROOT_UID} ]
then
  echo "You must be root to run this install script, as it installs system packages and configures service."
  exit 1
fi

# Catch ctrl-c and quit, instead of rambling on
trap "echo \"caught signal, will exit installation script\"; exit" INT TERM



### Functions

# Create a backup of the given file (complete path)
# Will suffix with the current date and a sequence number
function backupFile()
{
  FILENAME="$1"
  DATE=`date +%Y%m%d`
  SEQ=1
  while [[ -f $FILENAME.$DATE.$SEQ ]]
  do
     SEQ=`expr $SEQ + 1`
  done
  NEW_FILENAME=$FILENAME.$DATE.$SEQ

  cp -p $FILENAME $NEW_FILENAME
}

# Set a version in the node properties
function setOpenConextVersion() {
  NEW_VERSION="$1"

  # OpenConext VMs older than r47 do not have a node.properties
  if [ -f $NODE_PROPS ]
  then
    sed -i $NODE_PROPS -e "s/OC_VERSION=.*/OC_VERSION=$NEW_VERSION/"
  fi
}

function generate_new_certs() {

  if [ -f $CA_DIR/serial.txt ]
  then
    echo "reusing ca in $CA_DIR"
  else
    # Index and serial files
    echo -n "" > $CA_DIR/ca_index.txt
    echo -n "00" > $CA_DIR/serial.txt

    echo "
  [ ca ]
    default_ca      = OpenConext            # The default ca section

  [ OpenConext ]
    database = $CA_DIR/ca_index.txt
    serial = $CA_DIR/serial.txt
    default_md     = sha256
    policy         = policy_any            # default policy
    email_in_dn    = no                    # Don't add the email into cert DN
    name_opt       = ca_default            # Subject name display option
    cert_opt       = ca_default            # Certificate display option
    copy_extensions = none                 # Don't copy extensions from request
    unique_subject         = no            # Allow reuse of CN's in this CA

  [ policy_any ]
    countryName            = optional
    stateOrProvinceName    = optional
    organizationName       = optional
    organizationalUnitName = optional
    commonName             = supplied
    emailAddress           = optional

  [ req ]
    default_bits            = 4096
    default_md              = sha256
    default_keyfile         = $CA_DIR/ca.key
    distinguished_name      = req_distinguished_name
    x509_extensions = v3_ca # The extentions to add to the self signed cert

  [ req_distinguished_name ]              
    countryName                     = Country Name (2 letter code)
    countryName_default             = ORG
    countryName_min                 = 2
    countryName_max                 = 3

    stateOrProvinceName             = State or Province Name (full name)
    stateOrProvinceName_default     = Utrecht

    localityName                    = Locality Name (eg, city)
    localityName_default            = Utrecht

    0.organizationName              = Organization Name (eg, company)
    0.organizationName_default      = OpenConext

    organizationalUnitName          = Organizational Unit Name (eg, section)
    organizationalUnitName_default  = OpenConext Virtual Machine

    commonName                      = Common Name (eg, YOUR name)
    commonName_default              = $OC_DOMAIN
    commonName_max                  = 64

    #emailAddress                    = Email Address
    #emailAddress_max                = 40

  [ v3_req ]
  # Extensions to add to a certificate request
  basicConstraints = CA:FALSE
  keyUsage = nonRepudiation, digitalSignature, keyEncipherment

  [ v3_ca ]
  # Extensions for a typical CA
  # PKIX recommendation.
  subjectKeyIdentifier=hash
  authorityKeyIdentifier=keyid:always,issuer:always

  # This is what PKIX recommends but some broken software chokes on critical
  # extensions.
  #basicConstraints = critical,CA:true
  # So we do this instead.
  basicConstraints = CA:true
" > $CA_DIR/ca-config.cfg

#  fi

  # Create new CA
  openssl req -new \
  -x509 \
  -days 3650 \
  -extensions v3_ca \
  -config $CA_DIR/ca-config.cfg \
  -passout pass:$CA_KEY_PASSWORD \
  -keyout $CA_DIR/ca.key \
  -subj "/O=OpenConext CA" \
  -out $CA_DIR/ca.crt

  fi

  # Input for cert request
  echo "create new star certificate for OpenConext";

  SUBJECT_CSR="
O=OpenConext
commonName=*.$OC_DOMAIN
"

  # Generate CSR, generating a private key on the fly
  openssl req -new \
  -nodes \
  -config $CA_DIR/ca-config.cfg \
  -out $CA_DIR/server.csr \
  -keyout $CA_DIR/server.key \
  -batch \
  -subj "$(echo -n "$SUBJECT_CSR" | tr "\n" "/")" # openssl wants multiple lines to be separated with a forward slash

  # Sign with the CA
  openssl ca \
  -name OpenConext \
  -notext \
  -config $CA_DIR/ca-config.cfg \
  -cert $CA_DIR/ca.crt \
  -keyfile $CA_DIR/ca.key \
  -passin pass:$CA_KEY_PASSWORD \
  -in $CA_DIR/server.csr \
  -days 1825 \
  -batch \
  -outdir $CA_DIR \
  -out $CA_DIR/server.crt

  # Now we have the key and the certificates, copy them to the right place
  cp $CA_DIR/server.crt $KEY_DIR/openconext.pem
  cp $CA_DIR/server.key $KEY_DIR/openconext.key

  cp $CA_DIR/ca.crt $KEY_DIR/openconext_ca.pem
}

function explain_bring_your_own() {
  echo "You should now place a key and certificate of your choice in the directory $KEY_DIR."
  echo "They should be called:"
  echo "openconext.pem (the certificate)"
  echo "openconext.key (the private key, not password protected)"
  echo "openconext_ca.pem (the trust chain)"
  echo ""
  echo "Place the files and press enter to validate (by a configtest of httpd)"
  read FOOBAR # input not used afterwards

  if service httpd configtest
  then
    echo "Configuration test was successful."
    echo; echo
  else
    echo "Configuration test failed, please retry."
    echo; echo
    explain_bring_your_own
  fi
}

# Run GSH script
function runGshScript() {
  GSH_DIR=/opt/www/grouper-shell
  if grep -q "<id>jdbc</id>" $GSH_DIR/conf/sources.xml
  then
    # Set a replacement bookmark to be able to find the correct id in subsequent calls
    sed -i $GSH_DIR/conf/sources.xml -e "s~<id>jdbc</id>~<\!-- REPLACEMENT_BOOKMARK --> <id>$1</id>~"
  fi
  # Replace with the actual desired value
  sed -i $GSH_DIR/conf/sources.xml -e "s~REPLACEMENT_BOOKMARK.*<id>.*</id>~REPLACEMENT_BOOKMARK--><id>$1</id>~"
  GSH_SCRIPT=`mktemp`
  cat - > $GSH_SCRIPT # get stdin into script file
  cd $GSH_DIR && bin/gsh $GSH_SCRIPT && cd -
  rm -f $GSH_SCRIPT

  # Replace back to default
  sed -i $GSH_DIR/conf/sources.xml -e "s~REPLACEMENT_BOOKMARK.*<id>.*</id>~REPLACEMENT_BOOKMARK--><id>jdbc</id>~"
}

### Logging

LOGFILE=/var/log/openconext-vm.log
if [ -f $LOGFILE ]
then
  backupFile $LOGFILE
fi
exec > >(tee $LOGFILE)
exec 2> >(tee -a $LOGFILE)
echo "Logging all output to $LOGFILE"
