#!/bin/bash

### Constants
NODE_PROPS=/etc/openconext/node.properties


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
    sed -i $NODE_PROPS -e "s/openconext-version=.*/openconext-version=$NEW_VERSION/"
  fi
}

function generate_new_certs() {

# The CA key/cert were generated using this command:
# openssl req -new -x509 -days 3650 \
# -extensions v3_ca -passout pass:mysecret -keyout $TMP_DIR/ca.key \
# -subj "/O=OpenConext CA" \
# -out $TMP_DIR/ca.crt


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
    default_md     = sha1
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
" > $CA_DIR/ca-config.cfg

  fi

  
  # Input for cert request
  SUBJECT_CSR="
O=OpenConext
commonName=*.$OC_DOMAIN
"

  # Generate CSR, generating a private key on the fly
  openssl req -new \
  -nodes \
  -out $CA_DIR/server.csr \
  -keyout $CA_DIR/server.key \
  -batch \
  -subj "$(echo -n "$SUBJECT_CSR" | tr "\n" "/")" # openssl wants multiple lines to be separated with a forward slash

  # Sign with the CA
  openssl ca \
  -name OpenConext \
  -notext \
  -config $CA_DIR/ca-config.cfg \
  -cert $OC_BASEDIR/certs/openconext_ca.pem \
  -keyfile $OC_BASEDIR/certs/openconext_ca.key \
  -passin pass:$CA_KEY_PASSWORD \
  -in $CA_DIR/server.csr \
  -days 1825 \
  -batch \
  -outdir $CA_DIR \
  -out $CA_DIR/server.crt

  # Now we have the key and the certificates, copy them to the right place
  cp $CA_DIR/server.crt $KEY_DIR/openconext.pem
  cp $CA_DIR/server.key $KEY_DIR/openconext.key

  cp $OC_BASEDIR/certs/openconext_ca.pem $KEY_DIR/openconext_ca.pem
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

### Logging

LOGFILE=/var/log/openconext-vm.log
if [ -f $LOGFILE ]
then
  backupFile $LOGFILE
fi
exec > >(tee $LOGFILE)
exec 2> >(tee -a $LOGFILE)
echo "Logging all output to $LOGFILE"
