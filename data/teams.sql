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
