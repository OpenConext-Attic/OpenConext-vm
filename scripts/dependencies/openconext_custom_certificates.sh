#!/bin/bash

KEY_DIR=/etc/httpd/keys

function generate_new_certs() {
  TMP_DIR=/tmp/$$_$RANDOM
  mkdir $TMP_DIR

  # Setup a (throwaway) CA
  openssl req -new -x509 -days 3650 \
  -extensions v3_ca \
  -passout pass:mysecret \
  -keyout $TMP_DIR/ca.key \
  -subj "/O=OpenConext CA" \
  -out $TMP_DIR/ca.crt

  # Index and serial files
  echo -n "" > $TMP_DIR/ca_index.txt
  echo "01" > $TMP_DIR/serial.txt
  echo "[ ca ]
default_ca      = OpenConext            # The default ca section
[ OpenConext ]
database = $TMP_DIR/ca_index.txt
serial = $TMP_DIR/serial.txt
default_md     = md5
policy         = policy_any            # default policy
email_in_dn    = no                    # Don't add the email into cert DN
name_opt       = ca_default            # Subject name display option
cert_opt       = ca_default            # Certificate display option
copy_extensions = none                 # Don't copy extensions from request
[ policy_any ]
countryName            = optional
stateOrProvinceName    = optional
organizationName       = optional
organizationalUnitName = optional
commonName             = supplied
emailAddress           = optional
" > $TMP_DIR/ca-config.cfg

  # Input for cert request
  SUBJECT_CSR="
O=OpenConext
commonName=*.$OC_DOMAIN
"

  # Generate CSR, generating a private key on the fly
  openssl req -new \
  -nodes \
  -out $TMP_DIR/server.csr \
  -keyout $TMP_DIR/server.key \
  -batch \
  -subj "$(echo -n "$SUBJECT_CSR" | tr "\n" "/")" # openssl wants multiple lines to be separated with a forward slash


  openssl ca \
  -name OpenConext \
  -config $TMP_DIR/ca-config.cfg \
  -cert $TMP_DIR/ca.crt \
  -keyfile $TMP_DIR/ca.key \
  -passin pass:mysecret \
  -in $TMP_DIR/server.csr \
  -days 1825 \
  -batch \
  -outdir $TMP_DIR \
  -out $TMP_DIR/server.crt

  # Now we have the key and the certificate.

  # Copy them to the right place
  cp $TMP_DIR/server.crt $KEY_DIR/openconext.crt
  cp $TMP_DIR/server.key $KEY_DIR/openconext.key
  cp $TMP_DIR/ca.crt $KEY_DIR/openconext_cabundle.pem

  # Delete working directory (including the throwaway-CA... )
  rm -Rf $TMP_DIR
}

function explain_bring_your_own() {
  echo "You should now place a key and certificate of your choice in the directory $KEY_DIR."
  echo "They should be called:"
  echo "openconext.pem (the certificate)"
  echo "openconext.key (the private key, not password protected)"
  echo "openconext_cabundle.pem (the trust chain)"
  echo ""
  echo "Place the files and press enter to validate (by a configtest of httpd)"
  read FOOBAR

  if service httpd configtest
  then
    echo "Configuration test was successful, will restart httpd."
    echo; echo;
    service httpd restart
  else
    echo "Configuration test failed, please retry."
    echo; echo;
    explain_bring_your_own
  fi
}

echo; echo;
echo "For HTTP over SSL and SAML signing/encryption, a set of self-signed, default keys and certificates are installed. You can customize this now, if you want to."
echo
echo "1. Generate a new set, based on the chosen base domain ($OC_DOMAIN)"
echo "2, Bring your own certificates, (including trust chain)"
echo "3. Keep the default (for demo.openconext.org)"

read CERTCHOICE
echo; echo;
case "$CERTCHOICE" in
  "1" ) generate_new_certs ;;
  "2" ) explain_bring_your_own ;;
  * )
    echo "The current, default set will be used, valid for demo.openconext.org."
      ;;
esac
