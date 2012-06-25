-- MySQL dump 10.13  Distrib 5.5.22, for debian-linux-gnu (x86_64)
--
-- Host: db.dev.surfconext.nl    Database: 
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
-- Current Database: `teams`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `teams` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `teams`;

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
  `attribute_def_id` varchar(40) NOT NULL,
  `context_id` varchar(40) DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `id` varchar(40) NOT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attr_assn_act_def_id_idx` (`attribute_def_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_attr_assign_action_set`
--

DROP TABLE IF EXISTS `grouper_attr_assign_action_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_attr_assign_action_set` (
  `context_id` varchar(40) DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `id` varchar(40) NOT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `depth` bigint(20) NOT NULL,
  `if_has_attr_assn_action_id` varchar(40) NOT NULL,
  `then_has_attr_assn_action_id` varchar(40) NOT NULL,
  `parent_attr_assn_action_id` varchar(40) DEFAULT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `action_set_unq_idx` (`parent_attr_assn_action_id`,`if_has_attr_assn_action_id`,`then_has_attr_assn_action_id`),
  KEY `action_set_ifhas_idx` (`if_has_attr_assn_action_id`),
  KEY `action_set_then_idx` (`then_has_attr_assn_action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `attribute_assign_action_id` varchar(40) NOT NULL,
  `attribute_def_name_id` varchar(40) NOT NULL,
  `context_id` varchar(40) DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `disabled_time` bigint(20) DEFAULT NULL,
  `enabled` varchar(1) NOT NULL DEFAULT 'T',
  `enabled_time` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `id` varchar(40) NOT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `notes` varchar(1024) DEFAULT NULL,
  `attribute_assign_delegatable` varchar(15) NOT NULL,
  `attribute_assign_type` varchar(15) NOT NULL,
  `owner_attribute_assign_id` varchar(40) DEFAULT NULL,
  `owner_attribute_def_id` varchar(40) DEFAULT NULL,
  `owner_group_id` varchar(40) DEFAULT NULL,
  `owner_member_id` varchar(40) DEFAULT NULL,
  `owner_membership_id` varchar(40) DEFAULT NULL,
  `owner_stem_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_asgn_attr_name_idx` (`attribute_def_name_id`,`attribute_assign_action_id`),
  KEY `attr_asgn_own_asgn_idx` (`owner_attribute_assign_id`,`attribute_assign_action_id`),
  KEY `attr_asgn_own_def_idx` (`owner_attribute_def_id`,`attribute_assign_action_id`),
  KEY `attr_asgn_own_group_idx` (`owner_group_id`,`attribute_assign_action_id`),
  KEY `attr_asgn_own_mem_idx` (`owner_member_id`,`attribute_assign_action_id`),
  KEY `attr_asgn_own_mship_idx` (`owner_membership_id`,`attribute_assign_action_id`),
  KEY `attr_asgn_own_stem_idx` (`owner_stem_id`,`attribute_assign_action_id`),
  KEY `fk_attr_assign_action_id` (`attribute_assign_action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_attribute_assign_value`
--

DROP TABLE IF EXISTS `grouper_attribute_assign_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_attribute_assign_value` (
  `attribute_assign_id` varchar(40) NOT NULL,
  `context_id` varchar(40) DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `id` varchar(40) NOT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `value_integer` bigint(20) DEFAULT NULL,
  `value_floating` double DEFAULT NULL,
  `value_string` text,
  `value_member_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_val_assign_idx` (`attribute_assign_id`),
  KEY `attribute_val_integer_idx` (`value_integer`),
  KEY `attribute_val_member_id_idx` (`value_member_id`),
  KEY `attribute_val_string_idx` (`value_string`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_attribute_def`
--

DROP TABLE IF EXISTS `grouper_attribute_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_attribute_def` (
  `attribute_def_public` varchar(1) NOT NULL DEFAULT 'F',
  `attribute_def_type` varchar(32) NOT NULL DEFAULT 'attr',
  `context_id` varchar(40) DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `creator_id` varchar(40) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `id` varchar(40) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `extension` varchar(255) NOT NULL,
  `name` varchar(1024) NOT NULL,
  `multi_assignable` varchar(1) NOT NULL DEFAULT 'F',
  `multi_valued` varchar(1) NOT NULL DEFAULT 'F',
  `stem_id` varchar(40) NOT NULL,
  `value_type` varchar(32) NOT NULL DEFAULT 'marker',
  `assign_to_attribute_def` varchar(1) NOT NULL DEFAULT 'F',
  `assign_to_attribute_def_assn` varchar(1) NOT NULL DEFAULT 'F',
  `assign_to_eff_membership` varchar(1) NOT NULL DEFAULT 'F',
  `assign_to_eff_membership_assn` varchar(1) NOT NULL DEFAULT 'F',
  `assign_to_group` varchar(1) NOT NULL DEFAULT 'F',
  `assign_to_group_assn` varchar(1) NOT NULL DEFAULT 'F',
  `assign_to_imm_membership` varchar(1) NOT NULL DEFAULT 'F',
  `assign_to_imm_membership_assn` varchar(1) NOT NULL DEFAULT 'F',
  `assign_to_member` varchar(1) NOT NULL DEFAULT 'F',
  `assign_to_member_assn` varchar(1) NOT NULL DEFAULT 'F',
  `assign_to_stem` varchar(1) NOT NULL DEFAULT 'F',
  `assign_to_stem_assn` varchar(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_def_name_idx` (`name`(255)),
  KEY `fk_attr_def_stem` (`stem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_attribute_def_name`
--

DROP TABLE IF EXISTS `grouper_attribute_def_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_attribute_def_name` (
  `context_id` varchar(40) DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `id` varchar(40) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `extension` varchar(255) NOT NULL,
  `name` varchar(1024) NOT NULL,
  `stem_id` varchar(40) NOT NULL,
  `attribute_def_id` varchar(40) NOT NULL,
  `display_extension` varchar(128) NOT NULL,
  `display_name` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_def_name_name_idx` (`name`(255)),
  KEY `fk_attr_def_name_stem` (`stem_id`),
  KEY `fk_attr_def_name_def_id` (`attribute_def_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_attribute_def_name_set`
--

DROP TABLE IF EXISTS `grouper_attribute_def_name_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_attribute_def_name_set` (
  `context_id` varchar(40) DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `id` varchar(40) NOT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `depth` bigint(20) NOT NULL,
  `if_has_attribute_def_name_id` varchar(40) NOT NULL,
  `then_has_attribute_def_name_id` varchar(40) NOT NULL,
  `parent_attr_def_name_set_id` varchar(40) DEFAULT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attr_def_name_set_unq_idx` (`parent_attr_def_name_set_id`,`if_has_attribute_def_name_id`,`then_has_attribute_def_name_id`),
  KEY `attr_def_name_set_ifhas_idx` (`if_has_attribute_def_name_id`),
  KEY `attr_def_name_set_then_idx` (`then_has_attribute_def_name_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_attribute_def_scope`
--

DROP TABLE IF EXISTS `grouper_attribute_def_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_attribute_def_scope` (
  `attribute_def_id` varchar(40) NOT NULL,
  `context_id` varchar(40) DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `id` varchar(40) NOT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `attribute_def_scope_type` varchar(32) DEFAULT NULL,
  `scope_string` varchar(1024) DEFAULT NULL,
  `scope_string2` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_def_scope_atdef_idx` (`attribute_def_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_attributes`
--

DROP TABLE IF EXISTS `grouper_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_attributes` (
  `id` varchar(40) NOT NULL,
  `group_id` varchar(40) NOT NULL,
  `field_id` varchar(40) NOT NULL,
  `value` varchar(1024) NOT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `context_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_uniq_idx` (`group_id`,`field_id`),
  KEY `attribute_field_value_idx` (`field_id`,`value`(960)),
  KEY `attribute_group_idx` (`group_id`),
  KEY `attribute_context_idx` (`context_id`),
  KEY `attribute_value_idx` (`value`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `act_as_member_id` varchar(40) DEFAULT NULL,
  `audit_type_id` varchar(40) NOT NULL,
  `context_id` varchar(40) DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `description` text,
  `env_name` varchar(50) DEFAULT NULL,
  `grouper_engine` varchar(50) DEFAULT NULL,
  `grouper_version` varchar(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `id` varchar(40) NOT NULL,
  `int01` bigint(20) DEFAULT NULL,
  `int02` bigint(20) DEFAULT NULL,
  `int03` bigint(20) DEFAULT NULL,
  `int04` bigint(20) DEFAULT NULL,
  `int05` bigint(20) DEFAULT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `logged_in_member_id` varchar(40) DEFAULT NULL,
  `server_host` varchar(50) DEFAULT NULL,
  `string01` text,
  `string02` text,
  `string03` text,
  `string04` text,
  `string05` text,
  `string06` text,
  `string07` text,
  `string08` text,
  `user_ip_address` varchar(50) DEFAULT NULL,
  `duration_microseconds` bigint(20) DEFAULT NULL,
  `query_count` int(11) DEFAULT NULL,
  `server_user_name` varchar(50) DEFAULT NULL,
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `action_name` varchar(50) DEFAULT NULL,
  `audit_category` varchar(50) DEFAULT NULL,
  `context_id` varchar(40) DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `id` varchar(40) NOT NULL,
  `label_int01` varchar(50) DEFAULT NULL,
  `label_int02` varchar(50) DEFAULT NULL,
  `label_int03` varchar(50) DEFAULT NULL,
  `label_int04` varchar(50) DEFAULT NULL,
  `label_int05` varchar(50) DEFAULT NULL,
  `label_string01` varchar(50) DEFAULT NULL,
  `label_string02` varchar(50) DEFAULT NULL,
  `label_string03` varchar(50) DEFAULT NULL,
  `label_string04` varchar(50) DEFAULT NULL,
  `label_string05` varchar(50) DEFAULT NULL,
  `label_string06` varchar(50) DEFAULT NULL,
  `label_string07` varchar(50) DEFAULT NULL,
  `label_string08` varchar(50) DEFAULT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `audit_type_category_type_idx` (`audit_category`,`action_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_change_log_consumer`
--

DROP TABLE IF EXISTS `grouper_change_log_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_change_log_consumer` (
  `name` varchar(100) NOT NULL,
  `last_sequence_processed` bigint(20) DEFAULT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `id` varchar(40) NOT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `change_log_consumer_name_idx` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_change_log_entry`
--

DROP TABLE IF EXISTS `grouper_change_log_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_change_log_entry` (
  `change_log_type_id` varchar(40) NOT NULL,
  `context_id` varchar(40) DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `sequence_number` bigint(20) NOT NULL DEFAULT '0',
  `string01` text,
  `string02` text,
  `string03` text,
  `string04` text,
  `string05` text,
  `string06` text,
  `string07` text,
  `string08` text,
  `string09` text,
  `string10` text,
  `string11` text,
  `string12` text,
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_change_log_entry_temp`
--

DROP TABLE IF EXISTS `grouper_change_log_entry_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_change_log_entry_temp` (
  `id` varchar(40) NOT NULL,
  `change_log_type_id` varchar(40) NOT NULL,
  `context_id` varchar(40) DEFAULT NULL,
  `created_on` bigint(20) NOT NULL,
  `string01` text,
  `string02` text,
  `string03` text,
  `string04` text,
  `string05` text,
  `string06` text,
  `string07` text,
  `string08` text,
  `string09` text,
  `string10` text,
  `string11` text,
  `string12` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `action_name` varchar(50) DEFAULT NULL,
  `change_log_category` varchar(50) DEFAULT NULL,
  `context_id` varchar(40) DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `id` varchar(40) NOT NULL,
  `label_string01` varchar(50) DEFAULT NULL,
  `label_string02` varchar(50) DEFAULT NULL,
  `label_string03` varchar(50) DEFAULT NULL,
  `label_string04` varchar(50) DEFAULT NULL,
  `label_string05` varchar(50) DEFAULT NULL,
  `label_string06` varchar(50) DEFAULT NULL,
  `label_string07` varchar(50) DEFAULT NULL,
  `label_string08` varchar(50) DEFAULT NULL,
  `label_string09` varchar(50) DEFAULT NULL,
  `label_string10` varchar(50) DEFAULT NULL,
  `label_string11` varchar(50) DEFAULT NULL,
  `label_string12` varchar(50) DEFAULT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `change_log_type_cat_type_idx` (`change_log_category`,`action_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_composites`
--

DROP TABLE IF EXISTS `grouper_composites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_composites` (
  `id` varchar(40) NOT NULL,
  `owner` varchar(40) NOT NULL,
  `left_factor` varchar(40) NOT NULL,
  `right_factor` varchar(40) NOT NULL,
  `type` varchar(32) NOT NULL,
  `creator_id` varchar(40) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `context_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `composite_composite_idx` (`owner`),
  KEY `composite_createtime_idx` (`create_time`),
  KEY `composite_creator_idx` (`creator_id`),
  KEY `composite_factor_idx` (`left_factor`,`right_factor`),
  KEY `composite_left_factor_idx` (`left_factor`),
  KEY `composite_right_factor_idx` (`right_factor`),
  KEY `composite_context_idx` (`context_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `id` varchar(40) NOT NULL,
  `object_name` varchar(128) DEFAULT NULL,
  `db_version` int(11) DEFAULT NULL,
  `last_updated` varchar(50) DEFAULT NULL,
  `history` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grouper_ddl_object_name_idx` (`object_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_fields`
--

DROP TABLE IF EXISTS `grouper_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_fields` (
  `id` varchar(40) NOT NULL,
  `grouptype_uuid` varchar(40) NOT NULL,
  `is_nullable` tinyint(1) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `read_privilege` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  `write_privilege` varchar(32) NOT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `context_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_and_type` (`name`,`type`),
  KEY `fields_context_idx` (`context_id`),
  KEY `fk_fields_grouptype_uuid` (`grouptype_uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_flat_attribute_def`
--

DROP TABLE IF EXISTS `grouper_flat_attribute_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_flat_attribute_def` (
  `id` varchar(40) NOT NULL,
  `attribute_def_id` varchar(40) DEFAULT NULL,
  `context_id` varchar(40) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flat_attrdef_attrdef_idx` (`attribute_def_id`),
  KEY `flat_attrdef_context_idx` (`context_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_flat_groups`
--

DROP TABLE IF EXISTS `grouper_flat_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_flat_groups` (
  `id` varchar(40) NOT NULL,
  `group_id` varchar(40) DEFAULT NULL,
  `context_id` varchar(40) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flat_group_group_idx` (`group_id`),
  KEY `flat_group_context_idx` (`context_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_flat_memberships`
--

DROP TABLE IF EXISTS `grouper_flat_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_flat_memberships` (
  `id` varchar(40) NOT NULL,
  `owner_id` varchar(40) NOT NULL,
  `owner_attr_def_id` varchar(40) DEFAULT NULL,
  `owner_group_id` varchar(40) DEFAULT NULL,
  `owner_stem_id` varchar(40) DEFAULT NULL,
  `member_id` varchar(40) NOT NULL,
  `field_id` varchar(40) NOT NULL,
  `context_id` varchar(40) DEFAULT NULL,
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_flat_stems`
--

DROP TABLE IF EXISTS `grouper_flat_stems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_flat_stems` (
  `id` varchar(40) NOT NULL,
  `stem_id` varchar(40) DEFAULT NULL,
  `context_id` varchar(40) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flat_stem_stem_idx` (`stem_id`),
  KEY `flat_stem_context_idx` (`context_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_group_set`
--

DROP TABLE IF EXISTS `grouper_group_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_group_set` (
  `id` varchar(40) NOT NULL,
  `owner_attr_def_id` varchar(40) DEFAULT NULL,
  `owner_attr_def_id_null` varchar(40) NOT NULL DEFAULT '<NULL>',
  `owner_group_id` varchar(40) DEFAULT NULL,
  `owner_group_id_null` varchar(40) NOT NULL DEFAULT '<NULL>',
  `owner_stem_id` varchar(40) DEFAULT NULL,
  `owner_stem_id_null` varchar(40) NOT NULL DEFAULT '<NULL>',
  `member_attr_def_id` varchar(40) DEFAULT NULL,
  `member_group_id` varchar(40) DEFAULT NULL,
  `member_stem_id` varchar(40) DEFAULT NULL,
  `member_id` varchar(40) NOT NULL,
  `field_id` varchar(40) NOT NULL,
  `member_field_id` varchar(40) NOT NULL,
  `owner_id` varchar(40) NOT NULL,
  `mship_type` varchar(16) NOT NULL,
  `depth` int(11) NOT NULL,
  `via_group_id` varchar(40) DEFAULT NULL,
  `parent_id` varchar(40) DEFAULT NULL,
  `creator_id` varchar(40) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  `context_id` varchar(40) DEFAULT NULL,
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_groups`
--

DROP TABLE IF EXISTS `grouper_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_groups` (
  `id` varchar(40) NOT NULL,
  `parent_stem` varchar(40) NOT NULL,
  `creator_id` varchar(40) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  `modifier_id` varchar(40) DEFAULT NULL,
  `modify_time` bigint(20) DEFAULT NULL,
  `last_membership_change` bigint(20) DEFAULT NULL,
  `alternate_name` varchar(1024) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `name` varchar(1024) DEFAULT NULL,
  `display_name` varchar(1024) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `display_extension` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `context_id` varchar(40) DEFAULT NULL,
  `type_of_group` varchar(10) NOT NULL DEFAULT 'group',
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_groups_types`
--

DROP TABLE IF EXISTS `grouper_groups_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_groups_types` (
  `id` varchar(40) NOT NULL,
  `group_uuid` varchar(40) NOT NULL,
  `type_uuid` varchar(40) NOT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `context_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grouptypetyple_grouptype_idx` (`group_uuid`,`type_uuid`),
  KEY `grouptypetuple_type_idx` (`type_uuid`),
  KEY `grouptypetuple_group_idx` (`group_uuid`),
  KEY `grouptypetuple_context_idx` (`context_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `id` varchar(40) NOT NULL,
  `job_name` varchar(512) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `started_time` datetime DEFAULT NULL,
  `ended_time` datetime DEFAULT NULL,
  `millis` int(11) DEFAULT NULL,
  `millis_get_data` int(11) DEFAULT NULL,
  `millis_load_data` int(11) DEFAULT NULL,
  `job_type` varchar(128) DEFAULT NULL,
  `job_schedule_type` varchar(128) DEFAULT NULL,
  `job_description` text,
  `job_message` text,
  `host` varchar(128) DEFAULT NULL,
  `group_uuid` varchar(40) DEFAULT NULL,
  `job_schedule_quartz_cron` varchar(128) DEFAULT NULL,
  `job_schedule_interval_seconds` int(11) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `unresolvable_subject_count` int(11) DEFAULT NULL,
  `insert_count` int(11) DEFAULT NULL,
  `update_count` int(11) DEFAULT NULL,
  `delete_count` int(11) DEFAULT NULL,
  `total_count` int(11) DEFAULT NULL,
  `parent_job_name` varchar(512) DEFAULT NULL,
  `parent_job_id` varchar(40) DEFAULT NULL,
  `and_group_names` varchar(512) DEFAULT NULL,
  `job_schedule_priority` int(11) DEFAULT NULL,
  `context_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loader_context_idx` (`context_id`),
  KEY `grouper_loader_job_name_idx` (`job_name`(255),`status`,`ended_time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_members`
--

DROP TABLE IF EXISTS `grouper_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_members` (
  `id` varchar(40) NOT NULL,
  `subject_id` varchar(255) NOT NULL,
  `subject_source` varchar(255) NOT NULL,
  `subject_type` varchar(255) NOT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `context_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_subjectsourcetype_idx` (`subject_id`,`subject_source`,`subject_type`),
  KEY `member_subjectsource_idx` (`subject_source`),
  KEY `member_subjectid_idx` (`subject_id`),
  KEY `member_subjecttype_idx` (`subject_type`),
  KEY `member_context_idx` (`context_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grouper_memberships`
--

DROP TABLE IF EXISTS `grouper_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouper_memberships` (
  `id` varchar(40) NOT NULL,
  `member_id` varchar(40) NOT NULL,
  `owner_id` varchar(40) NOT NULL,
  `field_id` varchar(40) NOT NULL,
  `owner_group_id` varchar(40) DEFAULT NULL,
  `owner_stem_id` varchar(40) DEFAULT NULL,
  `owner_attr_def_id` varchar(40) DEFAULT NULL,
  `via_composite_id` varchar(40) DEFAULT NULL,
  `enabled` varchar(1) NOT NULL DEFAULT 'T',
  `enabled_timestamp` bigint(20) DEFAULT NULL,
  `disabled_timestamp` bigint(20) DEFAULT NULL,
  `mship_type` varchar(32) NOT NULL,
  `creator_id` varchar(40) DEFAULT NULL,
  `create_time` bigint(20) NOT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `context_id` varchar(40) DEFAULT NULL,
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `context_id` varchar(40) DEFAULT NULL,
  `created_on` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `id` varchar(40) NOT NULL,
  `last_updated` bigint(20) DEFAULT NULL,
  `depth` bigint(20) NOT NULL,
  `if_has_role_id` varchar(40) NOT NULL,
  `then_has_role_id` varchar(40) NOT NULL,
  `parent_role_set_id` varchar(40) DEFAULT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_set_unq_idx` (`parent_role_set_id`,`if_has_role_id`,`then_has_role_id`),
  KEY `role_set_ifhas_idx` (`if_has_role_id`),
  KEY `role_set_then_idx` (`then_has_role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `id` varchar(40) NOT NULL,
  `parent_stem` varchar(40) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `creator_id` varchar(40) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  `modifier_id` varchar(40) DEFAULT NULL,
  `modify_time` bigint(20) DEFAULT NULL,
  `display_extension` varchar(255) NOT NULL,
  `extension` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `last_membership_change` bigint(20) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `context_id` varchar(40) DEFAULT NULL,
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `id` varchar(40) NOT NULL,
  `name` varchar(255) NOT NULL,
  `creator_uuid` varchar(40) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  `is_assignable` tinyint(1) DEFAULT NULL,
  `is_internal` tinyint(1) DEFAULT NULL,
  `hibernate_version_number` bigint(20) DEFAULT NULL,
  `context_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name_idx` (`name`),
  KEY `type_context_idx` (`context_id`),
  KEY `fk_types_creator_uuid` (`creator_uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invitation_message`
--

DROP TABLE IF EXISTS `invitation_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitation_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inviter` varchar(255) DEFAULT NULL,
  `message` longtext,
  `timestamp` bigint(20) NOT NULL,
  `invitation_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invitations`
--

DROP TABLE IF EXISTS `invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitations` (
  `mailaddress` varchar(255) NOT NULL,
  `group_id` varchar(255) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `invitation_uiid` varchar(255) NOT NULL,
  `denied` tinyint(1) DEFAULT '0',
  `accepted` tinyint(1) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `intended_role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=219 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_attributes`
--

DROP TABLE IF EXISTS `member_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_attributes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(255) NOT NULL,
  `attribute_value` varchar(255) DEFAULT NULL,
  `member_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_id` (`member_id`,`attribute_name`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `uuid` varchar(255) NOT NULL,
  `group_id` varchar(255) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `subjectId` varchar(255) NOT NULL,
  `subjectTypeId` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subjectId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subjectattribute`
--

DROP TABLE IF EXISTS `subjectattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjectattribute` (
  `subjectId` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `searchValue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subjectId`,`name`,`value`),
  UNIQUE KEY `searchattribute_id_name_idx` (`subjectId`,`name`),
  KEY `searchattribute_value_idx` (`value`),
  KEY `searchattribute_name_idx` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Current Database: `test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `test` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `test`;

--
-- Current Database: `teams`
--

USE `teams`;

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
/*!50001 VIEW `grouper_attr_asn_asn_efmship_v` AS select distinct `gg`.`name` AS `group_name`,`gm`.`subject_source` AS `source_id`,`gm`.`subject_id` AS `subject_id`,`gaaa1`.`name` AS `action1`,`gaaa2`.`name` AS `action2`,`gadn1`.`name` AS `attribute_def_name_name1`,`gadn2`.`name` AS `attribute_def_name_name2`,`gadn1`.`display_name` AS `attribute_def_name_disp_name1`,`gadn2`.`display_name` AS `attribute_def_name_disp_name2`,`gf`.`name` AS `list_name`,`gad1`.`name` AS `name_of_attribute_def1`,`gad2`.`name` AS `name_of_attribute_def2`,`gaa1`.`notes` AS `attribute_assign_notes1`,`gaa2`.`notes` AS `attribute_assign_notes2`,`gaa2`.`enabled` AS `enabled2`,`gaa2`.`enabled_time` AS `enabled_time2`,`gaa2`.`disabled_time` AS `disabled_time2`,`gg`.`id` AS `group_id`,`gm`.`id` AS `member_id`,`gaa1`.`id` AS `attribute_assign_id1`,`gaa2`.`id` AS `attribute_assign_id2`,`gadn1`.`id` AS `attribute_def_name_id1`,`gadn2`.`id` AS `attribute_def_name_id2`,`gad1`.`id` AS `attribute_def_id1`,`gad2`.`id` AS `attribute_def_id2`,`gaaa1`.`id` AS `action_id1`,`gaaa2`.`id` AS `action_id2` from (((((((((((`grouper_attribute_assign` `gaa1` join `grouper_attribute_assign` `gaa2`) join `grouper_groups` `gg`) join `grouper_memberships_all_v` `gmav`) join `grouper_attribute_def_name` `gadn1`) join `grouper_attribute_def_name` `gadn2`) join `grouper_attribute_def` `gad1`) join `grouper_attribute_def` `gad2`) join `grouper_members` `gm`) join `grouper_fields` `gf`) join `grouper_attr_assign_action` `gaaa1`) join `grouper_attr_assign_action` `gaaa2`) where ((`gaa1`.`owner_member_id` = `gmav`.`MEMBER_ID`) and (`gaa1`.`owner_group_id` = `gmav`.`OWNER_GROUP_ID`) and (`gaa2`.`owner_attribute_assign_id` = `gaa1`.`id`) and (`gaa1`.`attribute_def_name_id` = `gadn1`.`id`) and (`gaa2`.`attribute_def_name_id` = `gadn2`.`id`) and (`gadn1`.`attribute_def_id` = `gad1`.`id`) and (`gadn2`.`attribute_def_id` = `gad2`.`id`) and (`gaa1`.`enabled` = 'T') and (`gmav`.`IMMEDIATE_MSHIP_ENABLED` = 'T') and (`gmav`.`FIELD_ID` = `gf`.`id`) and (`gmav`.`MEMBER_ID` = `gm`.`id`) and (`gmav`.`OWNER_GROUP_ID` = `gg`.`id`) and (`gf`.`type` = 'list') and (`gaa1`.`owner_member_id` is not null) and (`gaa1`.`owner_group_id` is not null) and (`gaa1`.`attribute_assign_action_id` = `gaaa1`.`id`) and (`gaa2`.`attribute_assign_action_id` = `gaaa2`.`id`)) */;
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
/*!50001 VIEW `grouper_attr_asn_efmship_v` AS select distinct `gg`.`name` AS `group_name`,`gm`.`subject_source` AS `subject_source_id`,`gm`.`subject_id` AS `subject_id`,`gaaa`.`name` AS `action`,`gadn`.`name` AS `attribute_def_name_name`,`gg`.`display_name` AS `group_display_name`,`gadn`.`display_name` AS `attribute_def_name_disp_name`,`gad`.`name` AS `name_of_attribute_def`,`gaa`.`notes` AS `attribute_assign_notes`,`gf`.`name` AS `list_name`,`gaa`.`attribute_assign_delegatable` AS `attribute_assign_delegatable`,`gaa`.`enabled` AS `enabled`,`gaa`.`enabled_time` AS `enabled_time`,`gaa`.`disabled_time` AS `disabled_time`,`gg`.`id` AS `group_id`,`gaa`.`id` AS `attribute_assign_id`,`gadn`.`id` AS `attribute_def_name_id`,`gad`.`id` AS `attribute_def_id`,`gm`.`id` AS `member_id`,`gaaa`.`id` AS `action_id` from (((((((`grouper_attribute_assign` `gaa` join `grouper_memberships_all_v` `gmav`) join `grouper_attribute_def_name` `gadn`) join `grouper_attribute_def` `gad`) join `grouper_groups` `gg`) join `grouper_fields` `gf`) join `grouper_members` `gm`) join `grouper_attr_assign_action` `gaaa`) where ((`gaa`.`owner_group_id` = `gmav`.`OWNER_GROUP_ID`) and (`gaa`.`owner_member_id` = `gmav`.`MEMBER_ID`) and (`gaa`.`attribute_def_name_id` = `gadn`.`id`) and (`gadn`.`attribute_def_id` = `gad`.`id`) and (`gmav`.`IMMEDIATE_MSHIP_ENABLED` = 'T') and (`gmav`.`OWNER_GROUP_ID` = `gg`.`id`) and (`gmav`.`FIELD_ID` = `gf`.`id`) and (`gf`.`type` = 'list') and (`gmav`.`MEMBER_ID` = `gm`.`id`) and (`gaa`.`owner_member_id` is not null) and isnull(`gaa`.`owner_group_id`) and (`gaa`.`attribute_assign_action_id` = `gaaa`.`id`)) */;
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
/*!50001 VIEW `grouper_attr_def_priv_v` AS select distinct `gm`.`subject_id` AS `subject_id`,`gm`.`subject_source` AS `subject_source_id`,`gf`.`name` AS `field_name`,`gad`.`name` AS `attribute_def_name`,`gad`.`description` AS `attribute_def_description`,`gad`.`attribute_def_type` AS `attribute_def_type`,`gad`.`stem_id` AS `attribute_def_stem_id`,`gad`.`id` AS `attribute_def_id`,`gm`.`id` AS `member_id`,`gmav`.`FIELD_ID` AS `field_id`,`gmav`.`IMMEDIATE_MEMBERSHIP_ID` AS `immediate_membership_id`,`gmav`.`MEMBERSHIP_ID` AS `membership_id` from (((`grouper_memberships_all_v` `gmav` join `grouper_attribute_def` `gad`) join `grouper_fields` `gf`) join `grouper_members` `gm`) where ((`gmav`.`OWNER_ATTR_DEF_ID` = `gad`.`id`) and (`gmav`.`FIELD_ID` = `gf`.`id`) and (`gmav`.`IMMEDIATE_MSHIP_ENABLED` = 'T') and (`gmav`.`MEMBER_ID` = `gm`.`id`)) */;
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
/*!50001 VIEW `grouper_rpt_stems_v` AS select `gs`.`name` AS `STEM_NAME`,`gs`.`display_name` AS `STEM_DISPLAYNAME`,(select count(0) from `grouper_groups` `gg` where (`gg`.`parent_stem` = `gs`.`id`)) AS `GROUP_IMMEDIATE_COUNT`,(select count(0) from `grouper_stems` `gs2` where (`gs`.`id` = `gs2`.`parent_stem`)) AS `STEM_IMMEDIATE_COUNT`,(select count(0) from `grouper_groups` `gg` where (`gg`.`name` like concat(`gs`.`name`,'%'))) AS `GROUP_COUNT`,(select count(0) from `grouper_stems` `gs2` where (`gs2`.`name` like concat(`gs`.`name`,'%'))) AS `STEM_COUNT`,(select count(distinct `gm`.`member_id`) from `grouper_flat_memberships` `gm` where (`gm`.`owner_stem_id` = `gs`.`id`)) AS `THIS_STEM_MEMBERSHIP_COUNT`,(select count(distinct `gm`.`member_id`) from (`grouper_flat_memberships` `gm` join `grouper_groups` `gg`) where ((`gg`.`parent_stem` = `gs`.`id`) and (`gm`.`owner_stem_id` = `gg`.`id`))) AS `CHILD_GROUP_MEMBERSHIP_COUNT`,(select count(distinct `gm`.`member_id`) from (`grouper_flat_memberships` `gm` join `grouper_groups` `gg`) where ((`gm`.`owner_group_id` = `gg`.`id`) and (`gg`.`name` like concat(`gs`.`name`,'%')))) AS `GROUP_MEMBERSHIP_COUNT`,`gs`.`id` AS `STEM_ID` from `grouper_stems` `gs` */;
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

--
-- Current Database: `test`
--

USE `test`;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-06-12 11:05:59


