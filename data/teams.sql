-- MySQL dump 10.13  Distrib 5.1.66, for redhat-linux-gnu (i386)
--
-- Host: localhost    Database: teams
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
-- Table structure for table `external_groups`
--

DROP TABLE IF EXISTS `external_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `group_provider` varchar(255) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_groups`
--

LOCK TABLES `external_groups` WRITE;
/*!40000 ALTER TABLE `external_groups` DISABLE KEYS */;
INSERT INTO `external_groups` VALUES (10,NULL,'avans','urn:collab:group:avans.nl:nl.avans.AVANS-employee_grp','AVANS-employee_grp');
INSERT INTO `external_groups` VALUES (999999,NULL,'mock-external-group-provider','urn:collab:group:example.com:mock-external-group','mock-external-group');
/*!40000 ALTER TABLE `external_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `grouper_attr_asn_asn_attrdef_v`
--

DROP TABLE IF EXISTS `grouper_attr_asn_asn_attrdef_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_asn_attrdef_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_attr_asn_asn_attrdef_v` (
  `name_of_attr_def_assigned_to` varchar(1024),
  `action1` varchar(40),
  `action2` varchar(40),
  `attribute_def_name_name1` varchar(1024),
  `attribute_def_name_name2` varchar(1024),
  `attribute_def_name_disp_name1` varchar(1024),
  `attribute_def_name_disp_name2` varchar(1024),
  `name_of_attribute_def1` varchar(1024),
  `name_of_attribute_def2` varchar(1024),
  `attribute_assign_notes1` varchar(1024),
  `attribute_assign_notes2` varchar(1024),
  `enabled2` varchar(1),
  `enabled_time2` bigint(20),
  `disabled_time2` bigint(20),
  `id_of_attr_def_assigned_to` varchar(40),
  `attribute_assign_id1` varchar(40),
  `attribute_assign_id2` varchar(40),
  `attribute_def_name_id1` varchar(40),
  `attribute_def_name_id2` varchar(40),
  `attribute_def_id1` varchar(40),
  `attribute_def_id2` varchar(40),
  `action_id1` varchar(40),
  `action_id2` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_attr_asn_asn_efmship_v`
--

DROP TABLE IF EXISTS `grouper_attr_asn_asn_efmship_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_asn_efmship_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_attr_asn_asn_efmship_v` (
  `group_name` varchar(1024),
  `source_id` varchar(255),
  `subject_id` varchar(255),
  `action1` varchar(40),
  `action2` varchar(40),
  `attribute_def_name_name1` varchar(1024),
  `attribute_def_name_name2` varchar(1024),
  `attribute_def_name_disp_name1` varchar(1024),
  `attribute_def_name_disp_name2` varchar(1024),
  `list_name` varchar(32),
  `name_of_attribute_def1` varchar(1024),
  `name_of_attribute_def2` varchar(1024),
  `attribute_assign_notes1` varchar(1024),
  `attribute_assign_notes2` varchar(1024),
  `enabled2` varchar(1),
  `enabled_time2` bigint(20),
  `disabled_time2` bigint(20),
  `group_id` varchar(40),
  `member_id` varchar(40),
  `attribute_assign_id1` varchar(40),
  `attribute_assign_id2` varchar(40),
  `attribute_def_name_id1` varchar(40),
  `attribute_def_name_id2` varchar(40),
  `attribute_def_id1` varchar(40),
  `attribute_def_id2` varchar(40),
  `action_id1` varchar(40),
  `action_id2` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_attr_asn_asn_group_v`
--

DROP TABLE IF EXISTS `grouper_attr_asn_asn_group_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_asn_group_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_attr_asn_asn_group_v` (
  `group_name` varchar(1024),
  `action1` varchar(40),
  `action2` varchar(40),
  `attribute_def_name_name1` varchar(1024),
  `attribute_def_name_name2` varchar(1024),
  `group_display_name` varchar(1024),
  `attribute_def_name_disp_name1` varchar(1024),
  `attribute_def_name_disp_name2` varchar(1024),
  `name_of_attribute_def1` varchar(1024),
  `name_of_attribute_def2` varchar(1024),
  `attribute_assign_notes1` varchar(1024),
  `attribute_assign_notes2` varchar(1024),
  `enabled2` varchar(1),
  `enabled_time2` bigint(20),
  `disabled_time2` bigint(20),
  `group_id` varchar(40),
  `attribute_assign_id1` varchar(40),
  `attribute_assign_id2` varchar(40),
  `attribute_def_name_id1` varchar(40),
  `attribute_def_name_id2` varchar(40),
  `attribute_def_id1` varchar(40),
  `attribute_def_id2` varchar(40),
  `action_id1` varchar(40),
  `action_id2` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_attr_asn_asn_member_v`
--

DROP TABLE IF EXISTS `grouper_attr_asn_asn_member_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_asn_member_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_attr_asn_asn_member_v` (
  `source_id` varchar(255),
  `subject_id` varchar(255),
  `action1` varchar(40),
  `action2` varchar(40),
  `attribute_def_name_name1` varchar(1024),
  `attribute_def_name_name2` varchar(1024),
  `attribute_def_name_disp_name1` varchar(1024),
  `attribute_def_name_disp_name2` varchar(1024),
  `name_of_attribute_def1` varchar(1024),
  `name_of_attribute_def2` varchar(1024),
  `attribute_assign_notes1` varchar(1024),
  `attribute_assign_notes2` varchar(1024),
  `enabled2` varchar(1),
  `enabled_time2` bigint(20),
  `disabled_time2` bigint(20),
  `member_id` varchar(40),
  `attribute_assign_id1` varchar(40),
  `attribute_assign_id2` varchar(40),
  `attribute_def_name_id1` varchar(40),
  `attribute_def_name_id2` varchar(40),
  `attribute_def_id1` varchar(40),
  `attribute_def_id2` varchar(40),
  `action_id1` varchar(40),
  `action_id2` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_attr_asn_asn_mship_v`
--

DROP TABLE IF EXISTS `grouper_attr_asn_asn_mship_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_asn_mship_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_attr_asn_asn_mship_v` (
  `group_name` varchar(1024),
  `source_id` varchar(255),
  `subject_id` varchar(255),
  `action1` varchar(40),
  `action2` varchar(40),
  `attribute_def_name_name1` varchar(1024),
  `attribute_def_name_name2` varchar(1024),
  `attribute_def_name_disp_name1` varchar(1024),
  `attribute_def_name_disp_name2` varchar(1024),
  `list_name` varchar(32),
  `name_of_attribute_def1` varchar(1024),
  `name_of_attribute_def2` varchar(1024),
  `attribute_assign_notes1` varchar(1024),
  `attribute_assign_notes2` varchar(1024),
  `enabled2` varchar(1),
  `enabled_time2` bigint(20),
  `disabled_time2` bigint(20),
  `group_id` varchar(40),
  `membership_id` varchar(40),
  `member_id` varchar(40),
  `attribute_assign_id1` varchar(40),
  `attribute_assign_id2` varchar(40),
  `attribute_def_name_id1` varchar(40),
  `attribute_def_name_id2` varchar(40),
  `attribute_def_id1` varchar(40),
  `attribute_def_id2` varchar(40),
  `action_id1` varchar(40),
  `action_id2` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_attr_asn_asn_stem_v`
--

DROP TABLE IF EXISTS `grouper_attr_asn_asn_stem_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_asn_stem_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_attr_asn_asn_stem_v` (
  `stem_name` varchar(255),
  `action1` varchar(40),
  `action2` varchar(40),
  `attribute_def_name_name1` varchar(1024),
  `attribute_def_name_name2` varchar(1024),
  `stem_display_name` varchar(255),
  `attribute_def_name_disp_name1` varchar(1024),
  `attribute_def_name_disp_name2` varchar(1024),
  `name_of_attribute_def1` varchar(1024),
  `name_of_attribute_def2` varchar(1024),
  `attribute_assign_notes1` varchar(1024),
  `attribute_assign_notes2` varchar(1024),
  `enabled2` varchar(1),
  `enabled_time2` bigint(20),
  `disabled_time2` bigint(20),
  `stem_id` varchar(40),
  `attribute_assign_id1` varchar(40),
  `attribute_assign_id2` varchar(40),
  `attribute_def_name_id1` varchar(40),
  `attribute_def_name_id2` varchar(40),
  `attribute_def_id1` varchar(40),
  `attribute_def_id2` varchar(40),
  `action_id1` varchar(40),
  `action_id2` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_attr_asn_attrdef_v`
--

DROP TABLE IF EXISTS `grouper_attr_asn_attrdef_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_attrdef_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_attr_asn_attrdef_v` (
  `name_of_attr_def_assigned_to` varchar(1024),
  `action` varchar(40),
  `attribute_def_name_name` varchar(1024),
  `attribute_def_name_disp_name` varchar(1024),
  `name_of_attribute_def_assigned` varchar(1024),
  `attribute_assign_notes` varchar(1024),
  `enabled` varchar(1),
  `enabled_time` bigint(20),
  `disabled_time` bigint(20),
  `id_of_attr_def_assigned_to` varchar(40),
  `attribute_assign_id` varchar(40),
  `attribute_def_name_id` varchar(40),
  `attribute_def_id` varchar(40),
  `action_id` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_attr_asn_efmship_v`
--

DROP TABLE IF EXISTS `grouper_attr_asn_efmship_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_efmship_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_attr_asn_efmship_v` (
  `group_name` varchar(1024),
  `subject_source_id` varchar(255),
  `subject_id` varchar(255),
  `action` varchar(40),
  `attribute_def_name_name` varchar(1024),
  `group_display_name` varchar(1024),
  `attribute_def_name_disp_name` varchar(1024),
  `name_of_attribute_def` varchar(1024),
  `attribute_assign_notes` varchar(1024),
  `list_name` varchar(32),
  `attribute_assign_delegatable` varchar(15),
  `enabled` varchar(1),
  `enabled_time` bigint(20),
  `disabled_time` bigint(20),
  `group_id` varchar(40),
  `attribute_assign_id` varchar(40),
  `attribute_def_name_id` varchar(40),
  `attribute_def_id` varchar(40),
  `member_id` varchar(40),
  `action_id` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_attr_asn_group_v`
--

DROP TABLE IF EXISTS `grouper_attr_asn_group_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_group_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_attr_asn_group_v` (
  `group_name` varchar(1024),
  `action` varchar(40),
  `attribute_def_name_name` varchar(1024),
  `group_display_name` varchar(1024),
  `attribute_def_name_disp_name` varchar(1024),
  `name_of_attribute_def` varchar(1024),
  `attribute_assign_notes` varchar(1024),
  `attribute_assign_delegatable` varchar(15),
  `enabled` varchar(1),
  `enabled_time` bigint(20),
  `disabled_time` bigint(20),
  `group_id` varchar(40),
  `attribute_assign_id` varchar(40),
  `attribute_def_name_id` varchar(40),
  `attribute_def_id` varchar(40),
  `action_id` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_attr_asn_member_v`
--

DROP TABLE IF EXISTS `grouper_attr_asn_member_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_member_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_attr_asn_member_v` (
  `source_id` varchar(255),
  `subject_id` varchar(255),
  `action` varchar(40),
  `attribute_def_name_name` varchar(1024),
  `attribute_def_name_disp_name` varchar(1024),
  `name_of_attribute_def` varchar(1024),
  `attribute_assign_notes` varchar(1024),
  `attribute_assign_delegatable` varchar(15),
  `enabled` varchar(1),
  `enabled_time` bigint(20),
  `disabled_time` bigint(20),
  `member_id` varchar(40),
  `attribute_assign_id` varchar(40),
  `attribute_def_name_id` varchar(40),
  `attribute_def_id` varchar(40),
  `action_id` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_attr_asn_mship_v`
--

DROP TABLE IF EXISTS `grouper_attr_asn_mship_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_mship_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_attr_asn_mship_v` (
  `group_name` varchar(1024),
  `source_id` varchar(255),
  `subject_id` varchar(255),
  `action` varchar(40),
  `attribute_def_name_name` varchar(1024),
  `attribute_def_name_disp_name` varchar(1024),
  `list_name` varchar(32),
  `name_of_attribute_def` varchar(1024),
  `attribute_assign_notes` varchar(1024),
  `attribute_assign_delegatable` varchar(15),
  `enabled` varchar(1),
  `enabled_time` bigint(20),
  `disabled_time` bigint(20),
  `group_id` varchar(40),
  `membership_id` varchar(40),
  `member_id` varchar(40),
  `attribute_assign_id` varchar(40),
  `attribute_def_name_id` varchar(40),
  `attribute_def_id` varchar(40),
  `action_id` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_attr_asn_stem_v`
--

DROP TABLE IF EXISTS `grouper_attr_asn_stem_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_stem_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_attr_asn_stem_v` (
  `stem_name` varchar(255),
  `action` varchar(40),
  `attribute_def_name_name` varchar(1024),
  `stem_display_name` varchar(255),
  `attribute_def_name_disp_name` varchar(1024),
  `name_of_attribute_def` varchar(1024),
  `attribute_assign_notes` varchar(1024),
  `enabled` varchar(1),
  `enabled_time` bigint(20),
  `disabled_time` bigint(20),
  `stem_id` varchar(40),
  `attribute_assign_id` varchar(40),
  `attribute_def_name_id` varchar(40),
  `attribute_def_id` varchar(40),
  `action_id` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grouper_attr_assign_action`
--

DROP TABLE IF EXISTS `grouper_attr_assign_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_attr_assign_action` (
  `attribute_def_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `name` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attr_assn_act_def_id_idx` (`attribute_def_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_attr_assign_action`
--

LOCK TABLES `grouper_attr_assign_action` WRITE;
/*!40000 ALTER TABLE `grouper_attr_assign_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouper_attr_assign_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_attr_assign_action_set`
--

DROP TABLE IF EXISTS `grouper_attr_assign_action_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_attr_assign_action_set` (
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `depth` bigint(20) NOT NULL,
  `if_has_attr_assn_action_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `then_has_attr_assn_action_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `parent_attr_assn_action_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `type` varchar(32) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `action_set_unq_idx` (`parent_attr_assn_action_id`,`if_has_attr_assn_action_id`,`then_has_attr_assn_action_id`),
  KEY `action_set_ifhas_idx` (`if_has_attr_assn_action_id`),
  KEY `action_set_then_idx` (`then_has_attr_assn_action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_attr_assign_action_set`
--

LOCK TABLES `grouper_attr_assign_action_set` WRITE;
/*!40000 ALTER TABLE `grouper_attr_assign_action_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouper_attr_assign_action_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `grouper_attr_assn_action_set_v`
--

DROP TABLE IF EXISTS `grouper_attr_assn_action_set_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_assn_action_set_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_attr_assn_action_set_v` (
  `if_has_attr_assn_action_name` varchar(40),
  `then_has_attr_assn_action_name` varchar(40),
  `depth` bigint(20),
  `type` varchar(32),
  `parent_if_has_name` varchar(40),
  `parent_then_has_name` varchar(40),
  `id` varchar(40),
  `if_has_attr_assn_action_id` varchar(40),
  `then_has_attr_assn_action_id` varchar(40),
  `parent_attr_assn_action_id` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_attr_def_name_set_v`
--

DROP TABLE IF EXISTS `grouper_attr_def_name_set_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_def_name_set_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_attr_def_name_set_v` (
  `if_has_attr_def_name_name` varchar(1024),
  `then_has_attr_def_name_name` varchar(1024),
  `depth` bigint(20),
  `type` varchar(32),
  `parent_if_has_name` varchar(1024),
  `parent_then_has_name` varchar(1024),
  `id` varchar(40),
  `if_has_attr_def_name_id` varchar(40),
  `then_has_attr_def_name_id` varchar(40),
  `parent_attr_def_name_set_id` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_attr_def_priv_v`
--

DROP TABLE IF EXISTS `grouper_attr_def_priv_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_def_priv_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_attr_def_priv_v` (
  `subject_id` varchar(255),
  `subject_source_id` varchar(255),
  `field_name` varchar(32),
  `attribute_def_name` varchar(1024),
  `attribute_def_description` varchar(1024),
  `attribute_def_type` varchar(32),
  `attribute_def_stem_id` varchar(40),
  `attribute_def_id` varchar(40),
  `member_id` varchar(40),
  `field_id` varchar(40),
  `immediate_membership_id` varchar(40),
  `membership_id` varchar(81)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grouper_attribute_assign`
--

DROP TABLE IF EXISTS `grouper_attribute_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_attribute_assign` (
  `attribute_assign_action_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `attribute_def_name_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `disabled_time` bigint(20) DEFAULT NULL,
  `enabled` varchar(1) CHARACTER SET latin1 NOT NULL DEFAULT 'T',
  `enabled_time` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `notes` varchar(1024) CHARACTER SET latin1 DEFAULT NULL,
  `attribute_assign_delegatable` varchar(15) CHARACTER SET latin1 NOT NULL,
  `attribute_assign_type` varchar(15) CHARACTER SET latin1 NOT NULL,
  `owner_attribute_assign_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `owner_attribute_def_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `owner_group_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `owner_member_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `owner_membership_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `owner_stem_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_asgn_attr_name_idx` (`attribute_def_name_id`,`attribute_assign_action_id`),
  KEY `attr_asgn_own_asgn_idx` (`owner_attribute_assign_id`,`attribute_assign_action_id`),
  KEY `attr_asgn_own_def_idx` (`owner_attribute_def_id`,`attribute_assign_action_id`),
  KEY `attr_asgn_own_group_idx` (`owner_group_id`,`attribute_assign_action_id`),
  KEY `attr_asgn_own_mem_idx` (`owner_member_id`,`attribute_assign_action_id`),
  KEY `attr_asgn_own_mship_idx` (`owner_membership_id`,`attribute_assign_action_id`),
  KEY `attr_asgn_own_stem_idx` (`owner_stem_id`,`attribute_assign_action_id`),
  KEY `fk_attr_assign_action_id` (`attribute_assign_action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_attribute_assign`
--

LOCK TABLES `grouper_attribute_assign` WRITE;
/*!40000 ALTER TABLE `grouper_attribute_assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouper_attribute_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_attribute_assign_value`
--

DROP TABLE IF EXISTS `grouper_attribute_assign_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_attribute_assign_value` (
  `attribute_assign_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `value_integer` bigint(20) DEFAULT NULL,
  `value_floating` double DEFAULT NULL,
  `value_string` text CHARACTER SET latin1,
  `value_member_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_val_assign_idx` (`attribute_assign_id`),
  KEY `attribute_val_integer_idx` (`value_integer`),
  KEY `attribute_val_member_id_idx` (`value_member_id`),
  KEY `attribute_val_string_idx` (`value_string`(255))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_attribute_assign_value`
--

LOCK TABLES `grouper_attribute_assign_value` WRITE;
/*!40000 ALTER TABLE `grouper_attribute_assign_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouper_attribute_assign_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_attribute_def`
--

DROP TABLE IF EXISTS `grouper_attribute_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_attribute_def` (
  `attribute_def_public` varchar(1) CHARACTER SET latin1 NOT NULL DEFAULT 'F',
  `attribute_def_type` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT 'attr',
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `creator_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `description` varchar(1024) CHARACTER SET latin1 DEFAULT NULL,
  `extension` varchar(255) CHARACTER SET latin1 NOT NULL,
  `name` varchar(1024) CHARACTER SET latin1 NOT NULL,
  `multi_assignable` varchar(1) CHARACTER SET latin1 NOT NULL DEFAULT 'F',
  `multi_valued` varchar(1) CHARACTER SET latin1 NOT NULL DEFAULT 'F',
  `stem_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `value_type` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT 'marker',
  `assign_to_attribute_def` varchar(1) CHARACTER SET latin1 NOT NULL DEFAULT 'F',
  `assign_to_attribute_def_assn` varchar(1) CHARACTER SET latin1 NOT NULL DEFAULT 'F',
  `assign_to_eff_membership` varchar(1) CHARACTER SET latin1 NOT NULL DEFAULT 'F',
  `assign_to_eff_membership_assn` varchar(1) CHARACTER SET latin1 NOT NULL DEFAULT 'F',
  `assign_to_group` varchar(1) CHARACTER SET latin1 NOT NULL DEFAULT 'F',
  `assign_to_group_assn` varchar(1) CHARACTER SET latin1 NOT NULL DEFAULT 'F',
  `assign_to_imm_membership` varchar(1) CHARACTER SET latin1 NOT NULL DEFAULT 'F',
  `assign_to_imm_membership_assn` varchar(1) CHARACTER SET latin1 NOT NULL DEFAULT 'F',
  `assign_to_member` varchar(1) CHARACTER SET latin1 NOT NULL DEFAULT 'F',
  `assign_to_member_assn` varchar(1) CHARACTER SET latin1 NOT NULL DEFAULT 'F',
  `assign_to_stem` varchar(1) CHARACTER SET latin1 NOT NULL DEFAULT 'F',
  `assign_to_stem_assn` varchar(1) CHARACTER SET latin1 NOT NULL DEFAULT 'F',
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_def_name_idx` (`name`(255)),
  KEY `fk_attr_def_stem` (`stem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_attribute_def`
--

LOCK TABLES `grouper_attribute_def` WRITE;
/*!40000 ALTER TABLE `grouper_attribute_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouper_attribute_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_attribute_def_name`
--

DROP TABLE IF EXISTS `grouper_attribute_def_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_attribute_def_name` (
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `description` varchar(1024) CHARACTER SET latin1 DEFAULT NULL,
  `extension` varchar(255) CHARACTER SET latin1 NOT NULL,
  `name` varchar(1024) CHARACTER SET latin1 NOT NULL,
  `stem_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `attribute_def_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `display_extension` varchar(128) CHARACTER SET latin1 NOT NULL,
  `display_name` varchar(1024) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_def_name_name_idx` (`name`(255)),
  KEY `fk_attr_def_name_stem` (`stem_id`),
  KEY `fk_attr_def_name_def_id` (`attribute_def_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_attribute_def_name`
--

LOCK TABLES `grouper_attribute_def_name` WRITE;
/*!40000 ALTER TABLE `grouper_attribute_def_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouper_attribute_def_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_attribute_def_name_set`
--

DROP TABLE IF EXISTS `grouper_attribute_def_name_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_attribute_def_name_set` (
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `depth` bigint(20) NOT NULL,
  `if_has_attribute_def_name_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `then_has_attribute_def_name_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `parent_attr_def_name_set_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `type` varchar(32) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attr_def_name_set_unq_idx` (`parent_attr_def_name_set_id`,`if_has_attribute_def_name_id`,`then_has_attribute_def_name_id`),
  KEY `attr_def_name_set_ifhas_idx` (`if_has_attribute_def_name_id`),
  KEY `attr_def_name_set_then_idx` (`then_has_attribute_def_name_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_attribute_def_name_set`
--

LOCK TABLES `grouper_attribute_def_name_set` WRITE;
/*!40000 ALTER TABLE `grouper_attribute_def_name_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouper_attribute_def_name_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_attribute_def_scope`
--

DROP TABLE IF EXISTS `grouper_attribute_def_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_attribute_def_scope` (
  `attribute_def_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `attribute_def_scope_type` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `scope_string` varchar(1024) CHARACTER SET latin1 DEFAULT NULL,
  `scope_string2` varchar(1024) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_def_scope_atdef_idx` (`attribute_def_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_attribute_def_scope`
--

LOCK TABLES `grouper_attribute_def_scope` WRITE;
/*!40000 ALTER TABLE `grouper_attribute_def_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouper_attribute_def_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_attributes`
--

DROP TABLE IF EXISTS `grouper_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_attributes` (
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `group_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `field_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `value` varchar(1024) CHARACTER SET latin1 NOT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_uniq_idx` (`group_id`,`field_id`),
  KEY `attribute_field_value_idx` (`field_id`,`value`(960)),
  KEY `attribute_group_idx` (`group_id`),
  KEY `attribute_context_idx` (`context_id`),
  KEY `attribute_value_idx` (`value`(255))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_attributes`
--

LOCK TABLES `grouper_attributes` WRITE;
/*!40000 ALTER TABLE `grouper_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouper_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `grouper_attributes_v`
--

DROP TABLE IF EXISTS `grouper_attributes_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_attributes_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_attributes_v` (
  `GROUP_NAME` varchar(1024),
  `GROUP_DISPLAY_NAME` varchar(1024),
  `ATTRIBUTE_NAME` varchar(32),
  `ATTRIBUTE_VALUE` varchar(1024),
  `GROUP_TYPE_NAME` varchar(255),
  `FIELD_ID` varchar(40),
  `ATTRIBUTE_ID` varchar(40),
  `GROUP_ID` varchar(40),
  `GROUPTYPE_UUID` varchar(40),
  `CONTEXT_ID` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grouper_audit_entry`
--

DROP TABLE IF EXISTS `grouper_audit_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_audit_entry` (
  `act_as_member_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `audit_type_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `description` text CHARACTER SET latin1,
  `env_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `grouper_engine` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `grouper_version` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `int01` bigint(20) DEFAULT NULL,
  `int02` bigint(20) DEFAULT NULL,
  `int03` bigint(20) DEFAULT NULL,
  `int04` bigint(20) DEFAULT NULL,
  `int05` bigint(20) DEFAULT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `logged_in_member_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `server_host` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `string01` text CHARACTER SET latin1,
  `string02` text CHARACTER SET latin1,
  `string03` text CHARACTER SET latin1,
  `string04` text CHARACTER SET latin1,
  `string05` text CHARACTER SET latin1,
  `string06` text CHARACTER SET latin1,
  `string07` text CHARACTER SET latin1,
  `string08` text CHARACTER SET latin1,
  `user_ip_address` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `duration_microseconds` bigint(20) DEFAULT NULL,
  `query_count` int(11) DEFAULT NULL,
  `server_user_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_entry_act_as_idx` (`act_as_member_id`),
  KEY `audit_entry_type_idx` (`audit_type_id`),
  KEY `audit_entry_context_idx` (`context_id`),
  KEY `audit_entry_logged_in_idx` (`logged_in_member_id`),
  KEY `audit_entry_string01_idx` (`string01`(255)),
  KEY `audit_entry_string02_idx` (`string02`(255)),
  KEY `audit_entry_string03_idx` (`string03`(255)),
  KEY `audit_entry_string04_idx` (`string04`(255)),
  KEY `audit_entry_string05_idx` (`string05`(255)),
  KEY `audit_entry_string06_idx` (`string06`(255)),
  KEY `audit_entry_string07_idx` (`string07`(255)),
  KEY `audit_entry_string08_idx` (`string08`(255))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_audit_entry`
--

LOCK TABLES `grouper_audit_entry` WRITE;
/*!40000 ALTER TABLE `grouper_audit_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouper_audit_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `grouper_audit_entry_v`
--

DROP TABLE IF EXISTS `grouper_audit_entry_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_audit_entry_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_audit_entry_v` (
  `created_on` bigint(20),
  `audit_category` varchar(50),
  `action_name` varchar(50),
  `logged_in_subject_id` varchar(255),
  `act_as_subject_id` varchar(255),
  `label_string01` varchar(50),
  `string01` text,
  `label_string02` varchar(50),
  `string02` text,
  `label_string03` varchar(50),
  `string03` text,
  `label_string04` varchar(50),
  `string04` text,
  `label_string05` varchar(50),
  `string05` text,
  `label_string06` varchar(50),
  `string06` text,
  `label_string07` varchar(50),
  `string07` text,
  `label_string08` varchar(50),
  `string08` text,
  `label_int01` varchar(50),
  `int01` bigint(20),
  `label_int02` varchar(50),
  `int02` bigint(20),
  `label_int03` varchar(50),
  `int03` bigint(20),
  `label_int04` varchar(50),
  `int04` bigint(20),
  `label_int05` varchar(50),
  `int05` bigint(20),
  `context_id` varchar(40),
  `grouper_engine` varchar(50),
  `description` text,
  `logged_in_source_id` varchar(255),
  `act_as_source_id` varchar(255),
  `logged_in_member_id` varchar(40),
  `act_as_member_id` varchar(40),
  `audit_type_id` varchar(40),
  `user_ip_address` varchar(50),
  `server_host` varchar(50),
  `audit_entry_last_updated` bigint(20),
  `audit_entry_id` varchar(40),
  `grouper_version` varchar(20),
  `env_name` varchar(50)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grouper_audit_type`
--

DROP TABLE IF EXISTS `grouper_audit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_audit_type` (
  `action_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `audit_category` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `label_int01` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_int02` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_int03` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_int04` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_int05` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_string01` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_string02` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_string03` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_string04` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_string05` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_string06` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_string07` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_string08` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `audit_type_category_type_idx` (`audit_category`,`action_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_audit_type`
--

LOCK TABLES `grouper_audit_type` WRITE;
/*!40000 ALTER TABLE `grouper_audit_type` DISABLE KEYS */;
INSERT INTO `grouper_audit_type` VALUES ('addGroupType','groupType','a7e4617e90be4a2e858943bb5bea0c25',1299235316387,0,'a7e4617e90be4a2e858943bb5bea0c25',NULL,NULL,NULL,NULL,NULL,'id','name',NULL,NULL,NULL,NULL,NULL,NULL,1299235316387);
INSERT INTO `grouper_audit_type` VALUES ('updateGroupType','groupType','949f6630da134391a3b617748cc67b56',1299235316394,0,'949f6630da134391a3b617748cc67b56',NULL,NULL,NULL,NULL,NULL,'id','name',NULL,NULL,NULL,NULL,NULL,NULL,1299235316394);
INSERT INTO `grouper_audit_type` VALUES ('deleteGroupType','groupType','147e38681d4e49efa3c7405a4cd166b2',1299235316399,0,'147e38681d4e49efa3c7405a4cd166b2',NULL,NULL,NULL,NULL,NULL,'id','name',NULL,NULL,NULL,NULL,NULL,NULL,1299235316399);
INSERT INTO `grouper_audit_type` VALUES ('addGroupField','groupField','f540b5e1742a411a8d20cd9576270cb3',1299235316406,0,'f540b5e1742a411a8d20cd9576270cb3',NULL,NULL,NULL,NULL,NULL,'id','name','groupTypeId','groupTypeName','type',NULL,NULL,NULL,1299235316406);
INSERT INTO `grouper_audit_type` VALUES ('updateGroupField','groupField','8a5d29930ff540abac2d7c2174996f94',1299235316413,0,'8a5d29930ff540abac2d7c2174996f94',NULL,NULL,NULL,NULL,NULL,'id','name','groupTypeId','groupTypeName','type',NULL,NULL,NULL,1299235316413);
INSERT INTO `grouper_audit_type` VALUES ('deleteGroupField','groupField','0d101cdb26ad47fcaa5c5c4582d9bc4f',1299235316420,0,'0d101cdb26ad47fcaa5c5c4582d9bc4f',NULL,NULL,NULL,NULL,NULL,'id','name','groupTypeId','groupTypeName','type',NULL,NULL,NULL,1299235316420);
INSERT INTO `grouper_audit_type` VALUES ('addGroupAttribute','groupAttribute','303c200b8d834f3caca7bf8077879b6a',1299235316443,0,'303c200b8d834f3caca7bf8077879b6a',NULL,NULL,NULL,NULL,NULL,'id','groupId','groupName','fieldId','fieldName','value',NULL,NULL,1299235316443);
INSERT INTO `grouper_audit_type` VALUES ('updateGroupAttribute','groupAttribute','012e545e4b7e45b79ea7265f78868bea',1299235316447,0,'012e545e4b7e45b79ea7265f78868bea',NULL,NULL,NULL,NULL,NULL,'id','groupId','groupName','fieldId','fieldName','value','oldValue',NULL,1299235316447);
INSERT INTO `grouper_audit_type` VALUES ('deleteGroupAttribute','groupAttribute','19221cd8a08843cdb797dfb80b122a63',1299235316454,0,'19221cd8a08843cdb797dfb80b122a63',NULL,NULL,NULL,NULL,NULL,'id','groupId','groupName','fieldId','fieldName','value',NULL,NULL,1299235316454);
INSERT INTO `grouper_audit_type` VALUES ('addGroupComposite','groupComposite','620de9f7f227419eaae75f1d7000a509',1299235316461,0,'620de9f7f227419eaae75f1d7000a509',NULL,NULL,NULL,NULL,NULL,'id','ownerId','ownerName','leftFactorId','leftFactorName','rightFactorId','rightFactorName','type',1299235316461);
INSERT INTO `grouper_audit_type` VALUES ('updateGroupComposite','groupComposite','b2e7b746d65e4fdfad7188d17623166f',1299235316468,0,'b2e7b746d65e4fdfad7188d17623166f',NULL,NULL,NULL,NULL,NULL,'id','ownerId','ownerName','leftFactorId','leftFactorName','rightFactorId','rightFactorName','type',1299235316468);
INSERT INTO `grouper_audit_type` VALUES ('deleteGroupComposite','groupComposite','8648b1cafd2044e0837d580177d86cb3',1299235316473,0,'8648b1cafd2044e0837d580177d86cb3',NULL,NULL,NULL,NULL,NULL,'id','ownerId','ownerName','leftFactorId','leftFactorName','rightFactorId','rightFactorName','type',1299235316473);
INSERT INTO `grouper_audit_type` VALUES ('assignGroupType','groupTypeAssignment','b27660c896ad47de8d60b1086956fbf0',1299235316479,0,'b27660c896ad47de8d60b1086956fbf0',NULL,NULL,NULL,NULL,NULL,'id','groupId','groupName','typeId','typeName',NULL,NULL,NULL,1299235316479);
INSERT INTO `grouper_audit_type` VALUES ('unassignGroupType','groupTypeAssignment','0a7929b227b34a21a970f0bde2453b1f',1299235316486,0,'0a7929b227b34a21a970f0bde2453b1f',NULL,NULL,NULL,NULL,NULL,'id','groupId','groupName','typeId','typeName',NULL,NULL,NULL,1299235316486);
INSERT INTO `grouper_audit_type` VALUES ('addGroupMembership','membership','cbb5b8d806624bba93143f7a392cad97',1299235316491,0,'cbb5b8d806624bba93143f7a392cad97',NULL,NULL,NULL,NULL,NULL,'id','fieldId','fieldName','memberId','membershipType','groupId','groupName',NULL,1299235316491);
INSERT INTO `grouper_audit_type` VALUES ('updateGroupMembership','membership','692f87a13f274f78a4604a42eb8a7171',1299235316495,0,'692f87a13f274f78a4604a42eb8a7171',NULL,NULL,NULL,NULL,NULL,'id','fieldId','fieldName','memberId','membershipType','groupId','groupName',NULL,1299235316495);
INSERT INTO `grouper_audit_type` VALUES ('deleteGroupMembership','membership','731e32afc9b049b684b9b907a5b9f085',1299235316522,0,'731e32afc9b049b684b9b907a5b9f085',NULL,NULL,NULL,NULL,NULL,'id','fieldId','fieldName','memberId','membershipType','groupId','groupName',NULL,1299235316522);
INSERT INTO `grouper_audit_type` VALUES ('addGroupPrivilege','privilege','1c8cf13cc94c4ca3a95843b762c164ef',1299235316527,0,'1c8cf13cc94c4ca3a95843b762c164ef',NULL,NULL,NULL,NULL,NULL,'privilegeName','memberId','privilegeType','groupId','groupName',NULL,NULL,NULL,1299235316527);
INSERT INTO `grouper_audit_type` VALUES ('updateGroupPrivilege','privilege','d33517123b394dcfb7c772570ce76d3d',1299235316531,0,'d33517123b394dcfb7c772570ce76d3d',NULL,NULL,NULL,NULL,NULL,'privilegeName','memberId','privilegeType','groupId','groupName',NULL,NULL,NULL,1299235316531);
INSERT INTO `grouper_audit_type` VALUES ('deleteGroupPrivilege','privilege','c86f7117fadb41cbaa2309b7bc15a29d',1299235316537,0,'c86f7117fadb41cbaa2309b7bc15a29d',NULL,NULL,NULL,NULL,NULL,'privilegeName','memberId','privilegeType','groupId','groupName',NULL,NULL,NULL,1299235316537);
INSERT INTO `grouper_audit_type` VALUES ('addStemPrivilege','privilege','69c43b8232db4428a116e60ad87bac3e',1299235316540,0,'69c43b8232db4428a116e60ad87bac3e',NULL,NULL,NULL,NULL,NULL,'privilegeName','memberId','privilegeType','stemId','stemName',NULL,NULL,NULL,1299235316540);
INSERT INTO `grouper_audit_type` VALUES ('updateStemPrivilege','privilege','9c3d1fc3c92343c28d858809546ec39a',1299235316545,0,'9c3d1fc3c92343c28d858809546ec39a',NULL,NULL,NULL,NULL,NULL,'privilegeName','memberId','privilegeType','stemId','stemName',NULL,NULL,NULL,1299235316545);
INSERT INTO `grouper_audit_type` VALUES ('deleteStemPrivilege','privilege','9bea3d46ad224749bbf754d4bc515361',1299235316550,0,'9bea3d46ad224749bbf754d4bc515361',NULL,NULL,NULL,NULL,NULL,'privilegeName','memberId','privilegeType','stemId','stemName',NULL,NULL,NULL,1299235316550);
INSERT INTO `grouper_audit_type` VALUES ('addAttributeDef','attributeDef','16447f885bd74506ab9c76b3021dea6b',1299235316554,0,'16447f885bd74506ab9c76b3021dea6b',NULL,NULL,NULL,NULL,NULL,'id','name','description','parentStemId',NULL,NULL,NULL,NULL,1299235316554);
INSERT INTO `grouper_audit_type` VALUES ('addAttributeDefName','attributeDefName','30b63368a2d7462088cdc2df97593a2f',1299235316557,0,'30b63368a2d7462088cdc2df97593a2f',NULL,NULL,NULL,NULL,NULL,'id','name','displayName','description','parentStemId','parentAttributeDefId','parentAttributeDefName',NULL,1299235316557);
INSERT INTO `grouper_audit_type` VALUES ('addGroup','group','b89b94abe2d2443486aa6daa46df617d',1299235316560,0,'b89b94abe2d2443486aa6daa46df617d',NULL,NULL,NULL,NULL,NULL,'id','name','parentStemId','displayName','description',NULL,NULL,NULL,1299235316560);
INSERT INTO `grouper_audit_type` VALUES ('updateGroup','group','10a0a5de29ed4b368562e82e83a16649',1299235316564,0,'10a0a5de29ed4b368562e82e83a16649',NULL,NULL,NULL,NULL,NULL,'id','name','parentStemId','displayName','description',NULL,NULL,NULL,1299235316564);
INSERT INTO `grouper_audit_type` VALUES ('deleteGroup','group','14cd895ab62e4ba480d30c1d863c59c7',1299235316570,0,'14cd895ab62e4ba480d30c1d863c59c7',NULL,NULL,NULL,NULL,NULL,'id','name','parentStemId','displayName','description',NULL,NULL,NULL,1299235316570);
INSERT INTO `grouper_audit_type` VALUES ('addStem','stem','1b9835b9621747c783884db049b3cf33',1299235316572,0,'1b9835b9621747c783884db049b3cf33',NULL,NULL,NULL,NULL,NULL,'id','name','parentStemId','displayName','description',NULL,NULL,NULL,1299235316572);
INSERT INTO `grouper_audit_type` VALUES ('updateStem','stem','547a93d2abf84665a8f79953938c9e5b',1299235316577,0,'547a93d2abf84665a8f79953938c9e5b',NULL,NULL,NULL,NULL,NULL,'id','name','parentStemId','displayName','description',NULL,NULL,NULL,1299235316577);
INSERT INTO `grouper_audit_type` VALUES ('deleteStem','stem','1e18f80ffc1a4cb096e5ba7419793509',1299235316582,0,'1e18f80ffc1a4cb096e5ba7419793509',NULL,NULL,NULL,NULL,NULL,'id','name','parentStemId','displayName','description',NULL,NULL,NULL,1299235316582);
INSERT INTO `grouper_audit_type` VALUES ('changeSubject','member','5af8bffc5a754f18a74487b44588adf3',1299235316586,0,'5af8bffc5a754f18a74487b44588adf3',NULL,NULL,NULL,NULL,NULL,'oldMemberId','oldSubjectId','oldSourceId','newMemberId','newSubjectId','newSourceId','deleteOldMember','memberIdChanged',1299235316586);
INSERT INTO `grouper_audit_type` VALUES ('import','importExport','a5962cb7e7fa4084b85a8449b375cd2d',1299235316589,0,'a5962cb7e7fa4084b85a8449b375cd2d',NULL,NULL,NULL,NULL,NULL,'fileName','subjectId',NULL,NULL,NULL,NULL,NULL,NULL,1299235316589);
INSERT INTO `grouper_audit_type` VALUES ('copy','group','82b9c6c46167492eb02701ca90c218e6',1299235316593,0,'82b9c6c46167492eb02701ca90c218e6','attributes',NULL,NULL,NULL,NULL,'oldGroupId','oldGroupName','newGroupId','newGroupName','privilegesOfGroup','groupAsPrivilege','listMembersOfGroup','listGroupAsMember',1299235316593);
INSERT INTO `grouper_audit_type` VALUES ('move','group','8590f586a4b74b99bd87fd6d0857cbed',1299235316597,0,'8590f586a4b74b99bd87fd6d0857cbed',NULL,NULL,NULL,NULL,NULL,'groupId','oldGroupName','newGroupName','newStemId','assignAlternateName',NULL,NULL,NULL,1299235316597);
INSERT INTO `grouper_audit_type` VALUES ('copy','stem','790d88657e964168bb12a10f9848565b',1299235316600,0,'790d88657e964168bb12a10f9848565b','attributes',NULL,NULL,NULL,NULL,'oldStemId','oldStemName','newStemName','newStemId','privilegesOfStem','privilegesOfGroup','listMembersOfGroup','listGroupAsMember',1299235316600);
INSERT INTO `grouper_audit_type` VALUES ('move','stem','8b690d5520d74b03a7392c1e88432141',1299235316604,0,'8b690d5520d74b03a7392c1e88432141',NULL,NULL,NULL,NULL,NULL,'stemId','oldStemName','newStemName','newParentStemId','assignAlternateName',NULL,NULL,NULL,1299235316604);
/*!40000 ALTER TABLE `grouper_audit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_change_log_consumer`
--

DROP TABLE IF EXISTS `grouper_change_log_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_change_log_consumer` (
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `last_sequence_processed` bigint(20) DEFAULT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `change_log_consumer_name_idx` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_change_log_consumer`
--

LOCK TABLES `grouper_change_log_consumer` WRITE;
/*!40000 ALTER TABLE `grouper_change_log_consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouper_change_log_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_change_log_entry`
--

DROP TABLE IF EXISTS `grouper_change_log_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_change_log_entry` (
  `change_log_type_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `sequence_number` bigint(20) NOT NULL DEFAULT '0',
  `string01` text CHARACTER SET latin1,
  `string02` text CHARACTER SET latin1,
  `string03` text CHARACTER SET latin1,
  `string04` text CHARACTER SET latin1,
  `string05` text CHARACTER SET latin1,
  `string06` text CHARACTER SET latin1,
  `string07` text CHARACTER SET latin1,
  `string08` text CHARACTER SET latin1,
  `string09` text CHARACTER SET latin1,
  `string10` text CHARACTER SET latin1,
  `string11` text CHARACTER SET latin1,
  `string12` text CHARACTER SET latin1,
  PRIMARY KEY (`sequence_number`),
  KEY `change_log_sequence_number_idx` (`sequence_number`,`created_on`),
  KEY `change_log_context_id_idx` (`context_id`),
  KEY `change_log_entry_string01_idx` (`string01`(255)),
  KEY `change_log_entry_string02_idx` (`string02`(255)),
  KEY `change_log_entry_string03_idx` (`string03`(255)),
  KEY `change_log_entry_string04_idx` (`string04`(255)),
  KEY `change_log_entry_string05_idx` (`string05`(255)),
  KEY `change_log_entry_string06_idx` (`string06`(255)),
  KEY `change_log_entry_string07_idx` (`string07`(255)),
  KEY `change_log_entry_string08_idx` (`string08`(255)),
  KEY `change_log_entry_string09_idx` (`string09`(255)),
  KEY `change_log_entry_string10_idx` (`string10`(255)),
  KEY `change_log_entry_string11_idx` (`string11`(255)),
  KEY `change_log_entry_string12_idx` (`string12`(255)),
  KEY `fk_change_log_entry_type_id` (`change_log_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_change_log_entry`
--

LOCK TABLES `grouper_change_log_entry` WRITE;
/*!40000 ALTER TABLE `grouper_change_log_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouper_change_log_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_change_log_entry_temp`
--

DROP TABLE IF EXISTS `grouper_change_log_entry_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_change_log_entry_temp` (
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `change_log_type_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `created_on` bigint(20) NOT NULL,
  `string01` text CHARACTER SET latin1,
  `string02` text CHARACTER SET latin1,
  `string03` text CHARACTER SET latin1,
  `string04` text CHARACTER SET latin1,
  `string05` text CHARACTER SET latin1,
  `string06` text CHARACTER SET latin1,
  `string07` text CHARACTER SET latin1,
  `string08` text CHARACTER SET latin1,
  `string09` text CHARACTER SET latin1,
  `string10` text CHARACTER SET latin1,
  `string11` text CHARACTER SET latin1,
  `string12` text CHARACTER SET latin1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_change_log_entry_temp`
--

LOCK TABLES `grouper_change_log_entry_temp` WRITE;
/*!40000 ALTER TABLE `grouper_change_log_entry_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouper_change_log_entry_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `grouper_change_log_entry_v`
--

DROP TABLE IF EXISTS `grouper_change_log_entry_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_change_log_entry_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_change_log_entry_v` (
  `created_on` bigint(20),
  `change_log_category` varchar(50),
  `action_name` varchar(50),
  `sequence_number` bigint(20),
  `label_string01` varchar(50),
  `string01` text,
  `label_string02` varchar(50),
  `string02` text,
  `label_string03` varchar(50),
  `string03` text,
  `label_string04` varchar(50),
  `string04` text,
  `label_string05` varchar(50),
  `string05` text,
  `label_string06` varchar(50),
  `string06` text,
  `label_string07` varchar(50),
  `string07` text,
  `label_string08` varchar(50),
  `string08` text,
  `label_string09` varchar(50),
  `string09` text,
  `label_string10` varchar(50),
  `string10` text,
  `label_string11` varchar(50),
  `string11` text,
  `label_string12` varchar(50),
  `string12` text,
  `context_id` varchar(40),
  `change_log_type_id` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grouper_change_log_type`
--

DROP TABLE IF EXISTS `grouper_change_log_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_change_log_type` (
  `action_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `change_log_category` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `label_string01` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_string02` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_string03` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_string04` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_string05` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_string06` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_string07` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_string08` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_string09` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_string10` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_string11` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label_string12` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `change_log_type_cat_type_idx` (`change_log_category`,`action_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_change_log_type`
--

LOCK TABLES `grouper_change_log_type` WRITE;
/*!40000 ALTER TABLE `grouper_change_log_type` DISABLE KEYS */;
INSERT INTO `grouper_change_log_type` VALUES ('addGroupType','groupType','35158db61acf454197964f7945ee3982',1299235316205,0,'35158db61acf454197964f7945ee3982','id','name',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1299235316205);
INSERT INTO `grouper_change_log_type` VALUES ('updateGroupType','groupType','2ef818c8eecb47de9b400b54091115e9',1299235316208,0,'2ef818c8eecb47de9b400b54091115e9','id','name','propertyChanged','propertyOldValue','propertyNewValue',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1299235316208);
INSERT INTO `grouper_change_log_type` VALUES ('deleteGroupType','groupType','065764b8cd714a3499bc560901b8818b',1299235316211,0,'065764b8cd714a3499bc560901b8818b','id','name',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1299235316211);
INSERT INTO `grouper_change_log_type` VALUES ('addGroupField','groupField','cca45bf1c22e451ebde018662aed6622',1299235316213,0,'cca45bf1c22e451ebde018662aed6622','id','name','groupTypeId','groupTypeName','type',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1299235316213);
INSERT INTO `grouper_change_log_type` VALUES ('updateGroupField','groupField','6d93255e6ee844f1ae26494dbd5edc7a',1299235316217,0,'6d93255e6ee844f1ae26494dbd5edc7a','id','name','groupTypeId','groupTypeName','type','propertyChanged','propertyOldValue','propertyNewValue',NULL,NULL,NULL,NULL,1299235316217);
INSERT INTO `grouper_change_log_type` VALUES ('deleteGroupField','groupField','fd19a30bcb4b4478b9fbedc82f2843e3',1299235316220,0,'fd19a30bcb4b4478b9fbedc82f2843e3','id','name','groupTypeId','groupTypeName','type',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1299235316220);
INSERT INTO `grouper_change_log_type` VALUES ('addGroupAttribute','groupAttribute','173f062eeaa841a8842784ac5f53791b',1299235316228,0,'173f062eeaa841a8842784ac5f53791b','id','name','groupId','groupName','fieldId','fieldName','value',NULL,NULL,NULL,NULL,NULL,1299235316228);
INSERT INTO `grouper_change_log_type` VALUES ('updateGroupAttribute','groupAttribute','1c7d0a952f4f4d86abb06bddb70dc593',1299235316233,0,'1c7d0a952f4f4d86abb06bddb70dc593','id','name','groupId','groupName','fieldId','fieldName','value','oldValue',NULL,NULL,NULL,NULL,1299235316233);
INSERT INTO `grouper_change_log_type` VALUES ('deleteGroupAttribute','groupAttribute','fdf71351ee6c4cd9bf9d08fee9898ba1',1299235316236,0,'fdf71351ee6c4cd9bf9d08fee9898ba1','id','name','groupId','groupName','fieldId','fieldName','value',NULL,NULL,NULL,NULL,NULL,1299235316236);
INSERT INTO `grouper_change_log_type` VALUES ('addGroupComposite','groupComposite','6e01f4e7931d4f21afd763e99b2a2de9',1299235316239,0,'6e01f4e7931d4f21afd763e99b2a2de9','id','ownerId','ownerName','leftFactorId','leftFactorName','rightFactorId','rightFactorName','type',NULL,NULL,NULL,NULL,1299235316239);
INSERT INTO `grouper_change_log_type` VALUES ('updateGroupComposite','groupComposite','564659abd1d641bab3648cca510062ca',1299235316242,0,'564659abd1d641bab3648cca510062ca','id','ownerId','ownerName','leftFactorId','leftFactorName','rightFactorId','rightFactorName','type',NULL,NULL,NULL,NULL,1299235316242);
INSERT INTO `grouper_change_log_type` VALUES ('deleteGroupComposite','groupComposite','37abd9a51cf6413f9d1311442d53816b',1299235316245,0,'37abd9a51cf6413f9d1311442d53816b','id','ownerId','ownerName','leftFactorId','leftFactorName','rightFactorId','rightFactorName','type',NULL,NULL,NULL,NULL,1299235316245);
INSERT INTO `grouper_change_log_type` VALUES ('assignGroupType','groupTypeAssignment','306bd92155024556a966cff69c0d34c3',1299235316248,0,'306bd92155024556a966cff69c0d34c3','id','groupId','groupName','typeId','typeName',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1299235316248);
INSERT INTO `grouper_change_log_type` VALUES ('unassignGroupType','groupTypeAssignment','926651d173e34f0a8abbfe0f7c08e75f',1299235316250,0,'926651d173e34f0a8abbfe0f7c08e75f','id','groupId','groupName','typeId','typeName',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1299235316250);
INSERT INTO `grouper_change_log_type` VALUES ('addMembership','membership','0e1c82716d2847adbcb73650d4b7742f',1299235316253,0,'0e1c82716d2847adbcb73650d4b7742f',NULL,'fieldName','subjectId','sourceId','membershipType','groupId','groupName','memberId','fieldId',NULL,NULL,NULL,1299235316253);
INSERT INTO `grouper_change_log_type` VALUES ('updateMembership','membership','7f3e7a8b7f564988aeebe0151e45aacd',1299235316255,0,'7f3e7a8b7f564988aeebe0151e45aacd',NULL,'fieldName','subjectId','sourceId','membershipType','groupId','groupName','propertyChanged','propertyOldValue','propertyNewValue',NULL,NULL,1299235316255);
INSERT INTO `grouper_change_log_type` VALUES ('deleteMembership','membership','e1c32216e3854c8295eccc532038a35e',1299235316273,0,'e1c32216e3854c8295eccc532038a35e',NULL,'fieldName','subjectId','sourceId','membershipType','groupId','groupName','memberId','fieldId',NULL,NULL,NULL,1299235316273);
INSERT INTO `grouper_change_log_type` VALUES ('addPrivilege','privilege','60c487c6469c4bdabad5eab4baede49d',1299235316274,0,'60c487c6469c4bdabad5eab4baede49d',NULL,'privilegeName','subjectId','sourceId','privilegeType','ownerType','ownerId','ownerName','memberId','fieldId','membershipType',NULL,1299235316274);
INSERT INTO `grouper_change_log_type` VALUES ('updatePrivilege','privilege','576b645e29aa47fd8c42c86aacab9625',1299235316278,0,'576b645e29aa47fd8c42c86aacab9625',NULL,'privilegeName','subjectId','sourceId','privilegeType','ownerType','ownerId','ownerName','membershipType',NULL,NULL,NULL,1299235316278);
INSERT INTO `grouper_change_log_type` VALUES ('deletePrivilege','privilege','330c258c808047229609af17dea2759b',1299235316283,0,'330c258c808047229609af17dea2759b',NULL,'privilegeName','subjectId','sourceId','privilegeType','ownerType','ownerId','ownerName','memberId','fieldId','membershipType',NULL,1299235316283);
INSERT INTO `grouper_change_log_type` VALUES ('addGroup','group','061f3eaf4e6a4aa7baab9b753b781f3e',1299235316289,0,'061f3eaf4e6a4aa7baab9b753b781f3e','id','name','parentStemId','displayName','description',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1299235316289);
INSERT INTO `grouper_change_log_type` VALUES ('updateGroup','group','ad29d1750212499e90b3e2c99d8ffa06',1299235316291,0,'ad29d1750212499e90b3e2c99d8ffa06','id','name','parentStemId','displayName','description','propertyChanged','propertyOldValue','propertyNewValue',NULL,NULL,NULL,NULL,1299235316291);
INSERT INTO `grouper_change_log_type` VALUES ('deleteGroup','group','0bfa20641f4b4c5e87262b83d9581cf6',1299235316295,0,'0bfa20641f4b4c5e87262b83d9581cf6','id','name','parentStemId','displayName','description',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1299235316295);
INSERT INTO `grouper_change_log_type` VALUES ('addAttributeDef','attributeDef','7565726e2cac483db0baa56119e95b9b',1299235316299,0,'7565726e2cac483db0baa56119e95b9b','id','name','stemId','description',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1299235316299);
INSERT INTO `grouper_change_log_type` VALUES ('updateAttributeDef','attributeDef','2819489e9b9d439c9dfded4e34071b67',1299235316303,0,'2819489e9b9d439c9dfded4e34071b67','id','name','stemId','description','propertyChanged','propertyOldValue','propertyNewValue',NULL,NULL,NULL,NULL,NULL,1299235316303);
INSERT INTO `grouper_change_log_type` VALUES ('deleteAttributeDef','attributeDef','a108d89ef32d4770b90467e0ba175b22',1299235316306,0,'a108d89ef32d4770b90467e0ba175b22','id','name','stemId','description',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1299235316306);
INSERT INTO `grouper_change_log_type` VALUES ('addStem','stem','e28af58c2dd04176863c71f0ccba931d',1299235316310,0,'e28af58c2dd04176863c71f0ccba931d','id','name','parentStemId','displayName','description',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1299235316310);
INSERT INTO `grouper_change_log_type` VALUES ('updateStem','stem','e9db57081a43477fa0b075bb8994e6be',1299235316313,0,'e9db57081a43477fa0b075bb8994e6be','id','name','parentStemId','displayName','description','propertyChanged','propertyOldValue','propertyNewValue',NULL,NULL,NULL,NULL,1299235316313);
INSERT INTO `grouper_change_log_type` VALUES ('deleteStem','stem','86215a8eb03448a3beab827719c6e3f7',1299235316317,0,'86215a8eb03448a3beab827719c6e3f7','id','name','parentStemId','displayName','description',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1299235316317);
INSERT INTO `grouper_change_log_type` VALUES ('changeSubject','member','3255b2b48dbe45f9b91c79c9f32c6a08',1299235316320,0,'3255b2b48dbe45f9b91c79c9f32c6a08','oldMemberId','oldSubjectId','oldSourceId','newMemberId','newSubjectId','newSourceId','deleteOldMember','memberIdChanged',NULL,NULL,NULL,NULL,1299235316320);
INSERT INTO `grouper_change_log_type` VALUES ('copy','group','386d9d8002c741b99f18c82912cce885',1299235316325,0,'386d9d8002c741b99f18c82912cce885','attributes','oldGroupId','oldGroupName','newGroupId','newGroupName','privilegesOfGroup','groupAsPrivilege','listMembersOfGroup','listGroupAsMember',NULL,NULL,NULL,1299235316325);
INSERT INTO `grouper_change_log_type` VALUES ('move','group','c9619fa999a6466b9b7c8970f5d19849',1299235316327,0,'c9619fa999a6466b9b7c8970f5d19849','groupId','oldGroupName','newGroupName','newStemId','assignAlternateName',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1299235316327);
INSERT INTO `grouper_change_log_type` VALUES ('copy','stem','5fd18ace3be646a993363cb87ec6d828',1299235316331,0,'5fd18ace3be646a993363cb87ec6d828','attributes','oldStemId','oldStemName','newStemName','newStemId','privilegesOfStem','privilegesOfGroup','listMembersOfGroup','listGroupAsMember',NULL,NULL,NULL,1299235316331);
INSERT INTO `grouper_change_log_type` VALUES ('move','stem','7b6d0257447a44ee9f79bbe53eb65a8e',1299235316335,0,'7b6d0257447a44ee9f79bbe53eb65a8e','stemId','oldStemName','newStemName','newParentStemId','assignAlternateName',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1299235316335);
/*!40000 ALTER TABLE `grouper_change_log_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_composites`
--

DROP TABLE IF EXISTS `grouper_composites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_composites` (
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `owner` varchar(40) CHARACTER SET latin1 NOT NULL,
  `left_factor` varchar(40) CHARACTER SET latin1 NOT NULL,
  `right_factor` varchar(40) CHARACTER SET latin1 NOT NULL,
  `type` varchar(32) CHARACTER SET latin1 NOT NULL,
  `creator_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `create_time` bigint(20) NOT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `composite_composite_idx` (`owner`),
  KEY `composite_createtime_idx` (`create_time`),
  KEY `composite_creator_idx` (`creator_id`),
  KEY `composite_factor_idx` (`left_factor`,`right_factor`),
  KEY `composite_left_factor_idx` (`left_factor`),
  KEY `composite_right_factor_idx` (`right_factor`),
  KEY `composite_context_idx` (`context_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_composites`
--

LOCK TABLES `grouper_composites` WRITE;
/*!40000 ALTER TABLE `grouper_composites` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouper_composites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `grouper_composites_v`
--

DROP TABLE IF EXISTS `grouper_composites_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_composites_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_composites_v` (
  `OWNER_GROUP_NAME` longtext,
  `COMPOSITE_TYPE` varchar(32),
  `LEFT_FACTOR_GROUP_NAME` longtext,
  `RIGHT_FACTOR_GROUP_NAME` longtext,
  `OWNER_GROUP_DISPLAYNAME` longtext,
  `LEFT_FACTOR_GROUP_DISPLAYNAME` longtext,
  `RIGHT_FACTOR_GROUP_DISPLAYNAME` longtext,
  `owner_group_id` varchar(40),
  `LEFT_FACTOR_GROUP_ID` varchar(40),
  `RIGHT_FACTOR_GROUP_ID` varchar(40),
  `COMPOSITE_ID` varchar(40),
  `CREATE_TIME` bigint(20),
  `CREATOR_ID` varchar(40),
  `HIBERNATE_VERSION_NUMBER` bigint(20),
  `CONTEXT_ID` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grouper_ddl`
--

DROP TABLE IF EXISTS `grouper_ddl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_ddl` (
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `object_name` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `db_version` int(11) DEFAULT NULL,
  `last_updated` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `history` text CHARACTER SET latin1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grouper_ddl_object_name_idx` (`object_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_ddl`
--

LOCK TABLES `grouper_ddl` WRITE;
/*!40000 ALTER TABLE `grouper_ddl` DISABLE KEYS */;
INSERT INTO `grouper_ddl` VALUES ('95ebb2b4f3164a89b524c7a83aeeffe7','Grouper',23,'2011/03/03 16:52:00','2011/03/03 16:52:00: upgrade Grouper from V22 to V23, 2011/03/03 16:52:00: upgrade Grouper from V21 to V22, 2011/03/03 16:51:59: upgrade Grouper from V20 to V21, 2011/03/03 16:51:59: upgrade Grouper from V19 to V20, 2011/03/03 16:51:59: upgrade Grouper from V18 to V19, 2011/03/03 16:51:59: upgrade Grouper from V17 to V18, 2011/03/03 16:51:59: upgrade Grouper from V16 to V17, 2011/03/03 16:51:59: upgrade Grouper from V15 to V16, 2011/03/03 16:51:59: upgrade Grouper from V14 to V15, 2011/03/03 16:51:59: upgrade Grouper from V13 to V14, 2011/03/03 16:51:59: upgrade Grouper from V12 to V13, 2011/03/03 16:51:59: upgrade Grouper from V11 to V12, 2011/03/03 16:51:59: upgrade Grouper from V10 to V11, 2011/03/03 16:51:58: upgrade Grouper from V9 to V10, 2011/03/03 16:51:58: upgrade Grouper from V8 to V9, 2011/03/03 16:51:58: upgrade Grouper from V7 to V8, 2011/03/03 16:51:58: upgrade Grouper from V6 to V7, 2011/03/03 16:51:58: upgrade Grouper from V5 to V6, 2011/03/03 16:51:58: upgrade Grouper from V4 to V5, 2011/03/03 16:51:58: upgrade Grouper from V3 to V4, 2011/03/03 16:51:58: upgrade Grouper from V2 to V3, 2011/03/03 16:51:58: upgrade Grouper from V1 to V2, 2011/03/03 16:51:58: upgrade Grouper from V0 to V1, ');
INSERT INTO `grouper_ddl` VALUES ('35756071fed849e488f564f4299b99dc','Subject',1,'2011/03/03 16:52:00','2011/03/03 16:52:00: upgrade Subject from V0 to V1, ');
/*!40000 ALTER TABLE `grouper_ddl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_fields`
--

DROP TABLE IF EXISTS `grouper_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_fields` (
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `grouptype_uuid` varchar(40) CHARACTER SET latin1 NOT NULL,
  `is_nullable` tinyint(1) DEFAULT NULL,
  `name` varchar(32) CHARACTER SET latin1 NOT NULL,
  `read_privilege` varchar(32) CHARACTER SET latin1 NOT NULL,
  `type` varchar(32) CHARACTER SET latin1 NOT NULL,
  `write_privilege` varchar(32) CHARACTER SET latin1 NOT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_and_type` (`name`,`type`),
  KEY `fields_context_idx` (`context_id`),
  KEY `fk_fields_grouptype_uuid` (`grouptype_uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_fields`
--

LOCK TABLES `grouper_fields` WRITE;
/*!40000 ALTER TABLE `grouper_fields` DISABLE KEYS */;
INSERT INTO `grouper_fields` VALUES ('699b0f53c252416f90d370dac04ea7ec','a561f3cd149245f482db2ce7b4a115f7',1,'members','read','list','update',0,'e761084a8f60478c84ea18b759614591');
INSERT INTO `grouper_fields` VALUES ('b4c5190fbf42433fb7ffdcf36a1c5f8c','a561f3cd149245f482db2ce7b4a115f7',1,'admins','admin','access','admin',0,'7ad7ce698a7b4d8fb1fbc7daf164fba3');
INSERT INTO `grouper_fields` VALUES ('3970107f60b6454e920560fe9979d205','a561f3cd149245f482db2ce7b4a115f7',1,'optouts','update','access','update',0,'c6c62f9bf49c430b82db5b342035bd4a');
INSERT INTO `grouper_fields` VALUES ('6918a3dbd28549ddb5a4b50b7e8abc3b','a561f3cd149245f482db2ce7b4a115f7',1,'optins','update','access','update',0,'996fbdb663f540f697fa2fa38931b4c2');
INSERT INTO `grouper_fields` VALUES ('40fce8b63a694849a0da1ddaa93887c5','a561f3cd149245f482db2ce7b4a115f7',1,'readers','admin','access','admin',0,'53ef194bc9364f09a894ea15da004a7d');
INSERT INTO `grouper_fields` VALUES ('4f5e3c3a49e345cf81bf9896dc213619','a561f3cd149245f482db2ce7b4a115f7',1,'updaters','admin','access','admin',0,'6b79a72b809b44b68ef4f2c55fafc246');
INSERT INTO `grouper_fields` VALUES ('5b99515e6d0e46aa8ca556e0aded3bb7','a561f3cd149245f482db2ce7b4a115f7',1,'viewers','admin','access','admin',0,'1d22458c621b47b2b1d7d741b385d57b');
INSERT INTO `grouper_fields` VALUES ('a5ec8c88ef604a378820ab44c8db1bed','8ba7dcb5ee7a4115863a952e836f32a2',1,'attrAdmins','attrAdmin','attributeDef','attrAdmin',0,'5ff68882de164f4c83c098be2a122b52');
INSERT INTO `grouper_fields` VALUES ('c1e03f54f324458c9f4405e9f435b4ab','8ba7dcb5ee7a4115863a952e836f32a2',1,'attrOptouts','attrUpdate','attributeDef','attrUpdate',0,'308fb9aeb71c4916962446498fc779a0');
INSERT INTO `grouper_fields` VALUES ('944485463529404096f2b8e14d357eac','8ba7dcb5ee7a4115863a952e836f32a2',1,'attrOptins','attrUpdate','attributeDef','attrUpdate',0,'ac2364f7bc7f4653937349fd06bd0183');
INSERT INTO `grouper_fields` VALUES ('9f9b724c63d546d2858bdf57de63357f','8ba7dcb5ee7a4115863a952e836f32a2',1,'attrReaders','attrAdmin','attributeDef','attrAdmin',0,'170a331fc664444f93927c0633da0d24');
INSERT INTO `grouper_fields` VALUES ('f86b2365d6ff4b9cb10d76674e9f3e59','8ba7dcb5ee7a4115863a952e836f32a2',1,'attrUpdaters','attrAdmin','attributeDef','attrAdmin',0,'ea0fef0946cb4d9fa45182299bde415f');
INSERT INTO `grouper_fields` VALUES ('b7b4a6be5aab4553a301aef18d148c6c','8ba7dcb5ee7a4115863a952e836f32a2',1,'attrViewers','attrAdmin','attributeDef','attrAdmin',0,'8bba1d20d9034675aecf6fed7372400b');
INSERT INTO `grouper_fields` VALUES ('3e216076b7fb4e88bc8107de20a4a23a','84919fd57778493da1d62ea966457557',1,'creators','stem','naming','stem',0,'8f797703939842d0aff9249e095d2664');
INSERT INTO `grouper_fields` VALUES ('f908e75534c349dc978e8b0f67ce4c74','84919fd57778493da1d62ea966457557',1,'stemmers','stem','naming','stem',0,'d0d5160290d248448c5734dc6477bdfd');
/*!40000 ALTER TABLE `grouper_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_flat_attribute_def`
--

DROP TABLE IF EXISTS `grouper_flat_attribute_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_flat_attribute_def` (
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `attribute_def_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flat_attrdef_attrdef_idx` (`attribute_def_id`),
  KEY `flat_attrdef_context_idx` (`context_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_flat_attribute_def`
--

LOCK TABLES `grouper_flat_attribute_def` WRITE;
/*!40000 ALTER TABLE `grouper_flat_attribute_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouper_flat_attribute_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_flat_groups`
--

DROP TABLE IF EXISTS `grouper_flat_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_flat_groups` (
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `group_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flat_group_group_idx` (`group_id`),
  KEY `flat_group_context_idx` (`context_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_flat_groups`
--

LOCK TABLES `grouper_flat_groups` WRITE;
/*!40000 ALTER TABLE `grouper_flat_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouper_flat_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_flat_memberships`
--

DROP TABLE IF EXISTS `grouper_flat_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_flat_memberships` (
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `owner_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `owner_attr_def_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `owner_group_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `owner_stem_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `member_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `field_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flat_mship_uniq_idx` (`owner_id`,`member_id`,`field_id`),
  KEY `flat_mship_owner_group_idx` (`owner_group_id`),
  KEY `flat_mship_stem_group_idx` (`owner_stem_id`),
  KEY `flat_mship_attrdef_group_idx` (`owner_attr_def_id`),
  KEY `flat_mship_field_idx` (`field_id`),
  KEY `flat_mship_context_idx` (`context_id`),
  KEY `flat_mship_member_idx` (`member_id`),
  KEY `flat_mship_owner_field_idx` (`owner_id`,`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_flat_memberships`
--

LOCK TABLES `grouper_flat_memberships` WRITE;
/*!40000 ALTER TABLE `grouper_flat_memberships` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouper_flat_memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_flat_stems`
--

DROP TABLE IF EXISTS `grouper_flat_stems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_flat_stems` (
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `stem_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flat_stem_stem_idx` (`stem_id`),
  KEY `flat_stem_context_idx` (`context_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_flat_stems`
--

LOCK TABLES `grouper_flat_stems` WRITE;
/*!40000 ALTER TABLE `grouper_flat_stems` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouper_flat_stems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_group_set`
--

DROP TABLE IF EXISTS `grouper_group_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_group_set` (
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `owner_attr_def_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `owner_attr_def_id_null` varchar(40) CHARACTER SET latin1 NOT NULL DEFAULT '<NULL>',
  `owner_group_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `owner_group_id_null` varchar(40) CHARACTER SET latin1 NOT NULL DEFAULT '<NULL>',
  `owner_stem_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `owner_stem_id_null` varchar(40) CHARACTER SET latin1 NOT NULL DEFAULT '<NULL>',
  `member_attr_def_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `member_group_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `member_stem_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `member_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `field_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `member_field_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `owner_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `mship_type` varchar(16) CHARACTER SET latin1 NOT NULL,
  `depth` int(11) NOT NULL,
  `via_group_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `parent_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `creator_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `create_time` bigint(20) NOT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_set_uniq_idx` (`member_id`,`field_id`,`owner_attr_def_id_null`,`owner_group_id_null`,`owner_stem_id_null`,`mship_type`,`parent_id`),
  KEY `group_set_owner_field_idx` (`owner_id`,`field_id`),
  KEY `group_set_creator_idx` (`creator_id`),
  KEY `group_set_parent_idx` (`parent_id`),
  KEY `group_set_via_group_idx` (`via_group_id`),
  KEY `group_set_context_idx` (`context_id`),
  KEY `group_set_gmember_idx` (`member_group_id`),
  KEY `group_set_smember_idx` (`member_stem_id`),
  KEY `group_set_amember_idx` (`member_attr_def_id`),
  KEY `group_set_gowner_field_idx` (`owner_group_id`,`field_id`),
  KEY `group_set_sowner_field_idx` (`owner_stem_id`,`field_id`),
  KEY `group_set_aowner_field_idx` (`owner_attr_def_id`,`field_id`),
  KEY `group_set_gowner_member_idx` (`owner_group_id`,`member_group_id`,`field_id`,`depth`),
  KEY `group_set_sowner_member_idx` (`owner_stem_id`,`member_stem_id`,`field_id`,`depth`),
  KEY `group_set_aowner_member_idx` (`owner_attr_def_id`,`member_attr_def_id`,`field_id`,`depth`),
  KEY `fk_group_set_field_id` (`field_id`),
  KEY `fk_group_set_member_field_id` (`member_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_group_set`
--

LOCK TABLES `grouper_group_set` WRITE;
/*!40000 ALTER TABLE `grouper_group_set` DISABLE KEYS */;
INSERT INTO `grouper_group_set` VALUES ('be746ba61e90466ebed01c555419b7d5',NULL,'<NULL>',NULL,'<NULL>','8e093a78c8494921bc29753ed4cd16e2','8e093a78c8494921bc29753ed4cd16e2',NULL,NULL,'8e093a78c8494921bc29753ed4cd16e2','8e093a78c8494921bc29753ed4cd16e2','3e216076b7fb4e88bc8107de20a4a23a','3e216076b7fb4e88bc8107de20a4a23a','8e093a78c8494921bc29753ed4cd16e2','immediate',0,NULL,'be746ba61e90466ebed01c555419b7d5','c57de3ae40fa40f0b723f6279c9da5fc',1299235317284,NULL,0);
INSERT INTO `grouper_group_set` VALUES ('900a95612d3d4ee2b6490a187373a5dd',NULL,'<NULL>',NULL,'<NULL>','8e093a78c8494921bc29753ed4cd16e2','8e093a78c8494921bc29753ed4cd16e2',NULL,NULL,'8e093a78c8494921bc29753ed4cd16e2','8e093a78c8494921bc29753ed4cd16e2','f908e75534c349dc978e8b0f67ce4c74','f908e75534c349dc978e8b0f67ce4c74','8e093a78c8494921bc29753ed4cd16e2','immediate',0,NULL,'900a95612d3d4ee2b6490a187373a5dd','c57de3ae40fa40f0b723f6279c9da5fc',1299235317296,NULL,0);
INSERT INTO `grouper_group_set` VALUES ('d13894d7683f456c86c69ab211274f7c',NULL,'<NULL>',NULL,'<NULL>','d6f965c796af4dfcb807a762255b0b52','d6f965c796af4dfcb807a762255b0b52',NULL,NULL,'d6f965c796af4dfcb807a762255b0b52','d6f965c796af4dfcb807a762255b0b52','3e216076b7fb4e88bc8107de20a4a23a','3e216076b7fb4e88bc8107de20a4a23a','d6f965c796af4dfcb807a762255b0b52','immediate',0,NULL,'d13894d7683f456c86c69ab211274f7c','c57de3ae40fa40f0b723f6279c9da5fc',1299235317477,'3a6c5ae3e85a4b5b9ae335d353ff8fae',0);
INSERT INTO `grouper_group_set` VALUES ('4f08b28ed1694458b3ec86b5fcb1888b',NULL,'<NULL>',NULL,'<NULL>','d6f965c796af4dfcb807a762255b0b52','d6f965c796af4dfcb807a762255b0b52',NULL,NULL,'d6f965c796af4dfcb807a762255b0b52','d6f965c796af4dfcb807a762255b0b52','f908e75534c349dc978e8b0f67ce4c74','f908e75534c349dc978e8b0f67ce4c74','d6f965c796af4dfcb807a762255b0b52','immediate',0,NULL,'4f08b28ed1694458b3ec86b5fcb1888b','c57de3ae40fa40f0b723f6279c9da5fc',1299235317483,'3a6c5ae3e85a4b5b9ae335d353ff8fae',0);
INSERT INTO `grouper_group_set` VALUES ('2bc91fba9e744b489e7b4909c467ca25',NULL,'<NULL>','5b4b95e447ec41aeb0cb156ea5b2eda7','5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,'<NULL>',NULL,'5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,'5b4b95e447ec41aeb0cb156ea5b2eda7','b4c5190fbf42433fb7ffdcf36a1c5f8c','b4c5190fbf42433fb7ffdcf36a1c5f8c','5b4b95e447ec41aeb0cb156ea5b2eda7','immediate',0,NULL,'2bc91fba9e744b489e7b4909c467ca25','c57de3ae40fa40f0b723f6279c9da5fc',1299235317774,'097a334751d94bc6a956be7ba4a0b7d7',0);
INSERT INTO `grouper_group_set` VALUES ('b72d1f7e137d4222afdc35bc5d4b46a1',NULL,'<NULL>','5b4b95e447ec41aeb0cb156ea5b2eda7','5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,'<NULL>',NULL,'5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,'5b4b95e447ec41aeb0cb156ea5b2eda7','699b0f53c252416f90d370dac04ea7ec','699b0f53c252416f90d370dac04ea7ec','5b4b95e447ec41aeb0cb156ea5b2eda7','immediate',0,NULL,'b72d1f7e137d4222afdc35bc5d4b46a1','c57de3ae40fa40f0b723f6279c9da5fc',1299235317777,'097a334751d94bc6a956be7ba4a0b7d7',0);
INSERT INTO `grouper_group_set` VALUES ('232ae36270424127beb0bf6a315dd840',NULL,'<NULL>','5b4b95e447ec41aeb0cb156ea5b2eda7','5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,'<NULL>',NULL,'5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,'5b4b95e447ec41aeb0cb156ea5b2eda7','6918a3dbd28549ddb5a4b50b7e8abc3b','6918a3dbd28549ddb5a4b50b7e8abc3b','5b4b95e447ec41aeb0cb156ea5b2eda7','immediate',0,NULL,'232ae36270424127beb0bf6a315dd840','c57de3ae40fa40f0b723f6279c9da5fc',1299235317791,'097a334751d94bc6a956be7ba4a0b7d7',0);
INSERT INTO `grouper_group_set` VALUES ('68743d02fb35413cbec2fed921970309',NULL,'<NULL>','5b4b95e447ec41aeb0cb156ea5b2eda7','5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,'<NULL>',NULL,'5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,'5b4b95e447ec41aeb0cb156ea5b2eda7','3970107f60b6454e920560fe9979d205','3970107f60b6454e920560fe9979d205','5b4b95e447ec41aeb0cb156ea5b2eda7','immediate',0,NULL,'68743d02fb35413cbec2fed921970309','c57de3ae40fa40f0b723f6279c9da5fc',1299235317793,'097a334751d94bc6a956be7ba4a0b7d7',0);
INSERT INTO `grouper_group_set` VALUES ('5483da317ae2443090e7599af0b85342',NULL,'<NULL>','5b4b95e447ec41aeb0cb156ea5b2eda7','5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,'<NULL>',NULL,'5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,'5b4b95e447ec41aeb0cb156ea5b2eda7','40fce8b63a694849a0da1ddaa93887c5','40fce8b63a694849a0da1ddaa93887c5','5b4b95e447ec41aeb0cb156ea5b2eda7','immediate',0,NULL,'5483da317ae2443090e7599af0b85342','c57de3ae40fa40f0b723f6279c9da5fc',1299235317795,'097a334751d94bc6a956be7ba4a0b7d7',0);
INSERT INTO `grouper_group_set` VALUES ('e32656a9a1ed4df1b7dc07eb45655219',NULL,'<NULL>','5b4b95e447ec41aeb0cb156ea5b2eda7','5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,'<NULL>',NULL,'5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,'5b4b95e447ec41aeb0cb156ea5b2eda7','4f5e3c3a49e345cf81bf9896dc213619','4f5e3c3a49e345cf81bf9896dc213619','5b4b95e447ec41aeb0cb156ea5b2eda7','immediate',0,NULL,'e32656a9a1ed4df1b7dc07eb45655219','c57de3ae40fa40f0b723f6279c9da5fc',1299235317797,'097a334751d94bc6a956be7ba4a0b7d7',0);
INSERT INTO `grouper_group_set` VALUES ('a417402ae3e745d59f15cdc3836bff66',NULL,'<NULL>','5b4b95e447ec41aeb0cb156ea5b2eda7','5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,'<NULL>',NULL,'5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,'5b4b95e447ec41aeb0cb156ea5b2eda7','5b99515e6d0e46aa8ca556e0aded3bb7','5b99515e6d0e46aa8ca556e0aded3bb7','5b4b95e447ec41aeb0cb156ea5b2eda7','immediate',0,NULL,'a417402ae3e745d59f15cdc3836bff66','c57de3ae40fa40f0b723f6279c9da5fc',1299235317799,'097a334751d94bc6a956be7ba4a0b7d7',0);
INSERT INTO `grouper_group_set` VALUES ('029c21c479284ca99f2c43e148bac061',NULL,'<NULL>','37e54589ba0848e3b6d25dcfe75b946f','37e54589ba0848e3b6d25dcfe75b946f',NULL,'<NULL>',NULL,'37e54589ba0848e3b6d25dcfe75b946f',NULL,'37e54589ba0848e3b6d25dcfe75b946f','b4c5190fbf42433fb7ffdcf36a1c5f8c','b4c5190fbf42433fb7ffdcf36a1c5f8c','37e54589ba0848e3b6d25dcfe75b946f','immediate',0,NULL,'029c21c479284ca99f2c43e148bac061','c57de3ae40fa40f0b723f6279c9da5fc',1299235318035,'59d05e7c2c0a48e08601cdb2bc12ee79',0);
INSERT INTO `grouper_group_set` VALUES ('33c3100b555d4a9682dd01e35329b81e',NULL,'<NULL>','37e54589ba0848e3b6d25dcfe75b946f','37e54589ba0848e3b6d25dcfe75b946f',NULL,'<NULL>',NULL,'37e54589ba0848e3b6d25dcfe75b946f',NULL,'37e54589ba0848e3b6d25dcfe75b946f','699b0f53c252416f90d370dac04ea7ec','699b0f53c252416f90d370dac04ea7ec','37e54589ba0848e3b6d25dcfe75b946f','immediate',0,NULL,'33c3100b555d4a9682dd01e35329b81e','c57de3ae40fa40f0b723f6279c9da5fc',1299235318036,'59d05e7c2c0a48e08601cdb2bc12ee79',0);
INSERT INTO `grouper_group_set` VALUES ('8441a861d4b14649a6a9575201d3dff3',NULL,'<NULL>','37e54589ba0848e3b6d25dcfe75b946f','37e54589ba0848e3b6d25dcfe75b946f',NULL,'<NULL>',NULL,'37e54589ba0848e3b6d25dcfe75b946f',NULL,'37e54589ba0848e3b6d25dcfe75b946f','6918a3dbd28549ddb5a4b50b7e8abc3b','6918a3dbd28549ddb5a4b50b7e8abc3b','37e54589ba0848e3b6d25dcfe75b946f','immediate',0,NULL,'8441a861d4b14649a6a9575201d3dff3','c57de3ae40fa40f0b723f6279c9da5fc',1299235318037,'59d05e7c2c0a48e08601cdb2bc12ee79',0);
INSERT INTO `grouper_group_set` VALUES ('12bc338b9944429eb4e1084f723b8422',NULL,'<NULL>','37e54589ba0848e3b6d25dcfe75b946f','37e54589ba0848e3b6d25dcfe75b946f',NULL,'<NULL>',NULL,'37e54589ba0848e3b6d25dcfe75b946f',NULL,'37e54589ba0848e3b6d25dcfe75b946f','3970107f60b6454e920560fe9979d205','3970107f60b6454e920560fe9979d205','37e54589ba0848e3b6d25dcfe75b946f','immediate',0,NULL,'12bc338b9944429eb4e1084f723b8422','c57de3ae40fa40f0b723f6279c9da5fc',1299235318039,'59d05e7c2c0a48e08601cdb2bc12ee79',0);
INSERT INTO `grouper_group_set` VALUES ('b38e04b4b40a4570a7cbbd612bf97673',NULL,'<NULL>','37e54589ba0848e3b6d25dcfe75b946f','37e54589ba0848e3b6d25dcfe75b946f',NULL,'<NULL>',NULL,'37e54589ba0848e3b6d25dcfe75b946f',NULL,'37e54589ba0848e3b6d25dcfe75b946f','40fce8b63a694849a0da1ddaa93887c5','40fce8b63a694849a0da1ddaa93887c5','37e54589ba0848e3b6d25dcfe75b946f','immediate',0,NULL,'b38e04b4b40a4570a7cbbd612bf97673','c57de3ae40fa40f0b723f6279c9da5fc',1299235318040,'59d05e7c2c0a48e08601cdb2bc12ee79',0);
INSERT INTO `grouper_group_set` VALUES ('dfc16915458b4bc4b9d962f622b33b1f',NULL,'<NULL>','37e54589ba0848e3b6d25dcfe75b946f','37e54589ba0848e3b6d25dcfe75b946f',NULL,'<NULL>',NULL,'37e54589ba0848e3b6d25dcfe75b946f',NULL,'37e54589ba0848e3b6d25dcfe75b946f','4f5e3c3a49e345cf81bf9896dc213619','4f5e3c3a49e345cf81bf9896dc213619','37e54589ba0848e3b6d25dcfe75b946f','immediate',0,NULL,'dfc16915458b4bc4b9d962f622b33b1f','c57de3ae40fa40f0b723f6279c9da5fc',1299235318046,'59d05e7c2c0a48e08601cdb2bc12ee79',0);
INSERT INTO `grouper_group_set` VALUES ('e3d21131bd024fdb9a8d352ea137a965',NULL,'<NULL>','37e54589ba0848e3b6d25dcfe75b946f','37e54589ba0848e3b6d25dcfe75b946f',NULL,'<NULL>',NULL,'37e54589ba0848e3b6d25dcfe75b946f',NULL,'37e54589ba0848e3b6d25dcfe75b946f','5b99515e6d0e46aa8ca556e0aded3bb7','5b99515e6d0e46aa8ca556e0aded3bb7','37e54589ba0848e3b6d25dcfe75b946f','immediate',0,NULL,'e3d21131bd024fdb9a8d352ea137a965','c57de3ae40fa40f0b723f6279c9da5fc',1299235318048,'59d05e7c2c0a48e08601cdb2bc12ee79',0);
INSERT INTO `grouper_group_set` VALUES ('1d1cc03cacf547e78c6e961166e9dd1d',NULL,'<NULL>','fb6582da37214fed85b84929bf254110','fb6582da37214fed85b84929bf254110',NULL,'<NULL>',NULL,'fb6582da37214fed85b84929bf254110',NULL,'fb6582da37214fed85b84929bf254110','b4c5190fbf42433fb7ffdcf36a1c5f8c','b4c5190fbf42433fb7ffdcf36a1c5f8c','fb6582da37214fed85b84929bf254110','immediate',0,NULL,'1d1cc03cacf547e78c6e961166e9dd1d','c57de3ae40fa40f0b723f6279c9da5fc',1299237918600,'36203465b48249aaa5026cee1f97a2b1',0);
INSERT INTO `grouper_group_set` VALUES ('b2fa0455d7824b439fb49cad4a156df0',NULL,'<NULL>','fb6582da37214fed85b84929bf254110','fb6582da37214fed85b84929bf254110',NULL,'<NULL>',NULL,'fb6582da37214fed85b84929bf254110',NULL,'fb6582da37214fed85b84929bf254110','699b0f53c252416f90d370dac04ea7ec','699b0f53c252416f90d370dac04ea7ec','fb6582da37214fed85b84929bf254110','immediate',0,NULL,'b2fa0455d7824b439fb49cad4a156df0','c57de3ae40fa40f0b723f6279c9da5fc',1299237918612,'36203465b48249aaa5026cee1f97a2b1',0);
INSERT INTO `grouper_group_set` VALUES ('0e5313ab40e347368684f1547dd263a9',NULL,'<NULL>','fb6582da37214fed85b84929bf254110','fb6582da37214fed85b84929bf254110',NULL,'<NULL>',NULL,'fb6582da37214fed85b84929bf254110',NULL,'fb6582da37214fed85b84929bf254110','6918a3dbd28549ddb5a4b50b7e8abc3b','6918a3dbd28549ddb5a4b50b7e8abc3b','fb6582da37214fed85b84929bf254110','immediate',0,NULL,'0e5313ab40e347368684f1547dd263a9','c57de3ae40fa40f0b723f6279c9da5fc',1299237918619,'36203465b48249aaa5026cee1f97a2b1',0);
INSERT INTO `grouper_group_set` VALUES ('fceab941bafe4b62a46714e28350ddd0',NULL,'<NULL>','fb6582da37214fed85b84929bf254110','fb6582da37214fed85b84929bf254110',NULL,'<NULL>',NULL,'fb6582da37214fed85b84929bf254110',NULL,'fb6582da37214fed85b84929bf254110','3970107f60b6454e920560fe9979d205','3970107f60b6454e920560fe9979d205','fb6582da37214fed85b84929bf254110','immediate',0,NULL,'fceab941bafe4b62a46714e28350ddd0','c57de3ae40fa40f0b723f6279c9da5fc',1299237918627,'36203465b48249aaa5026cee1f97a2b1',0);
INSERT INTO `grouper_group_set` VALUES ('c3575ba878074ea4ba39728b904cee1d',NULL,'<NULL>','fb6582da37214fed85b84929bf254110','fb6582da37214fed85b84929bf254110',NULL,'<NULL>',NULL,'fb6582da37214fed85b84929bf254110',NULL,'fb6582da37214fed85b84929bf254110','40fce8b63a694849a0da1ddaa93887c5','40fce8b63a694849a0da1ddaa93887c5','fb6582da37214fed85b84929bf254110','immediate',0,NULL,'c3575ba878074ea4ba39728b904cee1d','c57de3ae40fa40f0b723f6279c9da5fc',1299237918633,'36203465b48249aaa5026cee1f97a2b1',0);
INSERT INTO `grouper_group_set` VALUES ('91a6bef8e18446528eedb002a28d7690',NULL,'<NULL>','fb6582da37214fed85b84929bf254110','fb6582da37214fed85b84929bf254110',NULL,'<NULL>',NULL,'fb6582da37214fed85b84929bf254110',NULL,'fb6582da37214fed85b84929bf254110','4f5e3c3a49e345cf81bf9896dc213619','4f5e3c3a49e345cf81bf9896dc213619','fb6582da37214fed85b84929bf254110','immediate',0,NULL,'91a6bef8e18446528eedb002a28d7690','c57de3ae40fa40f0b723f6279c9da5fc',1299237918638,'36203465b48249aaa5026cee1f97a2b1',0);
INSERT INTO `grouper_group_set` VALUES ('74599029bb1a4b0aa3e1c568b40fd2be',NULL,'<NULL>','fb6582da37214fed85b84929bf254110','fb6582da37214fed85b84929bf254110',NULL,'<NULL>',NULL,'fb6582da37214fed85b84929bf254110',NULL,'fb6582da37214fed85b84929bf254110','5b99515e6d0e46aa8ca556e0aded3bb7','5b99515e6d0e46aa8ca556e0aded3bb7','fb6582da37214fed85b84929bf254110','immediate',0,NULL,'74599029bb1a4b0aa3e1c568b40fd2be','c57de3ae40fa40f0b723f6279c9da5fc',1299237918666,'36203465b48249aaa5026cee1f97a2b1',0);
INSERT INTO `grouper_group_set` VALUES ('74c133b1318c4971962e6c9bc1b0647d',NULL,'<NULL>','5245b790ba69410b83840db3bed60e33','5245b790ba69410b83840db3bed60e33',NULL,'<NULL>',NULL,'5245b790ba69410b83840db3bed60e33',NULL,'5245b790ba69410b83840db3bed60e33','b4c5190fbf42433fb7ffdcf36a1c5f8c','b4c5190fbf42433fb7ffdcf36a1c5f8c','5245b790ba69410b83840db3bed60e33','immediate',0,NULL,'74c133b1318c4971962e6c9bc1b0647d','c57de3ae40fa40f0b723f6279c9da5fc',1299237391683,'fc223a20a452469fb1af9e672f872443',0);
INSERT INTO `grouper_group_set` VALUES ('1dfdb6ec5482490694d059eead26bd68',NULL,'<NULL>','5245b790ba69410b83840db3bed60e33','5245b790ba69410b83840db3bed60e33',NULL,'<NULL>',NULL,'5245b790ba69410b83840db3bed60e33',NULL,'5245b790ba69410b83840db3bed60e33','699b0f53c252416f90d370dac04ea7ec','699b0f53c252416f90d370dac04ea7ec','5245b790ba69410b83840db3bed60e33','immediate',0,NULL,'1dfdb6ec5482490694d059eead26bd68','c57de3ae40fa40f0b723f6279c9da5fc',1299237391691,'fc223a20a452469fb1af9e672f872443',0);
INSERT INTO `grouper_group_set` VALUES ('15b1726132f743e3b138d21aef7b6cc1',NULL,'<NULL>','5245b790ba69410b83840db3bed60e33','5245b790ba69410b83840db3bed60e33',NULL,'<NULL>',NULL,'5245b790ba69410b83840db3bed60e33',NULL,'5245b790ba69410b83840db3bed60e33','6918a3dbd28549ddb5a4b50b7e8abc3b','6918a3dbd28549ddb5a4b50b7e8abc3b','5245b790ba69410b83840db3bed60e33','immediate',0,NULL,'15b1726132f743e3b138d21aef7b6cc1','c57de3ae40fa40f0b723f6279c9da5fc',1299237391696,'fc223a20a452469fb1af9e672f872443',0);
INSERT INTO `grouper_group_set` VALUES ('98f2d55433ef4d738b181d0a49831c02',NULL,'<NULL>','5245b790ba69410b83840db3bed60e33','5245b790ba69410b83840db3bed60e33',NULL,'<NULL>',NULL,'5245b790ba69410b83840db3bed60e33',NULL,'5245b790ba69410b83840db3bed60e33','3970107f60b6454e920560fe9979d205','3970107f60b6454e920560fe9979d205','5245b790ba69410b83840db3bed60e33','immediate',0,NULL,'98f2d55433ef4d738b181d0a49831c02','c57de3ae40fa40f0b723f6279c9da5fc',1299237391699,'fc223a20a452469fb1af9e672f872443',0);
INSERT INTO `grouper_group_set` VALUES ('60e461eff7c246baa4c1ff6771007809',NULL,'<NULL>','5245b790ba69410b83840db3bed60e33','5245b790ba69410b83840db3bed60e33',NULL,'<NULL>',NULL,'5245b790ba69410b83840db3bed60e33',NULL,'5245b790ba69410b83840db3bed60e33','40fce8b63a694849a0da1ddaa93887c5','40fce8b63a694849a0da1ddaa93887c5','5245b790ba69410b83840db3bed60e33','immediate',0,NULL,'60e461eff7c246baa4c1ff6771007809','c57de3ae40fa40f0b723f6279c9da5fc',1299237391701,'fc223a20a452469fb1af9e672f872443',0);
INSERT INTO `grouper_group_set` VALUES ('ec8d980f5a524baab16a6be740fbf129',NULL,'<NULL>','5245b790ba69410b83840db3bed60e33','5245b790ba69410b83840db3bed60e33',NULL,'<NULL>',NULL,'5245b790ba69410b83840db3bed60e33',NULL,'5245b790ba69410b83840db3bed60e33','4f5e3c3a49e345cf81bf9896dc213619','4f5e3c3a49e345cf81bf9896dc213619','5245b790ba69410b83840db3bed60e33','immediate',0,NULL,'ec8d980f5a524baab16a6be740fbf129','c57de3ae40fa40f0b723f6279c9da5fc',1299237391703,'fc223a20a452469fb1af9e672f872443',0);
INSERT INTO `grouper_group_set` VALUES ('0874b97d9f714e9a8863b0d0556112c5',NULL,'<NULL>','5245b790ba69410b83840db3bed60e33','5245b790ba69410b83840db3bed60e33',NULL,'<NULL>',NULL,'5245b790ba69410b83840db3bed60e33',NULL,'5245b790ba69410b83840db3bed60e33','5b99515e6d0e46aa8ca556e0aded3bb7','5b99515e6d0e46aa8ca556e0aded3bb7','5245b790ba69410b83840db3bed60e33','immediate',0,NULL,'0874b97d9f714e9a8863b0d0556112c5','c57de3ae40fa40f0b723f6279c9da5fc',1299237391711,'fc223a20a452469fb1af9e672f872443',0);
INSERT INTO `grouper_group_set` VALUES ('a67a5fbfd531469d8d8919e5ef4fb2ea',NULL,'<NULL>',NULL,'<NULL>','8f01671ee3da459e958b744dbb453c65','8f01671ee3da459e958b744dbb453c65',NULL,NULL,'8f01671ee3da459e958b744dbb453c65','8f01671ee3da459e958b744dbb453c65','3e216076b7fb4e88bc8107de20a4a23a','3e216076b7fb4e88bc8107de20a4a23a','8f01671ee3da459e958b744dbb453c65','immediate',0,NULL,'a67a5fbfd531469d8d8919e5ef4fb2ea','c57de3ae40fa40f0b723f6279c9da5fc',1301063883348,'26f41240df194c1fab6a8ed983c0753e',0);
INSERT INTO `grouper_group_set` VALUES ('8ecc963918aa47d4add0d3d1f8eca56e',NULL,'<NULL>',NULL,'<NULL>','8f01671ee3da459e958b744dbb453c65','8f01671ee3da459e958b744dbb453c65',NULL,NULL,'8f01671ee3da459e958b744dbb453c65','8f01671ee3da459e958b744dbb453c65','f908e75534c349dc978e8b0f67ce4c74','f908e75534c349dc978e8b0f67ce4c74','8f01671ee3da459e958b744dbb453c65','immediate',0,NULL,'8ecc963918aa47d4add0d3d1f8eca56e','c57de3ae40fa40f0b723f6279c9da5fc',1301063883352,'26f41240df194c1fab6a8ed983c0753e',0);
INSERT INTO `grouper_group_set` VALUES ('ea62f63e35c547a99f1dc4e475e57de1',NULL,'<NULL>',NULL,'<NULL>','d20499b3aad341058d011171ba4f5668','d20499b3aad341058d011171ba4f5668',NULL,NULL,'d20499b3aad341058d011171ba4f5668','d20499b3aad341058d011171ba4f5668','3e216076b7fb4e88bc8107de20a4a23a','3e216076b7fb4e88bc8107de20a4a23a','d20499b3aad341058d011171ba4f5668','immediate',0,NULL,'ea62f63e35c547a99f1dc4e475e57de1','c57de3ae40fa40f0b723f6279c9da5fc',1301063916394,'69b73e9b5c614499a31b1f38625ff3bc',0);
INSERT INTO `grouper_group_set` VALUES ('3d01a85c84444516a11e0ce7bc9897da',NULL,'<NULL>',NULL,'<NULL>','d20499b3aad341058d011171ba4f5668','d20499b3aad341058d011171ba4f5668',NULL,NULL,'d20499b3aad341058d011171ba4f5668','d20499b3aad341058d011171ba4f5668','f908e75534c349dc978e8b0f67ce4c74','f908e75534c349dc978e8b0f67ce4c74','d20499b3aad341058d011171ba4f5668','immediate',0,NULL,'3d01a85c84444516a11e0ce7bc9897da','c57de3ae40fa40f0b723f6279c9da5fc',1301063916396,'69b73e9b5c614499a31b1f38625ff3bc',0);
INSERT INTO `grouper_group_set` VALUES ('5c90d498cb354691868b234fb8ec18f9',NULL,'<NULL>',NULL,'<NULL>','9f0d5c61c39e4043b430a385b2ba5dae','9f0d5c61c39e4043b430a385b2ba5dae',NULL,NULL,'9f0d5c61c39e4043b430a385b2ba5dae','9f0d5c61c39e4043b430a385b2ba5dae','3e216076b7fb4e88bc8107de20a4a23a','3e216076b7fb4e88bc8107de20a4a23a','9f0d5c61c39e4043b430a385b2ba5dae','immediate',0,NULL,'5c90d498cb354691868b234fb8ec18f9','c57de3ae40fa40f0b723f6279c9da5fc',1301063970623,'961439852ebb4514b396b60de239ab54',0);
INSERT INTO `grouper_group_set` VALUES ('e1b2efdd67014ac0bf5cff754ef72c37',NULL,'<NULL>',NULL,'<NULL>','9f0d5c61c39e4043b430a385b2ba5dae','9f0d5c61c39e4043b430a385b2ba5dae',NULL,NULL,'9f0d5c61c39e4043b430a385b2ba5dae','9f0d5c61c39e4043b430a385b2ba5dae','f908e75534c349dc978e8b0f67ce4c74','f908e75534c349dc978e8b0f67ce4c74','9f0d5c61c39e4043b430a385b2ba5dae','immediate',0,NULL,'e1b2efdd67014ac0bf5cff754ef72c37','c57de3ae40fa40f0b723f6279c9da5fc',1301063970625,'961439852ebb4514b396b60de239ab54',0);
INSERT INTO `grouper_group_set` VALUES ('e494396f4e4e4ef69682028e746e55c6',NULL,'<NULL>',NULL,'<NULL>','cee78f561326448e87a896965c3da78f','cee78f561326448e87a896965c3da78f',NULL,NULL,'cee78f561326448e87a896965c3da78f','cee78f561326448e87a896965c3da78f','3e216076b7fb4e88bc8107de20a4a23a','3e216076b7fb4e88bc8107de20a4a23a','cee78f561326448e87a896965c3da78f','immediate',0,NULL,'e494396f4e4e4ef69682028e746e55c6','c57de3ae40fa40f0b723f6279c9da5fc',1303203634750,'f5a58e4fabe047918f1a1e9c530b2217',0);
INSERT INTO `grouper_group_set` VALUES ('fe1abdae18d44e869ce1905617143cc6',NULL,'<NULL>',NULL,'<NULL>','cee78f561326448e87a896965c3da78f','cee78f561326448e87a896965c3da78f',NULL,NULL,'cee78f561326448e87a896965c3da78f','cee78f561326448e87a896965c3da78f','f908e75534c349dc978e8b0f67ce4c74','f908e75534c349dc978e8b0f67ce4c74','cee78f561326448e87a896965c3da78f','immediate',0,NULL,'fe1abdae18d44e869ce1905617143cc6','c57de3ae40fa40f0b723f6279c9da5fc',1303203634757,'f5a58e4fabe047918f1a1e9c530b2217',0);
INSERT INTO `grouper_group_set` VALUES ('d91f0b75756641eda3c0205be0bc2baa',NULL,'<NULL>',NULL,'<NULL>','b758063c3737461d83947897fe0c22ef','b758063c3737461d83947897fe0c22ef',NULL,NULL,'b758063c3737461d83947897fe0c22ef','b758063c3737461d83947897fe0c22ef','3e216076b7fb4e88bc8107de20a4a23a','3e216076b7fb4e88bc8107de20a4a23a','b758063c3737461d83947897fe0c22ef','immediate',0,NULL,'d91f0b75756641eda3c0205be0bc2baa','c57de3ae40fa40f0b723f6279c9da5fc',1311772319483,'d2932a36b7a14f6d8c4d53ca6f22940b',0);
INSERT INTO `grouper_group_set` VALUES ('00ea3fbc6137423ea7eac7e0ee31a312',NULL,'<NULL>',NULL,'<NULL>','b758063c3737461d83947897fe0c22ef','b758063c3737461d83947897fe0c22ef',NULL,NULL,'b758063c3737461d83947897fe0c22ef','b758063c3737461d83947897fe0c22ef','f908e75534c349dc978e8b0f67ce4c74','f908e75534c349dc978e8b0f67ce4c74','b758063c3737461d83947897fe0c22ef','immediate',0,NULL,'00ea3fbc6137423ea7eac7e0ee31a312','c57de3ae40fa40f0b723f6279c9da5fc',1311772319487,'d2932a36b7a14f6d8c4d53ca6f22940b',0);
INSERT INTO `grouper_group_set` VALUES ('e8ae069a4cdb473db0500831e63cd4ab',NULL,'<NULL>',NULL,'<NULL>','3245bb4eec7d4778929b0513909c5641','3245bb4eec7d4778929b0513909c5641',NULL,NULL,'3245bb4eec7d4778929b0513909c5641','3245bb4eec7d4778929b0513909c5641','3e216076b7fb4e88bc8107de20a4a23a','3e216076b7fb4e88bc8107de20a4a23a','3245bb4eec7d4778929b0513909c5641','immediate',0,NULL,'e8ae069a4cdb473db0500831e63cd4ab','c57de3ae40fa40f0b723f6279c9da5fc',1354798749967,'8cbeff4d4fbb42799d0439b48e19e7a2',0);
INSERT INTO `grouper_group_set` VALUES ('89739cf924d74d3c820ca15bb0e38079',NULL,'<NULL>',NULL,'<NULL>','3245bb4eec7d4778929b0513909c5641','3245bb4eec7d4778929b0513909c5641',NULL,NULL,'3245bb4eec7d4778929b0513909c5641','3245bb4eec7d4778929b0513909c5641','f908e75534c349dc978e8b0f67ce4c74','f908e75534c349dc978e8b0f67ce4c74','3245bb4eec7d4778929b0513909c5641','immediate',0,NULL,'89739cf924d74d3c820ca15bb0e38079','c57de3ae40fa40f0b723f6279c9da5fc',1354798749972,'8cbeff4d4fbb42799d0439b48e19e7a2',0);
INSERT INTO `grouper_group_set` VALUES ('3b9d0df079704ccf9cd2f97325aa5ca9',NULL,'<NULL>','a48ceb417e4b43d7901e91c283fb93a0','a48ceb417e4b43d7901e91c283fb93a0',NULL,'<NULL>',NULL,'a48ceb417e4b43d7901e91c283fb93a0',NULL,'a48ceb417e4b43d7901e91c283fb93a0','b4c5190fbf42433fb7ffdcf36a1c5f8c','b4c5190fbf42433fb7ffdcf36a1c5f8c','a48ceb417e4b43d7901e91c283fb93a0','immediate',0,NULL,'3b9d0df079704ccf9cd2f97325aa5ca9','c57de3ae40fa40f0b723f6279c9da5fc',1354798750473,'2075fe5e6b2f4d22a0b6e940811e7361',0);
INSERT INTO `grouper_group_set` VALUES ('054396c03f7c4309ba7a84656a841656',NULL,'<NULL>','a48ceb417e4b43d7901e91c283fb93a0','a48ceb417e4b43d7901e91c283fb93a0',NULL,'<NULL>',NULL,'a48ceb417e4b43d7901e91c283fb93a0',NULL,'a48ceb417e4b43d7901e91c283fb93a0','699b0f53c252416f90d370dac04ea7ec','699b0f53c252416f90d370dac04ea7ec','a48ceb417e4b43d7901e91c283fb93a0','immediate',0,NULL,'054396c03f7c4309ba7a84656a841656','c57de3ae40fa40f0b723f6279c9da5fc',1354798750475,'2075fe5e6b2f4d22a0b6e940811e7361',0);
INSERT INTO `grouper_group_set` VALUES ('4cae271f7db5447da10711b83e0fd606',NULL,'<NULL>','a48ceb417e4b43d7901e91c283fb93a0','a48ceb417e4b43d7901e91c283fb93a0',NULL,'<NULL>',NULL,'a48ceb417e4b43d7901e91c283fb93a0',NULL,'a48ceb417e4b43d7901e91c283fb93a0','6918a3dbd28549ddb5a4b50b7e8abc3b','6918a3dbd28549ddb5a4b50b7e8abc3b','a48ceb417e4b43d7901e91c283fb93a0','immediate',0,NULL,'4cae271f7db5447da10711b83e0fd606','c57de3ae40fa40f0b723f6279c9da5fc',1354798750477,'2075fe5e6b2f4d22a0b6e940811e7361',0);
INSERT INTO `grouper_group_set` VALUES ('8220e709b0874138b295dd0dc48733c2',NULL,'<NULL>','a48ceb417e4b43d7901e91c283fb93a0','a48ceb417e4b43d7901e91c283fb93a0',NULL,'<NULL>',NULL,'a48ceb417e4b43d7901e91c283fb93a0',NULL,'a48ceb417e4b43d7901e91c283fb93a0','3970107f60b6454e920560fe9979d205','3970107f60b6454e920560fe9979d205','a48ceb417e4b43d7901e91c283fb93a0','immediate',0,NULL,'8220e709b0874138b295dd0dc48733c2','c57de3ae40fa40f0b723f6279c9da5fc',1354798750479,'2075fe5e6b2f4d22a0b6e940811e7361',0);
INSERT INTO `grouper_group_set` VALUES ('157d953624c34ab8bf408978c081f591',NULL,'<NULL>','a48ceb417e4b43d7901e91c283fb93a0','a48ceb417e4b43d7901e91c283fb93a0',NULL,'<NULL>',NULL,'a48ceb417e4b43d7901e91c283fb93a0',NULL,'a48ceb417e4b43d7901e91c283fb93a0','40fce8b63a694849a0da1ddaa93887c5','40fce8b63a694849a0da1ddaa93887c5','a48ceb417e4b43d7901e91c283fb93a0','immediate',0,NULL,'157d953624c34ab8bf408978c081f591','c57de3ae40fa40f0b723f6279c9da5fc',1354798750487,'2075fe5e6b2f4d22a0b6e940811e7361',0);
INSERT INTO `grouper_group_set` VALUES ('3093f99ba6404faaa8100dc560e45982',NULL,'<NULL>','a48ceb417e4b43d7901e91c283fb93a0','a48ceb417e4b43d7901e91c283fb93a0',NULL,'<NULL>',NULL,'a48ceb417e4b43d7901e91c283fb93a0',NULL,'a48ceb417e4b43d7901e91c283fb93a0','4f5e3c3a49e345cf81bf9896dc213619','4f5e3c3a49e345cf81bf9896dc213619','a48ceb417e4b43d7901e91c283fb93a0','immediate',0,NULL,'3093f99ba6404faaa8100dc560e45982','c57de3ae40fa40f0b723f6279c9da5fc',1354798750488,'2075fe5e6b2f4d22a0b6e940811e7361',0);
INSERT INTO `grouper_group_set` VALUES ('c90eae14f0e94fd1b2756eafca1f8246',NULL,'<NULL>','a48ceb417e4b43d7901e91c283fb93a0','a48ceb417e4b43d7901e91c283fb93a0',NULL,'<NULL>',NULL,'a48ceb417e4b43d7901e91c283fb93a0',NULL,'a48ceb417e4b43d7901e91c283fb93a0','5b99515e6d0e46aa8ca556e0aded3bb7','5b99515e6d0e46aa8ca556e0aded3bb7','a48ceb417e4b43d7901e91c283fb93a0','immediate',0,NULL,'c90eae14f0e94fd1b2756eafca1f8246','c57de3ae40fa40f0b723f6279c9da5fc',1354798750490,'2075fe5e6b2f4d22a0b6e940811e7361',0);
/*!40000 ALTER TABLE `grouper_group_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_groups`
--

DROP TABLE IF EXISTS `grouper_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_groups` (
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `parent_stem` varchar(40) CHARACTER SET latin1 NOT NULL,
  `creator_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `create_time` bigint(20) NOT NULL,
  `modifier_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `modify_time` bigint(20) DEFAULT NULL,
  `last_membership_change` bigint(20) DEFAULT NULL,
  `alternate_name` varchar(1024) CHARACTER SET latin1 DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `name` varchar(1024) DEFAULT NULL,
  `display_name` varchar(1024) DEFAULT NULL,
  `extension` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `display_extension` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `description` varchar(1024) CHARACTER SET latin1 DEFAULT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `type_of_group` varchar(10) CHARACTER SET latin1 NOT NULL DEFAULT 'group',
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_parent_idx` (`parent_stem`,`extension`),
  UNIQUE KEY `group_name_idx` (`name`(255)),
  KEY `group_last_membership_idx` (`last_membership_change`),
  KEY `group_creator_idx` (`creator_id`),
  KEY `group_createtime_idx` (`create_time`),
  KEY `group_modifier_idx` (`modifier_id`),
  KEY `group_modifytime_idx` (`modify_time`),
  KEY `group_context_idx` (`context_id`),
  KEY `group_alternate_name_idx` (`alternate_name`(255)),
  KEY `group_parent_display_idx` (`parent_stem`,`display_extension`),
  KEY `group_display_name_idx` (`display_name`(255))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_groups`
--

LOCK TABLES `grouper_groups` WRITE;
/*!40000 ALTER TABLE `grouper_groups` DISABLE KEYS */;
INSERT INTO `grouper_groups` VALUES ('5b4b95e447ec41aeb0cb156ea5b2eda7','d6f965c796af4dfcb807a762255b0b52','c57de3ae40fa40f0b723f6279c9da5fc',1299235317739,'c57de3ae40fa40f0b723f6279c9da5fc',1299235317996,1354798561805,NULL,1,'etc:sysadmingroup','etc:sysadmingroup','sysadmingroup','sysadmingroup','Super users','5407dfd8a95e4ad8adeb5ca2072e30d3','group');
INSERT INTO `grouper_groups` VALUES ('37e54589ba0848e3b6d25dcfe75b946f','d6f965c796af4dfcb807a762255b0b52','c57de3ae40fa40f0b723f6279c9da5fc',1299235318030,'c57de3ae40fa40f0b723f6279c9da5fc',1299235318104,1345552382567,NULL,1,'etc:webServiceUsers','etc:webServiceUsers','webServiceUsers','webServiceUsers','users allowed to log in to the WS','09f4e72d6ac34226beff1d962925f5d0','group');
INSERT INTO `grouper_groups` VALUES ('fb6582da37214fed85b84929bf254110','d6f965c796af4dfcb807a762255b0b52','c57de3ae40fa40f0b723f6279c9da5fc',1299237918305,'c57de3ae40fa40f0b723f6279c9da5fc',1299237919162,1299494733878,NULL,1,'etc:webServiceActAsUsers','etc:webServiceActAsUsers','webServiceActAsUsers','webServiceActAsUsers','users allowed to act as other in the WS','b08836b011ee452098ceff308d043f3d','group');
INSERT INTO `grouper_groups` VALUES ('5245b790ba69410b83840db3bed60e33','d6f965c796af4dfcb807a762255b0b52','c57de3ae40fa40f0b723f6279c9da5fc',1299237391573,'c57de3ae40fa40f0b723f6279c9da5fc',1299237391854,1345552383802,NULL,1,'etc:webServiceActAsGroup','etc:webServiceActAsGroup','webServiceActAsGroup','webServiceActAsGroup','webServiceActAsGroup','bb8ece51f2c2453f82f55680d842bf5e','group');
INSERT INTO `grouper_groups` VALUES ('a48ceb417e4b43d7901e91c283fb93a0','3245bb4eec7d4778929b0513909c5641','c57de3ae40fa40f0b723f6279c9da5fc',1354798750435,'c57de3ae40fa40f0b723f6279c9da5fc',1354798750741,1354798751310,NULL,1,'vo:mujina-devs:members','vo:mujina-devs:members','members','members','members','42a5a9df3afe447596314f8a443949a5','group');
/*!40000 ALTER TABLE `grouper_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_groups_types`
--

DROP TABLE IF EXISTS `grouper_groups_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_groups_types` (
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `group_uuid` varchar(40) CHARACTER SET latin1 NOT NULL,
  `type_uuid` varchar(40) CHARACTER SET latin1 NOT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grouptypetyple_grouptype_idx` (`group_uuid`,`type_uuid`),
  KEY `grouptypetuple_type_idx` (`type_uuid`),
  KEY `grouptypetuple_group_idx` (`group_uuid`),
  KEY `grouptypetuple_context_idx` (`context_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_groups_types`
--

LOCK TABLES `grouper_groups_types` WRITE;
/*!40000 ALTER TABLE `grouper_groups_types` DISABLE KEYS */;
INSERT INTO `grouper_groups_types` VALUES ('57ba83d1a87840d794e95a26448a9656','5b4b95e447ec41aeb0cb156ea5b2eda7','a561f3cd149245f482db2ce7b4a115f7',0,'097a334751d94bc6a956be7ba4a0b7d7');
INSERT INTO `grouper_groups_types` VALUES ('4d8a78e5f1df419aa1694725f53fdbd4','37e54589ba0848e3b6d25dcfe75b946f','a561f3cd149245f482db2ce7b4a115f7',0,'59d05e7c2c0a48e08601cdb2bc12ee79');
INSERT INTO `grouper_groups_types` VALUES ('0ec9a8fae33349caa03164ea41bd8f21','fb6582da37214fed85b84929bf254110','a561f3cd149245f482db2ce7b4a115f7',0,'36203465b48249aaa5026cee1f97a2b1');
INSERT INTO `grouper_groups_types` VALUES ('56322e70e77a4e70af653ead6b955110','5245b790ba69410b83840db3bed60e33','a561f3cd149245f482db2ce7b4a115f7',0,'fc223a20a452469fb1af9e672f872443');
INSERT INTO `grouper_groups_types` VALUES ('e185b0773a4b45c9aafaecf307b1bd38','a48ceb417e4b43d7901e91c283fb93a0','a561f3cd149245f482db2ce7b4a115f7',0,'2075fe5e6b2f4d22a0b6e940811e7361');
/*!40000 ALTER TABLE `grouper_groups_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `grouper_groups_types_v`
--

DROP TABLE IF EXISTS `grouper_groups_types_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_groups_types_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_groups_types_v` (
  `GROUP_NAME` longtext,
  `GROUP_DISPLAYNAME` longtext,
  `GROUP_TYPE_NAME` varchar(255),
  `GROUP_ID` varchar(40),
  `GROUP_TYPE_UUID` varchar(40),
  `GROUPER_GROUPS_TYPES_ID` varchar(40),
  `HIBERNATE_VERSION_NUMBER` bigint(20),
  `CONTEXT_ID` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_groups_v`
--

DROP TABLE IF EXISTS `grouper_groups_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_groups_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_groups_v` (
  `EXTENSION` varchar(255),
  `NAME` varchar(1024),
  `DISPLAY_EXTENSION` varchar(255),
  `DISPLAY_NAME` varchar(1024),
  `DESCRIPTION` varchar(1024),
  `PARENT_STEM_NAME` varchar(255),
  `TYPE_OF_GROUP` varchar(10),
  `GROUP_ID` varchar(40),
  `PARENT_STEM_ID` varchar(40),
  `MODIFIER_SOURCE` varchar(255),
  `MODIFIER_SUBJECT_ID` varchar(255),
  `CREATOR_SOURCE` varchar(255),
  `CREATOR_SUBJECT_ID` varchar(255),
  `IS_COMPOSITE_OWNER` varchar(1),
  `IS_COMPOSITE_FACTOR` varchar(1),
  `CREATOR_ID` varchar(40),
  `CREATE_TIME` bigint(20),
  `MODIFIER_ID` varchar(40),
  `MODIFY_TIME` bigint(20),
  `HIBERNATE_VERSION_NUMBER` bigint(20),
  `CONTEXT_ID` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grouper_loader_log`
--

DROP TABLE IF EXISTS `grouper_loader_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_loader_log` (
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `job_name` varchar(512) CHARACTER SET latin1 DEFAULT NULL,
  `status` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `started_time` datetime DEFAULT NULL,
  `ended_time` datetime DEFAULT NULL,
  `millis` int(11) DEFAULT NULL,
  `millis_get_data` int(11) DEFAULT NULL,
  `millis_load_data` int(11) DEFAULT NULL,
  `job_type` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `job_schedule_type` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `job_description` text CHARACTER SET latin1,
  `job_message` text CHARACTER SET latin1,
  `host` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `group_uuid` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `job_schedule_quartz_cron` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `job_schedule_interval_seconds` int(11) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `unresolvable_subject_count` int(11) DEFAULT NULL,
  `insert_count` int(11) DEFAULT NULL,
  `update_count` int(11) DEFAULT NULL,
  `delete_count` int(11) DEFAULT NULL,
  `total_count` int(11) DEFAULT NULL,
  `parent_job_name` varchar(512) CHARACTER SET latin1 DEFAULT NULL,
  `parent_job_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `and_group_names` varchar(512) CHARACTER SET latin1 DEFAULT NULL,
  `job_schedule_priority` int(11) DEFAULT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loader_context_idx` (`context_id`),
  KEY `grouper_loader_job_name_idx` (`job_name`(255),`status`,`ended_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_loader_log`
--

LOCK TABLES `grouper_loader_log` WRITE;
/*!40000 ALTER TABLE `grouper_loader_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouper_loader_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_members`
--

DROP TABLE IF EXISTS `grouper_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_members` (
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `subject_id` varchar(255) CHARACTER SET latin1 NOT NULL,
  `subject_source` varchar(255) CHARACTER SET latin1 NOT NULL,
  `subject_type` varchar(255) CHARACTER SET latin1 NOT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_subjectsourcetype_idx` (`subject_id`,`subject_source`,`subject_type`),
  KEY `member_subjectsource_idx` (`subject_source`),
  KEY `member_subjectid_idx` (`subject_id`),
  KEY `member_subjecttype_idx` (`subject_type`),
  KEY `member_context_idx` (`context_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_members`
--

LOCK TABLES `grouper_members` WRITE;
/*!40000 ALTER TABLE `grouper_members` DISABLE KEYS */;
INSERT INTO `grouper_members` VALUES ('c57de3ae40fa40f0b723f6279c9da5fc','GrouperSystem','g:isa','application',0,NULL);
INSERT INTO `grouper_members` VALUES ('0fc4de59e2d040e4b9708826c78267a0','GrouperAll','g:isa','application',0,'097a334751d94bc6a956be7ba4a0b7d7');
INSERT INTO `grouper_members` VALUES ('7ef31b1eca794d14b8a28180d3ede45a','engine','applications','person',0,NULL);
INSERT INTO `grouper_members` VALUES ('894943352e664c579ef371fb08b7b282','gadget','applications','person',0,NULL);
INSERT INTO `grouper_members` VALUES ('79f271b8c0d644f399d1bbce2153750b','surfmedia','applications','person',0,NULL);
INSERT INTO `grouper_members` VALUES ('27b3ba8bce7d4f2f9e160f029bca6315','urn:collab:person:example.com:admin','surfnet','person',0,NULL);
/*!40000 ALTER TABLE `grouper_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouper_memberships`
--

DROP TABLE IF EXISTS `grouper_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_memberships` (
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `member_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `owner_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `field_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `owner_group_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `owner_stem_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `owner_attr_def_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `via_composite_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `enabled` varchar(1) CHARACTER SET latin1 NOT NULL DEFAULT 'T',
  `enabled_timestamp` bigint(20) DEFAULT NULL,
  `disabled_timestamp` bigint(20) DEFAULT NULL,
  `mship_type` varchar(32) CHARACTER SET latin1 NOT NULL,
  `creator_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `create_time` bigint(20) NOT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `membership_uniq_idx` (`owner_id`,`member_id`,`field_id`),
  KEY `membership_owner_group_idx` (`owner_group_id`),
  KEY `membership_owner_stem_idx` (`owner_stem_id`),
  KEY `membership_owner_attr_idx` (`owner_attr_def_id`),
  KEY `membership_via_composite_idx` (`via_composite_id`),
  KEY `membership_member_cvia_idx` (`member_id`,`via_composite_id`),
  KEY `membership_gowner_member_idx` (`owner_group_id`,`member_id`,`field_id`),
  KEY `membership_sowner_member_idx` (`owner_stem_id`,`member_id`,`field_id`),
  KEY `membership_aowner_member_idx` (`owner_attr_def_id`,`member_id`,`field_id`),
  KEY `membership_enabled_idx` (`enabled`),
  KEY `membership_enabled_time_idx` (`enabled_timestamp`),
  KEY `membership_disabled_time_idx` (`disabled_timestamp`),
  KEY `membership_createtime_idx` (`create_time`),
  KEY `membership_creator_idx` (`creator_id`),
  KEY `membership_member_idx` (`member_id`),
  KEY `membership_member_list_idx` (`member_id`,`field_id`),
  KEY `membership_gowner_field_type_idx` (`owner_group_id`,`field_id`,`mship_type`),
  KEY `membership_sowner_field_type_idx` (`owner_stem_id`,`field_id`,`mship_type`),
  KEY `membership_type_idx` (`mship_type`),
  KEY `membership_context_idx` (`context_id`),
  KEY `fk_membership_field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_memberships`
--

LOCK TABLES `grouper_memberships` WRITE;
/*!40000 ALTER TABLE `grouper_memberships` DISABLE KEYS */;
INSERT INTO `grouper_memberships` VALUES ('e547e3b6022e4fb8b9480b80ab03a157','c57de3ae40fa40f0b723f6279c9da5fc','d6f965c796af4dfcb807a762255b0b52','f908e75534c349dc978e8b0f67ce4c74',NULL,'d6f965c796af4dfcb807a762255b0b52',NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1299235317512,0,'3a6c5ae3e85a4b5b9ae335d353ff8fae');
INSERT INTO `grouper_memberships` VALUES ('3aa4e8edfa9c433e96276e51d70fcd99','c57de3ae40fa40f0b723f6279c9da5fc','5b4b95e447ec41aeb0cb156ea5b2eda7','b4c5190fbf42433fb7ffdcf36a1c5f8c','5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1299235317928,0,'097a334751d94bc6a956be7ba4a0b7d7');
INSERT INTO `grouper_memberships` VALUES ('09fe68f72c5345b093b6240d796f8bbc','0fc4de59e2d040e4b9708826c78267a0','5b4b95e447ec41aeb0cb156ea5b2eda7','5b99515e6d0e46aa8ca556e0aded3bb7','5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1299235317977,0,'097a334751d94bc6a956be7ba4a0b7d7');
INSERT INTO `grouper_memberships` VALUES ('27d4a249a677489b815e11a833f0e2ca','c57de3ae40fa40f0b723f6279c9da5fc','37e54589ba0848e3b6d25dcfe75b946f','b4c5190fbf42433fb7ffdcf36a1c5f8c','37e54589ba0848e3b6d25dcfe75b946f',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1299235318054,0,'59d05e7c2c0a48e08601cdb2bc12ee79');
INSERT INTO `grouper_memberships` VALUES ('17339b29acec443a9202fb4e589fde05','0fc4de59e2d040e4b9708826c78267a0','37e54589ba0848e3b6d25dcfe75b946f','5b99515e6d0e46aa8ca556e0aded3bb7','37e54589ba0848e3b6d25dcfe75b946f',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1299235318072,0,'59d05e7c2c0a48e08601cdb2bc12ee79');
INSERT INTO `grouper_memberships` VALUES ('78e91653b748410fa3938fd8f963af5b','0fc4de59e2d040e4b9708826c78267a0','fb6582da37214fed85b84929bf254110','5b99515e6d0e46aa8ca556e0aded3bb7','fb6582da37214fed85b84929bf254110',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1299237918953,0,'36203465b48249aaa5026cee1f97a2b1');
INSERT INTO `grouper_memberships` VALUES ('148d09a032f541a1a51b832632ba7d9b','c57de3ae40fa40f0b723f6279c9da5fc','fb6582da37214fed85b84929bf254110','b4c5190fbf42433fb7ffdcf36a1c5f8c','fb6582da37214fed85b84929bf254110',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1299237918821,0,'36203465b48249aaa5026cee1f97a2b1');
INSERT INTO `grouper_memberships` VALUES ('fef82cefb2354ed1b714116d66cf8713','c57de3ae40fa40f0b723f6279c9da5fc','5245b790ba69410b83840db3bed60e33','b4c5190fbf42433fb7ffdcf36a1c5f8c','5245b790ba69410b83840db3bed60e33',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1299237391735,0,'fc223a20a452469fb1af9e672f872443');
INSERT INTO `grouper_memberships` VALUES ('d8594a755735430aa13a41564689dccc','0fc4de59e2d040e4b9708826c78267a0','5245b790ba69410b83840db3bed60e33','5b99515e6d0e46aa8ca556e0aded3bb7','5245b790ba69410b83840db3bed60e33',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1299237391777,0,'fc223a20a452469fb1af9e672f872443');
INSERT INTO `grouper_memberships` VALUES ('6e053f2b49f34ccca5dc12db23f72153','7ef31b1eca794d14b8a28180d3ede45a','5245b790ba69410b83840db3bed60e33','699b0f53c252416f90d370dac04ea7ec','5245b790ba69410b83840db3bed60e33',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1299238076558,0,'12ee49ac8d504a7fb1854df939add345');
INSERT INTO `grouper_memberships` VALUES ('3da0f601d0f5404b99c6c9da8ef3c844','894943352e664c579ef371fb08b7b282','5245b790ba69410b83840db3bed60e33','699b0f53c252416f90d370dac04ea7ec','5245b790ba69410b83840db3bed60e33',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1299238086823,0,'bd191852a6cd4ec0923012f30944b0a2');
INSERT INTO `grouper_memberships` VALUES ('44925a0c8d6646339215b6f89cb15afb','7ef31b1eca794d14b8a28180d3ede45a','37e54589ba0848e3b6d25dcfe75b946f','699b0f53c252416f90d370dac04ea7ec','37e54589ba0848e3b6d25dcfe75b946f',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1299238135005,0,'2571f11f7cd3495caf581e00e02b474a');
INSERT INTO `grouper_memberships` VALUES ('ac49f351c2bd453e8da0bfd17efa9c2e','894943352e664c579ef371fb08b7b282','37e54589ba0848e3b6d25dcfe75b946f','699b0f53c252416f90d370dac04ea7ec','37e54589ba0848e3b6d25dcfe75b946f',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1299238141383,0,'81640684999046f6ba2cfd2d47c98c8d');
INSERT INTO `grouper_memberships` VALUES ('f9d7f0fc938c4dccb4439fb9f7324751','c018a3f2a7da4f62b322f5c4745e35d4','5b4b95e447ec41aeb0cb156ea5b2eda7','699b0f53c252416f90d370dac04ea7ec','5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1299494733396,0,'8d817adef78845c2937a81a893ef595e');
INSERT INTO `grouper_memberships` VALUES ('c2c06bd6e69946bea5487af886f91f54','6ba4365555784afca4315881357429bd','37e54589ba0848e3b6d25dcfe75b946f','699b0f53c252416f90d370dac04ea7ec','37e54589ba0848e3b6d25dcfe75b946f',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1299494733825,0,'15836448feae417eb10c62090c702882');
INSERT INTO `grouper_memberships` VALUES ('8854ae9bab174e30accd7315f5164f35','6ba4365555784afca4315881357429bd','fb6582da37214fed85b84929bf254110','699b0f53c252416f90d370dac04ea7ec','fb6582da37214fed85b84929bf254110',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1299494733867,0,'781b583b13c74ffba28fd4ac64d0957d');
INSERT INTO `grouper_memberships` VALUES ('2e266fff1bff465294bd62998afca6df','c57de3ae40fa40f0b723f6279c9da5fc','8f01671ee3da459e958b744dbb453c65','f908e75534c349dc978e8b0f67ce4c74',NULL,'8f01671ee3da459e958b744dbb453c65',NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1301063883398,0,'26f41240df194c1fab6a8ed983c0753e');
INSERT INTO `grouper_memberships` VALUES ('e3a81c933bbb40b69b3ee3f86f768ade','c57de3ae40fa40f0b723f6279c9da5fc','8f01671ee3da459e958b744dbb453c65','3e216076b7fb4e88bc8107de20a4a23a',NULL,'8f01671ee3da459e958b744dbb453c65',NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1301063883587,0,'8e3d431dc4124a6c95f0d04ec1985c97');
INSERT INTO `grouper_memberships` VALUES ('50082eb764694014b34bc7ec3ac5190c','c57de3ae40fa40f0b723f6279c9da5fc','d20499b3aad341058d011171ba4f5668','f908e75534c349dc978e8b0f67ce4c74',NULL,'d20499b3aad341058d011171ba4f5668',NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1301063916414,0,'69b73e9b5c614499a31b1f38625ff3bc');
INSERT INTO `grouper_memberships` VALUES ('0ad2c39d850343f9bbb8c5a7621a1715','c57de3ae40fa40f0b723f6279c9da5fc','d20499b3aad341058d011171ba4f5668','3e216076b7fb4e88bc8107de20a4a23a',NULL,'d20499b3aad341058d011171ba4f5668',NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1301063916453,0,'d52e1a3711ca4b7bb82ce95f99f658c5');
INSERT INTO `grouper_memberships` VALUES ('13dc2b751fc1408d840b91d85c3a71c9','c57de3ae40fa40f0b723f6279c9da5fc','9f0d5c61c39e4043b430a385b2ba5dae','f908e75534c349dc978e8b0f67ce4c74',NULL,'9f0d5c61c39e4043b430a385b2ba5dae',NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1301063970637,0,'961439852ebb4514b396b60de239ab54');
INSERT INTO `grouper_memberships` VALUES ('0648474c08984ebf81399c3928bed206','c57de3ae40fa40f0b723f6279c9da5fc','9f0d5c61c39e4043b430a385b2ba5dae','3e216076b7fb4e88bc8107de20a4a23a',NULL,'9f0d5c61c39e4043b430a385b2ba5dae',NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1301063970665,0,'3d649b5731cf4035991915bc55a85e3e');
INSERT INTO `grouper_memberships` VALUES ('a0def6d9b18c4233980d3548452eac65','c57de3ae40fa40f0b723f6279c9da5fc','b758063c3737461d83947897fe0c22ef','f908e75534c349dc978e8b0f67ce4c74',NULL,'b758063c3737461d83947897fe0c22ef',NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1311772319516,0,'d2932a36b7a14f6d8c4d53ca6f22940b');
INSERT INTO `grouper_memberships` VALUES ('406af8a0b73a4b77857f4d66d6668583','79f271b8c0d644f399d1bbce2153750b','37e54589ba0848e3b6d25dcfe75b946f','699b0f53c252416f90d370dac04ea7ec','37e54589ba0848e3b6d25dcfe75b946f',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1302776409967,0,'d0e6135fedf14bf3a385705b1249dc36');
INSERT INTO `grouper_memberships` VALUES ('67616e589320410ebf1a93b65276a1fe','79f271b8c0d644f399d1bbce2153750b','5245b790ba69410b83840db3bed60e33','699b0f53c252416f90d370dac04ea7ec','5245b790ba69410b83840db3bed60e33',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1302776461945,0,'a9e8c9b92bab47a48d300846af7c00e6');
INSERT INTO `grouper_memberships` VALUES ('bc82657cd11c4842839a476ae603b792','c57de3ae40fa40f0b723f6279c9da5fc','cee78f561326448e87a896965c3da78f','f908e75534c349dc978e8b0f67ce4c74',NULL,'cee78f561326448e87a896965c3da78f',NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1303203634779,0,'f5a58e4fabe047918f1a1e9c530b2217');
INSERT INTO `grouper_memberships` VALUES ('bf82ca502d654bf0a519d1bacfaceb9f','c57de3ae40fa40f0b723f6279c9da5fc','cee78f561326448e87a896965c3da78f','3e216076b7fb4e88bc8107de20a4a23a',NULL,'cee78f561326448e87a896965c3da78f',NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1303203634903,0,'fadc2e7c314a4410974ee8a692de8a28');
INSERT INTO `grouper_memberships` VALUES ('733afce4316f428d9d5e179f80a58336','c57de3ae40fa40f0b723f6279c9da5fc','b758063c3737461d83947897fe0c22ef','3e216076b7fb4e88bc8107de20a4a23a',NULL,'b758063c3737461d83947897fe0c22ef',NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1311772319616,0,'ab71ca68ce834d0baf16ab218549c1e7');
INSERT INTO `grouper_memberships` VALUES ('86da196705b84f9ca62d900e6d6a8794','2f7c79b2796f426e9a72cd5102883a52','5b4b95e447ec41aeb0cb156ea5b2eda7','4f5e3c3a49e345cf81bf9896dc213619','5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1322477985473,0,'5f1a381369ed4e7e8d8e46c30453f12b');
INSERT INTO `grouper_memberships` VALUES ('28e218aa72054bc8865f44363400b5bb','2f7c79b2796f426e9a72cd5102883a52','5b4b95e447ec41aeb0cb156ea5b2eda7','699b0f53c252416f90d370dac04ea7ec','5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1322477965111,0,'7b47c0ce156d42bb9bab3cd748e193a0');
INSERT INTO `grouper_memberships` VALUES ('e8f3a72f2ff749e8ab1aa37c618a1592','2f7c79b2796f426e9a72cd5102883a52','5b4b95e447ec41aeb0cb156ea5b2eda7','b4c5190fbf42433fb7ffdcf36a1c5f8c','5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1322477985381,0,'102c1d1bd25f4c509fd6bb352ebd15c4');
INSERT INTO `grouper_memberships` VALUES ('14da641c90914d93b6226d0666a418f3','2f7c79b2796f426e9a72cd5102883a52','5b4b95e447ec41aeb0cb156ea5b2eda7','40fce8b63a694849a0da1ddaa93887c5','5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1322477985510,0,'f05c6d51fb194023af5cc0b6edf5c097');
INSERT INTO `grouper_memberships` VALUES ('df09b2011dc549199edb8dde5ff6fef5','2f7c79b2796f426e9a72cd5102883a52','5b4b95e447ec41aeb0cb156ea5b2eda7','5b99515e6d0e46aa8ca556e0aded3bb7','5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1322477985535,0,'cd92ee5486584e0ea96f3582f5d2e723');
INSERT INTO `grouper_memberships` VALUES ('b568cd9e2bb647d9b485076c487d15aa','2f7c79b2796f426e9a72cd5102883a52','5b4b95e447ec41aeb0cb156ea5b2eda7','6918a3dbd28549ddb5a4b50b7e8abc3b','5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1322477985568,0,'7cd6b15c10e044ddb13996c8f6dc8069');
INSERT INTO `grouper_memberships` VALUES ('a24c8d4262774d94924c7ce649ff0ba3','2f7c79b2796f426e9a72cd5102883a52','5b4b95e447ec41aeb0cb156ea5b2eda7','3970107f60b6454e920560fe9979d205','5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1322477985598,0,'636ba0ec4ccf4537bb7f364f98b6da42');
INSERT INTO `grouper_memberships` VALUES ('898b56a76a6846ea8d25a638ae087e23','c57de3ae40fa40f0b723f6279c9da5fc','3245bb4eec7d4778929b0513909c5641','f908e75534c349dc978e8b0f67ce4c74',NULL,'3245bb4eec7d4778929b0513909c5641',NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1354798749996,0,'8cbeff4d4fbb42799d0439b48e19e7a2');
INSERT INTO `grouper_memberships` VALUES ('5bc8522d5764436a84a036d6791dd84b','c57de3ae40fa40f0b723f6279c9da5fc','a48ceb417e4b43d7901e91c283fb93a0','b4c5190fbf42433fb7ffdcf36a1c5f8c','a48ceb417e4b43d7901e91c283fb93a0',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1354798750563,0,'2075fe5e6b2f4d22a0b6e940811e7361');
INSERT INTO `grouper_memberships` VALUES ('864b0040a59b469589855b27e5cf47e0','0fc4de59e2d040e4b9708826c78267a0','a48ceb417e4b43d7901e91c283fb93a0','5b99515e6d0e46aa8ca556e0aded3bb7','a48ceb417e4b43d7901e91c283fb93a0',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1354798750700,0,'2075fe5e6b2f4d22a0b6e940811e7361');
INSERT INTO `grouper_memberships` VALUES ('cab1e3d5dd764138901f0bfff047049a','9854dd475e0d44d8815d402add3c409a','a48ceb417e4b43d7901e91c283fb93a0','699b0f53c252416f90d370dac04ea7ec','a48ceb417e4b43d7901e91c283fb93a0',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1354798750988,0,'a8a2b03d8422406f8aa16c1373409bd4');
INSERT INTO `grouper_memberships` VALUES ('98f0c4b5b6704907a83d27da1f2a9189','9854dd475e0d44d8815d402add3c409a','a48ceb417e4b43d7901e91c283fb93a0','b4c5190fbf42433fb7ffdcf36a1c5f8c','a48ceb417e4b43d7901e91c283fb93a0',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1354798751175,0,'82e48c90fa744d9e98ccfa7ad4df32db');
INSERT INTO `grouper_memberships` VALUES ('135c7d1163cd4dcc986e748c691b5a25','9854dd475e0d44d8815d402add3c409a','a48ceb417e4b43d7901e91c283fb93a0','40fce8b63a694849a0da1ddaa93887c5','a48ceb417e4b43d7901e91c283fb93a0',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1354798751241,0,'48c396026ed74e0ca9463796c99b4dc8');
INSERT INTO `grouper_memberships` VALUES ('fa4d7f80ec0e4321b8a5218f2048e20f','9854dd475e0d44d8815d402add3c409a','a48ceb417e4b43d7901e91c283fb93a0','3970107f60b6454e920560fe9979d205','a48ceb417e4b43d7901e91c283fb93a0',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1354798751286,0,'0326a20d6c6846f4ba622695d9aca37d');
INSERT INTO `grouper_memberships` VALUES ('61955e421e8e4f44a7f3faf151622a94','9854dd475e0d44d8815d402add3c409a','a48ceb417e4b43d7901e91c283fb93a0','4f5e3c3a49e345cf81bf9896dc213619','a48ceb417e4b43d7901e91c283fb93a0',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1354798751306,0,'c2f3cad3021a40e99feeaf7501692fd0');
INSERT INTO `grouper_memberships` VALUES ('9dc4b4aa525443f8b0535a04f7a436b0','ed0ca0030d964576ab3df1ec9ec9f324','5245b790ba69410b83840db3bed60e33','699b0f53c252416f90d370dac04ea7ec','5245b790ba69410b83840db3bed60e33',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1345552383600,0,'54ec0c4f8b1f422fa3bfb9bf0831f16e');
INSERT INTO `grouper_memberships` VALUES ('ea6e5631ddc644b4960c5b0b316a698e','1f59b36af08d48f587928ff1d0ec5bc9','5b4b95e447ec41aeb0cb156ea5b2eda7','699b0f53c252416f90d370dac04ea7ec','5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1345552375782,0,'7b80b1c188b84e7e828c6a5395c9c910');
INSERT INTO `grouper_memberships` VALUES ('f1f0b5ba9b5c46fe93c88dfb31faa81d','ed0ca0030d964576ab3df1ec9ec9f324','5b4b95e447ec41aeb0cb156ea5b2eda7','699b0f53c252416f90d370dac04ea7ec','5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1345552381045,0,'4f37e9f0848645219bc567fb46ea7f5d');
INSERT INTO `grouper_memberships` VALUES ('1b55275284ea47be9c933c3a14f5055b','1f59b36af08d48f587928ff1d0ec5bc9','37e54589ba0848e3b6d25dcfe75b946f','699b0f53c252416f90d370dac04ea7ec','37e54589ba0848e3b6d25dcfe75b946f',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1345552381797,0,'41bc4aabc4684832af353d847f5b7c54');
INSERT INTO `grouper_memberships` VALUES ('4660927822504f08ba81dff0a8f81095','ed0ca0030d964576ab3df1ec9ec9f324','37e54589ba0848e3b6d25dcfe75b946f','699b0f53c252416f90d370dac04ea7ec','37e54589ba0848e3b6d25dcfe75b946f',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1345552382386,0,'caa4d3557e534f2ba3bb6ae1be0a9aac');
INSERT INTO `grouper_memberships` VALUES ('225ff76e77d54b2b8561cfd4568bcd9a','1f59b36af08d48f587928ff1d0ec5bc9','5245b790ba69410b83840db3bed60e33','699b0f53c252416f90d370dac04ea7ec','5245b790ba69410b83840db3bed60e33',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1345552383020,0,'97fb2a9bcfe74efd945d20314b10c2cf');
INSERT INTO `grouper_memberships` VALUES ('8269860a530d4586948e5381f1f65edc','27b3ba8bce7d4f2f9e160f029bca6315','5b4b95e447ec41aeb0cb156ea5b2eda7','699b0f53c252416f90d370dac04ea7ec','5b4b95e447ec41aeb0cb156ea5b2eda7',NULL,NULL,NULL,'T',NULL,NULL,'immediate','c57de3ae40fa40f0b723f6279c9da5fc',1322477965637,0,'e73a27d593b34f018ac956d73f4efc86');
/*!40000 ALTER TABLE `grouper_memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `grouper_memberships_all_v`
--

DROP TABLE IF EXISTS `grouper_memberships_all_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_memberships_all_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_memberships_all_v` (
  `MEMBERSHIP_ID` varchar(81),
  `IMMEDIATE_MEMBERSHIP_ID` varchar(40),
  `GROUP_SET_ID` varchar(40),
  `MEMBER_ID` varchar(40),
  `FIELD_ID` varchar(40),
  `IMMEDIATE_FIELD_ID` varchar(40),
  `OWNER_ID` varchar(40),
  `OWNER_ATTR_DEF_ID` varchar(40),
  `OWNER_GROUP_ID` varchar(40),
  `OWNER_STEM_ID` varchar(40),
  `VIA_GROUP_ID` varchar(40),
  `VIA_COMPOSITE_ID` varchar(40),
  `DEPTH` int(11),
  `MSHIP_TYPE` varchar(16),
  `IMMEDIATE_MSHIP_ENABLED` varchar(1),
  `IMMEDIATE_MSHIP_ENABLED_TIME` bigint(20),
  `IMMEDIATE_MSHIP_DISABLED_TIME` bigint(20),
  `GROUP_SET_PARENT_ID` varchar(40),
  `MEMBERSHIP_CREATOR_ID` varchar(40),
  `MEMBERSHIP_CREATE_TIME` bigint(20),
  `GROUP_SET_CREATOR_ID` varchar(40),
  `GROUP_SET_CREATE_TIME` bigint(20),
  `HIBERNATE_VERSION_NUMBER` bigint(20),
  `CONTEXT_ID` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_memberships_lw_v`
--

DROP TABLE IF EXISTS `grouper_memberships_lw_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_memberships_lw_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_memberships_lw_v` (
  `SUBJECT_ID` varchar(255),
  `SUBJECT_SOURCE` varchar(255),
  `GROUP_NAME` varchar(1024),
  `LIST_NAME` varchar(32),
  `LIST_TYPE` varchar(32),
  `GROUP_ID` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_memberships_v`
--

DROP TABLE IF EXISTS `grouper_memberships_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_memberships_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_memberships_v` (
  `GROUP_NAME` longtext,
  `GROUP_DISPLAYNAME` longtext,
  `STEM_NAME` varchar(255),
  `STEM_DISPLAYNAME` varchar(255),
  `SUBJECT_ID` varchar(255),
  `SUBJECT_SOURCE` varchar(255),
  `MEMBER_ID` varchar(40),
  `LIST_TYPE` varchar(32),
  `LIST_NAME` varchar(32),
  `MEMBERSHIP_TYPE` varchar(16),
  `COMPOSITE_PARENT_GROUP_NAME` longtext,
  `DEPTH` int(11),
  `CREATOR_SOURCE` varchar(255),
  `CREATOR_SUBJECT_ID` varchar(255),
  `MEMBERSHIP_ID` varchar(81),
  `IMMEDIATE_MEMBERSHIP_ID` varchar(40),
  `GROUP_SET_ID` varchar(40),
  `STEM_ID` varchar(40),
  `GROUP_ID` varchar(40),
  `CREATE_TIME` bigint(20),
  `CREATOR_ID` varchar(40),
  `FIELD_ID` varchar(40),
  `CONTEXT_ID` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_mship_attr_flat_lw_v`
--

DROP TABLE IF EXISTS `grouper_mship_attr_flat_lw_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_mship_attr_flat_lw_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_mship_attr_flat_lw_v` (
  `subject_id` varchar(255),
  `subject_source` varchar(255),
  `attribute_def_name` varchar(1024),
  `list_name` varchar(32),
  `list_type` varchar(32),
  `attribute_def_id` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_mship_attrdef_lw_v`
--

DROP TABLE IF EXISTS `grouper_mship_attrdef_lw_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_mship_attrdef_lw_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_mship_attrdef_lw_v` (
  `SUBJECT_ID` varchar(255),
  `SUBJECT_SOURCE` varchar(255),
  `ATTRIBUTE_DEF_NAME` varchar(1024),
  `LIST_NAME` varchar(32),
  `LIST_TYPE` varchar(32),
  `ATTRIBUTE_DEF_ID` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_mship_group_flat_lw_v`
--

DROP TABLE IF EXISTS `grouper_mship_group_flat_lw_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_mship_group_flat_lw_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_mship_group_flat_lw_v` (
  `subject_id` varchar(255),
  `subject_source` varchar(255),
  `group_name` varchar(1024),
  `list_name` varchar(32),
  `list_type` varchar(32),
  `group_id` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_mship_stem_flat_lw_v`
--

DROP TABLE IF EXISTS `grouper_mship_stem_flat_lw_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_mship_stem_flat_lw_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_mship_stem_flat_lw_v` (
  `subject_id` varchar(255),
  `subject_source` varchar(255),
  `stem_name` varchar(255),
  `list_name` varchar(32),
  `list_type` varchar(32),
  `stem_id` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_mship_stem_lw_v`
--

DROP TABLE IF EXISTS `grouper_mship_stem_lw_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_mship_stem_lw_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_mship_stem_lw_v` (
  `SUBJECT_ID` varchar(255),
  `SUBJECT_SOURCE` varchar(255),
  `STEM_NAME` varchar(255),
  `LIST_NAME` varchar(32),
  `LIST_TYPE` varchar(32),
  `STEM_ID` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_perms_all_v`
--

DROP TABLE IF EXISTS `grouper_perms_all_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_perms_all_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_perms_all_v` (
  `role_name` longtext,
  `subject_source_id` varchar(255),
  `subject_id` varchar(255),
  `action` varchar(40),
  `attribute_def_name_name` longtext,
  `attribute_def_name_disp_name` longtext,
  `role_display_name` longtext,
  `attribute_assign_delegatable` varchar(15),
  `enabled` varchar(1),
  `enabled_time` bigint(20),
  `disabled_time` bigint(20),
  `role_id` varchar(40),
  `attribute_def_id` varchar(40),
  `member_id` varchar(40),
  `attribute_def_name_id` varchar(40),
  `action_id` varchar(40),
  `membership_depth` int(11),
  `role_set_depth` bigint(20),
  `attr_def_name_set_depth` bigint(20),
  `attr_assign_action_set_depth` bigint(20),
  `membership_id` varchar(81),
  `attribute_assign_id` varchar(40),
  `permission_type` varchar(12),
  `assignment_notes` longtext
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_perms_role_subject_v`
--

DROP TABLE IF EXISTS `grouper_perms_role_subject_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_perms_role_subject_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_perms_role_subject_v` (
  `role_name` varchar(1024),
  `subject_source_id` varchar(255),
  `subject_id` varchar(255),
  `action` varchar(40),
  `attribute_def_name_name` varchar(1024),
  `attribute_def_name_disp_name` varchar(1024),
  `role_display_name` varchar(1024),
  `attribute_assign_delegatable` varchar(15),
  `enabled` varchar(1),
  `enabled_time` bigint(20),
  `disabled_time` bigint(20),
  `role_id` varchar(40),
  `attribute_def_id` varchar(40),
  `member_id` varchar(40),
  `attribute_def_name_id` varchar(40),
  `action_id` varchar(40),
  `membership_depth` int(11),
  `role_set_depth` int(2),
  `attr_def_name_set_depth` bigint(20),
  `attr_assign_action_set_depth` bigint(20),
  `membership_id` varchar(81),
  `attribute_assign_id` varchar(40),
  `permission_type` varchar(12),
  `assignment_notes` varchar(1024)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_perms_role_v`
--

DROP TABLE IF EXISTS `grouper_perms_role_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_perms_role_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_perms_role_v` (
  `role_name` varchar(1024),
  `subject_source_id` varchar(255),
  `subject_id` varchar(255),
  `action` varchar(40),
  `attribute_def_name_name` varchar(1024),
  `attribute_def_name_disp_name` varchar(1024),
  `role_display_name` varchar(1024),
  `attribute_assign_delegatable` varchar(15),
  `enabled` varchar(1),
  `enabled_time` bigint(20),
  `disabled_time` bigint(20),
  `role_id` varchar(40),
  `attribute_def_id` varchar(40),
  `member_id` varchar(40),
  `attribute_def_name_id` varchar(40),
  `action_id` varchar(40),
  `membership_depth` int(11),
  `role_set_depth` bigint(20),
  `attr_def_name_set_depth` bigint(20),
  `attr_assign_action_set_depth` bigint(20),
  `membership_id` varchar(81),
  `attribute_assign_id` varchar(40),
  `permission_type` varchar(4),
  `assignment_notes` varchar(1024)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grouper_role_set`
--

DROP TABLE IF EXISTS `grouper_role_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_role_set` (
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `depth` bigint(20) NOT NULL,
  `if_has_role_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `then_has_role_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `parent_role_set_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `type` varchar(32) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_set_unq_idx` (`parent_role_set_id`,`if_has_role_id`,`then_has_role_id`),
  KEY `role_set_ifhas_idx` (`if_has_role_id`),
  KEY `role_set_then_idx` (`then_has_role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_role_set`
--

LOCK TABLES `grouper_role_set` WRITE;
/*!40000 ALTER TABLE `grouper_role_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouper_role_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `grouper_role_set_v`
--

DROP TABLE IF EXISTS `grouper_role_set_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_role_set_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_role_set_v` (
  `if_has_role_name` varchar(1024),
  `then_has_role_name` varchar(1024),
  `depth` bigint(20),
  `type` varchar(32),
  `parent_if_has_name` varchar(1024),
  `parent_then_has_name` varchar(1024),
  `id` varchar(40),
  `if_has_role_id` varchar(40),
  `then_has_role_id` varchar(40),
  `parent_role_set_id` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_roles_v`
--

DROP TABLE IF EXISTS `grouper_roles_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_roles_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_roles_v` (
  `EXTENSION` varchar(255),
  `NAME` varchar(1024),
  `DISPLAY_EXTENSION` varchar(255),
  `DISPLAY_NAME` varchar(1024),
  `DESCRIPTION` varchar(1024),
  `PARENT_STEM_NAME` varchar(255),
  `ROLE_ID` varchar(40),
  `PARENT_STEM_ID` varchar(40),
  `MODIFIER_SOURCE` varchar(255),
  `MODIFIER_SUBJECT_ID` varchar(255),
  `CREATOR_SOURCE` varchar(255),
  `CREATOR_SUBJECT_ID` varchar(255),
  `IS_COMPOSITE_OWNER` varchar(1),
  `IS_COMPOSITE_FACTOR` varchar(1),
  `CREATOR_ID` varchar(40),
  `CREATE_TIME` bigint(20),
  `MODIFIER_ID` varchar(40),
  `MODIFY_TIME` bigint(20),
  `HIBERNATE_VERSION_NUMBER` bigint(20),
  `CONTEXT_ID` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_rpt_attributes_v`
--

DROP TABLE IF EXISTS `grouper_rpt_attributes_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_rpt_attributes_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_rpt_attributes_v` (
  `ATTRIBUTE_NAME` varchar(32),
  `GROUP_COUNT` bigint(21),
  `GROUP_TYPE_NAME` varchar(255),
  `FIELD_ID` varchar(40),
  `GROUP_TYPE_ID` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_rpt_composites_v`
--

DROP TABLE IF EXISTS `grouper_rpt_composites_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_rpt_composites_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_rpt_composites_v` (
  `COMPOSITE_TYPE` varchar(32),
  `THE_COUNT` bigint(21)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_rpt_group_field_v`
--

DROP TABLE IF EXISTS `grouper_rpt_group_field_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_rpt_group_field_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_rpt_group_field_v` (
  `GROUP_NAME` varchar(1024),
  `GROUP_DISPLAYNAME` varchar(1024),
  `FIELD_TYPE` varchar(32),
  `FIELD_NAME` varchar(32),
  `MEMBER_COUNT` bigint(21)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_rpt_groups_v`
--

DROP TABLE IF EXISTS `grouper_rpt_groups_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_rpt_groups_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_rpt_groups_v` (
  `GROUP_NAME` varchar(1024),
  `GROUP_DISPLAYNAME` varchar(1024),
  `TYPE_OF_GROUP` varchar(10),
  `IMMEDIATE_MEMBERSHIP_COUNT` bigint(21),
  `MEMBERSHIP_COUNT` bigint(21),
  `ATTRIBUTE_COUNT` bigint(21),
  `GROUPS_TYPES_COUNT` bigint(21),
  `ISA_COMPOSITE_FACTOR_COUNT` bigint(21),
  `ISA_MEMBER_COUNT` bigint(21),
  `GROUP_ID` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_rpt_members_v`
--

DROP TABLE IF EXISTS `grouper_rpt_members_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_rpt_members_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_rpt_members_v` (
  `SUBJECT_ID` varchar(255),
  `SUBJECT_SOURCE` varchar(255),
  `MEMBERSHIP_COUNT` bigint(21),
  `MEMBER_ID` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_rpt_roles_v`
--

DROP TABLE IF EXISTS `grouper_rpt_roles_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_rpt_roles_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_rpt_roles_v` (
  `ROLE_NAME` varchar(1024),
  `ROLE_DISPLAYNAME` varchar(1024),
  `IMMEDIATE_MEMBERSHIP_COUNT` bigint(21),
  `MEMBERSHIP_COUNT` bigint(21),
  `ATTRIBUTE_COUNT` bigint(21),
  `ROLES_TYPES_COUNT` bigint(21),
  `ISA_COMPOSITE_FACTOR_COUNT` bigint(21),
  `ISA_MEMBER_COUNT` bigint(21),
  `ROLE_ID` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_rpt_stems_v`
--

DROP TABLE IF EXISTS `grouper_rpt_stems_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_rpt_stems_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_rpt_stems_v` (
  `STEM_NAME` varchar(255),
  `STEM_DISPLAYNAME` varchar(255),
  `GROUP_IMMEDIATE_COUNT` bigint(21),
  `STEM_IMMEDIATE_COUNT` bigint(21),
  `GROUP_COUNT` bigint(21),
  `STEM_COUNT` bigint(21),
  `THIS_STEM_MEMBERSHIP_COUNT` bigint(21),
  `CHILD_GROUP_MEMBERSHIP_COUNT` bigint(21),
  `GROUP_MEMBERSHIP_COUNT` bigint(21),
  `STEM_ID` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouper_rpt_types_v`
--

DROP TABLE IF EXISTS `grouper_rpt_types_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_rpt_types_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_rpt_types_v` (
  `GROUP_TYPE_NAME` varchar(255),
  `GROUP_COUNT` bigint(21),
  `GROUP_TYPE_ID` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grouper_stems`
--

DROP TABLE IF EXISTS `grouper_stems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_stems` (
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `parent_stem` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `display_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `creator_id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `create_time` bigint(20) NOT NULL,
  `modifier_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `modify_time` bigint(20) DEFAULT NULL,
  `display_extension` varchar(255) CHARACTER SET latin1 NOT NULL,
  `extension` varchar(255) CHARACTER SET latin1 NOT NULL,
  `description` varchar(1024) CHARACTER SET latin1 DEFAULT NULL,
  `last_membership_change` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stem_name_idx` (`name`),
  KEY `stem_last_membership_idx` (`last_membership_change`),
  KEY `stem_createtime_idx` (`create_time`),
  KEY `stem_creator_idx` (`creator_id`),
  KEY `stem_dislpayextn_idx` (`display_extension`),
  KEY `stem_displayname_idx` (`display_name`),
  KEY `stem_extn_idx` (`extension`),
  KEY `stem_modifier_idx` (`modifier_id`),
  KEY `stem_modifytime_idx` (`modify_time`),
  KEY `stem_parent_idx` (`parent_stem`),
  KEY `stem_context_idx` (`context_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_stems`
--

LOCK TABLES `grouper_stems` WRITE;
/*!40000 ALTER TABLE `grouper_stems` DISABLE KEYS */;
INSERT INTO `grouper_stems` VALUES ('8e093a78c8494921bc29753ed4cd16e2',NULL,':',':','c57de3ae40fa40f0b723f6279c9da5fc',1299235317270,NULL,0,':',':',NULL,NULL,0,NULL);
INSERT INTO `grouper_stems` VALUES ('d6f965c796af4dfcb807a762255b0b52','8e093a78c8494921bc29753ed4cd16e2','etc','etc','c57de3ae40fa40f0b723f6279c9da5fc',1299235317421,NULL,0,'etc','etc',NULL,1299235317622,0,'3a6c5ae3e85a4b5b9ae335d353ff8fae');
INSERT INTO `grouper_stems` VALUES ('8f01671ee3da459e958b744dbb453c65','8e093a78c8494921bc29753ed4cd16e2','nl','nl','c57de3ae40fa40f0b723f6279c9da5fc',1301063883261,'c57de3ae40fa40f0b723f6279c9da5fc',1301063883605,'nl','nl','nl',1301063883594,1,'38b9a3860d384f6bbea6b071fadfe10b');
INSERT INTO `grouper_stems` VALUES ('d20499b3aad341058d011171ba4f5668','8f01671ee3da459e958b744dbb453c65','nl:surfnet','nl:surfnet','c57de3ae40fa40f0b723f6279c9da5fc',1301063916388,'c57de3ae40fa40f0b723f6279c9da5fc',1301063916480,'surfnet','surfnet','surfnet',1301063916459,1,'fdd8c718169f4d5ca319205b89e290ad');
INSERT INTO `grouper_stems` VALUES ('9f0d5c61c39e4043b430a385b2ba5dae','d20499b3aad341058d011171ba4f5668','nl:surfnet:diensten','nl:surfnet:diensten','c57de3ae40fa40f0b723f6279c9da5fc',1301063970619,'c57de3ae40fa40f0b723f6279c9da5fc',1301063970681,'diensten','diensten','diensten',1301063970671,1,'d171a08a5f414300a97f16cc7c328f13');
INSERT INTO `grouper_stems` VALUES ('cee78f561326448e87a896965c3da78f','d20499b3aad341058d011171ba4f5668','nl:surfnet:management','nl:surfnet:management','c57de3ae40fa40f0b723f6279c9da5fc',1303203634678,'c57de3ae40fa40f0b723f6279c9da5fc',1303203634919,'management','management','management',1303203634909,1,'447874b5de45488cb4fad0d2995aa710');
INSERT INTO `grouper_stems` VALUES ('b758063c3737461d83947897fe0c22ef','8e093a78c8494921bc29753ed4cd16e2','vo','vo','c57de3ae40fa40f0b723f6279c9da5fc',1311772319450,'c57de3ae40fa40f0b723f6279c9da5fc',1311772319652,'vo','vo','Stem Virtual Organisations',1311772319625,1,'7a9f05ebcd6547078f17aeecdc25a474');
INSERT INTO `grouper_stems` VALUES ('3245bb4eec7d4778929b0513909c5641','b758063c3737461d83947897fe0c22ef','vo:mujina-devs','vo:mujina-devs','c57de3ae40fa40f0b723f6279c9da5fc',1354798749778,'c57de3ae40fa40f0b723f6279c9da5fc',1354798750182,'mujina-devs','mujina-devs','Mujina devs',1354798750046,1,'98233277ec3e43eab9a22253d44674ae');
/*!40000 ALTER TABLE `grouper_stems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `grouper_stems_v`
--

DROP TABLE IF EXISTS `grouper_stems_v`;
/*!50001 DROP VIEW IF EXISTS `grouper_stems_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouper_stems_v` (
  `EXTENSION` varchar(255),
  `NAME` varchar(255),
  `DISPLAY_EXTENSION` varchar(255),
  `DISPLAY_NAME` varchar(255),
  `DESCRIPTION` varchar(1024),
  `PARENT_STEM_NAME` varchar(255),
  `PARENT_STEM_DISPLAYNAME` varchar(255),
  `CREATOR_SOURCE` varchar(255),
  `CREATOR_SUBJECT_ID` varchar(255),
  `MODIFIER_SOURCE` varchar(255),
  `MODIFIER_SUBJECT_ID` varchar(255),
  `CREATE_TIME` bigint(20),
  `CREATOR_ID` varchar(40),
  `STEM_ID` varchar(40),
  `MODIFIER_ID` varchar(40),
  `MODIFY_TIME` bigint(20),
  `PARENT_STEM` varchar(40),
  `HIBERNATE_VERSION_NUMBER` bigint(20),
  `CONTEXT_ID` varchar(40)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grouper_types`
--

DROP TABLE IF EXISTS `grouper_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_types` (
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `creator_uuid` varchar(40) CHARACTER SET latin1 NOT NULL,
  `create_time` bigint(20) NOT NULL,
  `is_assignable` tinyint(1) DEFAULT NULL,
  `is_internal` tinyint(1) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `context_id` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name_idx` (`name`),
  KEY `type_context_idx` (`context_id`),
  KEY `fk_types_creator_uuid` (`creator_uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouper_types`
--

LOCK TABLES `grouper_types` WRITE;
/*!40000 ALTER TABLE `grouper_types` DISABLE KEYS */;
INSERT INTO `grouper_types` VALUES ('a561f3cd149245f482db2ce7b4a115f7','base','c57de3ae40fa40f0b723f6279c9da5fc',1299235316156,0,0,0,'dc371bd806644aa2a49bfc1fcd100862');
INSERT INTO `grouper_types` VALUES ('8ba7dcb5ee7a4115863a952e836f32a2','attributeDef','c57de3ae40fa40f0b723f6279c9da5fc',1299235316941,0,1,0,'3eec61b2fa21457a8cbca526ac21034c');
INSERT INTO `grouper_types` VALUES ('84919fd57778493da1d62ea966457557','naming','c57de3ae40fa40f0b723f6279c9da5fc',1299235317150,0,1,0,'503c28526ddb44349111d10b49b4fe54');
/*!40000 ALTER TABLE `grouper_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitation_message`
--

DROP TABLE IF EXISTS `invitation_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitation_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inviter` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `message` longtext CHARACTER SET latin1,
  `timestamp` bigint(20) NOT NULL,
  `invitation_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=570 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitation_message`
--

LOCK TABLES `invitation_message` WRITE;
/*!40000 ALTER TABLE `invitation_message` DISABLE KEYS */;
INSERT INTO `invitation_message` VALUES (401,'urn:collab:person:test.surfguest.nl:gvanderploeg','',1353494866583,463);
INSERT INTO `invitation_message` VALUES (497,'urn:collab:person:test.surfguest.nl:gvanderploeg','',1353919391269,559);
INSERT INTO `invitation_message` VALUES (501,'klsj','',1353940999738,563);
INSERT INTO `invitation_message` VALUES (502,'klsj','',1353941031600,564);
INSERT INTO `invitation_message` VALUES (503,'klsj','',1353941050872,565);
INSERT INTO `invitation_message` VALUES (506,'urn:collab:person:www.supersite.nl:klsj','',1353941822201,568);
INSERT INTO `invitation_message` VALUES (507,'urn:collab:person:www.supersite.nl:klsj','',1353941823045,569);
INSERT INTO `invitation_message` VALUES (510,'urn:collab:person:www.supersite.nl:klsj','',1353941835857,572);
INSERT INTO `invitation_message` VALUES (511,'urn:collab:person:www.supersite.nl:klsj','',1353941836374,573);
INSERT INTO `invitation_message` VALUES (514,'urn:collab:person:www.supersite.nl:klsj','',1353941849697,576);
INSERT INTO `invitation_message` VALUES (515,'urn:collab:person:www.supersite.nl:klsj','',1353941850321,577);
INSERT INTO `invitation_message` VALUES (517,'urn:collab:person:test.surfguest.nl:gvanderploeg','',1354113893214,603);
INSERT INTO `invitation_message` VALUES (518,'urn:collab:person:test.surfguest.nl:gvanderploeg','',1354113893885,604);
INSERT INTO `invitation_message` VALUES (519,'urn:collab:person:test.surfguest.nl:gvanderploeg','',1354113942018,605);
INSERT INTO `invitation_message` VALUES (520,'urn:collab:person:test.surfguest.nl:gvanderploeg','',1354113942504,606);
INSERT INTO `invitation_message` VALUES (521,'urn:collab:person:test.surfguest.nl:gvanderploeg','',1354113953549,607);
INSERT INTO `invitation_message` VALUES (522,'urn:collab:person:test.surfguest.nl:gvanderploeg','',1354113953937,608);
INSERT INTO `invitation_message` VALUES (540,'urn:collab:person:test.surfguest.nl:gvanderploeg','',1354198062216,626);
/*!40000 ALTER TABLE `invitation_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitations`
--

DROP TABLE IF EXISTS `invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitations` (
  `mailaddress` varchar(255) CHARACTER SET latin1 NOT NULL,
  `group_id` varchar(255) CHARACTER SET latin1 NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `invitation_uiid` varchar(255) CHARACTER SET latin1 NOT NULL,
  `denied` tinyint(1) DEFAULT '0',
  `accepted` tinyint(1) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `intended_role` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=656 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitations`
--

LOCK TABLES `invitations` WRITE;
/*!40000 ALTER TABLE `invitations` DISABLE KEYS */;
INSERT INTO `invitations` VALUES ('femke.morsch@surfnet.nl','nl:surfnet:diensten:federatiecontactpersonen',1353941823045,'4anes6iDmx1dA8jYjccECwiMd4lgiYAchpD6VhGm3zDl7G5C7KUzEteNY3tUSei71xy9ELxlBhgcmi1A0qhEHyFt7Vl8yIYDZnxp2plh5L4212iN40XEaPLedMQFjM0jFBaVMwezf0dV43OyCNtqHJ730sXTmnrQBWkmPnmEjFZRxX6zFd4pKhv3twMNnQPrC7qmLbGt096OWdJcQrNotvdEdCyCAg6mhOwBrgoP0EvxoOYHBbzQ0D3P1XxoKc8',0,1,569,'Admin');
INSERT INTO `invitations` VALUES ('oharsta@zilverline.com','nl:surfnet:diensten:licentiecontactpersonen',1354113942018,'27UxUIA7l9Vev3sErBjokZ1PJYg9GEEQHqpx1pFdlqn9fJqKxm6JIj8hAA5TNcamQy22qoo3FL4xdFQeuDFerZ5St5dm5MmhORgxwvoE9OrHnxqGPon0tphAH1GxUAbCxQ8ZbsHFW0aJYUqedJc3zoX9XOu7Zb6251MPjZGEdEJxIQnTAOYuhKm9bdFO5PWm9sybA6xtTk89gVOcbAWGKskhRMkRr2IWXFZ59R2v0htXaGN5mt4BysD0PQpN7e4',0,1,605,'Member');
INSERT INTO `invitations` VALUES ('rjansen@iprofs.nl','nl:surfnet:diensten:licentiecontactpersonen',1354113942504,'blDFdIcDdbTfzqfkhWcMRYuhkvmyrlVQkhkpbbZn9SX9N3SR0wbCogMtRbL97llqJIlz1DwiuFxanwqsNWJ5L88NWygw1sF7byhh0lLEo76roMv27pKJTK9dKQ5QxwhAtRqIov1gNvT3URLBo6EOpXXjkBWotBpC9xpXhlzLHCKXqGPHVzWUE5zqhtON2ueO00k1MymFNnM7LR5hF97BR1AhRs5T1PZ4XhjxfMz28fKkznDQRBD9WJo05cjhpyy',0,1,606,'Member');
INSERT INTO `invitations` VALUES ('arjan@arjaneising.nl','nl:surfnet:diensten:licentiecontactpersonen',1353941835857,'RfOyMF3uwWTnrauQqnQmYT0v6I5rtmutKEybQn8KIm3MYQjByfKiSzJnYl69AusopQdBDtpxOeUAGavHq5VKWwBnFrVr7fbbTJaFlgR0Q4VbDz7eSjgR9SLVaY5tqgmv3lNxTwhCyvJ0vfLMyijQ4CvpGrzAabupcLTzoevQ99QHUb9zQoj7hikmCLG654grrGqz3s6FZakmr9ij9wh9cxMWo223S88vnW0gpmFemN1b6uXYCm0oysNg3WkXDMH',0,0,572,'Admin');
INSERT INTO `invitations` VALUES ('femke.morsch@surfnet.nl','nl:surfnet:diensten:licentiecontactpersonen',1353941836374,'vqh3FwUkGUrBofjXyZLQLPYzDns8ugbhT7x1fx8lJtYRAIq5ovtrfnTVslXT7O4OmRX5DaFcjM5Mkoa5XeWsiaae63DWmPXspBzJH5XusrSzb3A1RWcy7OyZscsMkXPx2HNgPcq51M0tqZbxJ189MnXaKXX8FGv9HH4Z23KS6YVljLKeLArzM6bsvs4RIUzctpOxKMYNEP33Ak0EYLNp19gVY6GfjqeXPiafJOiR9KhVpAQdukSr0MhJkaGvePL',0,1,573,'Admin');
INSERT INTO `invitations` VALUES ('oharsta@zilverline.com','nl:surfnet:diensten:federatiecontactpersonen',1354113953549,'7AV8UTU0KWcd6cmB560EOa5kVJ8q1Mu01BB7gdq9AgqVcqAkb7F3IP6vIR8sghpZTJqKsyHvf8JTWWAVhtFF73UqrwAdw4D3n1zrXvAcouogqlw3V6PGiclWMRV9slYp3NKxwDhnH82AieHSNFTaqxWPyl1XSDENVxUODjvqcDOO4LWcVziRA5YbJZ7rCbpjtmU5NPQAFJyFVOF6mxBrgnBywvB1LFT0BdWDvpl9DAMk9jYoUeTE5YQo7FIQvtR',0,0,607,'Member');
INSERT INTO `invitations` VALUES ('oharsta@zilverline.com','nl:surfnet:diensten:shopmanager_cdk',1354113893214,'ZB6rW0A9lZybHtHaLFa5C71O8MJqWDcDgcSgqDM1Ic1jA6RLMfcv7DSZxIL5691ExSz2bj4Vt65UuFTvjPLNO9gBPZBr0xFTjmI5IVvpZhMYDasFLTKGapMdGD9EPHZfDBm5AhdNod0GJD0TWglzg5jv3pzRgMP5xs0tjFDFxTbNVSR11NvpZl5odwe3BkJLre8icxelCXW7pJvWc5bhmCOrV7jgmmimSTX8AiZ7Wyektmk0xe4yImQw1T44B1K',0,1,603,'Member');
INSERT INTO `invitations` VALUES ('arjan@arjaneising.nl','nl:surfnet:diensten:shopmanager_cdk',1353941849697,'E42lQ1p5tYOnSxurbu82nZImppP48q5LtJrknGS5XoAD48SvK6QzdRUiZ35n1rqmML9AGomoEwsRC75I8OBiZqUSVgBuVc73B1wD4OjBALVSNQZFMs9e9SBWCulK84xzww03BBLEAwQztXtsi1XbJkXyqoD7urogxMSoIp2tpBkbzvPdJQzW8sVuuj93obtT5dysojhJ2LsCmo84vx6aiJlnGuteMT62y5OEqBUxnOnMUdsYSpIQPKGcZc0wav4',0,0,576,'Admin');
INSERT INTO `invitations` VALUES ('geertpl@gmail.com','nl:surfnet:diensten:shopmanager_cdk',1354198062216,'DMAP7xOHr8JrMjcDvtcuw76YZkQUltZ3jrX3ZFfwnrGlOrWL5sZ5oKM527wvWyRq5hc5691kH04aISANLxMhxdNjptI9dI1JYgivIlCiEICL7y4gaZaoBUJQDU1WHknGdIhcPTjbxH0Rap2zmFbgCI9Q0xoYJrBcADhjapjuFxLWOiWxwW1meKPS9uT6vIsOcFh2BVKku5IbxlFHeT0C5n0ZqN5aIEL58KBNAHvMVRHv7BXhzOh9TFsxBFDYTkI',0,1,626,'Member');
INSERT INTO `invitations` VALUES ('arjan@arjaneising.nl','nl:surfnet:diensten:federatiecontactpersonen',1353941822201,'atC4jSouwO9vCjomel9WkHDBFyHiMmdjW1qIVFeuo7N1Nlj444papkzrXOfWIRSl55cwHrvhGPMCn6PRVAORlcassRLKfvf087TIMAFWiLUbmtlLVj65uofcSA0mHYprLFRSWRch1dlGLD6kiFRwTjXNCNs34n8eGINYb5iGEOtWG6c0joKwIcv4i5Fw0ryFlnav1KxK7hZN1w8MhpfsX3UnLUiTOnmoHb4PwmFGAdnRDHmd4XwPeVRJiLrTwaB',0,0,568,'Admin');
INSERT INTO `invitations` VALUES ('gvanderploeg@iprofs.nl','nl:surfnet:diensten:shopmanager_cdk',1353941050872,'dT2KbaN5WlxUXDv30xJ7xPBNlBoqg50p6x17I93p4SGnAVjT67KA6CcJniSXh271HClmaqO4yTP0LtLmg06boFYoXQBKubzxKMnxrvi0Qvf4qmSiioEczunwdEFynxvuqltEW9pwUNLTA2DSduRicofmWf26mWGUgqpm93SrwwJ7TXIl4bCt3XnHxqe30celf9DaXDphAyfye25xtwTlYtgfE7KUXUAt5fiZOQ95SsiVDwMtf5gBjCvwsqaaytK',0,1,565,'Manager');
INSERT INTO `invitations` VALUES ('gvanderploeg@iprofs.nl','nl:surfnet:diensten:licentiecontactpersonen',1353941031600,'SLI00ID06enLvGsnyqxbtBQcrLZyz62QVozn7lcfhhzZrJk6olcnHrRhpYLcRr784JqPb2Baw5ueLpeBl1bEhedb5u4aw7JjYxuvXFwdhkGtZY9Wx1e9ikibFv2CsqkA5PXTkcceA5z1hKEzfVD5JxXE63sAS7UamA2hp9Kmhku0j5Z4MJmwAjsZAOjJVXLtb5DuoakOwZiMBscpkWneYQ5mUx9ErgAjwiEUcf7X7ByPFwocUMvOHq5rACFXs6G',0,1,564,'Manager');
INSERT INTO `invitations` VALUES ('rjansen@iprofs.nl','nl:surfnet:management:managementvotest',1353494866583,'pClvJaRZNgtwN2LgMKMGws4vdxmqq362jFkrHiN3KJ4iRKmG5YbpnNA8t9r6d1mX7YaSRcBvuLJB8WH8GuI7v2Mxs3b9XrewH9JFvxzFXWQ7MEFeMZcZnu1p0NPou3b8y1YgqHRzsSN2ZhXVzpcAzbuU2773DB9I1ecGLIwpZluw2cd1tcehVRQ9Ci7mGe1kbZcYRV4Rtbpp22BMoQ9vcYQJmf9sey30nelrRmvO8MtuDmoICX3yCQd9fUMD4pM',0,1,463,'Member');
INSERT INTO `invitations` VALUES ('gvanderploeg@iprofs.nl','nl:surfnet:diensten:contactpersonen_idps',1353919391269,'NlnlM8dwdrnpiS8Ka07kIZvYJ0KBSIX6QI4VWZ1Kpl2XKNtZpfQTQz9X60QcRnidCZptIyi5I9LWw37s2BU0dIyuoYmSCKJLJoFPVExI40RFqyeYPRa5M4DujVV5OzLNGCgB5FPHAO8ai1nlQqR008I7nSQLAQK9MumZ4ZrEUQ3fyaBzPlHMUOHtG1YBP9hRIC7vYybdGv71diGosjvpfJZXagO2e5AWoKFSBBmvbobOyRs3Tq1N4irc98cJFbJ',0,1,559,'Member');
INSERT INTO `invitations` VALUES ('gvanderploeg@iprofs.nl','nl:surfnet:diensten:federatiecontactpersonen',1353940999738,'7tRTJtdlQo6cDvZf0bhw4uVfIaJTiJul5mOnU1w9rNRWOCg0SJZcbxpPmXaXUqHCY8wgtsFEhjapCnC0SM3lGQZs0473HBDHSvglA5QQGSj2JHBb88qE4und7KRXOiEYhJ4PL9qEtJ48buDCznacdV0FvAEWE15Xa5MM9J0k6wlTTZMH0mp8rILiPGIDps1kRmsOS4A0XHe00ARDRtC0jWHJJUtPnzM48izePGe58Ug85oqvyrX4XzkXz1kDwEC',0,1,563,'Manager');
INSERT INTO `invitations` VALUES ('femke.morsch@surfnet.nl','nl:surfnet:diensten:shopmanager_cdk',1353941850321,'qYCQBiFv3HEkpCw5uBTFqVlSXi6sHi7jml2IHkqjgllqdOskSitkNzQLcF9aN6MXGllrP0bGyhLY6BnMUla1T5suVH7saMmJYLnMhyiGQDDRx87K2Ic7AMPV9LxAzahIj5yX26V51J5l4tzC3YK0gEaOyyeEJ5qICQdTsCKZLjJ154qRKxOh7G5O5a8dgmYAADOgDkvwSi9Uy5qACNMDtiIHFuWpEfV0EmMquFWgah70wtudcX4B6PkVvq4yiG2',0,1,577,'Admin');
INSERT INTO `invitations` VALUES ('rjansen@iprofs.nl','nl:surfnet:diensten:shopmanager_cdk',1354113893885,'n9RunOVwiQ2MwGuYlTtWZYbEap5rgCmj13HZqFZ1zthVvnvYTZ95ehi85zXUhtykUnrPb9WmvmGOpLPaBO8FkGsOEBe2WOmbm0Il3AdN3KedrktKzC0JFze2kj5PL9asEaTTXZITjaP6lK8srCzwTy58OuKhLA2UoOJvCYbjANlFSbsLY0E4KqLdinhtbTnfQhbj6tfuFi7NQ9tvr76HsSx0enhpXacWJNBMi6GKsSAJ9Uia4vcc7GDu0k7E47U',0,1,604,'Member');
INSERT INTO `invitations` VALUES ('rjansen@iprofs.nl','nl:surfnet:diensten:federatiecontactpersonen',1354113953937,'oIk8REqo4OEqi7P9PcUUxtCKwPtU25lkzSb3LgGUsNYAEkBf8taqu8AT0bZY7F0UbLTac9oMvKtfgzzMs64mzMZdIfgEd8rQKx7bbMcRQX0H38zBLC8nR3mKAitYWxxfOQa4eo2TC2L0DJV4ERG4flmBUE4CeVHGVatZvlz62Ac9HNpYJp8zyQwwQ8WDnCNnowAczXvQ1HYnlliXdnKJzw8zUPwiPQ94kx6BXltDnTqDrzCc2IHknrNe3q8DITV',0,1,608,'Member');
/*!40000 ALTER TABLE `invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_attributes`
--

DROP TABLE IF EXISTS `member_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_attributes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `attribute_value` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `member_id` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_id` (`member_id`,`attribute_name`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_attributes`
--

LOCK TABLES `member_attributes` WRITE;
/*!40000 ALTER TABLE `member_attributes` DISABLE KEYS */;
INSERT INTO `member_attributes` VALUES (1,'guest','false','urn:collab:person:test.surfguest.nl:gkn');
INSERT INTO `member_attributes` VALUES (2,'guest','true','urn:collab:person:twitter.com:SCNtestaccount');
INSERT INTO `member_attributes` VALUES (3,'guest','true','urn:collab:person:test.surfguest.nl:scntestgoogle');
INSERT INTO `member_attributes` VALUES (4,'guest','true','urn:collab:person:test.surfguest.nl:peterclijsters');
INSERT INTO `member_attributes` VALUES (5,'guest','false','urn:collab:person:surfnet.nl:okke');
INSERT INTO `member_attributes` VALUES (6,'guest','true','urn:collab:person:test.surfguest.nl:peterc');
INSERT INTO `member_attributes` VALUES (7,'guest','false','urn:collab:person:test.surfguest.nl:smibuildings');
INSERT INTO `member_attributes` VALUES (8,'guest','false','urn:collab:person:surfnet.nl:maarten');
INSERT INTO `member_attributes` VALUES (9,'guest','true','urn:collab:person:test.surfguest.nl:oharsta');
INSERT INTO `member_attributes` VALUES (10,'guest','false','urn:collab:person:surfnet.nl:abeelen');
INSERT INTO `member_attributes` VALUES (11,'guest','true','urn:collab:person:test.surfguest.nl:steinwelberg2');
INSERT INTO `member_attributes` VALUES (12,'guest','false','urn:collab:person:test.surfguest.nl:steinwelberg');
INSERT INTO `member_attributes` VALUES (13,'guest','false','urn:collab:person:surfnet.nl:morsch');
INSERT INTO `member_attributes` VALUES (14,'guest','false','urn:collab:person:surfnet.nl:niels');
INSERT INTO `member_attributes` VALUES (15,'guest','false','urn:collab:person:surfnet.nl:paulvd');
INSERT INTO `member_attributes` VALUES (16,'guest','false','urn:collab:person:test.surfguest.nl:jjoachimsthal');
INSERT INTO `member_attributes` VALUES (17,'guest','true','urn:collab:person:surfnet.nl:bas');
INSERT INTO `member_attributes` VALUES (18,'guest','true','urn:collab:person:surfnet.nl:pinxt');
INSERT INTO `member_attributes` VALUES (19,'guest','true','urn:collab:person:twitter.com:cdr80');
INSERT INTO `member_attributes` VALUES (20,'guest','true','urn:collab:person:google.com:creativethings_gmail.com');
INSERT INTO `member_attributes` VALUES (21,'guest','true','urn:collab:person:google.com:fpinxt_gmail.com');
INSERT INTO `member_attributes` VALUES (22,'guest','true','urn:collab:person:twitter.com:steinwelberg');
INSERT INTO `member_attributes` VALUES (23,'guest','true','urn:collab:person:facebook.com:618969129');
INSERT INTO `member_attributes` VALUES (24,'guest','true','urn:collab:person:google.com:m.s.schok_gmail.com');
INSERT INTO `member_attributes` VALUES (25,'guest','false','urn:collab:person:surfnet.nl:henny');
INSERT INTO `member_attributes` VALUES (26,'guest','false','urn:collab:person:test.surfguest.nl:jasha');
INSERT INTO `member_attributes` VALUES (27,'guest','true','urn:collab:person:yahoo.com:stein.welberg_yahoo.com');
INSERT INTO `member_attributes` VALUES (28,'guest','true','urn:collab:person:google.com:stein.welberg_gmail.com');
INSERT INTO `member_attributes` VALUES (29,'guest','true','urn:collab:person:hyves.nl:steinwelberg');
INSERT INTO `member_attributes` VALUES (30,'guest','false','urn:collab:person:test.surfguest.nl:mdobrinic');
INSERT INTO `member_attributes` VALUES (31,'guest','true','urn:collab:person:test.surfguest.nl:vkumar');
INSERT INTO `member_attributes` VALUES (32,'guest','false','urn:collab:person:test.surfguest.nl:alle.veenstra');
INSERT INTO `member_attributes` VALUES (33,'guest','true','urn:collab:person:perftestidppersistent.dev.surfconext.nl:performancetest-5');
INSERT INTO `member_attributes` VALUES (34,'guest','true','urn:collab:person:test.surfguest.nl:mdobrinic2');
INSERT INTO `member_attributes` VALUES (35,'guest','true','urn:collab:person:surfguest.nl:peterclijsters');
INSERT INTO `member_attributes` VALUES (36,'guest','true','urn:collab:person:test.surfguest.nl:mediawiki-niels');
INSERT INTO `member_attributes` VALUES (37,'guest','true','urn:collab:person:surfnet.nl:poortinga');
INSERT INTO `member_attributes` VALUES (38,'guest','true','urn:collab:person:test.surfguest.nl:mdobrinic3');
INSERT INTO `member_attributes` VALUES (39,'guest','true','urn:collab:person:surfguest.nl:lvlierop_ibuildings');
INSERT INTO `member_attributes` VALUES (40,'guest','false','urn:collab:person:surfguest.nl:alle.veenstra');
INSERT INTO `member_attributes` VALUES (41,'guest','true','urn:collab:person:google.com:alle.veenstra_gmail.com');
INSERT INTO `member_attributes` VALUES (42,'guest','true','urn:collab:person:surfguest.nl:relax');
INSERT INTO `member_attributes` VALUES (43,'guest','false','urn:collab:person:example.com:john.doe');
INSERT INTO `member_attributes` VALUES (44,'guest','true','urn:collab:person:surfguest.nl:oharsta');
INSERT INTO `member_attributes` VALUES (45,'guest','true','urn:collab:person:hyves.nl:jashaj');
INSERT INTO `member_attributes` VALUES (46,'guest','true','urn:collab:person:surfguest.nl:femke');
INSERT INTO `member_attributes` VALUES (47,'guest','true','urn:collab:person:surfguest.nl:pgm2');
INSERT INTO `member_attributes` VALUES (48,'guest','false','urn:collab:person:hz.nl:verh0064');
INSERT INTO `member_attributes` VALUES (49,'guest','true','urn:collab:person:example.com:test-boy');
INSERT INTO `member_attributes` VALUES (50,'guest','true','urn:collab:person:test.surfguest.nl:gvanderploeg');
INSERT INTO `member_attributes` VALUES (51,'guest','true','urn:collab:person:okkewatdoejenou.nl:john.doe');
INSERT INTO `member_attributes` VALUES (52,'guest','true','urn:collab:person:surfguest.nl:rutgerpuntnet');
INSERT INTO `member_attributes` VALUES (53,'guest','true','urn:collab:person:test.surfguest.nl:arjaneising');
INSERT INTO `member_attributes` VALUES (54,'guest','true','urn:collab:person:test.surfguest.nl:rutgerpuntnettest');
INSERT INTO `member_attributes` VALUES (55,'guest','true','urn:collab:person:surfguest.nl:jfartsgmail');
/*!40000 ALTER TABLE `member_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `uuid` varchar(255) CHARACTER SET latin1 NOT NULL,
  `group_id` varchar(255) CHARACTER SET latin1 NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` text CHARACTER SET latin1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES ('urn:collab:person:test.surfguest.nl:jjoachimsthal','nl:surfnet:diensten:facebook_team',1301557136000,1,NULL);
INSERT INTO `requests` VALUES ('urn:collab:person:test.surfguest.nl:jjoachimsthal','nl:surfnet:diensten:aaaaaa',1302526831000,2,NULL);
INSERT INTO `requests` VALUES ('urn:collab:person:test.surfguest.nl:jjoachimsthal','nl:surfnet:diensten:femke\'s_testteam',1303285891934,6,'Dear Admin,\r\n\r\nJasha Joachimsthal TEST would like to join team Femke\'s testteam.');
INSERT INTO `requests` VALUES ('urn:collab:person:test.surfguest.nl:jfartsteams','nl:surfnet:diensten:test_ik_ben_een_guest',1303460840151,7,'Dear Admin,\r\n\r\nJan Arts would like to join team test ik ben een guest.');
INSERT INTO `requests` VALUES ('urn:collab:person:surfnet.nl:henny','nl:surfnet:diensten:team_1',1304349195875,16,'Dear Admin,\r\n\r\nHendrik J. Bekker would like to join team Team 1.');
INSERT INTO `requests` VALUES ('urn:collab:person:surfnet.nl:okke','nl:surfnet:diensten:aaaaaa',1305101097065,20,'Dear Admin,\r\n\r\nOkke Harsta would like to join team aaaaaa.');
INSERT INTO `requests` VALUES ('urn:collab:person:surfnet.nl:henny','nl:surfnet:diensten:bachelor_informatiekunde',1306161307718,23,'Dear Admin,\r\n\r\nHendrik J. Bekker would like to join team Bachelor Informatiekunde.');
INSERT INTO `requests` VALUES ('urn:collab:person:hyves.nl:jashaj','nl:surfnet:diensten:team_jasha',1336572496675,35,'Hoi admin,\r\n\r\n<marquee>zou ik bij <b>dit</b> team mogen komen? Dan kan ik veel gaan testen, leuk he? :)</marquee>\r\n\r\nJasha');
INSERT INTO `requests` VALUES ('urn:collab:person:test.surfguest.nl:jjoachimsthal','nl:surfnet:diensten:hallo',1306842383378,26,'Dear Admin,\r\n\r\nJasha Joachimsthal TEST account would like to join team hallo.');
INSERT INTO `requests` VALUES ('urn:collab:person:test.surfguest.nl:steinwelberg','nl:surfnet:diensten:blabla',1319440769000,30,'Dear Admin,\r\n\r\nStein Welberg would like to join team blabla.');
INSERT INTO `requests` VALUES ('urn:collab:person:surfnet.nl:henny','nl:votest1:votest1group',1320250357521,32,'Dear Admin,\r\n\r\nHendrik J. Bekker would like to join team votest1group.');
INSERT INTO `requests` VALUES ('urn:collab:person:surfguest.nl:jjoachimsthal','nl:surfnet:diensten:backlog-423',1338281945165,36,'Wie is hier de admin?');
INSERT INTO `requests` VALUES ('urn:collab:person:test.surfguest.nl:jjoachimsthal','nl:surfnet:diensten:selfservice_idp_contactpersonen',1340783903899,37,'Kan iemand mij toevoegen zodat ik selfservice ook echt kan testen?');
INSERT INTO `requests` VALUES ('urn:collab:person:test.surfguest.nl:oharsta','nl:surfnet:diensten:selfservice_idp_contactpersonen',1340786640725,38,'please join');
INSERT INTO `requests` VALUES ('urn:collab:person:test.surfguest.nl:oharsta','nl:surfnet:diensten:iñtërnâtiônàlizætiøn',1350301623967,40,'Ze krijgen de prijs voor hun onderzoek naar de manier waarop allerlei zaken in de economie worden \'gematcht\', bijvoorbeeld welke arbeider welke baan krijgt.Of welke studenten naar welke school gaan.\r\n\r\nDe wetenschappers wisten modellen te ontwikkelen om voor dit complexe, theoretische probleem praktische oplossingen te vinden.\r\n\r\nDe winnaars ontvangen in december een medaille en een bedrag van ongeveer 930.000 euro. Dat bedrag moeten ze delen.');
INSERT INTO `requests` VALUES ('urn:collab:person:test.surfguest.nl:gvanderploeg','nl:surfnet:diensten:team_okke',1350302669721,41,'Nog een poging');
INSERT INTO `requests` VALUES ('urn:collab:person:surfguest.nl:jfartsgmail','nl:surfnet:diensten:team_3',1350305620943,42,'ik wil er bij!');
INSERT INTO `requests` VALUES ('urn:collab:person:surfguest.nl:jfartsgmail','nl:surfnet:diensten:test_mail',1350305942156,43,'myttmty');
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scim_events`
--

DROP TABLE IF EXISTS `scim_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scim_events` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order` bigint(20) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scim_events`
--

LOCK TABLES `scim_events` WRITE;
/*!40000 ALTER TABLE `scim_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `scim_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `subjectId` varchar(255) CHARACTER SET latin1 NOT NULL,
  `subjectTypeId` varchar(32) CHARACTER SET latin1 NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`subjectId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjectattribute`
--

DROP TABLE IF EXISTS `subjectattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjectattribute` (
  `subjectId` varchar(255) CHARACTER SET latin1 NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `value` varchar(255) CHARACTER SET latin1 NOT NULL,
  `searchValue` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`subjectId`,`name`,`value`),
  UNIQUE KEY `searchattribute_id_name_idx` (`subjectId`,`name`),
  KEY `searchattribute_value_idx` (`value`),
  KEY `searchattribute_name_idx` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjectattribute`
--

LOCK TABLES `subjectattribute` WRITE;
/*!40000 ALTER TABLE `subjectattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjectattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_external_groups`
--

DROP TABLE IF EXISTS `team_external_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_external_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `grouper_team_id` varchar(255) DEFAULT NULL,
  `external_groups_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grouper_team_id` (`grouper_team_id`,`external_groups_id`),
  KEY `FKB046E6E69AB3B3FA` (`external_groups_id`),
  CONSTRAINT `FKB046E6E69AB3B3FA` FOREIGN KEY (`external_groups_id`) REFERENCES `external_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_external_groups`
--

LOCK TABLES `team_external_groups` WRITE;
/*!40000 ALTER TABLE `team_external_groups` DISABLE KEYS */;
INSERT INTO `team_external_groups` VALUES (999999,'nl:surfnet:diensten:mock-external-team',999999);
INSERT INTO `team_external_groups` VALUES (6,'nl:surfnet:diensten:team_jasha',10);
/*!40000 ALTER TABLE `team_external_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `grouper_attr_asn_asn_attrdef_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_attr_asn_asn_attrdef_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_asn_attrdef_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_attr_asn_asn_attrdef_v` AS select `gad`.`name` AS `name_of_attr_def_assigned_to`,`gaaa1`.`name` AS `action1`,`gaaa2`.`name` AS `action2`,`gadn1`.`name` AS `attribute_def_name_name1`,`gadn2`.`name` AS `attribute_def_name_name2`,`gadn1`.`display_name` AS `attribute_def_name_disp_name1`,`gadn2`.`display_name` AS `attribute_def_name_disp_name2`,`gad1`.`name` AS `name_of_attribute_def1`,`gad2`.`name` AS `name_of_attribute_def2`,`gaa1`.`notes` AS `attribute_assign_notes1`,`gaa2`.`notes` AS `attribute_assign_notes2`,`gaa2`.`enabled` AS `enabled2`,`gaa2`.`enabled_time` AS `enabled_time2`,`gaa2`.`disabled_time` AS `disabled_time2`,`gad`.`id` AS `id_of_attr_def_assigned_to`,`gaa1`.`id` AS `attribute_assign_id1`,`gaa2`.`id` AS `attribute_assign_id2`,`gadn1`.`id` AS `attribute_def_name_id1`,`gadn2`.`id` AS `attribute_def_name_id2`,`gad1`.`id` AS `attribute_def_id1`,`gad2`.`id` AS `attribute_def_id2`,`gaaa1`.`id` AS `action_id1`,`gaaa2`.`id` AS `action_id2` from ((((((((`grouper_attribute_assign` `gaa1` join `grouper_attribute_assign` `gaa2`) join `grouper_attribute_def` `gad`) join `grouper_attribute_def_name` `gadn1`) join `grouper_attribute_def_name` `gadn2`) join `grouper_attribute_def` `gad1`) join `grouper_attribute_def` `gad2`) join `grouper_attr_assign_action` `gaaa1`) join `grouper_attr_assign_action` `gaaa2`) where ((`gaa1`.`id` = `gaa2`.`owner_attribute_assign_id`) and (`gaa1`.`attribute_def_name_id` = `gadn1`.`id`) and (`gaa2`.`attribute_def_name_id` = `gadn2`.`id`) and (`gadn1`.`attribute_def_id` = `gad1`.`id`) and (`gadn2`.`attribute_def_id` = `gad2`.`id`) and (`gaa1`.`enabled` = 'T') and (`gad`.`id` = `gaa1`.`owner_attribute_def_id`) and (`gaa1`.`attribute_assign_action_id` = `gaaa1`.`id`) and (`gaa2`.`attribute_assign_action_id` = `gaaa2`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_attr_asn_asn_efmship_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_attr_asn_asn_efmship_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_asn_efmship_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_attr_asn_asn_efmship_v` AS select distinct `gg`.`name` AS `group_name`,`gm`.`subject_source` AS `source_id`,`gm`.`subject_id` AS `subject_id`,`gaaa1`.`name` AS `action1`,`gaaa2`.`name` AS `action2`,`gadn1`.`name` AS `attribute_def_name_name1`,`gadn2`.`name` AS `attribute_def_name_name2`,`gadn1`.`display_name` AS `attribute_def_name_disp_name1`,`gadn2`.`display_name` AS `attribute_def_name_disp_name2`,`gf`.`name` AS `list_name`,`gad1`.`name` AS `name_of_attribute_def1`,`gad2`.`name` AS `name_of_attribute_def2`,`gaa1`.`notes` AS `attribute_assign_notes1`,`gaa2`.`notes` AS `attribute_assign_notes2`,`gaa2`.`enabled` AS `enabled2`,`gaa2`.`enabled_time` AS `enabled_time2`,`gaa2`.`disabled_time` AS `disabled_time2`,`gg`.`id` AS `group_id`,`gm`.`id` AS `member_id`,`gaa1`.`id` AS `attribute_assign_id1`,`gaa2`.`id` AS `attribute_assign_id2`,`gadn1`.`id` AS `attribute_def_name_id1`,`gadn2`.`id` AS `attribute_def_name_id2`,`gad1`.`id` AS `attribute_def_id1`,`gad2`.`id` AS `attribute_def_id2`,`gaaa1`.`id` AS `action_id1`,`gaaa2`.`id` AS `action_id2` from (((((((((((`grouper_attribute_assign` `gaa1` join `grouper_attribute_assign` `gaa2`) join `grouper_groups` `gg`) join `grouper_memberships_all_v` `gmav`) join `grouper_attribute_def_name` `gadn1`) join `grouper_attribute_def_name` `gadn2`) join `grouper_attribute_def` `gad1`) join `grouper_attribute_def` `gad2`) join `grouper_members` `gm`) join `grouper_fields` `gf`) join `grouper_attr_assign_action` `gaaa1`) join `grouper_attr_assign_action` `gaaa2`) where ((convert(`gaa1`.`owner_member_id` using utf8) = convert(`gmav`.`MEMBER_ID` using utf8)) and (convert(`gaa1`.`owner_group_id` using utf8) = convert(`gmav`.`OWNER_GROUP_ID` using utf8)) and (`gaa2`.`owner_attribute_assign_id` = `gaa1`.`id`) and (`gaa1`.`attribute_def_name_id` = `gadn1`.`id`) and (`gaa2`.`attribute_def_name_id` = `gadn2`.`id`) and (`gadn1`.`attribute_def_id` = `gad1`.`id`) and (`gadn2`.`attribute_def_id` = `gad2`.`id`) and (`gaa1`.`enabled` = 'T') and (`gmav`.`IMMEDIATE_MSHIP_ENABLED` = 'T') and (convert(`gmav`.`FIELD_ID` using utf8) = convert(`gf`.`id` using utf8)) and (convert(`gmav`.`MEMBER_ID` using utf8) = convert(`gm`.`id` using utf8)) and (convert(`gmav`.`OWNER_GROUP_ID` using utf8) = convert(`gg`.`id` using utf8)) and (`gf`.`type` = 'list') and (`gaa1`.`owner_member_id` is not null) and (`gaa1`.`owner_group_id` is not null) and (`gaa1`.`attribute_assign_action_id` = `gaaa1`.`id`) and (`gaa2`.`attribute_assign_action_id` = `gaaa2`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_attr_asn_asn_group_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_attr_asn_asn_group_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_asn_group_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_attr_asn_asn_group_v` AS select `gg`.`name` AS `group_name`,`gaaa1`.`name` AS `action1`,`gaaa2`.`name` AS `action2`,`gadn1`.`name` AS `attribute_def_name_name1`,`gadn2`.`name` AS `attribute_def_name_name2`,`gg`.`display_name` AS `group_display_name`,`gadn1`.`display_name` AS `attribute_def_name_disp_name1`,`gadn2`.`display_name` AS `attribute_def_name_disp_name2`,`gad1`.`name` AS `name_of_attribute_def1`,`gad2`.`name` AS `name_of_attribute_def2`,`gaa1`.`notes` AS `attribute_assign_notes1`,`gaa2`.`notes` AS `attribute_assign_notes2`,`gaa2`.`enabled` AS `enabled2`,`gaa2`.`enabled_time` AS `enabled_time2`,`gaa2`.`disabled_time` AS `disabled_time2`,`gg`.`id` AS `group_id`,`gaa1`.`id` AS `attribute_assign_id1`,`gaa2`.`id` AS `attribute_assign_id2`,`gadn1`.`id` AS `attribute_def_name_id1`,`gadn2`.`id` AS `attribute_def_name_id2`,`gad1`.`id` AS `attribute_def_id1`,`gad2`.`id` AS `attribute_def_id2`,`gaaa1`.`id` AS `action_id1`,`gaaa2`.`id` AS `action_id2` from ((((((((`grouper_attribute_assign` `gaa1` join `grouper_attribute_assign` `gaa2`) join `grouper_groups` `gg`) join `grouper_attribute_def_name` `gadn1`) join `grouper_attribute_def_name` `gadn2`) join `grouper_attribute_def` `gad1`) join `grouper_attribute_def` `gad2`) join `grouper_attr_assign_action` `gaaa1`) join `grouper_attr_assign_action` `gaaa2`) where ((`gaa1`.`id` = `gaa2`.`owner_attribute_assign_id`) and (`gaa1`.`attribute_def_name_id` = `gadn1`.`id`) and (`gaa2`.`attribute_def_name_id` = `gadn2`.`id`) and (`gadn1`.`attribute_def_id` = `gad1`.`id`) and (`gadn2`.`attribute_def_id` = `gad2`.`id`) and (`gaa1`.`enabled` = 'T') and (`gg`.`id` = `gaa1`.`owner_group_id`) and isnull(`gaa1`.`owner_member_id`) and (`gaa1`.`attribute_assign_action_id` = `gaaa1`.`id`) and (`gaa2`.`attribute_assign_action_id` = `gaaa2`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_attr_asn_asn_member_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_attr_asn_asn_member_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_asn_member_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_attr_asn_asn_member_v` AS select `gm`.`subject_source` AS `source_id`,`gm`.`subject_id` AS `subject_id`,`gaaa1`.`name` AS `action1`,`gaaa2`.`name` AS `action2`,`gadn1`.`name` AS `attribute_def_name_name1`,`gadn2`.`name` AS `attribute_def_name_name2`,`gadn1`.`display_name` AS `attribute_def_name_disp_name1`,`gadn2`.`display_name` AS `attribute_def_name_disp_name2`,`gad1`.`name` AS `name_of_attribute_def1`,`gad2`.`name` AS `name_of_attribute_def2`,`gaa1`.`notes` AS `attribute_assign_notes1`,`gaa2`.`notes` AS `attribute_assign_notes2`,`gaa2`.`enabled` AS `enabled2`,`gaa2`.`enabled_time` AS `enabled_time2`,`gaa2`.`disabled_time` AS `disabled_time2`,`gm`.`id` AS `member_id`,`gaa1`.`id` AS `attribute_assign_id1`,`gaa2`.`id` AS `attribute_assign_id2`,`gadn1`.`id` AS `attribute_def_name_id1`,`gadn2`.`id` AS `attribute_def_name_id2`,`gad1`.`id` AS `attribute_def_id1`,`gad2`.`id` AS `attribute_def_id2`,`gaaa1`.`id` AS `action_id1`,`gaaa2`.`id` AS `action_id2` from ((((((((`grouper_attribute_assign` `gaa1` join `grouper_attribute_assign` `gaa2`) join `grouper_members` `gm`) join `grouper_attribute_def_name` `gadn1`) join `grouper_attribute_def_name` `gadn2`) join `grouper_attribute_def` `gad1`) join `grouper_attribute_def` `gad2`) join `grouper_attr_assign_action` `gaaa1`) join `grouper_attr_assign_action` `gaaa2`) where ((`gaa1`.`id` = `gaa2`.`owner_attribute_assign_id`) and (`gaa1`.`attribute_def_name_id` = `gadn1`.`id`) and (`gaa2`.`attribute_def_name_id` = `gadn2`.`id`) and (`gadn1`.`attribute_def_id` = `gad1`.`id`) and (`gadn2`.`attribute_def_id` = `gad2`.`id`) and (`gaa1`.`enabled` = 'T') and (`gm`.`id` = `gaa1`.`owner_member_id`) and isnull(`gaa1`.`owner_group_id`) and (`gaa1`.`attribute_assign_action_id` = `gaaa1`.`id`) and (`gaa2`.`attribute_assign_action_id` = `gaaa2`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_attr_asn_asn_mship_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_attr_asn_asn_mship_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_asn_mship_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_attr_asn_asn_mship_v` AS select `gg`.`name` AS `group_name`,`gm`.`subject_source` AS `source_id`,`gm`.`subject_id` AS `subject_id`,`gaaa1`.`name` AS `action1`,`gaaa2`.`name` AS `action2`,`gadn1`.`name` AS `attribute_def_name_name1`,`gadn2`.`name` AS `attribute_def_name_name2`,`gadn1`.`display_name` AS `attribute_def_name_disp_name1`,`gadn2`.`display_name` AS `attribute_def_name_disp_name2`,`gf`.`name` AS `list_name`,`gad1`.`name` AS `name_of_attribute_def1`,`gad2`.`name` AS `name_of_attribute_def2`,`gaa1`.`notes` AS `attribute_assign_notes1`,`gaa2`.`notes` AS `attribute_assign_notes2`,`gaa2`.`enabled` AS `enabled2`,`gaa2`.`enabled_time` AS `enabled_time2`,`gaa2`.`disabled_time` AS `disabled_time2`,`gg`.`id` AS `group_id`,`gms`.`id` AS `membership_id`,`gm`.`id` AS `member_id`,`gaa1`.`id` AS `attribute_assign_id1`,`gaa2`.`id` AS `attribute_assign_id2`,`gadn1`.`id` AS `attribute_def_name_id1`,`gadn2`.`id` AS `attribute_def_name_id2`,`gad1`.`id` AS `attribute_def_id1`,`gad2`.`id` AS `attribute_def_id2`,`gaaa1`.`id` AS `action_id1`,`gaaa2`.`id` AS `action_id2` from (((((((((((`grouper_attribute_assign` `gaa1` join `grouper_attribute_assign` `gaa2`) join `grouper_groups` `gg`) join `grouper_memberships` `gms`) join `grouper_attribute_def_name` `gadn1`) join `grouper_attribute_def_name` `gadn2`) join `grouper_attribute_def` `gad1`) join `grouper_attribute_def` `gad2`) join `grouper_members` `gm`) join `grouper_fields` `gf`) join `grouper_attr_assign_action` `gaaa1`) join `grouper_attr_assign_action` `gaaa2`) where ((`gaa1`.`owner_membership_id` = `gms`.`id`) and (`gaa2`.`owner_attribute_assign_id` = `gaa1`.`id`) and (`gaa1`.`attribute_def_name_id` = `gadn1`.`id`) and (`gaa2`.`attribute_def_name_id` = `gadn2`.`id`) and (`gadn1`.`attribute_def_id` = `gad1`.`id`) and (`gadn2`.`attribute_def_id` = `gad2`.`id`) and (`gaa1`.`enabled` = 'T') and (`gms`.`field_id` = `gf`.`id`) and (`gms`.`member_id` = `gm`.`id`) and (`gms`.`owner_group_id` = `gg`.`id`) and (`gf`.`type` = 'list') and (`gaa1`.`attribute_assign_action_id` = `gaaa1`.`id`) and (`gaa2`.`attribute_assign_action_id` = `gaaa2`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_attr_asn_asn_stem_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_attr_asn_asn_stem_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_asn_stem_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_attr_asn_asn_stem_v` AS select `gs`.`name` AS `stem_name`,`gaaa1`.`name` AS `action1`,`gaaa2`.`name` AS `action2`,`gadn1`.`name` AS `attribute_def_name_name1`,`gadn2`.`name` AS `attribute_def_name_name2`,`gs`.`display_name` AS `stem_display_name`,`gadn1`.`display_name` AS `attribute_def_name_disp_name1`,`gadn2`.`display_name` AS `attribute_def_name_disp_name2`,`gad1`.`name` AS `name_of_attribute_def1`,`gad2`.`name` AS `name_of_attribute_def2`,`gaa1`.`notes` AS `attribute_assign_notes1`,`gaa2`.`notes` AS `attribute_assign_notes2`,`gaa2`.`enabled` AS `enabled2`,`gaa2`.`enabled_time` AS `enabled_time2`,`gaa2`.`disabled_time` AS `disabled_time2`,`gs`.`id` AS `stem_id`,`gaa1`.`id` AS `attribute_assign_id1`,`gaa2`.`id` AS `attribute_assign_id2`,`gadn1`.`id` AS `attribute_def_name_id1`,`gadn2`.`id` AS `attribute_def_name_id2`,`gad1`.`id` AS `attribute_def_id1`,`gad2`.`id` AS `attribute_def_id2`,`gaaa1`.`id` AS `action_id1`,`gaaa2`.`id` AS `action_id2` from ((((((((`grouper_attribute_assign` `gaa1` join `grouper_attribute_assign` `gaa2`) join `grouper_stems` `gs`) join `grouper_attribute_def_name` `gadn1`) join `grouper_attribute_def_name` `gadn2`) join `grouper_attribute_def` `gad1`) join `grouper_attribute_def` `gad2`) join `grouper_attr_assign_action` `gaaa1`) join `grouper_attr_assign_action` `gaaa2`) where ((`gaa1`.`id` = `gaa2`.`owner_attribute_assign_id`) and (`gaa1`.`attribute_def_name_id` = `gadn1`.`id`) and (`gaa2`.`attribute_def_name_id` = `gadn2`.`id`) and (`gadn1`.`attribute_def_id` = `gad1`.`id`) and (`gadn2`.`attribute_def_id` = `gad2`.`id`) and (`gaa1`.`enabled` = 'T') and (`gs`.`id` = `gaa1`.`owner_stem_id`) and (`gaa1`.`attribute_assign_action_id` = `gaaa1`.`id`) and (`gaa2`.`attribute_assign_action_id` = `gaaa2`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_attr_asn_attrdef_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_attr_asn_attrdef_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_attrdef_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_attr_asn_attrdef_v` AS select `gad_assigned_to`.`name` AS `name_of_attr_def_assigned_to`,`gaaa`.`name` AS `action`,`gadn`.`name` AS `attribute_def_name_name`,`gadn`.`display_name` AS `attribute_def_name_disp_name`,`gad`.`name` AS `name_of_attribute_def_assigned`,`gaa`.`notes` AS `attribute_assign_notes`,`gaa`.`enabled` AS `enabled`,`gaa`.`enabled_time` AS `enabled_time`,`gaa`.`disabled_time` AS `disabled_time`,`gad_assigned_to`.`id` AS `id_of_attr_def_assigned_to`,`gaa`.`id` AS `attribute_assign_id`,`gadn`.`id` AS `attribute_def_name_id`,`gad`.`id` AS `attribute_def_id`,`gaaa`.`id` AS `action_id` from ((((`grouper_attribute_assign` `gaa` join `grouper_attribute_def` `gad_assigned_to`) join `grouper_attribute_def_name` `gadn`) join `grouper_attribute_def` `gad`) join `grouper_attr_assign_action` `gaaa`) where ((`gaa`.`owner_attribute_def_id` = `gad_assigned_to`.`id`) and (`gaa`.`attribute_def_name_id` = `gadn`.`id`) and (`gadn`.`attribute_def_id` = `gad`.`id`) and (`gaa`.`attribute_assign_action_id` = `gaaa`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_attr_asn_efmship_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_attr_asn_efmship_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_efmship_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_attr_asn_efmship_v` AS select distinct `gg`.`name` AS `group_name`,`gm`.`subject_source` AS `subject_source_id`,`gm`.`subject_id` AS `subject_id`,`gaaa`.`name` AS `action`,`gadn`.`name` AS `attribute_def_name_name`,`gg`.`display_name` AS `group_display_name`,`gadn`.`display_name` AS `attribute_def_name_disp_name`,`gad`.`name` AS `name_of_attribute_def`,`gaa`.`notes` AS `attribute_assign_notes`,`gf`.`name` AS `list_name`,`gaa`.`attribute_assign_delegatable` AS `attribute_assign_delegatable`,`gaa`.`enabled` AS `enabled`,`gaa`.`enabled_time` AS `enabled_time`,`gaa`.`disabled_time` AS `disabled_time`,`gg`.`id` AS `group_id`,`gaa`.`id` AS `attribute_assign_id`,`gadn`.`id` AS `attribute_def_name_id`,`gad`.`id` AS `attribute_def_id`,`gm`.`id` AS `member_id`,`gaaa`.`id` AS `action_id` from (((((((`grouper_attribute_assign` `gaa` join `grouper_memberships_all_v` `gmav`) join `grouper_attribute_def_name` `gadn`) join `grouper_attribute_def` `gad`) join `grouper_groups` `gg`) join `grouper_fields` `gf`) join `grouper_members` `gm`) join `grouper_attr_assign_action` `gaaa`) where ((convert(`gaa`.`owner_group_id` using utf8) = convert(`gmav`.`OWNER_GROUP_ID` using utf8)) and (convert(`gaa`.`owner_member_id` using utf8) = convert(`gmav`.`MEMBER_ID` using utf8)) and (`gaa`.`attribute_def_name_id` = `gadn`.`id`) and (`gadn`.`attribute_def_id` = `gad`.`id`) and (`gmav`.`IMMEDIATE_MSHIP_ENABLED` = 'T') and (convert(`gmav`.`OWNER_GROUP_ID` using utf8) = convert(`gg`.`id` using utf8)) and (convert(`gmav`.`FIELD_ID` using utf8) = convert(`gf`.`id` using utf8)) and (`gf`.`type` = 'list') and (convert(`gmav`.`MEMBER_ID` using utf8) = convert(`gm`.`id` using utf8)) and (`gaa`.`owner_member_id` is not null) and isnull(`gaa`.`owner_group_id`) and (`gaa`.`attribute_assign_action_id` = `gaaa`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_attr_asn_group_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_attr_asn_group_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_group_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_attr_asn_group_v` AS select `gg`.`name` AS `group_name`,`gaaa`.`name` AS `action`,`gadn`.`name` AS `attribute_def_name_name`,`gg`.`display_name` AS `group_display_name`,`gadn`.`display_name` AS `attribute_def_name_disp_name`,`gad`.`name` AS `name_of_attribute_def`,`gaa`.`notes` AS `attribute_assign_notes`,`gaa`.`attribute_assign_delegatable` AS `attribute_assign_delegatable`,`gaa`.`enabled` AS `enabled`,`gaa`.`enabled_time` AS `enabled_time`,`gaa`.`disabled_time` AS `disabled_time`,`gg`.`id` AS `group_id`,`gaa`.`id` AS `attribute_assign_id`,`gadn`.`id` AS `attribute_def_name_id`,`gad`.`id` AS `attribute_def_id`,`gaaa`.`id` AS `action_id` from ((((`grouper_attribute_assign` `gaa` join `grouper_groups` `gg`) join `grouper_attribute_def_name` `gadn`) join `grouper_attribute_def` `gad`) join `grouper_attr_assign_action` `gaaa`) where ((`gaa`.`owner_group_id` = `gg`.`id`) and (`gaa`.`attribute_def_name_id` = `gadn`.`id`) and (`gadn`.`attribute_def_id` = `gad`.`id`) and isnull(`gaa`.`owner_member_id`) and (`gaa`.`attribute_assign_action_id` = `gaaa`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_attr_asn_member_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_attr_asn_member_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_member_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_attr_asn_member_v` AS select `gm`.`subject_source` AS `source_id`,`gm`.`subject_id` AS `subject_id`,`gaaa`.`name` AS `action`,`gadn`.`name` AS `attribute_def_name_name`,`gadn`.`display_name` AS `attribute_def_name_disp_name`,`gad`.`name` AS `name_of_attribute_def`,`gaa`.`notes` AS `attribute_assign_notes`,`gaa`.`attribute_assign_delegatable` AS `attribute_assign_delegatable`,`gaa`.`enabled` AS `enabled`,`gaa`.`enabled_time` AS `enabled_time`,`gaa`.`disabled_time` AS `disabled_time`,`gm`.`id` AS `member_id`,`gaa`.`id` AS `attribute_assign_id`,`gadn`.`id` AS `attribute_def_name_id`,`gad`.`id` AS `attribute_def_id`,`gaaa`.`id` AS `action_id` from ((((`grouper_attribute_assign` `gaa` join `grouper_members` `gm`) join `grouper_attribute_def_name` `gadn`) join `grouper_attribute_def` `gad`) join `grouper_attr_assign_action` `gaaa`) where ((`gaa`.`owner_member_id` = `gm`.`id`) and (`gaa`.`attribute_def_name_id` = `gadn`.`id`) and (`gadn`.`attribute_def_id` = `gad`.`id`) and isnull(`gaa`.`owner_group_id`) and (`gaa`.`attribute_assign_action_id` = `gaaa`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_attr_asn_mship_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_attr_asn_mship_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_mship_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_attr_asn_mship_v` AS select `gg`.`name` AS `group_name`,`gm`.`subject_source` AS `source_id`,`gm`.`subject_id` AS `subject_id`,`gaaa`.`name` AS `action`,`gadn`.`name` AS `attribute_def_name_name`,`gadn`.`display_name` AS `attribute_def_name_disp_name`,`gf`.`name` AS `list_name`,`gad`.`name` AS `name_of_attribute_def`,`gaa`.`notes` AS `attribute_assign_notes`,`gaa`.`attribute_assign_delegatable` AS `attribute_assign_delegatable`,`gaa`.`enabled` AS `enabled`,`gaa`.`enabled_time` AS `enabled_time`,`gaa`.`disabled_time` AS `disabled_time`,`gg`.`id` AS `group_id`,`gms`.`id` AS `membership_id`,`gm`.`id` AS `member_id`,`gaa`.`id` AS `attribute_assign_id`,`gadn`.`id` AS `attribute_def_name_id`,`gad`.`id` AS `attribute_def_id`,`gaaa`.`id` AS `action_id` from (((((((`grouper_attribute_assign` `gaa` join `grouper_groups` `gg`) join `grouper_memberships` `gms`) join `grouper_attribute_def_name` `gadn`) join `grouper_attribute_def` `gad`) join `grouper_members` `gm`) join `grouper_fields` `gf`) join `grouper_attr_assign_action` `gaaa`) where ((`gaa`.`owner_membership_id` = `gms`.`id`) and (`gaa`.`attribute_def_name_id` = `gadn`.`id`) and (`gadn`.`attribute_def_id` = `gad`.`id`) and (`gms`.`field_id` = `gf`.`id`) and (`gms`.`member_id` = `gm`.`id`) and (`gms`.`owner_group_id` = `gg`.`id`) and (`gf`.`type` = 'list') and (`gaa`.`attribute_assign_action_id` = `gaaa`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_attr_asn_stem_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_attr_asn_stem_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_asn_stem_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_attr_asn_stem_v` AS select `gs`.`name` AS `stem_name`,`gaaa`.`name` AS `action`,`gadn`.`name` AS `attribute_def_name_name`,`gs`.`display_name` AS `stem_display_name`,`gadn`.`display_name` AS `attribute_def_name_disp_name`,`gad`.`name` AS `name_of_attribute_def`,`gaa`.`notes` AS `attribute_assign_notes`,`gaa`.`enabled` AS `enabled`,`gaa`.`enabled_time` AS `enabled_time`,`gaa`.`disabled_time` AS `disabled_time`,`gs`.`id` AS `stem_id`,`gaa`.`id` AS `attribute_assign_id`,`gadn`.`id` AS `attribute_def_name_id`,`gad`.`id` AS `attribute_def_id`,`gaaa`.`id` AS `action_id` from ((((`grouper_attribute_assign` `gaa` join `grouper_stems` `gs`) join `grouper_attribute_def_name` `gadn`) join `grouper_attribute_def` `gad`) join `grouper_attr_assign_action` `gaaa`) where ((`gaa`.`owner_stem_id` = `gs`.`id`) and (`gaa`.`attribute_def_name_id` = `gadn`.`id`) and (`gadn`.`attribute_def_id` = `gad`.`id`) and (`gaa`.`attribute_assign_action_id` = `gaaa`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_attr_assn_action_set_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_attr_assn_action_set_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_assn_action_set_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_attr_assn_action_set_v` AS select `ifHas`.`name` AS `if_has_attr_assn_action_name`,`thenHas`.`name` AS `then_has_attr_assn_action_name`,`gaaas`.`depth` AS `depth`,`gaaas`.`type` AS `type`,`gaaaParentIfHas`.`name` AS `parent_if_has_name`,`gaaaParentThenHas`.`name` AS `parent_then_has_name`,`gaaas`.`id` AS `id`,`ifHas`.`id` AS `if_has_attr_assn_action_id`,`thenHas`.`id` AS `then_has_attr_assn_action_id`,`gaaas`.`parent_attr_assn_action_id` AS `parent_attr_assn_action_id` from (((((`grouper_attr_assign_action_set` `gaaas` join `grouper_attr_assign_action_set` `gaaasParent`) join `grouper_attr_assign_action` `gaaaParentIfHas`) join `grouper_attr_assign_action` `gaaaParentThenHas`) join `grouper_attr_assign_action` `ifHas`) join `grouper_attr_assign_action` `thenHas`) where ((`thenHas`.`id` = `gaaas`.`then_has_attr_assn_action_id`) and (`ifHas`.`id` = `gaaas`.`if_has_attr_assn_action_id`) and (`gaaas`.`parent_attr_assn_action_id` = `gaaasParent`.`id`) and (`gaaaParentIfHas`.`id` = `gaaasParent`.`if_has_attr_assn_action_id`) and (`gaaaParentThenHas`.`id` = `gaaasParent`.`then_has_attr_assn_action_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_attr_def_name_set_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_attr_def_name_set_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_def_name_set_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_attr_def_name_set_v` AS select `ifHas`.`name` AS `if_has_attr_def_name_name`,`thenHas`.`name` AS `then_has_attr_def_name_name`,`gadns`.`depth` AS `depth`,`gadns`.`type` AS `type`,`gadnParentIfHas`.`name` AS `parent_if_has_name`,`gadnParentThenHas`.`name` AS `parent_then_has_name`,`gadns`.`id` AS `id`,`ifHas`.`id` AS `if_has_attr_def_name_id`,`thenHas`.`id` AS `then_has_attr_def_name_id`,`gadns`.`parent_attr_def_name_set_id` AS `parent_attr_def_name_set_id` from (((((`grouper_attribute_def_name_set` `gadns` join `grouper_attribute_def_name_set` `gadnsParent`) join `grouper_attribute_def_name` `gadnParentIfHas`) join `grouper_attribute_def_name` `gadnParentThenHas`) join `grouper_attribute_def_name` `ifHas`) join `grouper_attribute_def_name` `thenHas`) where ((`thenHas`.`id` = `gadns`.`then_has_attribute_def_name_id`) and (`ifHas`.`id` = `gadns`.`if_has_attribute_def_name_id`) and (`gadns`.`parent_attr_def_name_set_id` = `gadnsParent`.`id`) and (`gadnParentIfHas`.`id` = `gadnsParent`.`if_has_attribute_def_name_id`) and (`gadnParentThenHas`.`id` = `gadnsParent`.`then_has_attribute_def_name_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_attr_def_priv_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_attr_def_priv_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_attr_def_priv_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_attr_def_priv_v` AS select distinct `gm`.`subject_id` AS `subject_id`,`gm`.`subject_source` AS `subject_source_id`,`gf`.`name` AS `field_name`,`gad`.`name` AS `attribute_def_name`,`gad`.`description` AS `attribute_def_description`,`gad`.`attribute_def_type` AS `attribute_def_type`,`gad`.`stem_id` AS `attribute_def_stem_id`,`gad`.`id` AS `attribute_def_id`,`gm`.`id` AS `member_id`,`gmav`.`FIELD_ID` AS `field_id`,`gmav`.`IMMEDIATE_MEMBERSHIP_ID` AS `immediate_membership_id`,`gmav`.`MEMBERSHIP_ID` AS `membership_id` from (((`grouper_memberships_all_v` `gmav` join `grouper_attribute_def` `gad`) join `grouper_fields` `gf`) join `grouper_members` `gm`) where ((convert(`gmav`.`OWNER_ATTR_DEF_ID` using utf8) = convert(`gad`.`id` using utf8)) and (convert(`gmav`.`FIELD_ID` using utf8) = convert(`gf`.`id` using utf8)) and (`gmav`.`IMMEDIATE_MSHIP_ENABLED` = 'T') and (convert(`gmav`.`MEMBER_ID` using utf8) = convert(`gm`.`id` using utf8))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_attributes_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_attributes_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_attributes_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_attributes_v` AS select `gg`.`name` AS `GROUP_NAME`,`gg`.`display_name` AS `GROUP_DISPLAY_NAME`,`gf`.`name` AS `ATTRIBUTE_NAME`,`ga`.`value` AS `ATTRIBUTE_VALUE`,`gt`.`name` AS `GROUP_TYPE_NAME`,`ga`.`field_id` AS `FIELD_ID`,`ga`.`id` AS `ATTRIBUTE_ID`,`gg`.`id` AS `GROUP_ID`,`gf`.`grouptype_uuid` AS `GROUPTYPE_UUID`,`ga`.`context_id` AS `CONTEXT_ID` from (((`grouper_attributes` `ga` join `grouper_groups` `gg`) join `grouper_fields` `gf`) join `grouper_types` `gt`) where ((`ga`.`field_id` = `gf`.`id`) and (`ga`.`group_id` = `gg`.`id`) and (`gf`.`grouptype_uuid` = `gt`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_audit_entry_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_audit_entry_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_audit_entry_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_audit_entry_v` AS select `gae`.`created_on` AS `created_on`,`gat`.`audit_category` AS `audit_category`,`gat`.`action_name` AS `action_name`,(select `gm`.`subject_id` from `grouper_members` `gm` where (`gm`.`id` = `gae`.`logged_in_member_id`)) AS `logged_in_subject_id`,(select `gm`.`subject_id` from `grouper_members` `gm` where (`gm`.`id` = `gae`.`act_as_member_id`)) AS `act_as_subject_id`,`gat`.`label_string01` AS `label_string01`,`gae`.`string01` AS `string01`,`gat`.`label_string02` AS `label_string02`,`gae`.`string02` AS `string02`,`gat`.`label_string03` AS `label_string03`,`gae`.`string03` AS `string03`,`gat`.`label_string04` AS `label_string04`,`gae`.`string04` AS `string04`,`gat`.`label_string05` AS `label_string05`,`gae`.`string05` AS `string05`,`gat`.`label_string06` AS `label_string06`,`gae`.`string06` AS `string06`,`gat`.`label_string07` AS `label_string07`,`gae`.`string07` AS `string07`,`gat`.`label_string08` AS `label_string08`,`gae`.`string08` AS `string08`,`gat`.`label_int01` AS `label_int01`,`gae`.`int01` AS `int01`,`gat`.`label_int02` AS `label_int02`,`gae`.`int02` AS `int02`,`gat`.`label_int03` AS `label_int03`,`gae`.`int03` AS `int03`,`gat`.`label_int04` AS `label_int04`,`gae`.`int04` AS `int04`,`gat`.`label_int05` AS `label_int05`,`gae`.`int05` AS `int05`,`gae`.`context_id` AS `context_id`,`gae`.`grouper_engine` AS `grouper_engine`,`gae`.`description` AS `description`,(select `gm`.`subject_source` from `grouper_members` `gm` where (`gm`.`id` = `gae`.`logged_in_member_id`)) AS `logged_in_source_id`,(select `gm`.`subject_source` from `grouper_members` `gm` where (`gm`.`id` = `gae`.`act_as_member_id`)) AS `act_as_source_id`,`gae`.`logged_in_member_id` AS `logged_in_member_id`,`gae`.`act_as_member_id` AS `act_as_member_id`,`gat`.`id` AS `audit_type_id`,`gae`.`user_ip_address` AS `user_ip_address`,`gae`.`server_host` AS `server_host`,`gae`.`last_updated` AS `audit_entry_last_updated`,`gae`.`id` AS `audit_entry_id`,`gae`.`grouper_version` AS `grouper_version`,`gae`.`env_name` AS `env_name` from (`grouper_audit_type` `gat` join `grouper_audit_entry` `gae`) where (`gat`.`id` = `gae`.`audit_type_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_change_log_entry_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_change_log_entry_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_change_log_entry_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_change_log_entry_v` AS select `gcle`.`created_on` AS `created_on`,`gclt`.`change_log_category` AS `change_log_category`,`gclt`.`action_name` AS `action_name`,`gcle`.`sequence_number` AS `sequence_number`,`gclt`.`label_string01` AS `label_string01`,`gcle`.`string01` AS `string01`,`gclt`.`label_string02` AS `label_string02`,`gcle`.`string02` AS `string02`,`gclt`.`label_string03` AS `label_string03`,`gcle`.`string03` AS `string03`,`gclt`.`label_string04` AS `label_string04`,`gcle`.`string04` AS `string04`,`gclt`.`label_string05` AS `label_string05`,`gcle`.`string05` AS `string05`,`gclt`.`label_string06` AS `label_string06`,`gcle`.`string06` AS `string06`,`gclt`.`label_string07` AS `label_string07`,`gcle`.`string07` AS `string07`,`gclt`.`label_string08` AS `label_string08`,`gcle`.`string08` AS `string08`,`gclt`.`label_string09` AS `label_string09`,`gcle`.`string09` AS `string09`,`gclt`.`label_string10` AS `label_string10`,`gcle`.`string10` AS `string10`,`gclt`.`label_string11` AS `label_string11`,`gcle`.`string11` AS `string11`,`gclt`.`label_string12` AS `label_string12`,`gcle`.`string12` AS `string12`,`gcle`.`context_id` AS `context_id`,`gcle`.`change_log_type_id` AS `change_log_type_id` from (`grouper_change_log_type` `gclt` join `grouper_change_log_entry` `gcle`) where (`gclt`.`id` = `gcle`.`change_log_type_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_composites_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_composites_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_composites_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_composites_v` AS select (select `gg`.`name` from `grouper_groups` `gg` where (`gg`.`id` = `gc`.`owner`)) AS `OWNER_GROUP_NAME`,`gc`.`type` AS `COMPOSITE_TYPE`,(select `gg`.`name` from `grouper_groups` `gg` where (`gg`.`id` = `gc`.`left_factor`)) AS `LEFT_FACTOR_GROUP_NAME`,(select `gg`.`name` from `grouper_groups` `gg` where (`gg`.`id` = `gc`.`right_factor`)) AS `RIGHT_FACTOR_GROUP_NAME`,(select `gg`.`display_name` from `grouper_groups` `gg` where (`gg`.`id` = `gc`.`owner`)) AS `OWNER_GROUP_DISPLAYNAME`,(select `gg`.`display_name` from `grouper_groups` `gg` where (`gg`.`id` = `gc`.`left_factor`)) AS `LEFT_FACTOR_GROUP_DISPLAYNAME`,(select `gg`.`display_name` from `grouper_groups` `gg` where (`gg`.`id` = `gc`.`right_factor`)) AS `RIGHT_FACTOR_GROUP_DISPLAYNAME`,`gc`.`owner` AS `owner_group_id`,`gc`.`left_factor` AS `LEFT_FACTOR_GROUP_ID`,`gc`.`right_factor` AS `RIGHT_FACTOR_GROUP_ID`,`gc`.`id` AS `COMPOSITE_ID`,`gc`.`create_time` AS `CREATE_TIME`,`gc`.`creator_id` AS `CREATOR_ID`,`gc`.`hibernate_version_number` AS `HIBERNATE_VERSION_NUMBER`,`gc`.`context_id` AS `CONTEXT_ID` from `grouper_composites` `gc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_groups_types_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_groups_types_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_groups_types_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_groups_types_v` AS select (select `gg`.`name` from `grouper_groups` `gg` where (`gg`.`id` = `ggt`.`group_uuid`)) AS `GROUP_NAME`,(select `gg`.`display_name` from `grouper_groups` `gg` where (`gg`.`id` = `ggt`.`group_uuid`)) AS `GROUP_DISPLAYNAME`,`gt`.`name` AS `GROUP_TYPE_NAME`,`ggt`.`group_uuid` AS `GROUP_ID`,`ggt`.`type_uuid` AS `GROUP_TYPE_UUID`,`ggt`.`id` AS `GROUPER_GROUPS_TYPES_ID`,`ggt`.`hibernate_version_number` AS `HIBERNATE_VERSION_NUMBER`,`ggt`.`context_id` AS `CONTEXT_ID` from (`grouper_groups_types` `ggt` join `grouper_types` `gt`) where (`ggt`.`type_uuid` = `gt`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_groups_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_groups_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_groups_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_groups_v` AS select `gg`.`extension` AS `EXTENSION`,`gg`.`name` AS `NAME`,`gg`.`display_extension` AS `DISPLAY_EXTENSION`,`gg`.`display_name` AS `DISPLAY_NAME`,`gg`.`description` AS `DESCRIPTION`,`gs`.`name` AS `PARENT_STEM_NAME`,`gg`.`type_of_group` AS `TYPE_OF_GROUP`,`gg`.`id` AS `GROUP_ID`,`gs`.`id` AS `PARENT_STEM_ID`,(select `gm`.`subject_source` from `grouper_members` `gm` where (`gm`.`id` = `gg`.`modifier_id`)) AS `MODIFIER_SOURCE`,(select `gm`.`subject_id` from `grouper_members` `gm` where (`gm`.`id` = `gg`.`modifier_id`)) AS `MODIFIER_SUBJECT_ID`,(select `gm`.`subject_source` from `grouper_members` `gm` where (`gm`.`id` = `gg`.`creator_id`)) AS `CREATOR_SOURCE`,(select `gm`.`subject_id` from `grouper_members` `gm` where (`gm`.`id` = `gg`.`creator_id`)) AS `CREATOR_SUBJECT_ID`,(select distinct 'T' from `grouper_composites` `gc` where (`gc`.`owner` = `gg`.`id`)) AS `IS_COMPOSITE_OWNER`,(select distinct 'T' from `grouper_composites` `gc` where ((`gc`.`left_factor` = `gg`.`id`) or (`gc`.`right_factor` = `gg`.`id`))) AS `IS_COMPOSITE_FACTOR`,`gg`.`creator_id` AS `CREATOR_ID`,`gg`.`create_time` AS `CREATE_TIME`,`gg`.`modifier_id` AS `MODIFIER_ID`,`gg`.`modify_time` AS `MODIFY_TIME`,`gg`.`hibernate_version_number` AS `HIBERNATE_VERSION_NUMBER`,`gg`.`context_id` AS `CONTEXT_ID` from (`grouper_groups` `gg` join `grouper_stems` `gs`) where (`gg`.`parent_stem` = `gs`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_memberships_all_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_memberships_all_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_memberships_all_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_memberships_all_v` AS select concat(`ms`.`id`,':',`gs`.`id`) AS `MEMBERSHIP_ID`,`ms`.`id` AS `IMMEDIATE_MEMBERSHIP_ID`,`gs`.`id` AS `GROUP_SET_ID`,`ms`.`member_id` AS `MEMBER_ID`,`gs`.`field_id` AS `FIELD_ID`,`ms`.`field_id` AS `IMMEDIATE_FIELD_ID`,`gs`.`owner_id` AS `OWNER_ID`,`gs`.`owner_attr_def_id` AS `OWNER_ATTR_DEF_ID`,`gs`.`owner_group_id` AS `OWNER_GROUP_ID`,`gs`.`owner_stem_id` AS `OWNER_STEM_ID`,`gs`.`via_group_id` AS `VIA_GROUP_ID`,`ms`.`via_composite_id` AS `VIA_COMPOSITE_ID`,`gs`.`depth` AS `DEPTH`,`gs`.`mship_type` AS `MSHIP_TYPE`,`ms`.`enabled` AS `IMMEDIATE_MSHIP_ENABLED`,`ms`.`enabled_timestamp` AS `IMMEDIATE_MSHIP_ENABLED_TIME`,`ms`.`disabled_timestamp` AS `IMMEDIATE_MSHIP_DISABLED_TIME`,`gs`.`parent_id` AS `GROUP_SET_PARENT_ID`,`ms`.`creator_id` AS `MEMBERSHIP_CREATOR_ID`,`ms`.`create_time` AS `MEMBERSHIP_CREATE_TIME`,`gs`.`creator_id` AS `GROUP_SET_CREATOR_ID`,`gs`.`create_time` AS `GROUP_SET_CREATE_TIME`,`ms`.`hibernate_version_number` AS `HIBERNATE_VERSION_NUMBER`,`ms`.`context_id` AS `CONTEXT_ID` from (`grouper_memberships` `ms` join `grouper_group_set` `gs`) where ((`ms`.`owner_id` = `gs`.`member_id`) and (`ms`.`field_id` = `gs`.`member_field_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_memberships_lw_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_memberships_lw_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_memberships_lw_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_memberships_lw_v` AS select distinct `gm`.`subject_id` AS `SUBJECT_ID`,`gm`.`subject_source` AS `SUBJECT_SOURCE`,`gg`.`name` AS `GROUP_NAME`,`gfl`.`name` AS `LIST_NAME`,`gfl`.`type` AS `LIST_TYPE`,`gg`.`id` AS `GROUP_ID` from (((`grouper_memberships_all_v` `gms` join `grouper_members` `gm`) join `grouper_groups` `gg`) join `grouper_fields` `gfl`) where ((`gms`.`OWNER_GROUP_ID` = `gg`.`id`) and (`gms`.`FIELD_ID` = `gfl`.`id`) and (`gms`.`MEMBER_ID` = `gm`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_memberships_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_memberships_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_memberships_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_memberships_v` AS select (select `gg`.`name` from `grouper_groups` `gg` where (`gg`.`id` = `gms`.`OWNER_GROUP_ID`)) AS `GROUP_NAME`,(select `gg`.`display_name` from `grouper_groups` `gg` where (`gg`.`id` = `gms`.`OWNER_GROUP_ID`)) AS `GROUP_DISPLAYNAME`,(select `gs`.`name` from `grouper_stems` `gs` where (`gs`.`id` = `gms`.`OWNER_STEM_ID`)) AS `STEM_NAME`,(select `gs`.`display_name` from `grouper_stems` `gs` where (`gs`.`id` = `gms`.`OWNER_STEM_ID`)) AS `STEM_DISPLAYNAME`,`gm`.`subject_id` AS `SUBJECT_ID`,`gm`.`subject_source` AS `SUBJECT_SOURCE`,`gms`.`MEMBER_ID` AS `MEMBER_ID`,`gf`.`type` AS `LIST_TYPE`,`gf`.`name` AS `LIST_NAME`,`gms`.`MSHIP_TYPE` AS `MEMBERSHIP_TYPE`,(select `gg`.`name` from (`grouper_groups` `gg` join `grouper_composites` `gc`) where ((`gg`.`id` = `gms`.`VIA_COMPOSITE_ID`) and (`gg`.`id` = `gc`.`owner`))) AS `COMPOSITE_PARENT_GROUP_NAME`,`gms`.`DEPTH` AS `DEPTH`,(select `gm`.`subject_source` from `grouper_members` `gm` where (`gm`.`id` = `gms`.`MEMBERSHIP_CREATOR_ID`)) AS `CREATOR_SOURCE`,(select `gm`.`subject_id` from `grouper_members` `gm` where (`gm`.`id` = `gms`.`MEMBERSHIP_CREATOR_ID`)) AS `CREATOR_SUBJECT_ID`,`gms`.`MEMBERSHIP_ID` AS `MEMBERSHIP_ID`,`gms`.`IMMEDIATE_MEMBERSHIP_ID` AS `IMMEDIATE_MEMBERSHIP_ID`,`gms`.`GROUP_SET_ID` AS `GROUP_SET_ID`,(select `gs`.`id` from `grouper_stems` `gs` where (`gs`.`id` = `gms`.`OWNER_STEM_ID`)) AS `STEM_ID`,(select `gg`.`id` from `grouper_groups` `gg` where (`gg`.`id` = `gms`.`OWNER_GROUP_ID`)) AS `GROUP_ID`,`gms`.`MEMBERSHIP_CREATE_TIME` AS `CREATE_TIME`,`gms`.`MEMBERSHIP_CREATOR_ID` AS `CREATOR_ID`,`gms`.`FIELD_ID` AS `FIELD_ID`,`gms`.`CONTEXT_ID` AS `CONTEXT_ID` from ((`grouper_memberships_all_v` `gms` join `grouper_members` `gm`) join `grouper_fields` `gf`) where ((`gms`.`MEMBER_ID` = `gm`.`id`) and (`gms`.`FIELD_ID` = `gf`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_mship_attr_flat_lw_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_mship_attr_flat_lw_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_mship_attr_flat_lw_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_mship_attr_flat_lw_v` AS select `gm`.`subject_id` AS `subject_id`,`gm`.`subject_source` AS `subject_source`,`gad`.`name` AS `attribute_def_name`,`gf`.`name` AS `list_name`,`gf`.`type` AS `list_type`,`gad`.`id` AS `attribute_def_id` from (((`grouper_flat_memberships` `gfm` join `grouper_attribute_def` `gad`) join `grouper_fields` `gf`) join `grouper_members` `gm`) where ((`gfm`.`owner_stem_id` = `gad`.`id`) and (`gfm`.`field_id` = `gf`.`id`) and (`gfm`.`member_id` = `gm`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_mship_attrdef_lw_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_mship_attrdef_lw_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_mship_attrdef_lw_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_mship_attrdef_lw_v` AS select distinct `gm`.`subject_id` AS `SUBJECT_ID`,`gm`.`subject_source` AS `SUBJECT_SOURCE`,`gad`.`name` AS `ATTRIBUTE_DEF_NAME`,`gfl`.`name` AS `LIST_NAME`,`gfl`.`type` AS `LIST_TYPE`,`gad`.`id` AS `ATTRIBUTE_DEF_ID` from (((`grouper_memberships_all_v` `gms` join `grouper_members` `gm`) join `grouper_attribute_def` `gad`) join `grouper_fields` `gfl`) where ((`gms`.`OWNER_ATTR_DEF_ID` = `gad`.`id`) and (`gms`.`FIELD_ID` = `gfl`.`id`) and (`gms`.`MEMBER_ID` = `gm`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_mship_group_flat_lw_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_mship_group_flat_lw_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_mship_group_flat_lw_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_mship_group_flat_lw_v` AS select `gm`.`subject_id` AS `subject_id`,`gm`.`subject_source` AS `subject_source`,`gg`.`name` AS `group_name`,`gf`.`name` AS `list_name`,`gf`.`type` AS `list_type`,`gg`.`id` AS `group_id` from (((`grouper_flat_memberships` `gfm` join `grouper_groups` `gg`) join `grouper_fields` `gf`) join `grouper_members` `gm`) where ((`gfm`.`owner_group_id` = `gg`.`id`) and (`gfm`.`field_id` = `gf`.`id`) and (`gfm`.`member_id` = `gm`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_mship_stem_flat_lw_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_mship_stem_flat_lw_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_mship_stem_flat_lw_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_mship_stem_flat_lw_v` AS select `gm`.`subject_id` AS `subject_id`,`gm`.`subject_source` AS `subject_source`,`gs`.`name` AS `stem_name`,`gf`.`name` AS `list_name`,`gf`.`type` AS `list_type`,`gs`.`id` AS `stem_id` from (((`grouper_flat_memberships` `gfm` join `grouper_stems` `gs`) join `grouper_fields` `gf`) join `grouper_members` `gm`) where ((`gfm`.`owner_stem_id` = `gs`.`id`) and (`gfm`.`field_id` = `gf`.`id`) and (`gfm`.`member_id` = `gm`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_mship_stem_lw_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_mship_stem_lw_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_mship_stem_lw_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_mship_stem_lw_v` AS select distinct `gm`.`subject_id` AS `SUBJECT_ID`,`gm`.`subject_source` AS `SUBJECT_SOURCE`,`gs`.`name` AS `STEM_NAME`,`gfl`.`name` AS `LIST_NAME`,`gfl`.`type` AS `LIST_TYPE`,`gs`.`id` AS `STEM_ID` from (((`grouper_memberships_all_v` `gms` join `grouper_members` `gm`) join `grouper_stems` `gs`) join `grouper_fields` `gfl`) where ((`gms`.`OWNER_STEM_ID` = `gs`.`id`) and (`gms`.`FIELD_ID` = `gfl`.`id`) and (`gms`.`MEMBER_ID` = `gm`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_perms_all_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_perms_all_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_perms_all_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_perms_all_v` AS select `grouper_perms_role_v`.`role_name` AS `role_name`,`grouper_perms_role_v`.`subject_source_id` AS `subject_source_id`,`grouper_perms_role_v`.`subject_id` AS `subject_id`,`grouper_perms_role_v`.`action` AS `action`,`grouper_perms_role_v`.`attribute_def_name_name` AS `attribute_def_name_name`,`grouper_perms_role_v`.`attribute_def_name_disp_name` AS `attribute_def_name_disp_name`,`grouper_perms_role_v`.`role_display_name` AS `role_display_name`,`grouper_perms_role_v`.`attribute_assign_delegatable` AS `attribute_assign_delegatable`,`grouper_perms_role_v`.`enabled` AS `enabled`,`grouper_perms_role_v`.`enabled_time` AS `enabled_time`,`grouper_perms_role_v`.`disabled_time` AS `disabled_time`,`grouper_perms_role_v`.`role_id` AS `role_id`,`grouper_perms_role_v`.`attribute_def_id` AS `attribute_def_id`,`grouper_perms_role_v`.`member_id` AS `member_id`,`grouper_perms_role_v`.`attribute_def_name_id` AS `attribute_def_name_id`,`grouper_perms_role_v`.`action_id` AS `action_id`,`grouper_perms_role_v`.`membership_depth` AS `membership_depth`,`grouper_perms_role_v`.`role_set_depth` AS `role_set_depth`,`grouper_perms_role_v`.`attr_def_name_set_depth` AS `attr_def_name_set_depth`,`grouper_perms_role_v`.`attr_assign_action_set_depth` AS `attr_assign_action_set_depth`,`grouper_perms_role_v`.`membership_id` AS `membership_id`,`grouper_perms_role_v`.`attribute_assign_id` AS `attribute_assign_id`,`grouper_perms_role_v`.`permission_type` AS `permission_type`,`grouper_perms_role_v`.`assignment_notes` AS `assignment_notes` from `grouper_perms_role_v` union select `grouper_perms_role_subject_v`.`role_name` AS `role_name`,`grouper_perms_role_subject_v`.`subject_source_id` AS `subject_source_id`,`grouper_perms_role_subject_v`.`subject_id` AS `subject_id`,`grouper_perms_role_subject_v`.`action` AS `action`,`grouper_perms_role_subject_v`.`attribute_def_name_name` AS `attribute_def_name_name`,`grouper_perms_role_subject_v`.`attribute_def_name_disp_name` AS `attribute_def_name_disp_name`,`grouper_perms_role_subject_v`.`role_display_name` AS `role_display_name`,`grouper_perms_role_subject_v`.`attribute_assign_delegatable` AS `attribute_assign_delegatable`,`grouper_perms_role_subject_v`.`enabled` AS `enabled`,`grouper_perms_role_subject_v`.`enabled_time` AS `enabled_time`,`grouper_perms_role_subject_v`.`disabled_time` AS `disabled_time`,`grouper_perms_role_subject_v`.`role_id` AS `role_id`,`grouper_perms_role_subject_v`.`attribute_def_id` AS `attribute_def_id`,`grouper_perms_role_subject_v`.`member_id` AS `member_id`,`grouper_perms_role_subject_v`.`attribute_def_name_id` AS `attribute_def_name_id`,`grouper_perms_role_subject_v`.`action_id` AS `action_id`,`grouper_perms_role_subject_v`.`membership_depth` AS `membership_depth`,`grouper_perms_role_subject_v`.`role_set_depth` AS `role_set_depth`,`grouper_perms_role_subject_v`.`attr_def_name_set_depth` AS `attr_def_name_set_depth`,`grouper_perms_role_subject_v`.`attr_assign_action_set_depth` AS `attr_assign_action_set_depth`,`grouper_perms_role_subject_v`.`membership_id` AS `membership_id`,`grouper_perms_role_subject_v`.`attribute_assign_id` AS `attribute_assign_id`,`grouper_perms_role_subject_v`.`permission_type` AS `permission_type`,`grouper_perms_role_subject_v`.`assignment_notes` AS `assignment_notes` from `grouper_perms_role_subject_v` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_perms_role_subject_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_perms_role_subject_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_perms_role_subject_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_perms_role_subject_v` AS select distinct `gr`.`name` AS `role_name`,`gm`.`subject_source` AS `subject_source_id`,`gm`.`subject_id` AS `subject_id`,`gaaa`.`name` AS `action`,`gadn`.`name` AS `attribute_def_name_name`,`gadn`.`display_name` AS `attribute_def_name_disp_name`,`gr`.`display_name` AS `role_display_name`,`gaa`.`attribute_assign_delegatable` AS `attribute_assign_delegatable`,`gaa`.`enabled` AS `enabled`,`gaa`.`enabled_time` AS `enabled_time`,`gaa`.`disabled_time` AS `disabled_time`,`gr`.`id` AS `role_id`,`gadn`.`attribute_def_id` AS `attribute_def_id`,`gm`.`id` AS `member_id`,`gadn`.`id` AS `attribute_def_name_id`,`gaaa`.`id` AS `action_id`,`gmav`.`DEPTH` AS `membership_depth`,-(1) AS `role_set_depth`,`gadns`.`depth` AS `attr_def_name_set_depth`,`gaaas`.`depth` AS `attr_assign_action_set_depth`,`gmav`.`MEMBERSHIP_ID` AS `membership_id`,`gaa`.`id` AS `attribute_assign_id`,'role_subject' AS `permission_type`,`gaa`.`notes` AS `assignment_notes` from ((((((((`grouper_groups` `gr` join `grouper_memberships_all_v` `gmav`) join `grouper_members` `gm`) join `grouper_fields` `gf`) join `grouper_attribute_assign` `gaa`) join `grouper_attribute_def_name` `gadn`) join `grouper_attribute_def_name_set` `gadns`) join `grouper_attr_assign_action` `gaaa`) join `grouper_attr_assign_action_set` `gaaas`) where ((`gr`.`type_of_group` = 'role') and (`gmav`.`OWNER_GROUP_ID` = `gr`.`id`) and (`gmav`.`FIELD_ID` = `gf`.`id`) and (`gmav`.`OWNER_GROUP_ID` = `gaa`.`owner_group_id`) and (`gmav`.`MEMBER_ID` = `gaa`.`owner_member_id`) and (`gf`.`type` = 'list') and (`gf`.`name` = 'members') and (`gmav`.`IMMEDIATE_MSHIP_ENABLED` = 'T') and (`gmav`.`MEMBER_ID` = `gm`.`id`) and (`gaa`.`attribute_assign_type` = 'any_mem') and (`gaa`.`attribute_def_name_id` = `gadns`.`if_has_attribute_def_name_id`) and (`gadn`.`id` = `gadns`.`then_has_attribute_def_name_id`) and (`gaa`.`attribute_assign_action_id` = `gaaas`.`if_has_attr_assn_action_id`) and (`gaaa`.`id` = `gaaas`.`then_has_attr_assn_action_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_perms_role_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_perms_role_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_perms_role_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_perms_role_v` AS select distinct `gr`.`name` AS `role_name`,`gm`.`subject_source` AS `subject_source_id`,`gm`.`subject_id` AS `subject_id`,`gaaa`.`name` AS `action`,`gadn`.`name` AS `attribute_def_name_name`,`gadn`.`display_name` AS `attribute_def_name_disp_name`,`gr`.`display_name` AS `role_display_name`,`gaa`.`attribute_assign_delegatable` AS `attribute_assign_delegatable`,`gaa`.`enabled` AS `enabled`,`gaa`.`enabled_time` AS `enabled_time`,`gaa`.`disabled_time` AS `disabled_time`,`gr`.`id` AS `role_id`,`gadn`.`attribute_def_id` AS `attribute_def_id`,`gm`.`id` AS `member_id`,`gadn`.`id` AS `attribute_def_name_id`,`gaaa`.`id` AS `action_id`,`gmav`.`DEPTH` AS `membership_depth`,`grs`.`depth` AS `role_set_depth`,`gadns`.`depth` AS `attr_def_name_set_depth`,`gaaas`.`depth` AS `attr_assign_action_set_depth`,`gmav`.`MEMBERSHIP_ID` AS `membership_id`,`gaa`.`id` AS `attribute_assign_id`,'role' AS `permission_type`,`gaa`.`notes` AS `assignment_notes` from (((((((((`grouper_groups` `gr` join `grouper_memberships_all_v` `gmav`) join `grouper_members` `gm`) join `grouper_fields` `gf`) join `grouper_role_set` `grs`) join `grouper_attribute_assign` `gaa`) join `grouper_attribute_def_name` `gadn`) join `grouper_attribute_def_name_set` `gadns`) join `grouper_attr_assign_action` `gaaa`) join `grouper_attr_assign_action_set` `gaaas`) where ((`gr`.`type_of_group` = 'role') and (`gmav`.`OWNER_GROUP_ID` = `gr`.`id`) and (`gmav`.`FIELD_ID` = `gf`.`id`) and (`gf`.`type` = 'list') and (`gf`.`name` = 'members') and (`gmav`.`IMMEDIATE_MSHIP_ENABLED` = 'T') and (`gmav`.`MEMBER_ID` = `gm`.`id`) and (`grs`.`if_has_role_id` = `gr`.`id`) and (`gaa`.`owner_group_id` = `grs`.`then_has_role_id`) and (`gaa`.`attribute_def_name_id` = `gadns`.`if_has_attribute_def_name_id`) and (`gadn`.`id` = `gadns`.`then_has_attribute_def_name_id`) and (`gaa`.`attribute_assign_type` = 'group') and (`gaa`.`attribute_assign_action_id` = `gaaas`.`if_has_attr_assn_action_id`) and (`gaaa`.`id` = `gaaas`.`then_has_attr_assn_action_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_role_set_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_role_set_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_role_set_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_role_set_v` AS select `ifHas`.`name` AS `if_has_role_name`,`thenHas`.`name` AS `then_has_role_name`,`grs`.`depth` AS `depth`,`grs`.`type` AS `type`,`grParentIfHas`.`name` AS `parent_if_has_name`,`grParentThenHas`.`name` AS `parent_then_has_name`,`grs`.`id` AS `id`,`ifHas`.`id` AS `if_has_role_id`,`thenHas`.`id` AS `then_has_role_id`,`grs`.`parent_role_set_id` AS `parent_role_set_id` from (((((`grouper_role_set` `grs` join `grouper_role_set` `grsParent`) join `grouper_groups` `grParentIfHas`) join `grouper_groups` `grParentThenHas`) join `grouper_groups` `ifHas`) join `grouper_groups` `thenHas`) where ((`thenHas`.`id` = `grs`.`then_has_role_id`) and (`ifHas`.`id` = `grs`.`if_has_role_id`) and (`grs`.`parent_role_set_id` = `grsParent`.`id`) and (`grParentIfHas`.`id` = `grsParent`.`if_has_role_id`) and (`grParentThenHas`.`id` = `grsParent`.`then_has_role_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_roles_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_roles_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_roles_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_roles_v` AS select `gg`.`extension` AS `EXTENSION`,`gg`.`name` AS `NAME`,`gg`.`display_extension` AS `DISPLAY_EXTENSION`,`gg`.`display_name` AS `DISPLAY_NAME`,`gg`.`description` AS `DESCRIPTION`,`gs`.`name` AS `PARENT_STEM_NAME`,`gg`.`id` AS `ROLE_ID`,`gs`.`id` AS `PARENT_STEM_ID`,(select `gm`.`subject_source` from `grouper_members` `gm` where (`gm`.`id` = `gg`.`modifier_id`)) AS `MODIFIER_SOURCE`,(select `gm`.`subject_id` from `grouper_members` `gm` where (`gm`.`id` = `gg`.`modifier_id`)) AS `MODIFIER_SUBJECT_ID`,(select `gm`.`subject_source` from `grouper_members` `gm` where (`gm`.`id` = `gg`.`creator_id`)) AS `CREATOR_SOURCE`,(select `gm`.`subject_id` from `grouper_members` `gm` where (`gm`.`id` = `gg`.`creator_id`)) AS `CREATOR_SUBJECT_ID`,(select distinct 'T' from `grouper_composites` `gc` where (`gc`.`owner` = `gg`.`id`)) AS `IS_COMPOSITE_OWNER`,(select distinct 'T' from `grouper_composites` `gc` where ((`gc`.`left_factor` = `gg`.`id`) or (`gc`.`right_factor` = `gg`.`id`))) AS `IS_COMPOSITE_FACTOR`,`gg`.`creator_id` AS `CREATOR_ID`,`gg`.`create_time` AS `CREATE_TIME`,`gg`.`modifier_id` AS `MODIFIER_ID`,`gg`.`modify_time` AS `MODIFY_TIME`,`gg`.`hibernate_version_number` AS `HIBERNATE_VERSION_NUMBER`,`gg`.`context_id` AS `CONTEXT_ID` from (`grouper_groups` `gg` join `grouper_stems` `gs`) where ((`gg`.`parent_stem` = `gs`.`id`) and (`gg`.`type_of_group` = 'role')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_rpt_attributes_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_rpt_attributes_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_rpt_attributes_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_rpt_attributes_v` AS select `gf`.`name` AS `ATTRIBUTE_NAME`,(select count(0) from `grouper_attributes` `ga` where (`ga`.`field_id` = `gf`.`id`)) AS `GROUP_COUNT`,`gt`.`name` AS `GROUP_TYPE_NAME`,`gf`.`id` AS `FIELD_ID`,`gt`.`id` AS `GROUP_TYPE_ID` from (`grouper_fields` `gf` join `grouper_types` `gt`) where ((`gf`.`type` = 'attribute') and (`gf`.`grouptype_uuid` = `gt`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_rpt_composites_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_rpt_composites_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_rpt_composites_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_rpt_composites_v` AS select `gc`.`type` AS `COMPOSITE_TYPE`,count(0) AS `THE_COUNT` from `grouper_composites` `gc` group by `gc`.`type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_rpt_group_field_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_rpt_group_field_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_rpt_group_field_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_rpt_group_field_v` AS select `gg`.`name` AS `GROUP_NAME`,`gg`.`display_name` AS `GROUP_DISPLAYNAME`,`gf`.`type` AS `FIELD_TYPE`,`gf`.`name` AS `FIELD_NAME`,count(distinct `gms`.`MEMBER_ID`) AS `MEMBER_COUNT` from ((`grouper_memberships_all_v` `gms` join `grouper_groups` `gg`) join `grouper_fields` `gf`) where ((`gms`.`FIELD_ID` = `gf`.`id`) and (`gg`.`id` = `gms`.`OWNER_GROUP_ID`)) group by `gg`.`name`,`gg`.`display_name`,`gf`.`type`,`gf`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_rpt_groups_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_rpt_groups_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_rpt_groups_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_rpt_groups_v` AS select `gg`.`name` AS `GROUP_NAME`,`gg`.`display_name` AS `GROUP_DISPLAYNAME`,`gg`.`type_of_group` AS `TYPE_OF_GROUP`,(select count(distinct `gms`.`MEMBER_ID`) from `grouper_memberships_all_v` `gms` where ((`gms`.`OWNER_GROUP_ID` = `gg`.`id`) and (`gms`.`MSHIP_TYPE` = 'immediate'))) AS `IMMEDIATE_MEMBERSHIP_COUNT`,(select count(distinct `gms`.`MEMBER_ID`) from `grouper_memberships_all_v` `gms` where (`gms`.`OWNER_GROUP_ID` = `gg`.`id`)) AS `MEMBERSHIP_COUNT`,(select count(0) from `grouper_attributes` `ga` where (`ga`.`group_id` = `gg`.`id`)) AS `ATTRIBUTE_COUNT`,(select count(0) from `grouper_groups_types` `ggt` where (`ggt`.`group_uuid` = `gg`.`id`)) AS `GROUPS_TYPES_COUNT`,(select count(0) from `grouper_composites` `gc` where ((`gc`.`left_factor` = `gg`.`id`) or (`gc`.`right_factor` = `gg`.`id`))) AS `ISA_COMPOSITE_FACTOR_COUNT`,(select count(distinct `gms`.`OWNER_GROUP_ID`) from (`grouper_memberships_all_v` `gms` join `grouper_members` `gm`) where ((`gm`.`subject_id` = `gg`.`id`) and (`gms`.`MEMBER_ID` = `gm`.`id`))) AS `ISA_MEMBER_COUNT`,`gg`.`id` AS `GROUP_ID` from `grouper_groups` `gg` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_rpt_members_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_rpt_members_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_rpt_members_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_rpt_members_v` AS select `gm`.`subject_id` AS `SUBJECT_ID`,`gm`.`subject_source` AS `SUBJECT_SOURCE`,(select count(distinct `gms`.`owner_group_id`) from `grouper_memberships` `gms` where (`gms`.`member_id` = `gm`.`id`)) AS `MEMBERSHIP_COUNT`,`gm`.`id` AS `MEMBER_ID` from `grouper_members` `gm` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_rpt_roles_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_rpt_roles_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_rpt_roles_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_rpt_roles_v` AS select `gg`.`name` AS `ROLE_NAME`,`gg`.`display_name` AS `ROLE_DISPLAYNAME`,(select count(distinct `gms`.`MEMBER_ID`) from `grouper_memberships_all_v` `gms` where ((`gms`.`OWNER_GROUP_ID` = `gg`.`id`) and (`gms`.`MSHIP_TYPE` = 'immediate'))) AS `IMMEDIATE_MEMBERSHIP_COUNT`,(select count(distinct `gms`.`MEMBER_ID`) from `grouper_memberships_all_v` `gms` where (`gms`.`OWNER_GROUP_ID` = `gg`.`id`)) AS `MEMBERSHIP_COUNT`,(select count(0) from `grouper_attributes` `ga` where (`ga`.`group_id` = `gg`.`id`)) AS `ATTRIBUTE_COUNT`,(select count(0) from `grouper_groups_types` `ggt` where (`ggt`.`group_uuid` = `gg`.`id`)) AS `ROLES_TYPES_COUNT`,(select count(0) from `grouper_composites` `gc` where ((`gc`.`left_factor` = `gg`.`id`) or (`gc`.`right_factor` = `gg`.`id`))) AS `ISA_COMPOSITE_FACTOR_COUNT`,(select count(distinct `gms`.`owner_group_id`) from (`grouper_flat_memberships` `gms` join `grouper_members` `gm`) where ((`gm`.`subject_id` = `gg`.`id`) and (`gms`.`member_id` = `gm`.`id`))) AS `ISA_MEMBER_COUNT`,`gg`.`id` AS `ROLE_ID` from `grouper_groups` `gg` where (`gg`.`type_of_group` = 'role') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_rpt_stems_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_rpt_stems_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_rpt_stems_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_rpt_stems_v` AS select `gs`.`name` AS `STEM_NAME`,`gs`.`display_name` AS `STEM_DISPLAYNAME`,(select count(0) from `grouper_groups` `gg` where (`gg`.`parent_stem` = `gs`.`id`)) AS `GROUP_IMMEDIATE_COUNT`,(select count(0) from `grouper_stems` `gs2` where (`gs`.`id` = `gs2`.`parent_stem`)) AS `STEM_IMMEDIATE_COUNT`,(select count(0) from `grouper_groups` `gg` where (`gg`.`name` like convert(concat(`gs`.`name`,'%') using utf8))) AS `GROUP_COUNT`,(select count(0) from `grouper_stems` `gs2` where (`gs2`.`name` like concat(`gs`.`name`,'%'))) AS `STEM_COUNT`,(select count(distinct `gm`.`member_id`) from `grouper_flat_memberships` `gm` where (`gm`.`owner_stem_id` = `gs`.`id`)) AS `THIS_STEM_MEMBERSHIP_COUNT`,(select count(distinct `gm`.`member_id`) from (`grouper_flat_memberships` `gm` join `grouper_groups` `gg`) where ((`gg`.`parent_stem` = `gs`.`id`) and (`gm`.`owner_stem_id` = `gg`.`id`))) AS `CHILD_GROUP_MEMBERSHIP_COUNT`,(select count(distinct `gm`.`member_id`) from (`grouper_flat_memberships` `gm` join `grouper_groups` `gg`) where ((`gm`.`owner_group_id` = `gg`.`id`) and (`gg`.`name` like convert(concat(`gs`.`name`,'%') using utf8)))) AS `GROUP_MEMBERSHIP_COUNT`,`gs`.`id` AS `STEM_ID` from `grouper_stems` `gs` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_rpt_types_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_rpt_types_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_rpt_types_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_rpt_types_v` AS select `gt`.`name` AS `GROUP_TYPE_NAME`,(select count(0) from `grouper_groups_types` `ggt` where (`ggt`.`type_uuid` = `gt`.`id`)) AS `GROUP_COUNT`,`gt`.`id` AS `GROUP_TYPE_ID` from `grouper_types` `gt` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouper_stems_v`
--

/*!50001 DROP TABLE IF EXISTS `grouper_stems_v`*/;
/*!50001 DROP VIEW IF EXISTS `grouper_stems_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grouper_stems_v` AS select `gs`.`extension` AS `EXTENSION`,`gs`.`name` AS `NAME`,`gs`.`display_extension` AS `DISPLAY_EXTENSION`,`gs`.`display_name` AS `DISPLAY_NAME`,`gs`.`description` AS `DESCRIPTION`,(select `gs_parent`.`name` from `grouper_stems` `gs_parent` where (`gs_parent`.`id` = `gs`.`parent_stem`)) AS `PARENT_STEM_NAME`,(select `gs_parent`.`display_name` from `grouper_stems` `gs_parent` where (`gs_parent`.`id` = `gs`.`parent_stem`)) AS `PARENT_STEM_DISPLAYNAME`,(select `gm`.`subject_source` from `grouper_members` `gm` where (`gm`.`id` = `gs`.`creator_id`)) AS `CREATOR_SOURCE`,(select `gm`.`subject_id` from `grouper_members` `gm` where (`gm`.`id` = `gs`.`creator_id`)) AS `CREATOR_SUBJECT_ID`,(select `gm`.`subject_source` from `grouper_members` `gm` where (`gm`.`id` = `gs`.`modifier_id`)) AS `MODIFIER_SOURCE`,(select `gm`.`subject_id` from `grouper_members` `gm` where (`gm`.`id` = `gs`.`modifier_id`)) AS `MODIFIER_SUBJECT_ID`,`gs`.`create_time` AS `CREATE_TIME`,`gs`.`creator_id` AS `CREATOR_ID`,`gs`.`id` AS `STEM_ID`,`gs`.`modifier_id` AS `MODIFIER_ID`,`gs`.`modify_time` AS `MODIFY_TIME`,`gs`.`parent_stem` AS `PARENT_STEM`,`gs`.`hibernate_version_number` AS `HIBERNATE_VERSION_NUMBER`,`gs`.`context_id` AS `CONTEXT_ID` from `grouper_stems` `gs` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-12-06 14:26:18
