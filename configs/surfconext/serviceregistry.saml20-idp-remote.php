<?php

/**
 * REQUIRED environment configuration for JANUS module
 * For a complete set of the available configuration options
 * please see serviceregistry/metadata/saml20-idp-remote.php
 */

$metadata['https://engine.demo.openconext.org/authentication/idp/metadata'] = array(
        'SingleSignOnService'   => 'https://engine.demo.openconext.org/authentication/idp/single-sign-on',
        'certificate'           =>'engineblock.crt',
);