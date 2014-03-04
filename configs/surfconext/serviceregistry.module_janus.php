<?php

/**
 * REQUIRED environment configuration for JANUS module
 * For a complete set of the available configuration options
 * please see serviceregistry/config/module_janus.php
 */

$config['admin.name']  = '_OC__ADMIN_NAME_';
$config['admin.email'] = '_OC__ADMIN_EMAIL_';

/*
 * Auth source used to gain access to JANUS
 */
#$config['auth'] = 'admin'; // Admin password (for installing or debugging)
$config['auth'] = 'default-sp'; // Single Sign On via EngineBlock

/*
 * Attibute used to identify users
 */
#$config['useridattr'] = 'user';
$config['useridattr'] = 'urn:mace:dir:attribute-def:eduPersonTargetedID';

$config['store'] = array(
    'dsn'       => 'mysql:host=localhost;dbname=serviceregistry',
    'username'  => '_SERVICEREGISTRY_DB_USER_',
    'password'  => '_SERVICEREGISTRY_DB_PASS_',
    'prefix'    => 'janus__',
);

/*
 * Automatically create a new user if user do not exists on login
 */
$config['user.autocreate'] = true;

