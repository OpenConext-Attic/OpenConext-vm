<?php

/**
 * REQUIRED environment configuration for JANUS module
 * For a complete set of the available configuration options
 * please see serviceregistry/metadata/saml20-idp-remote.php
 */

$metadata['https://engine._OPENCONEXT_DOMAIN_/authentication/idp/metadata'] = array(
        'SingleSignOnService'   => 'https://engine._OPENCONEXT_DOMAIN_/authentication/idp/single-sign-on',
        'certificate'           =>'engineblock.crt',
);