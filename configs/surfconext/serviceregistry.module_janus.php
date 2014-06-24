<?php

/**
 * REQUIRED environment configuration for JANUS module
 * For a complete set of the available configuration options
 * please see serviceregistry/config/module_janus.php
 */

$config['admin.name']  = '__OC__ADMIN_NAME__';
$config['admin.email'] = '__OC__ADMIN_EMAIL__';

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
    'username'  => '__OC__SERVICEREGISTRY_DB_USER__',
    'password'  => '__OC__SERVICEREGISTRY_DB_PASS__',
    'prefix'    => 'janus__',
);

/*
 * Automatically create a new user if user do not exists on login
 */
$config['user.autocreate'] = true;

