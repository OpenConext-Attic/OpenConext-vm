<?php
	require_once '/opt/www/serviceregistry/www/_include.php';

#	$session = SimpleSAML_Session::getInstance();
	$config = SimpleSAML_Configuration::getInstance();
	$janus_config = SimpleSAML_Configuration::getConfig('module_janus.php');

        $econtroller = new sspmod_janus_EntityController($janus_config);
	$econtroller->setEntity('http://example.openconext.local');
	$econtroller->addMetaData('SingleSignOnService','http://example.openconext.local');
#	$econtroller->saveEntity();


?>
