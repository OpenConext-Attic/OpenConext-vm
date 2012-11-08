-- MySQL dump 10.13  Distrib 5.1.61, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: engineblock
-- ------------------------------------------------------
-- Server version	5.1.61

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `consent`
--

DROP TABLE IF EXISTS `consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consent` (
  `consent_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usage_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hashed_user_id` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `service_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attribute` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hashed_user_id`,`service_id`),
  KEY `hashed_user_id` (`hashed_user_id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consent`
--

LOCK TABLES `consent` WRITE;
/*!40000 ALTER TABLE `consent` DISABLE KEYS */;
INSERT INTO `consent` VALUES ('2012-06-27 09:01:37','2012-06-27 09:01:37','4e20080aba70103a60039bf19fdac0c4fb7ce367','https://manage.demo.openconext.org/simplesaml/module.php/saml/sp/metadata.php/default-sp','f8fff30971a5477e0721ce45aa5dd7ad83b6848e'),\n('2012-06-27 09:13:32','2012-06-27 09:13:32','4e20080aba70103a60039bf19fdac0c4fb7ce367','https://serviceregistry._OPENCONEXT_DOMAIN_/simplesaml/module.php/saml/sp/metadata.php/default-sp','f8fff30971a5477e0721ce45aa5dd7ad83b6848e');
/*!40000 ALTER TABLE `consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_changelog`
--

DROP TABLE IF EXISTS `db_changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_changelog` (
  `patch_number` int(11) NOT NULL,
  `branch` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `completed` int(11) DEFAULT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`patch_number`,`branch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_changelog`
--

LOCK TABLES `db_changelog` WRITE;
/*!40000 ALTER TABLE `db_changelog` DISABLE KEYS */;
INSERT INTO `db_changelog` VALUES (1,'default',1340787301,'patch-0001.php','9e47c3b8','Move the groupProviders configuration from the local config to the database.'),\n(2,'default',1340787301,'patch-0002.sql','2a482377','Initial migration away from LiquiBase'),\n(3,'default',1340787301,'patch-0003.sql','271b9ee1','Remove LiquiBase tables'),\n(4,'default',1340787301,'patch-0004.sql','bece62cf','Table structure for table `emails`'),\n(5,'default',1340787301,'patch-0005.sql','61a65c9d','Add new emails for deprovisioning'),\n(6,'default',1340787301,'patch-0006.sql','e7075a42','Update deprovisioning mail'),\n(7,'default',1340787301,'patch-0007.sql','445ce3bd','Add id field to login table (ported from manage patch-001.sql)'),\n(8,'default',1340787301,'patch-0008.php','e452a2b0','Add urn:collab:group: prefixing to Grouper group providers'),\n(9,'default',1340787301,'patch-0009.sql','7fed17ad','Add tables for new persistent NameID'),\n(10,'default',1340788257,'patch-0010.php','d2a6343a','Assign a UUID to all users in LDAP'),\n(11,'default',1340788257,'patch-0011.sql','015c7b4a','Add useragent field to login_logs table for logging the User-Agent'),\n(12,'default',1340788257,'patch-0012.sql','a668c1a3','Add voname field to login_logs table for logging the Virtual Organisation Context'),\n(13,'default',1340788257,'patch-0013.sql','ab0053d5','Add table for storing the ACL Group provider information for service providers'),\n(14,'default',1340788257,'patch-0014.sql','e2e35650',''),\n(15,'default',1340788257,'patch-0015.sql','479a53d4','Add logo_url field to group_provider table for displaying the picture in teams');
/*!40000 ALTER TABLE `db_changelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email_from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_html` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_type` (`email_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
INSERT INTO `emails` VALUES (1,'introduction_email','Dear {user},<br />\r\n<br />\r\nThis mail is a confirmation that we have created a profile for you on the SURFconext platform. Please visit https://profile.surfconext.nl to see and manage your profile. If you have any questions regarding this mail please contact help@surfconext.nl.<br />\r\n<br />\r\nBest regards, Surfconext ','help@surfconext.nl','Welcome to SURFconext',1),\n(2,'deprovisioning_warning_email','Dear {user},<br /><br />This mail is to inform you that you will be deprovisioned at {deprovision_time}. If you have any questions regarding this mail please contact help@surfconext.nl.<br /><br />You will be deleted as a member of all the groups. Currently you are member of the following groups:<br />{groups}<br />In the groups displayed below you are the only administrator. Please make another member administrator before you are deprovisioned, for these teams will be without an administrator otherwise.&nbsp;<br />{onlyAdminGroups}<br />Best regards,<br />SURFconext','help@surfconext.nl','Deprovisioning SURFconext',NULL),\n(3,'deprovisioning_warning_email_group_members','Dear {user},<br />\r\n<br />\r\nThis mail is to inform you that your administrator in team {team} will be deprovisioned at {deprovision_time}. If you have any questions regarding this mail please contact help@surfconext.nl.<br />\r\n<br />\r\nBest regards<br />, SURFconext','help@surfconext.nl','Deprovisioning  SURFconext',NULL);
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_provider`
--

DROP TABLE IF EXISTS `group_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `logo_url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_provider`
--

LOCK TABLES `group_provider` WRITE;
/*!40000 ALTER TABLE `group_provider` DISABLE KEYS */;
INSERT INTO `group_provider` VALUES (1,'SURFteams grouper','SURFteams grouper','EngineBlock_Group_Provider_Grouper','SURFteams grouper');
/*!40000 ALTER TABLE `group_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_provider_decorator`
--

DROP TABLE IF EXISTS `group_provider_decorator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_provider_decorator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_provider_id` int(11) NOT NULL,
  `classname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_provider_decorator`
--

LOCK TABLES `group_provider_decorator` WRITE;
/*!40000 ALTER TABLE `group_provider_decorator` DISABLE KEYS */;
INSERT INTO `group_provider_decorator` VALUES (1,1,'EngineBlock_Group_Provider_Decorator_GroupIdReplace');
/*!40000 ALTER TABLE `group_provider_decorator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_provider_decorator_option`
--

DROP TABLE IF EXISTS `group_provider_decorator_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_provider_decorator_option` (
  `group_provider_decorator_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`group_provider_decorator_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_provider_decorator_option`
--

LOCK TABLES `group_provider_decorator_option` WRITE;
/*!40000 ALTER TABLE `group_provider_decorator_option` DISABLE KEYS */;
INSERT INTO `group_provider_decorator_option` VALUES (1,'replace','$1'),\n(1,'search','|urn:collab:group:dev.surfteams.nl:(.+)|');
/*!40000 ALTER TABLE `group_provider_decorator_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_provider_filter`
--

DROP TABLE IF EXISTS `group_provider_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_provider_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_provider_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_provider_filter`
--

LOCK TABLES `group_provider_filter` WRITE;
/*!40000 ALTER TABLE `group_provider_filter` DISABLE KEYS */;
INSERT INTO `group_provider_filter` VALUES (1,1,'group','EngineBlock_Group_Provider_Filter_ModelProperty_PregReplace');
/*!40000 ALTER TABLE `group_provider_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_provider_filter_option`
--

DROP TABLE IF EXISTS `group_provider_filter_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_provider_filter_option` (
  `group_provider_filter_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`group_provider_filter_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_provider_filter_option`
--

LOCK TABLES `group_provider_filter_option` WRITE;
/*!40000 ALTER TABLE `group_provider_filter_option` DISABLE KEYS */;
INSERT INTO `group_provider_filter_option` VALUES (1,'property','id'),\n(1,'replace','urn:collab:group:dev.surfteams.nl:$1'),\n(1,'search','|(.+)|');
/*!40000 ALTER TABLE `group_provider_filter_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_provider_option`
--

DROP TABLE IF EXISTS `group_provider_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_provider_option` (
  `group_provider_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`group_provider_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_provider_option`
--

LOCK TABLES `group_provider_option` WRITE;
/*!40000 ALTER TABLE `group_provider_option` DISABLE KEYS */;
INSERT INTO `group_provider_option` VALUES (1,'host','grouper._OPENCONEXT_DOMAIN_'),\n(1,'password','KJ75DFeg32a'),\n(1,'path','/grouper-ws/servicesRest'),\n(1,'protocol','https'),\n(1,'timeout','10'),\n(1,'user','engine'),\n(1,'version','v1_6_000');
/*!40000 ALTER TABLE `group_provider_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_provider_precondition`
--

DROP TABLE IF EXISTS `group_provider_precondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_provider_precondition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_provider_id` int(11) NOT NULL,
  `classname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_provider_precondition`
--

LOCK TABLES `group_provider_precondition` WRITE;
/*!40000 ALTER TABLE `group_provider_precondition` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_provider_precondition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_provider_precondition_option`
--

DROP TABLE IF EXISTS `group_provider_precondition_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_provider_precondition_option` (
  `group_provider_precondition_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`group_provider_precondition_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_provider_precondition_option`
--

LOCK TABLES `group_provider_precondition_option` WRITE;
/*!40000 ALTER TABLE `group_provider_precondition_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_provider_precondition_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_provider_user_oauth`
--

DROP TABLE IF EXISTS `group_provider_user_oauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_provider_user_oauth` (
  `provider_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `oauth_token` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `oauth_secret` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`provider_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_provider_user_oauth`
--

LOCK TABLES `group_provider_user_oauth` WRITE;
/*!40000 ALTER TABLE `group_provider_user_oauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_provider_user_oauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_logins`
--

DROP TABLE IF EXISTS `log_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_logins` (
  `loginstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `spentityid` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idpentityid` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `spentityname` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idpentityname` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `useragent` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `voname` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_logins`
--

LOCK TABLES `log_logins` WRITE;
/*!40000 ALTER TABLE `log_logins` DISABLE KEYS */;
INSERT INTO `log_logins` VALUES
('2012-06-27 09:13:33','urn:collab:person:example.com:john.doe','https://serviceregistry._OPENCONEXT_DOMAIN_/simplesaml/module.php/saml/sp/metadata.php/default-sp','http://mock-idp','OpenConext ServiceRegistry','OpenConext Mujina','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:13.0) Gecko/20100101 Firefox/13.0.1',NULL,1);
/*!40000 ALTER TABLE `log_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saml_persistent_id`
--

DROP TABLE IF EXISTS `saml_persistent_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saml_persistent_id` (
  `persistent_id` char(40) COLLATE utf8_unicode_ci NOT NULL COMMENT 'SHA1 of service_provider_uuid + user_uuid',
  `user_uuid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `service_provider_uuid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`persistent_id`),
  KEY `user_uuid` (`user_uuid`,`service_provider_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Look up table for persistent_ids we hand out';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saml_persistent_id`
--

LOCK TABLES `saml_persistent_id` WRITE;
/*!40000 ALTER TABLE `saml_persistent_id` DISABLE KEYS */;
INSERT INTO `saml_persistent_id` VALUES ('9a26dd18d7f33511b4a98d838cae09543ce5f171','b06b98b0-c036-11e1-b910-cd9212b8c0d3','5e5717a0-c038-11e1-8b8e-234ffa2d0a60'),\n('3f18e71b45ef07f3110e3cb418bdeb1be0c9ef83','b06b98b0-c036-11e1-b910-cd9212b8c0d3','b416cbc0-c036-11e1-b5a6-216cccc3b1fc');
/*!40000 ALTER TABLE `saml_persistent_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_provider_group_acl`
--

DROP TABLE IF EXISTS `service_provider_group_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_provider_group_acl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_provider_id` bigint(20) NOT NULL,
  `spentityid` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `allow_groups` tinyint(1) DEFAULT '0',
  `allow_members` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `spentityid_group_provider_id` (`spentityid`(250),`group_provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_provider_group_acl`
--

LOCK TABLES `service_provider_group_acl` WRITE;
/*!40000 ALTER TABLE `service_provider_group_acl` DISABLE KEYS */;
INSERT INTO `service_provider_group_acl` VALUES (1,1,'https://engine._OPENCONEXT_DOMAIN_/authentication/sp/metadata',1,1),\n(2,1,'https://profile._OPENCONEXT_DOMAIN_/simplesaml/module.php/saml/sp/metadata.php/default-sp',1,1),\n(3,1,'https://manage._OPENCONEXT_DOMAIN_/simplesaml/module.php/saml/sp/metadata.php/default-sp',1,1),\n(4,1,'https://serviceregistry.demo.openconext.org/simplesaml/module.php/saml/sp/metadata.php/default-sp',1,1),\n(5,1,'http://mock-sp',1,1),\n(6,1,'https://grouper.demo.openconext.org/grouper/shibboleth',1,1),\n(7,1,'https://teams.demo.openconext.org/shibboleth',1,1);
/*!40000 ALTER TABLE `service_provider_group_acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_provider_uuid`
--

DROP TABLE IF EXISTS `service_provider_uuid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_provider_uuid` (
  `uuid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `service_provider_entity_id` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `service_provider_entity_id` (`service_provider_entity_id`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lookup table for UUIDs for Service Providers, provides a lev';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_provider_uuid`
--

LOCK TABLES `service_provider_uuid` WRITE;
/*!40000 ALTER TABLE `service_provider_uuid` DISABLE KEYS */;
INSERT INTO `service_provider_uuid` VALUES ('5e5717a0-c038-11e1-8b8e-234ffa2d0a60','https://serviceregistry.demo.openconext.org/simplesaml/module.php/saml/sp/metadata.php/default-sp'),\n('b416cbc0-c036-11e1-b5a6-216cccc3b1fc','https://manage.demo.openconext.org/simplesaml/module.php/saml/sp/metadata.php/default-sp');
/*!40000 ALTER TABLE `service_provider_uuid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_organisation`
--

DROP TABLE IF EXISTS `virtual_organisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_organisation` (
  `vo_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vo_type` enum('GROUP','STEM','IDP','MIXED') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`vo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_organisation`
--

LOCK TABLES `virtual_organisation` WRITE;
/*!40000 ALTER TABLE `virtual_organisation` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtual_organisation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_organisation_attribute`
--

DROP TABLE IF EXISTS `virtual_organisation_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_organisation_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vo_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sp_entity_id` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `user_id_pattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attribute_name_saml` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attribute_name_opensocial` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attribute_value` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vo_id` (`vo_id`(200),`sp_entity_id`(200),`user_id_pattern`(200),`attribute_name_saml`(200),`attribute_name_opensocial`(200))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_organisation_attribute`
--

LOCK TABLES `virtual_organisation_attribute` WRITE;
/*!40000 ALTER TABLE `virtual_organisation_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtual_organisation_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_organisation_group`
--

DROP TABLE IF EXISTS `virtual_organisation_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_organisation_group` (
  `vo_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`vo_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_organisation_group`
--

LOCK TABLES `virtual_organisation_group` WRITE;
/*!40000 ALTER TABLE `virtual_organisation_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtual_organisation_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_organisation_idp`
--

DROP TABLE IF EXISTS `virtual_organisation_idp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_organisation_idp` (
  `vo_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `idp_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`vo_id`,`idp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_organisation_idp`
--

LOCK TABLES `virtual_organisation_idp` WRITE;
/*!40000 ALTER TABLE `virtual_organisation_idp` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtual_organisation_idp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-06-27 10:51:18
