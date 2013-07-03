-- MySQL dump 10.13  Distrib 5.1.66, for redhat-linux-gnu (i386)
--
-- Host: localhost    Database: srnew
-- ------------------------------------------------------
-- Server version	5.1.66

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
-- Table structure for table `db_changelog`
--

DROP TABLE IF EXISTS `db_changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_changelog` (
  `patch_number` int(11) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `completed` int(11) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`patch_number`,`branch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_changelog`
--

LOCK TABLES `db_changelog` WRITE;
/*!40000 ALTER TABLE `db_changelog` DISABLE KEYS */;
INSERT INTO `db_changelog` VALUES (1,'default',1339486578,'patch-0001.sql','cc44f128','Create Tables for JANUS');
INSERT INTO `db_changelog` VALUES (2,'default',1339486578,'patch-0002.sql','c21bafcb','Initial users for JANUS');
INSERT INTO `db_changelog` VALUES (3,'default',1339486578,'patch-0003.php','ce9a2d0e','Add metadata_valid_until and metadata_cache_until fields for metadata refreshing.');
INSERT INTO `db_changelog` VALUES (4,'default',1339486578,'patch-0004.sql','b93a31b5','Turn off required signature validation for all SPs');
INSERT INTO `db_changelog` VALUES (5,'default',1339486579,'patch-0005.sql','d349d559','Primary key for JANUS entities (ported from manage/patch-002.sql)');
INSERT INTO `db_changelog` VALUES (6,'default',1339486579,'patch-0006.sql','82f24f5e','Add deleted column for deleting ARP rules in JANUS 1.10.0');
INSERT INTO `db_changelog` VALUES (7,'default',1339486579,'patch-0007.sql','2d5543cb','Set all entities to production workflow state');
INSERT INTO `db_changelog` VALUES (8,'default',1339486579,'patch-0008.php','c0943bec','Remove all usertypes other than technical and admin');
INSERT INTO `db_changelog` VALUES (9,'default',1339486579,'patch-0009.php','57f47b80','Update all NameIDFormat keys to urn:oasis:names:tc:SAML:2.0:nameid-format:unspecified');
INSERT INTO `db_changelog` VALUES (10,'default',1339486579,'patch-0010.sql','f832671a','');
INSERT INTO `db_changelog` VALUES (11,'default',1340091386,'patch-0011.sql','2da0be49','');
INSERT INTO `db_changelog` VALUES (12,'default',1340787309,'patch-0012.sql','3cf38d8c','');
INSERT INTO `db_changelog` VALUES (13,'default',1340787309,'patch-0013.php','9d981bbf','Convert allowed / blocked entities from remoteentityid to remoteeid (see BACKLOG-505)');
/*!40000 ALTER TABLE `db_changelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `janus__allowedEntity`
--

DROP TABLE IF EXISTS `janus__allowedEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `janus__allowedEntity` (
  `eid` int(11) NOT NULL,
  `revisionid` int(11) NOT NULL,
  `remoteentityid` text NOT NULL,
  `remoteeid` int(11) NOT NULL,
  `created` char(25) NOT NULL,
  `ip` char(15) NOT NULL,
  KEY `remoteeid` (`remoteeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `janus__allowedEntity`
--

LOCK TABLES `janus__allowedEntity` WRITE;
/*!40000 ALTER TABLE `janus__allowedEntity` DISABLE KEYS */;
/*!40000 ALTER TABLE `janus__allowedEntity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `janus__arp`
--

DROP TABLE IF EXISTS `janus__arp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `janus__arp` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `description` text,
  `attributes` text,
  `is_default` tinyint(1) DEFAULT NULL,
  `created` char(25) NOT NULL,
  `updated` char(25) NOT NULL,
  `deleted` char(25) NOT NULL,
  `ip` char(15) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `janus__arp`
--

LOCK TABLES `janus__arp` WRITE;
/*!40000 ALTER TABLE `janus__arp` DISABLE KEYS */;
INSERT INTO `janus__arp` VALUES (1,'No attributes','Don\'t release any attributes to the Service Provider','a:0:{}',0,'2012-06-13T11:05:08+02:00','2012-06-13T11:05:08+02:00','','172.18.5.1');
INSERT INTO `janus__arp` VALUES (2,'Minimal','Minimal set of attributes to release to Service Providers','a:2:{s:38:\"urn:mace:dir:attribute-def:displayName\";a:1:{i:0;s:1:\"*\";}s:31:\"urn:mace:dir:attribute-def:mail\";a:1:{i:0;s:1:\"*\";}}',0,'2012-06-13T11:05:47+02:00','2012-06-13T11:05:47+02:00','','172.18.5.1');
/*!40000 ALTER TABLE `janus__arp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `janus__attribute`
--

DROP TABLE IF EXISTS `janus__attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `janus__attribute` (
  `eid` int(11) NOT NULL,
  `revisionid` int(11) NOT NULL,
  `key` text NOT NULL,
  `value` text NOT NULL,
  `created` char(25) NOT NULL,
  `ip` char(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `janus__attribute`
--

LOCK TABLES `janus__attribute` WRITE;
/*!40000 ALTER TABLE `janus__attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `janus__attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `janus__blockedEntity`
--

DROP TABLE IF EXISTS `janus__blockedEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `janus__blockedEntity` (
  `eid` int(11) NOT NULL,
  `revisionid` int(11) NOT NULL,
  `remoteentityid` text NOT NULL,
  `remoteeid` int(11) NOT NULL,
  `created` char(25) NOT NULL,
  `ip` char(15) NOT NULL,
  KEY `remoteeid` (`remoteeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `janus__blockedEntity`
--

LOCK TABLES `janus__blockedEntity` WRITE;
/*!40000 ALTER TABLE `janus__blockedEntity` DISABLE KEYS */;
/*!40000 ALTER TABLE `janus__blockedEntity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `janus__disableConsent`
--

DROP TABLE IF EXISTS `janus__disableConsent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `janus__disableConsent` (
  `eid` int(11) NOT NULL,
  `revisionid` int(11) NOT NULL,
  `remoteentityid` text NOT NULL,
  `created` char(25) NOT NULL,
  `ip` char(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `janus__disableConsent`
--

LOCK TABLES `janus__disableConsent` WRITE;
/*!40000 ALTER TABLE `janus__disableConsent` DISABLE KEYS */;
/*!40000 ALTER TABLE `janus__disableConsent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `janus__entity`
--

DROP TABLE IF EXISTS `janus__entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `janus__entity` (
  `eid` int(11) NOT NULL,
  `entityid` text NOT NULL,
  `revisionid` int(11) NOT NULL DEFAULT '0',
  `state` text,
  `type` text,
  `expiration` char(25) DEFAULT NULL,
  `metadataurl` text,
  `metadata_valid_until` datetime DEFAULT NULL,
  `metadata_cache_until` datetime DEFAULT NULL,
  `allowedall` char(3) NOT NULL DEFAULT 'yes',
  `arp` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `created` char(25) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `revisionnote` text,
  `active` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`eid`,`revisionid`),
  UNIQUE KEY `eid` (`eid`,`revisionid`),
  UNIQUE KEY `janus__entity__eid_revisionid` (`eid`,`revisionid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `janus__entity`
--

LOCK TABLES `janus__entity` WRITE;
/*!40000 ALTER TABLE `janus__entity` DISABLE KEYS */;
INSERT INTO `janus__entity` VALUES (1,'https://engine._OPENCONEXT_DOMAIN_/authentication/sp/metadata',0,'prodaccepted','saml20-sp',NULL,NULL,NULL,NULL,'yes',0,1,'2012-06-12T10:38:18+02:00','172.18.5.1',NULL,'Entity created.','yes');
INSERT INTO `janus__entity` VALUES (2,'https://engine._OPENCONEXT_DOMAIN_/authentication/idp/metadata',0,'prodaccepted','saml20-idp',NULL,NULL,NULL,NULL,'yes',0,1,'2012-06-12T10:38:32+02:00','172.18.5.1',NULL,'Entity created.','yes');
INSERT INTO `janus__entity` VALUES (3,'https://profile._OPENCONEXT_DOMAIN_/simplesaml/module.php/saml/sp/metadata.php/default-sp',0,'prodaccepted','saml20-sp',NULL,NULL,NULL,NULL,'yes',0,1,'2012-06-12T10:39:39+02:00','172.18.5.1',NULL,'Entity created.','yes');
INSERT INTO `janus__entity` VALUES (4,'https://manage._OPENCONEXT_DOMAIN_/simplesaml/module.php/saml/sp/metadata.php/default-sp',0,'prodaccepted','saml20-sp',NULL,NULL,NULL,NULL,'yes',0,1,'2012-06-12T11:09:48+02:00','172.18.5.1',NULL,'Entity created.','yes');
INSERT INTO `janus__entity` VALUES (5,'http://idp.ssocircle.com',0,'prodaccepted','saml20-idp',NULL,NULL,NULL,NULL,'yes',0,1,'2012-06-12T11:36:19+02:00','172.18.5.1',NULL,'Entity created.','yes');
INSERT INTO `janus__entity` VALUES (6,'http://mock-idp',0,'prodaccepted','saml20-idp',NULL,NULL,NULL,NULL,'yes',0,1,'2012-06-12T13:07:17+02:00','172.18.5.1',NULL,'Entity created.','yes');
INSERT INTO `janus__entity` VALUES (7,'http://mock-sp',0,'prodaccepted','saml20-sp',NULL,NULL,NULL,NULL,'yes',0,1,'2012-06-12T13:07:26+02:00','172.18.5.1',NULL,'Entity created.','yes');
INSERT INTO `janus__entity` VALUES (8,'https://openidp.feide.no',0,'prodaccepted','saml20-idp',NULL,NULL,NULL,NULL,'yes',0,1,'2012-06-12T13:19:21+02:00','172.18.5.1',NULL,'Entity created.','yes');
INSERT INTO `janus__entity` VALUES (9,'https://serviceregistry._OPENCONEXT_DOMAIN_/simplesaml/module.php/saml/sp/metadata.php/default-sp',0,'prodaccepted','saml20-sp',NULL,NULL,NULL,NULL,'yes',0,1,'2012-06-13T08:00:55+02:00','172.18.5.1',NULL,'Entity created.','yes');
INSERT INTO `janus__entity` VALUES (10,'https://grouper._OPENCONEXT_DOMAIN_/grouper/shibboleth',0,'prodaccepted','saml20-sp',NULL,NULL,NULL,NULL,'yes',0,3,'2012-06-19T09:43:48+02:00','172.18.5.1',NULL,'Entity created.','yes');
INSERT INTO `janus__entity` VALUES (11,'https://teams._OPENCONEXT_DOMAIN_/shibboleth',0,'prodaccepted','saml20-sp',NULL,NULL,NULL,NULL,'yes',0,3,'2012-06-25T16:34:29+02:00','172.18.5.1',NULL,'Entity created.','yes');
INSERT INTO `janus__entity` VALUES (12,'https://api._OPENCONEXT_DOMAIN_/',0,'prodaccepted','saml20-sp',NULL,NULL,NULL,NULL,'yes',0,3,'2012-06-27T13:22:35+02:00','172.18.5.1',NULL,'Entity created.','yes');
/*!40000 ALTER TABLE `janus__entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `janus__hasEntity`
--

DROP TABLE IF EXISTS `janus__hasEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `janus__hasEntity` (
  `uid` int(11) NOT NULL,
  `eid` int(11) DEFAULT NULL,
  `created` char(25) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `janus__hasEntity`
--

LOCK TABLES `janus__hasEntity` WRITE;
/*!40000 ALTER TABLE `janus__hasEntity` DISABLE KEYS */;
INSERT INTO `janus__hasEntity` VALUES (1,1,'2012-06-12T10:38:18+02:00','172.18.5.1');
INSERT INTO `janus__hasEntity` VALUES (1,2,'2012-06-12T10:38:32+02:00','172.18.5.1');
INSERT INTO `janus__hasEntity` VALUES (1,3,'2012-06-12T10:39:39+02:00','172.18.5.1');
INSERT INTO `janus__hasEntity` VALUES (1,4,'2012-06-12T11:09:48+02:00','172.18.5.1');
INSERT INTO `janus__hasEntity` VALUES (1,5,'2012-06-12T11:36:19+02:00','172.18.5.1');
INSERT INTO `janus__hasEntity` VALUES (1,6,'2012-06-12T13:07:17+02:00','172.18.5.1');
INSERT INTO `janus__hasEntity` VALUES (1,7,'2012-06-12T13:07:26+02:00','172.18.5.1');
INSERT INTO `janus__hasEntity` VALUES (1,8,'2012-06-12T13:19:21+02:00','172.18.5.1');
INSERT INTO `janus__hasEntity` VALUES (1,9,'2012-06-13T08:00:55+02:00','172.18.5.1');
INSERT INTO `janus__hasEntity` VALUES (3,10,'2012-06-19T09:43:48+02:00','172.18.5.1');
INSERT INTO `janus__hasEntity` VALUES (3,11,'2012-06-25T16:34:29+02:00','172.18.5.1');
INSERT INTO `janus__hasEntity` VALUES (3,12,'2012-06-27T13:22:35+02:00','172.18.5.1');
/*!40000 ALTER TABLE `janus__hasEntity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `janus__message`
--

DROP TABLE IF EXISTS `janus__message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `janus__message` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `subject` text NOT NULL,
  `message` text,
  `from` int(11) NOT NULL,
  `subscription` text NOT NULL,
  `read` enum('yes','no') DEFAULT 'no',
  `created` char(25) NOT NULL,
  `ip` char(15) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `janus__message`
--

LOCK TABLES `janus__message` WRITE;
/*!40000 ALTER TABLE `janus__message` DISABLE KEYS */;
INSERT INTO `janus__message` VALUES (1,0,'New entity created','User: admin<br />Permalink: <a href=\"https://serviceregistry._OPENCONEXT_DOMAIN_/simplesaml/module.php/janus/editentity.php?eid=1\">https://serviceregistry._OPENCONEXT_DOMAIN_/simplesaml/module.php/janus/editentity.php?eid=1</a><br /><br />A new entity has been created.<br />Entityid: https://engine._OPENCONEXT_DOMAIN_/authentication/sp/metadata<br />Entity type: saml20-sp',1,'ENTITYCREATE','no','2012-06-12T10:38:18+02:00','172.18.5.1');
/*!40000 ALTER TABLE `janus__message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `janus__metadata`
--

DROP TABLE IF EXISTS `janus__metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `janus__metadata` (
  `eid` int(11) NOT NULL,
  `revisionid` int(11) NOT NULL,
  `key` text NOT NULL,
  `value` text NOT NULL,
  `created` char(25) NOT NULL,
  `ip` char(15) NOT NULL,
  UNIQUE KEY `janus__metadata__eid_revisionid_key` (`eid`,`revisionid`,`key`(50))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `janus__metadata`
--

LOCK TABLES `janus__metadata` WRITE;
/*!40000 ALTER TABLE `janus__metadata` DISABLE KEYS */;
INSERT INTO `janus__metadata` VALUES (5,0,'certData','MIICjDCCAXSgAwIBAgIFAJRvxcMwDQYJKoZIhvcNAQEEBQAwLjELMAkGA1UEBhMCREUxEjAQBgNVBAoTCVNTT0NpcmNsZTELMAkGA1UEAxMCQ0EwHhcNMTEwNTE3MTk1NzIxWhcNMTYwODE3MTk1NzIxWjBLMQswCQYDVQQGEwJERTESMBAGA1UEChMJU1NPQ2lyY2xlMQwwCgYDVQQLEwNpZHAxGjAYBgNVBAMTEWlkcC5zc29jaXJjbGUuY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCbzDRkudC/aC2gMqRVVaLdPJJEwpFB4o71fR5bnNd2ocnnNzJ/W9CoCargzKx+EJ4Nm3vWmX/IZRCFvrvy9C78fP1cmt6Sa091K9luaMAyWn7oC8h/YBXH7rB42tdvWLY4Kl9VJy6UCclvasyrfKx+SR4KU6zCsM622Kvp5wW67QIDAQABoxgwFjAUBglghkgBhvhCAQEBAf8EBAMCBHAwDQYJKoZIhvcNAQEEBQADggEBAJ0heua7mFO3QszdGu1NblGaTDXtf6Txte0zpYIt+8YUcza2SaZXXvCLb9DvGxW1TJWaZpPGpHz5tLXJbdYQn7xTAnL4yQOKN6uNqUA/aTVgyyUJkWZt2giwEsWUvG0UBMSPS1tp2pV2c6/olIcbdYU6ZecUz6N24sSS7itEBC6nwCVBoHOL8u6MsfxMLDzJIPBI68UZjz3IMKTDUDv6U9DtYmXLc8iMVZBncYJn9NgNi3ghl9fYPpHcc6QbXeDUjhdzXXUqG+hB6FabGqdTdkIZwoi4gNpyr3kacKRVWJssDgakeL2MoDNqJyQ0fXC6Ze3f79CKy/WjeU5FLwDZR0Q=','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'certData2','MIICjDCCAXSgAwIBAgIFAJRvxcMwDQYJKoZIhvcNAQEEBQAwLjELMAkGA1UEBhMCREUxEjAQBgNVBAoTCVNTT0NpcmNsZTELMAkGA1UEAxMCQ0EwHhcNMTEwNTE3MTk1NzIxWhcNMTYwODE3MTk1NzIxWjBLMQswCQYDVQQGEwJERTESMBAGA1UEChMJU1NPQ2lyY2xlMQwwCgYDVQQLEwNpZHAxGjAYBgNVBAMTEWlkcC5zc29jaXJjbGUuY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCbzDRkudC/aC2gMqRVVaLdPJJEwpFB4o71fR5bnNd2ocnnNzJ/W9CoCargzKx+EJ4Nm3vWmX/IZRCFvrvy9C78fP1cmt6Sa091K9luaMAyWn7oC8h/YBXH7rB42tdvWLY4Kl9VJy6UCclvasyrfKx+SR4KU6zCsM622Kvp5wW67QIDAQABoxgwFjAUBglghkgBhvhCAQEBAf8EBAMCBHAwDQYJKoZIhvcNAQEEBQADggEBAJ0heua7mFO3QszdGu1NblGaTDXtf6Txte0zpYIt+8YUcza2SaZXXvCLb9DvGxW1TJWaZpPGpHz5tLXJbdYQn7xTAnL4yQOKN6uNqUA/aTVgyyUJkWZt2giwEsWUvG0UBMSPS1tp2pV2c6/olIcbdYU6ZecUz6N24sSS7itEBC6nwCVBoHOL8u6MsfxMLDzJIPBI68UZjz3IMKTDUDv6U9DtYmXLc8iMVZBncYJn9NgNi3ghl9fYPpHcc6QbXeDUjhdzXXUqG+hB6FabGqdTdkIZwoi4gNpyr3kacKRVWJssDgakeL2MoDNqJyQ0fXC6Ze3f79CKy/WjeU5FLwDZR0Q=','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'coin:guest_qualifier','All','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'contacts:0:contactType','technical','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'contacts:0:emailAddress','support@openconext.org','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'contacts:0:givenName','Support','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'contacts:0:surName','OpenConext','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'contacts:1:contactType','support','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'contacts:1:emailAddress','support@openconext.org','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'contacts:1:givenName','Support','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'contacts:1:surName','OpenConext.org','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'contacts:2:contactType','administrative','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'contacts:2:emailAddress','support@openconext.org','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'contacts:2:givenName','Support','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'contacts:2:surName','OpenConext','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'description:en','SSOCircle public IdP','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'description:nl','SSOCircle public IdP','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'keywords:en','public idp open','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'keywords:nl','public idp open','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'logo:0:height','73','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'logo:0:url','https://static._OPENCONEXT_DOMAIN_/media/sso_circle_logo.png','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'logo:0:width','73','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'name:en','SSOCircle IDP','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'name:nl','SSOCircle IDP','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'SingleSignOnService:0:Binding','urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'SingleSignOnService:0:Location','https://idp.ssocircle.com:443/sso/SSORedirect/metaAlias/ssocircle','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (5,0,'coin:schachomeorganization','','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'certData','MIIDYzCCAkugAwIBAgIJAMWzFQ+2+7UtMA0GCSqGSIb3DQEBBQUAMEgxFDASBgNVBAMMC0VuZ2luZUJsb2NrMREwDwYDVQQLDAhTZXJ2aWNlczEQMA4GA1UECgwHU1VSRm5ldDELMAkGA1UEBhMCTkwwHhcNMTIwNjEyMDczNjA2WhcNMjIwNjEyMDczNjA2WjBIMRQwEgYDVQQDDAtFbmdpbmVCbG9jazERMA8GA1UECwwIU2VydmljZXMxEDAOBgNVBAoMB1NVUkZuZXQxCzAJBgNVBAYTAk5MMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyl/YsyxuCsqh44RwBz8a0qy15/NbFNL635N0DW2vBVzkppJQN5SJih1aG+ES7pEleWcnvMDyAWSnKTA6uOQCNQIAPJMaJXJuYK8tdTbJWFJTAmiaJxF2NvpA4q4ToY1n1L7cLWBvM9HERLIPC6rFLgv6O05c00s/XqzymlMV9EsAXQbJRp3n5DXNOJrRjfqclK7gpy8O5cD1NWy4OuaA086ipjW6lESKPONTscdFjKDtLarX3JthjAoaK8b/0OCQcbAklaDJXpQTnZNtFZUBWj3n/fuv4jyKvVBWwx5XGACrPEnLTwkLkZZG7oav75jS9sOiDxnTEh+m42Tp17tFZQIDAQABo1AwTjAdBgNVHQ4EFgQU0S9rclotGkC2jUYpy7HTgB/DCU0wHwYDVR0jBBgwFoAU0S9rclotGkC2jUYpy7HTgB/DCU0wDAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQUFAAOCAQEAHbAa/lSpNf1ayKtq0c513vxboCTaclZ76vmN2jTFpu5qWiwboumRsn9q4Irhxt2kIjdpUHIg8hr46tYtep/tmf9UjbdDeZxZ1sxwhxzrMMjv972/mF1wJcENBZW/degXevz4fiEB//t0wyaA7bWeC2Ry13cvmg0x8fztqJgr4JjjxOSNKbBJ2PmN9ES3hf54UZZTy5iyW2E/3I59uRYyuPhDZDu2Uf0LlEeEuYmbY2AEgPvC+W2eR6axWkw6406jLh0Qf2ph0Wk+1YV94QmHBT9dFCyumnYIByWbqj2TSz2pCu5Gv8Kiik5k/xDDXMQ5W3EHUZIf6gdajhyH3kQkRg==','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'coin:guest_qualifier','All','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'contacts:0:contactType','technical','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'contacts:0:emailAddress','support@openconext.org','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'contacts:0:givenName','Support','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'contacts:0:surName','OpenConext','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'contacts:1:contactType','support','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'contacts:1:emailAddress','support@openconext.org','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'contacts:1:givenName','Support','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'contacts:1:surName','OpenConext','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'contacts:2:contactType','administrative','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'contacts:2:emailAddress','support@openconext.org','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'contacts:2:givenName','Support','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'contacts:2:surName','OpenConext','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'description:en','OpenConext SSO Proxy','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'description:nl','OpenConext SSO Proxy','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'keywords:en','openconext engine engineblock proxy sso saml2','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'keywords:nl','openconext engine engineblock proxy sso saml2','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'logo:0:height','96','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'logo:0:url','https://static._OPENCONEXT_DOMAIN_/media/conext_logo.png','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'logo:0:width','96','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'name:en','OpenConext Engine','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'name:nl','OpenConext Engine','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'SingleSignOnService:0:Binding','urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (2,0,'SingleSignOnService:0:Location','https://engine._OPENCONEXT_DOMAIN_/authentication/idp/single-sign-on','2012-06-12T12:54:18+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'AssertionConsumerService:0:Binding','urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'AssertionConsumerService:0:Location','https://engine._OPENCONEXT_DOMAIN_/authentication/sp/consume-assertion','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'contacts:0:contactType','technical','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'contacts:0:emailAddress','support@openconext.org','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'contacts:0:givenName','Support','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'contacts:0:surName','OpenConext','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'contacts:1:contactType','support','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'contacts:1:emailAddress','support@openconext.org','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'contacts:1:givenName','Support','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'contacts:1:surName','OpenConext','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'contacts:2:contactType','administrative','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'contacts:2:emailAddress','support@openconext.org','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'contacts:2:givenName','Support','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'contacts:2:surName','OpenConext','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'description:en','OpenConext SSO Proxy','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'description:nl','OpenConext SSO Proxy','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'logo:0:height','96','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'logo:0:url','https://static._OPENCONEXT_DOMAIN_/media/conext_logo.png','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'logo:0:width','96','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'name:en','OpenConext Engine','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'name:nl','OpenConext Engine','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (1,0,'redirect.sign','','2012-06-12T13:12:33+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'AssertionConsumerService:0:Binding','urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'AssertionConsumerService:0:Location','https://profile._OPENCONEXT_DOMAIN_/simplesaml/module.php/saml/sp/saml2-acs.php/default-sp','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'contacts:0:contactType','technical','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'contacts:0:emailAddress','support@openconext.org','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'contacts:0:givenName','Support','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'contacts:0:surName','OpenConext','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'contacts:1:contactType','support','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'contacts:1:emailAddress','support@openconext.org','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'contacts:1:givenName','Support','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'contacts:1:surName','OpenConext','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'contacts:2:contactType','administrative','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'contacts:2:emailAddress','support@openconext.org','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'contacts:2:givenName','Support','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'contacts:2:surName','OpenConext','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'description:en','OpenConext Profile management','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'description:nl','OpenConext Profile management','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'logo:0:height','96','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'logo:0:url','https://static._OPENCONEXT_DOMAIN_/media/conext_logo.png','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'logo:0:width','96','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'name:en','OpenConext Profile','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'name:nl','OpenConext Profile','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'redirect.sign','','2012-06-12T13:13:05+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (3,0,'NameIDFormat','urn:oasis:names:tc:SAML:2.0:nameid-format:unspecified','2012-11-28T17:27:02+01:00','192.168.56.1');
INSERT INTO `janus__metadata` VALUES (8,0,'certData','MIICizCCAfQCCQCY8tKaMc0BMjANBgkqhkiG9w0BAQUFADCBiTELMAkGA1UEBhMCTk8xEjAQBgNVBAgTCVRyb25kaGVpbTEQMA4GA1UEChMHVU5JTkVUVDEOMAwGA1UECxMFRmVpZGUxGTAXBgNVBAMTEG9wZW5pZHAuZmVpZGUubm8xKTAnBgkqhkiG9w0BCQEWGmFuZHJlYXMuc29sYmVyZ0B1bmluZXR0Lm5vMB4XDTA4MDUwODA5MjI0OFoXDTM1MDkyMzA5MjI0OFowgYkxCzAJBgNVBAYTAk5PMRIwEAYDVQQIEwlUcm9uZGhlaW0xEDAOBgNVBAoTB1VOSU5FVFQxDjAMBgNVBAsTBUZlaWRlMRkwFwYDVQQDExBvcGVuaWRwLmZlaWRlLm5vMSkwJwYJKoZIhvcNAQkBFhphbmRyZWFzLnNvbGJlcmdAdW5pbmV0dC5ubzCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAt8jLoqI1VTlxAZ2axiDIThWcAOXdu8KkVUWaN/SooO9O0QQ7KRUjSGKN9JK65AFRDXQkWPAu4HlnO4noYlFSLnYyDxI66LCr71x4lgFJjqLeAvB/GqBqFfIZ3YK/NrhnUqFwZu63nLrZjcUZxNaPjOOSRSDaXpv1kb5k3jOiSGECAwEAATANBgkqhkiG9w0BAQUFAAOBgQBQYj4cAafWaYfjBU2zi1ElwStIaJ5nyp/s/8B8SAPK2T79McMyccP3wSW13LHkmM1jwKe3ACFXBvqGQN0IbcH49hu0FKhYFM/GPDJcIHFBsiyMBXChpye9vBaTNEBCtU3KjjyG0hRT2mAQ9h+bkPmOvlEo/aH0xR68Z9hw4PF13w==','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'coin:guest_qualifier','All','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'contacts:0:contactType','technical','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'contacts:0:emailAddress','support@feide.no','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'contacts:0:givenName','Feide','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'contacts:0:surName','support','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'contacts:1:contactType','support','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'contacts:1:emailAddress','support@feide.no','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'contacts:1:givenName','Feide','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'contacts:1:surName','support','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'contacts:2:contactType','administrative','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'contacts:2:emailAddress','support@feide.no','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'contacts:2:givenName','Feide','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'contacts:2:surName','support','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'description:en','Feide Public Open IdP','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'description:nl','Feide Public Open IdP','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'keywords:en','feide norway open idp','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'keywords:nl','feide norway open idp','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'logo:0:height','240','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'logo:0:url','https://static._OPENCONEXT_DOMAIN_/media/feide_logo.jpg','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'logo:0:width','435','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'name:en','Feide Public Open IdP','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'name:nl','Feide Public Open IdP','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'SingleSignOnService:0:Binding','urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (8,0,'SingleSignOnService:0:Location','https://openidp.feide.no/simplesaml/saml2/idp/SSOService.php','2012-06-12T13:22:27+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'AssertionConsumerService:0:Binding','urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'AssertionConsumerService:0:Location','https://serviceregistry._OPENCONEXT_DOMAIN_/simplesaml/module.php/saml/sp/saml2-acs.php/default-sp','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'contacts:0:contactType','technical','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'contacts:0:emailAddress','support@openconext.org','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'contacts:0:givenName','Support','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'contacts:0:surName','OpenConext','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'contacts:1:contactType','support','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'contacts:1:emailAddress','support@openconext.org','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'contacts:1:givenName','Support','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'contacts:1:surName','OpenConext','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'contacts:2:contactType','administrative','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'contacts:2:emailAddress','support@openconext.org','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'contacts:2:givenName','Support','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'contacts:2:surName','OpenConext','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'description:en','OpenConext Service Registry, register all SPs and IdPs here','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'description:nl','OpenConext Service Registry, register all SPs and IdPs here','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'logo:0:height','96','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'logo:0:url','https://static._OPENCONEXT_DOMAIN_/media/conext_logo.png','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'logo:0:width','96','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'name:en','OpenConext ServiceRegistry','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'name:nl','OpenConext ServiceRegistry','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'redirect.sign','','2012-06-13T08:02:29+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (9,0,'NameIDFormat','urn:oasis:names:tc:SAML:2.0:nameid-format:unspecified','2012-11-28T17:27:02+01:00','192.168.56.1');
INSERT INTO `janus__metadata` VALUES (4,0,'AssertionConsumerService:0:Binding','urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'AssertionConsumerService:0:Location','https://manage._OPENCONEXT_DOMAIN_/simplesaml/module.php/saml/sp/saml2-acs.php/default-sp','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'contacts:0:contactType','technical','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'contacts:0:emailAddress','support@openconext.org','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'contacts:0:givenName','Support','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'contacts:0:surName','OpenConext','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'contacts:1:contactType','support','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'contacts:1:emailAddress','support@openconext.org','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'contacts:1:givenName','Support','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'contacts:1:surName','OpenConext','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'contacts:2:contactType','administrative','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'contacts:2:emailAddress','support@openconext.org','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'contacts:2:givenName','Support','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'contacts:2:surName','OpenConext','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'description:en','OpenConext Management application','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'description:nl','OpenConext Management application','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'logo:0:height','96','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'logo:0:url','https://static._OPENCONEXT_DOMAIN_/media/conext_logo.png','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'logo:0:width','96','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'name:en','OpenConext Manage','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'name:nl','OpenConext Manage','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'redirect.sign','','2012-06-13T09:04:30+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (4,0,'NameIDFormat','urn:oasis:names:tc:SAML:2.0:nameid-format:unspecified','2012-11-28T17:27:02+01:00','192.168.56.1');
INSERT INTO `janus__metadata` VALUES (7,0,'AssertionConsumerService:0:Binding','urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'AssertionConsumerService:0:Location','https://mujina-sp._OPENCONEXT_DOMAIN_/AssertionConsumerService','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'contacts:0:contactType','technical','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'contacts:0:emailAddress','support@openconext.org','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'contacts:0:givenName','Support','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'contacts:0:surName','OpenConext','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'contacts:1:contactType','support','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'contacts:1:emailAddress','support@openconext.org','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'contacts:1:givenName','Support','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'contacts:1:surName','OpenConext','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'contacts:2:contactType','administrative','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'contacts:2:emailAddress','support@openconext.org','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'contacts:2:givenName','Support','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'contacts:2:surName','OpenConext','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'description:en','OpenConext Mujina Test Service Provider','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'description:nl','OpenConext Mujina Test Service Provider','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'logo:0:height','96','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'logo:0:url','https://static._OPENCONEXT_DOMAIN_/media/conext_logo.png','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'logo:0:width','96','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'name:en','OpenConext Mujina SP','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'name:nl','OpenConext Mujina SP','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'redirect.sign','','2012-06-13T11:06:09+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (7,0,'NameIDFormat','urn:oasis:names:tc:SAML:2.0:nameid-format:unspecified','2012-11-28T17:27:02+01:00','192.168.56.1');
INSERT INTO `janus__metadata` VALUES (10,0,'AssertionConsumerService:0:Binding','urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'AssertionConsumerService:0:Location','https://grouper._OPENCONEXT_DOMAIN_/grouper/Shibboleth.sso/SAML2/POST','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'contacts:0:emailAddress','','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'contacts:0:givenName','','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'contacts:0:surName','','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'contacts:1:emailAddress','','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'contacts:1:givenName','','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'contacts:1:surName','','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'contacts:2:emailAddress','','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'contacts:2:givenName','','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'contacts:2:surName','','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'description:en','','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'description:nl','','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'logo:0:height','60','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'logo:0:url','https://.png','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'logo:0:width','120','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'name:en','OpenConext Grouper','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'name:nl','OpenConext Grouper','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'redirect.sign','','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'contacts:0:contactType','technical','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'contacts:1:contactType','technical','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'contacts:2:contactType','technical','2012-06-19T09:44:38+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (10,0,'NameIDFormat','urn:oasis:names:tc:SAML:2.0:nameid-format:unspecified','2012-11-28T17:27:02+01:00','192.168.56.1');
INSERT INTO `janus__metadata` VALUES (11,0,'AssertionConsumerService:0:Binding','urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'AssertionConsumerService:0:Location','https://teams._OPENCONEXT_DOMAIN_/Shibboleth.sso/SAML2/POST','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'coin:gadgetbaseurl','https://teams._OPENCONEXT_DOMAIN_/.*','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'coin:oauth:secret','mysecret','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'coin:oauth:two_legged_allowed','1','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'contacts:0:contactType','technical','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'contacts:0:emailAddress','','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'contacts:0:givenName','','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'contacts:0:surName','','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'contacts:1:emailAddress','','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'contacts:1:givenName','','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'contacts:1:surName','','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'contacts:2:emailAddress','','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'contacts:2:givenName','','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'contacts:2:surName','','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'description:en','','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'description:nl','','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'logo:0:height','60','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'logo:0:url','https://.png','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'logo:0:width','120','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'name:en','OpenConext Teams','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'name:nl','OpenConext Teams','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'redirect.sign','','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'url:en','','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'url:nl','','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'contacts:1:contactType','technical','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'contacts:2:contactType','technical','2012-06-25T16:42:04+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (11,0,'NameIDFormat','urn:oasis:names:tc:SAML:2.0:nameid-format:unspecified','2012-11-28T17:27:02+01:00','192.168.56.1');
INSERT INTO `janus__metadata` VALUES (6,0,'certData','MIICHzCCAYgCCQD7KMJ17XQa7TANBgkqhkiG9w0BAQUFADBUMQswCQYDVQQGEwJOTDEQMA4GA1UECAwHVXRyZWNodDEQMA4GA1UEBwwHVXRyZWNodDEQMA4GA1UECgwHU3VyZm5ldDEPMA0GA1UECwwGQ29uZXh0MB4XDTEyMDMwODA4NTQyNFoXDTEzMDMwODA4NTQyNFowVDELMAkGA1UEBhMCTkwxEDAOBgNVBAgMB1V0cmVjaHQxEDAOBgNVBAcMB1V0cmVjaHQxEDAOBgNVBAoMB1N1cmZuZXQxDzANBgNVBAsMBkNvbmV4dDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEA2slVe459WUDL4RXxJf5h5t5oUbPkPlFZ9lQysSoS3fnFTdCgzA6FzQzGRDcfRj0HnWBdA1YH+LxBjNcBIJ/nBc7Ssu4e4rMO3MSAV5Ouo3MaGgHqVq6dCD47f52b98df6QTAA3C+7sHqOdiQ0UDCAK0C+qP5LtTcmB8QrJhKmV8CAwEAATANBgkqhkiG9w0BAQUFAAOBgQCvPhO0aSbqX7g7IkR79IFVdJ/P7uSlYFtJ9cMxec85cYLmWL1aVgF5ZFFJqC25blyPJu2GRcSxoVwB3ae8sPCECWwqRQA4AHKIjiW5NgrAGYR++ssTOQR8mcAucEBfNaNdlJoy8GdZIhHZNkGlyHfY8kWS3OWkGzhWSsuRCLl78A==','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'coin:guest_qualifier','None','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'contacts:0:contactType','technical','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'contacts:0:emailAddress','support@openconext.org','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'contacts:0:givenName','Support','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'contacts:0:surName','OpenConext','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'contacts:1:contactType','support','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'contacts:1:emailAddress','support@openconext.org','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'contacts:1:givenName','Support','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'contacts:1:surName','OpenConext','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'contacts:2:contactType','administrative','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'contacts:2:emailAddress','support@openconext.org','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'contacts:2:givenName','Support','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'contacts:2:surName','OpenConext','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'description:en','OpenConext Mujina Test Identity Provider','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'description:nl','OpenConext Mujina Test Identity Provider','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'keywords:en','mock idp mujina','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'keywords:nl','mock idp mujina','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'logo:0:height','96','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'logo:0:url','https://static._OPENCONEXT_DOMAIN_/media/conext_logo.png','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'logo:0:width','96','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'name:en','OpenConext Mujina IDP','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'name:nl','OpenConext Mujina IDP','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'SingleSignOnService:0:Binding','urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'SingleSignOnService:0:Location','https://mujina-idp._OPENCONEXT_DOMAIN_/SingleSignOnService','2012-06-27T11:14:12+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (6,0,'NameIDFormat','urn:oasis:names:tc:SAML:2.0:nameid-format:unspecified','2012-11-28T17:27:02+01:00','192.168.56.1');
INSERT INTO `janus__metadata` VALUES (12,0,'AssertionConsumerService:0:Binding','urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'AssertionConsumerService:0:Location','https://api._OPENCONEXT_DOMAIN_/v1/assertionConsumer','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'contacts:0:emailAddress','','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'contacts:0:givenName','','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'contacts:0:surName','','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'contacts:1:emailAddress','','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'contacts:1:givenName','','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'contacts:1:surName','','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'contacts:2:emailAddress','','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'contacts:2:givenName','','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'contacts:2:surName','','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'description:en','','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'description:nl','','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'logo:0:height','60','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'logo:0:url','https://.png','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'logo:0:width','120','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'name:en','OpenConext API','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'name:nl','OpenConext API','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'redirect.sign','','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'url:en','','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'url:nl','','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'contacts:0:contactType','technical','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'contacts:1:contactType','technical','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'contacts:2:contactType','technical','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'coin:no_consent_required','1','2012-06-27T13:24:02+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'certData','_OPENCONEXT_CERT_','2012-06-12T12:51:28+02:00','172.18.5.1');
INSERT INTO `janus__metadata` VALUES (12,0,'NameIDFormat','urn:oasis:names:tc:SAML:2.0:nameid-format:unspecified','2012-11-28T17:27:02+01:00','192.168.56.1');

/*!40000 ALTER TABLE `janus__metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `janus__subscription`
--

DROP TABLE IF EXISTS `janus__subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `janus__subscription` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `subscription` text NOT NULL,
  `type` text,
  `created` char(25) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `janus__subscription`
--

LOCK TABLES `janus__subscription` WRITE;
/*!40000 ALTER TABLE `janus__subscription` DISABLE KEYS */;
INSERT INTO `janus__subscription` VALUES (1,1,'ENTITYUPDATE-1','INBOX','2012-06-12T10:38:18+02:00','172.18.5.1');
INSERT INTO `janus__subscription` VALUES (2,1,'ENTITYUPDATE-2','INBOX','2012-06-12T10:38:32+02:00','172.18.5.1');
INSERT INTO `janus__subscription` VALUES (3,1,'ENTITYUPDATE-3','INBOX','2012-06-12T10:39:39+02:00','172.18.5.1');
INSERT INTO `janus__subscription` VALUES (4,1,'ENTITYUPDATE-4','INBOX','2012-06-12T11:09:48+02:00','172.18.5.1');
INSERT INTO `janus__subscription` VALUES (5,1,'ENTITYUPDATE-5','INBOX','2012-06-12T11:36:19+02:00','172.18.5.1');
INSERT INTO `janus__subscription` VALUES (6,1,'ENTITYUPDATE-6','INBOX','2012-06-12T13:07:17+02:00','172.18.5.1');
INSERT INTO `janus__subscription` VALUES (7,1,'ENTITYUPDATE-7','INBOX','2012-06-12T13:07:26+02:00','172.18.5.1');
INSERT INTO `janus__subscription` VALUES (8,1,'ENTITYUPDATE-8','INBOX','2012-06-12T13:19:22+02:00','172.18.5.1');
INSERT INTO `janus__subscription` VALUES (9,1,'ENTITYUPDATE-9','INBOX','2012-06-13T08:00:55+02:00','172.18.5.1');
INSERT INTO `janus__subscription` VALUES (10,3,'USER-3','INBOX','2012-06-13T10:57:08+02:00','172.18.5.1');
INSERT INTO `janus__subscription` VALUES (11,3,'ENTITYUPDATE-10','INBOX','2012-06-19T09:43:49+02:00','172.18.5.1');
INSERT INTO `janus__subscription` VALUES (12,3,'ENTITYUPDATE-11','INBOX','2012-06-25T16:34:30+02:00','172.18.5.1');
INSERT INTO `janus__subscription` VALUES (13,3,'ENTITYUPDATE-12','INBOX','2012-06-27T13:22:35+02:00','172.18.5.1');
/*!40000 ALTER TABLE `janus__subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `janus__tokens`
--

DROP TABLE IF EXISTS `janus__tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `janus__tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail` varchar(320) NOT NULL,
  `token` varchar(255) NOT NULL,
  `notvalidafter` varchar(255) NOT NULL,
  `usedat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `janus__tokens`
--

LOCK TABLES `janus__tokens` WRITE;
/*!40000 ALTER TABLE `janus__tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `janus__tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `janus__user`
--

DROP TABLE IF EXISTS `janus__user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `janus__user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` text,
  `type` text,
  `email` varchar(320) DEFAULT NULL,
  `active` char(3) DEFAULT 'yes',
  `update` char(25) DEFAULT NULL,
  `created` char(25) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  `data` text,
  `secret` text,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `janus__user`
--

LOCK TABLES `janus__user` WRITE;
/*!40000 ALTER TABLE `janus__user` DISABLE KEYS */;
INSERT INTO `janus__user` VALUES (1,'admin','a:2:{i:0;s:9:\"technical\";i:1;s:5:\"admin\";}',NULL,'yes','2011-04-12T01:02:43-07:00','2011-04-12T01:02:43-07:00','192.168.212.1',NULL,NULL);
INSERT INTO `janus__user` VALUES (2,'engine','a:2:{i:0;s:9:\"technical\";i:1;s:5:\"admin\";}',NULL,'yes','2011-04-12T02:42:25-07:00','2011-04-12T02:42:25-07:00','192.168.212.1',NULL,'engineblock');
INSERT INTO `janus__user` VALUES (3,'urn:collab:person:example.com:john.doe','a:2:{i:0;s:9:\"technical\";i:1;s:5:\"admin\";}',NULL,'yes','2012-06-13T10:57:08+02:00','2012-06-13T10:57:08+02:00','172.18.5.1',NULL,NULL);
INSERT INTO `janus__user` VALUES (4,'urn:collab:person:example.com:admin','a:2:{i:0;s:9:\"technical\";i:1;s:5:\"admin\";}',NULL,'yes','2012-06-13T10:57:08+02:00','2012-06-13T10:57:08+02:00','172.18.5.1',NULL,NULL);
INSERT INTO `janus__user` VALUES (5,'urn:collab:person:example.com:regression','a:2:{i:0;s:9:\"technical\";i:1;s:5:\"admin\";}',NULL,'yes','2013-01-01T10:57:08+02:00','2013-07-01T10:57:08+02:00','172.18.5.1',NULL,NULL);
/*!40000 ALTER TABLE `janus__user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `janus__userData`
--

DROP TABLE IF EXISTS `janus__userData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `janus__userData` (
  `uid` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `update` char(25) NOT NULL,
  `created` char(25) NOT NULL,
  `ip` char(15) NOT NULL,
  UNIQUE KEY `uid` (`uid`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `janus__userData`
--

LOCK TABLES `janus__userData` WRITE;
/*!40000 ALTER TABLE `janus__userData` DISABLE KEYS */;
/*!40000 ALTER TABLE `janus__userData` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-12-05  9:47:36
