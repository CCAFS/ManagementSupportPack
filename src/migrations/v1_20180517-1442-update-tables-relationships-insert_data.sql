-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: msp_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.31-MariaDB

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
-- Table structure for table `msp_categories`
--

DROP TABLE IF EXISTS `msp_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msp_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msp_categories`
--

LOCK TABLES `msp_categories` WRITE;
/*!40000 ALTER TABLE `msp_categories` DISABLE KEYS */;
INSERT INTO `msp_categories` (`id`, `name`) VALUES (0,'Protocols');
INSERT INTO `msp_categories` (`id`, `name`) VALUES (1,'Policy Documents');
INSERT INTO `msp_categories` (`id`, `name`) VALUES (2,'Data Ownership and Authorship');
INSERT INTO `msp_categories` (`id`, `name`) VALUES (3,'Budgeting & Planning');
INSERT INTO `msp_categories` (`id`, `name`) VALUES (4,'Data & Document Store');
INSERT INTO `msp_categories` (`id`, `name`) VALUES (5,'Fieldwork');
INSERT INTO `msp_categories` (`id`, `name`) VALUES (6,'Managing Data');
INSERT INTO `msp_categories` (`id`, `name`) VALUES (7,'Metadata');
INSERT INTO `msp_categories` (`id`, `name`) VALUES (8,' Archiving & Sharing');
/*!40000 ALTER TABLE `msp_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msp_download`
--

DROP TABLE IF EXISTS `msp_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msp_download` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `institute` longtext NOT NULL,
  `intended_use` longtext NOT NULL,
  `date` datetime NOT NULL,
  `filter_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_msp_download_msp_person1_idx1` (`user_id`),
  CONSTRAINT `fk_download_person` FOREIGN KEY (`user_id`) REFERENCES `msp_person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15469 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msp_download`
--

LOCK TABLES `msp_download` WRITE;
/*!40000 ALTER TABLE `msp_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `msp_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msp_download_stats`
--

DROP TABLE IF EXISTS `msp_download_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msp_download_stats` (
  `first_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `institute` longtext,
  `intended_use` longtext,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msp_download_stats`
--

LOCK TABLES `msp_download_stats` WRITE;
/*!40000 ALTER TABLE `msp_download_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `msp_download_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msp_downloadinstitutelocation`
--

DROP TABLE IF EXISTS `msp_downloadinstitutelocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msp_downloadinstitutelocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `download_id` int(11) NOT NULL,
  `africa` tinyint(1) NOT NULL DEFAULT '0',
  `asia` tinyint(1) NOT NULL DEFAULT '0',
  `oceania` tinyint(1) NOT NULL DEFAULT '0',
  `central_america_caribbean` tinyint(1) NOT NULL DEFAULT '0',
  `europe` tinyint(1) NOT NULL DEFAULT '0',
  `middle_east_north_africa` tinyint(1) NOT NULL DEFAULT '0',
  `north_america` tinyint(1) NOT NULL DEFAULT '0',
  `south_america` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_msp_downloadinstitutelocation_msp_download1_idx1` (`download_id`),
  CONSTRAINT `fk_downloadid` FOREIGN KEY (`download_id`) REFERENCES `msp_download` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15451 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msp_downloadinstitutelocation`
--

LOCK TABLES `msp_downloadinstitutelocation` WRITE;
/*!40000 ALTER TABLE `msp_downloadinstitutelocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `msp_downloadinstitutelocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msp_guidelines`
--

DROP TABLE IF EXISTS `msp_guidelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msp_guidelines` (
  `id` int(11) NOT NULL,
  `code` varchar(45) NOT NULL,
  `name` varchar(200) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `source` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msp_guidelines`
--

LOCK TABLES `msp_guidelines` WRITE;
/*!40000 ALTER TABLE `msp_guidelines` DISABLE KEYS */;
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (1,'1.1.','CGIAR Open Access & Data Management Policy',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (2,'1.2.','CGIAR Open Access & Data Management Implementation Guidelines',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (3,'1.3.','CGIAR Open Access-Open Data Implementation Plan Template',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (4,'1.4.','CCAFS Data Management Strategy',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (5,'0.1.','Writing Research Protocols - a statistical perspective',0,'https://resources.stats4sd.org/resource/writing-research-protocols---a-statistical-perspective');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (6,'0.2.','What is a research protocol and how to use one (Video)',0,'https://www.youtube.com/watch?v=_KVHxHYM9DQ&index=1&list=PLK5PktXR1tmNRaUPsFiYlyhg2lui0xgpj');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (7,'0.3.','What a Protocol Should Contain (Video)',0,'https://www.youtube.com/watch?v=IhmliEn_ejw&index=2&list=PLK5PktXR1tmNRaUPsFiYlyhg2lui0xgpj');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (8,'2.1.','Data Ownership & Authorship',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (9,'2.2.','Data Ownership (Video)',0,'https://www.youtube.com/watch?v=aDQWTuAMKTQ&list=PLK5PktXR1tmNRaUPsFiYlyhg2lui0xgpj&index=5');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (10,'2.3.','Data Ownership Agreement - Template',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (11,'2.4.','CGIAR Author Guidance',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (12,'2.5.','Data Ownership Agreement - Example',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (13,'2.6.','CCAFS Publications Policy',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (14,'3.1.','Budgeting and Planning for Data Management',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (15,'3.2.','Planning and Budgeting for Data Management (Video)',0,'https://www.youtube.com/watch?v=O0vpXLJPB5o&list=PLK5PktXR1tmNRaUPsFiYlyhg2lui0xgpj&index=4');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (16,'3.3.','ILRI Data Management Process (flowcharts)',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (17,'3.4.','Data Management Process - Narrative',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (18,'3.5.','Creating a Data Management Plan',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (19,'3.6.','Data Management Plan (Video)',0,'https://www.youtube.com/watch?v=Q8jX_cH0C60&index=3&list=PLK5PktXR1tmNRaUPsFiYlyhg2lui0xgpj');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (20,'3.7.','ToR Data Management Roles - General',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (21,'3.8.','Example Data Management Activity Plan',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (22,'3.9.','Tools for Research Projects',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (23,'4.1.','Creating and Using a Data and Document Storage Facility',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (24,'4.2.','Introduction to Data and Document Storage (Video)',0,'https://www.youtube.com/watch?v=4CQtJbg_Qms&index=6&list=PLK5PktXR1tmNRaUPsFiYlyhg2lui0xgpj');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (25,'4.3.','Ownership Issues with Data and Document Stores (Video)',0,'https://www.youtube.com/watch?v=ML3UXLzaqRw&index=8&list=PLK5PktXR1tmNRaUPsFiYlyhg2lui0xgpj');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (26,'4.4.','Data and Document Store Organisation (Video)',0,'https://www.youtube.com/watch?v=MMagU_77rdI&list=PLK5PktXR1tmNRaUPsFiYlyhg2lui0xgpj&index=7');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (27,'4.5.','Introduction to Dropbox',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (28,'4.6.','Introduction to Dropbox (Video)',0,'https://www.youtube.com/watch?v=kvMkh4slKCU&index=9&list=PLK5PktXR1tmNRaUPsFiYlyhg2lui0xgpj');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (29,'5.1.','Documents needed for Survey Fieldwork and Training',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (30,'5.2.','CCAFS Training Manual for Field Supervisors',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (31,'5.3.','CCAFS HBS Code Book',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (32,'5.4.','CCAFS HBS Questionnaire',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (33,'5.5.','Example Consent Form',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (34,'5.6.','Example Training Manual when using ODK',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (35,'6.1.','Data Quality Assurance',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (36,'6.2.','Data Quality Checking (Video)',0,'https://www.youtube.com/watch?v=vbxvtIbqkPA&index=15&list=PLK5PktXR1tmNRaUPsFiYlyhg2lui0xgpj');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (37,'6.3.','Transition from Raw to Primary Data',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (38,'6.4.','Transition from Raw to Primary Data (Video)',0,'https://www.youtube.com/watch?v=IR0hbPIn_Yk&list=PLK5PktXR1tmNRaUPsFiYlyhg2lui0xgpj&index=17');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (39,'6.5.','Guidance for Handling Different Types of Data',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (40,'6.6.','Guidance for Handling Different Types of Data (Video)',0,'https://www.youtube.com/watch?v=SrRN2eHOVxk&index=16&list=PLK5PktXR1tmNRaUPsFiYlyhg2lui0xgpj');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (41,'7.1.','Introduction to Metadata',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (42,'7.2.','Metadata (Video)',0,'https://www.youtube.com/watch?v=AdX5OUJY9P0&index=11&list=PLK5PktXR1tmNRaUPsFiYlyhg2lui0xgpj');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (43,'7.3.','CG Core Metadata Schema',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (44,'7.4.','CG Core Basic for Researchers (Excel)',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (45,'7.5.','CG Core Basic for Researchers  ',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (46,'7.6.','ILRI Datasets Metadata Template (Excel)',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (47,'8.1.','Principles for Archiving and Sharing',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (48,'8.2.','Archiving & Sharing Data (Video)',0,'https://www.youtube.com/watch?v=H8sO21P5RBc&list=PLK5PktXR1tmNRaUPsFiYlyhg2lui0xgpj&index=10');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (49,'8.3.','Data and Documents to Submit for Archiving - a checklist',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (50,'8.4.','Portals for Archiving & Sharing',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (51,'8.5.','Introduction to Dataverse',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (52,'8.6.','Introduction to Dataverse (Video)',0,'https://www.youtube.com/watch?v=EGYuj1JM1Qc&index=12&list=PLK5PktXR1tmNRaUPsFiYlyhg2lui0xgpj');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (53,'8.7.','Creating a Dataverse (Video)',0,'https://www.youtube.com/watch?v=9dMtCvCpZNM&list=PLK5PktXR1tmNRaUPsFiYlyhg2lui0xgpj&index=13');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (54,'8.8.','CCAFS Dataverse (Video)',0,'https://www.youtube.com/watch?v=tr33h7TzFeY&list=PLK5PktXR1tmNRaUPsFiYlyhg2lui0xgpj&index=14');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (55,'8.9.','Introduction to Dspace (needs writing by CIAT)',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (56,'8.10.','Introduction to AgTrials (needs writing by CIAT)',0,'');
INSERT INTO `msp_guidelines` (`id`, `code`, `name`, `type`, `source`) VALUES (57,'8.11.','Introduction to CCAFS-Climate (needs writing by CIAT)',0,'');
/*!40000 ALTER TABLE `msp_guidelines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msp_guidelines_downloaded`
--

DROP TABLE IF EXISTS `msp_guidelines_downloaded`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msp_guidelines_downloaded` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `download_id` int(11) NOT NULL,
  `guideline_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_msp_guidelines_downloaded_msp_download1_idx` (`download_id`),
  KEY `fk_msp_guidelines_downloaded_msp_guidelines1_idx1` (`guideline_id`),
  CONSTRAINT `fk_download` FOREIGN KEY (`download_id`) REFERENCES `msp_download` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_guideline` FOREIGN KEY (`guideline_id`) REFERENCES `msp_guidelines` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msp_guidelines_downloaded`
--

LOCK TABLES `msp_guidelines_downloaded` WRITE;
/*!40000 ALTER TABLE `msp_guidelines_downloaded` DISABLE KEYS */;
/*!40000 ALTER TABLE `msp_guidelines_downloaded` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msp_guidelines_downloaded_stats`
--

DROP TABLE IF EXISTS `msp_guidelines_downloaded_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msp_guidelines_downloaded_stats` (
  `id` int(11) NOT NULL,
  `download_id` int(11) DEFAULT NULL,
  `guideline_id` int(11) NOT NULL,
  `first_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `institute` longtext,
  `intended_use` longtext,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_msp_guidelines_downloaded_stats_msp_guidelines1_idx` (`guideline_id`),
  KEY `fk_msp_downloadedguideline_idx` (`download_id`),
  CONSTRAINT `fk_msp_downloadedguideline` FOREIGN KEY (`download_id`) REFERENCES `msp_download` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_msp_guidelines_downloaded_stats_msp_guidelines1` FOREIGN KEY (`guideline_id`) REFERENCES `msp_guidelines` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msp_guidelines_downloaded_stats`
--

LOCK TABLES `msp_guidelines_downloaded_stats` WRITE;
/*!40000 ALTER TABLE `msp_guidelines_downloaded_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `msp_guidelines_downloaded_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msp_guidesph`
--

DROP TABLE IF EXISTS `msp_guidesph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msp_guidesph` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sphere_id` int(11) NOT NULL,
  `guideline_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sphere_relationship_idx` (`sphere_id`),
  KEY `fk_guideline_relationship_idx` (`guideline_id`),
  CONSTRAINT `fk_guideline_relationship` FOREIGN KEY (`guideline_id`) REFERENCES `msp_guidelines` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sphere_relationship` FOREIGN KEY (`sphere_id`) REFERENCES `msp_sphere` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msp_guidesph`
--

LOCK TABLES `msp_guidesph` WRITE;
/*!40000 ALTER TABLE `msp_guidesph` DISABLE KEYS */;
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (1,1,1);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (2,2,1);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (3,1,2);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (4,3,2);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (5,6,2);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (6,1,3);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (7,2,3);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (8,3,3);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (9,5,3);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (10,1,4);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (11,2,4);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (12,1,8);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (13,2,8);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (14,4,8);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (15,1,10);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (16,2,10);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (17,7,10);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (18,2,11);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (19,4,11);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (20,7,11);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (21,2,12);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (22,4,13);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (23,1,14);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (24,3,14);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (25,3,16);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (26,5,16);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (27,6,16);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (28,7,16);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (29,3,17);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (30,5,17);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (31,6,17);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (32,7,17);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (33,1,18);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (34,1,20);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (35,3,20);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (36,5,20);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (37,6,21);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (38,5,22);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (39,6,22);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (40,7,22);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (41,4,23);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (42,6,23);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (43,7,23);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (44,6,27);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (45,7,27);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (46,4,29);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (47,6,29);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (48,7,29);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (49,4,30);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (50,6,30);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (51,7,30);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (52,6,31);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (53,7,31);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (54,6,32);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (55,7,32);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (56,7,33);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (57,4,34);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (58,6,34);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (59,7,34);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (60,3,35);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (61,6,35);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (62,6,37);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (63,3,39);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (64,5,39);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (65,6,39);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (66,6,41);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (67,7,41);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (68,4,43);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (69,6,43);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (70,7,43);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (71,4,44);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (72,6,44);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (73,7,44);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (74,4,45);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (75,6,45);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (76,7,45);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (77,6,46);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (78,7,46);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (79,1,47);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (80,2,47);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (81,6,47);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (82,7,47);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (83,6,49);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (84,5,50);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (85,6,50);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (86,7,50);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (87,2,51);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (88,4,51);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (89,5,51);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (90,6,51);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (91,7,51);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (92,4,55);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (93,6,55);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (94,7,55);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (95,6,56);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (96,7,56);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (97,5,57);
INSERT INTO `msp_guidesph` (`id`, `sphere_id`, `guideline_id`) VALUES (98,6,57);
/*!40000 ALTER TABLE `msp_guidesph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msp_importance_levels`
--

DROP TABLE IF EXISTS `msp_importance_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msp_importance_levels` (
  `id_importance_level` int(11) NOT NULL,
  `importance_level` enum('Very important','Important','Useful','Optional') DEFAULT NULL,
  `guideline_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `stage_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id_importance_level`),
  KEY `fk_msp_importance_levels_msp_roles1_idx1` (`role_id`),
  KEY `fk_msp_importance_levels_msp_guidelines1_idx1` (`guideline_id`),
  KEY `fk_msp_importance_levels_msp_stages1_idx1` (`stage_id`),
  KEY `fk_msp_importance_levels_msp_categories1_idx1` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `msp_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_guidelines` FOREIGN KEY (`guideline_id`) REFERENCES `msp_guidelines` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rol_id` FOREIGN KEY (`role_id`) REFERENCES `msp_roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stage` FOREIGN KEY (`stage_id`) REFERENCES `msp_stages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msp_importance_levels`
--

LOCK TABLES `msp_importance_levels` WRITE;
/*!40000 ALTER TABLE `msp_importance_levels` DISABLE KEYS */;
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (1,'Very important',1,1,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (2,'Very important',1,1,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (3,'Important',1,1,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (4,'Very important',1,1,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (5,'Very important',1,1,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (6,'Important',1,1,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (7,'Important',1,1,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (8,'Important',1,1,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (9,'Important',1,1,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (10,'Important',1,1,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (11,'Optional',1,1,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (12,'Important',1,1,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (13,'Very important',1,1,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (14,'Optional',1,1,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (15,'Very important',1,1,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (16,'Important',2,1,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (17,'Useful',2,1,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (18,'Important',2,1,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (19,'Important',2,1,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (20,'Useful',2,1,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (21,'Important',2,1,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (22,'Optional',2,1,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (23,'Optional',2,1,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (24,'Optional',2,1,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (25,'Optional',2,1,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (26,'Optional',2,1,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (27,'Optional',2,1,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (28,'Optional',2,1,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (29,'Optional',2,1,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (30,'Useful',2,1,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (31,'Useful',3,1,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (32,'Optional',3,1,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (33,'Optional',3,1,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (34,'Useful',3,1,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (35,'Optional',3,1,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (36,'Optional',3,1,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (37,'Optional',3,1,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (38,'Optional',3,1,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (39,'Optional',3,1,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (40,'Optional',3,1,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (41,'Optional',3,1,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (42,'Optional',3,1,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (43,'Useful',3,1,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (44,'Optional',3,1,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (45,'Useful',3,1,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (46,'Very important',4,1,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (47,'Important',4,1,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (48,'Very important',4,1,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (49,'Very important',4,1,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (50,'Important',4,1,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (51,'Very important',4,1,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (52,'Optional',4,1,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (53,'Optional',4,1,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (54,'Optional',4,1,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (55,'Optional',4,1,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (56,'Optional',4,1,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (57,'Optional',4,1,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (58,'Very important',4,1,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (59,'Optional',4,1,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (60,'Optional',4,1,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (61,'Very important',5,0,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (62,'Very important',5,0,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (63,'Very important',5,0,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (64,'Useful',5,0,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (65,'Useful',5,0,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (66,'Useful',5,0,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (67,'Optional',5,0,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (68,'Optional',5,0,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (69,'Optional',5,0,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (70,'Optional',5,0,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (71,'Optional',5,0,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (72,'Optional',5,0,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (73,'Optional',5,0,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (74,'Optional',5,0,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (75,'Optional',5,0,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (76,'Important',6,0,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (77,'Very important',6,0,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (78,'Useful',6,0,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (79,'Useful',6,0,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (80,'Useful',6,0,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (81,'Useful',6,0,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (82,'Optional',6,0,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (83,'Optional',6,0,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (84,'Optional',6,0,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (85,'Optional',6,0,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (86,'Useful',6,0,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (87,'Useful',6,0,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (88,'Optional',6,0,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (89,'Useful',6,0,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (90,'Useful',6,0,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (91,'Important',7,0,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (92,'Important',7,0,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (93,'Useful',7,0,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (94,'Useful',7,0,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (95,'Useful',7,0,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (96,'Useful',7,0,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (97,'Optional',7,0,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (98,'Optional',7,0,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (99,'Optional',7,0,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (100,'Optional',7,0,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (101,'Useful',7,0,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (102,'Useful',7,0,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (103,'Optional',7,0,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (104,'Useful',7,0,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (105,'Useful',7,0,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (106,'Very important',8,2,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (107,'Very important',8,2,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (108,'Very important',8,2,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (109,'Very important',8,2,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (110,'Very important',8,2,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (111,'Very important',8,2,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (112,'Useful',8,2,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (113,'Useful',8,2,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (114,'Useful',8,2,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (115,'Useful',8,2,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (116,'Useful',8,2,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (117,'Useful',8,2,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (118,'Useful',8,2,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (119,'Useful',8,2,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (120,'Useful',8,2,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (121,'Important',9,2,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (122,'Important',9,2,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (123,'Very important',9,2,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (124,'Very important',9,2,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (125,'Very important',9,2,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (126,'Very important',9,2,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (127,'Useful',9,2,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (128,'Useful',9,2,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (129,'Useful',9,2,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (130,'Useful',9,2,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (131,'Useful',9,2,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (132,'Useful',9,2,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (133,'Useful',9,2,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (134,'Useful',9,2,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (135,'Useful',9,2,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (136,'Useful',10,2,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (137,'Useful',10,2,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (138,'Important',10,2,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (139,'Very important',10,2,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (140,'Very important',10,2,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (141,'Very important',10,2,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (142,'Useful',10,2,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (143,'Useful',10,2,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (144,'Important',10,2,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (145,'Useful',10,2,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (146,'Useful',10,2,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (147,'Useful',10,2,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (148,'Useful',10,2,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (149,'Useful',10,2,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (150,'Useful',10,2,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (151,'Useful',11,2,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (152,'Useful',11,2,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (153,'Optional',11,2,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (154,'Important',11,2,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (155,'Important',11,2,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (156,'Optional',11,2,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (157,'Optional',11,2,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (158,'Optional',11,2,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (159,'Optional',11,2,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (160,'Very important',11,2,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (161,'Very important',11,2,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (162,'Useful',11,2,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (163,'Useful',11,2,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (164,'Useful',11,2,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (165,'Optional',11,2,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (166,'Useful',12,2,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (167,'Useful',12,2,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (168,'Very important',12,2,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (169,'Very important',12,2,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (170,'Very important',12,2,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (171,'Very important',12,2,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (172,'Useful',12,2,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (173,'Useful',12,2,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (174,'Important',12,2,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (175,'Useful',12,2,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (176,'Useful',12,2,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (177,'Very important',12,2,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (178,'Useful',12,2,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (179,'Useful',12,2,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (180,'Very important',12,2,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (181,'Important',13,2,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (182,'Important',13,2,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (183,'Optional',13,2,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (184,'Useful',13,2,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (185,'Useful',13,2,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (186,'Optional',13,2,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (187,'Optional',13,2,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (188,'Optional',13,2,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (189,'Optional',13,2,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (190,'Important',13,2,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (191,'Important',13,2,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (192,'Optional',13,2,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (193,'Useful',13,2,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (194,'Useful',13,2,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (195,'Optional',13,2,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (196,'Very important',14,3,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (197,'Very important',14,3,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (198,'Very important',14,3,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (199,'Very important',14,3,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (200,'Very important',14,3,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (201,'Very important',14,3,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (202,'Important',14,3,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (203,'Useful',14,3,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (204,'Useful',14,3,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (205,'Useful',14,3,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (206,'Useful',14,3,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (207,'Useful',14,3,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (208,'Optional',14,3,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (209,'Optional',14,3,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (210,'Optional',14,3,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (211,'Very important',15,3,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (212,'Very important',15,3,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (213,'Very important',15,3,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (214,'Very important',15,3,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (215,'Very important',15,3,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (216,'Very important',15,3,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (217,'Useful',15,3,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (218,'Useful',15,3,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (219,'Useful',15,3,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (220,'Useful',15,3,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (221,'Useful',15,3,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (222,'Useful',15,3,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (223,'Optional',15,3,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (224,'Optional',15,3,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (225,'Optional',15,3,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (226,'Optional',16,3,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (227,'Optional',16,3,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (228,'Optional',16,3,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (229,'Optional',16,3,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (230,'Optional',16,3,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (231,'Optional',16,3,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (232,'Optional',16,3,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (233,'Optional',16,3,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (234,'Optional',16,3,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (235,'Optional',16,3,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (236,'Optional',16,3,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (237,'Useful',16,3,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (238,'Optional',16,3,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (239,'Optional',16,3,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (240,'Optional',16,3,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (241,'Optional',17,3,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (242,'Optional',17,3,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (243,'Optional',17,3,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (244,'Optional',17,3,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (245,'Optional',17,3,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (246,'Optional',17,3,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (247,'Optional',17,3,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (248,'Optional',17,3,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (249,'Optional',17,3,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (250,'Optional',17,3,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (251,'Optional',17,3,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (252,'Useful',17,3,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (253,'Optional',17,3,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (254,'Optional',17,3,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (255,'Optional',17,3,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (256,'Very important',18,3,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (257,'Very important',18,3,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (258,'Very important',18,3,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (259,'Very important',18,3,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (260,'Very important',18,3,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (261,'Very important',18,3,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (262,'Important',18,3,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (263,'Useful',18,3,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (264,'Very important',18,3,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (265,'Useful',18,3,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (266,'Useful',18,3,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (267,'Useful',18,3,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (268,'Optional',18,3,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (269,'Useful',18,3,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (270,'Useful',18,3,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (271,'Useful',19,3,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (272,'Useful',19,3,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (273,'Very important',19,3,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (274,'Useful',19,3,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (275,'Important',19,3,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (276,'Useful',19,3,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (277,'Useful',19,3,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (278,'Optional',19,3,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (279,'Very important',19,3,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (280,'Optional',19,3,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (281,'Useful',19,3,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (282,'Useful',19,3,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (283,'Optional',19,3,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (284,'Useful',19,3,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (285,'Useful',19,3,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (286,'Very important',20,3,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (287,'Very important',20,3,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (288,'Very important',20,3,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (289,'Very important',20,3,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (290,'Very important',20,3,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (291,'Very important',20,3,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (292,'Important',20,3,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (293,'Optional',20,3,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (294,'Important',20,3,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (295,'Useful',20,3,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (296,'Useful',20,3,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (297,'Useful',20,3,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (298,'Optional',20,3,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (299,'Optional',20,3,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (300,'Optional',20,3,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (301,'Useful',21,3,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (302,'Useful',21,3,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (303,'Important',21,3,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (304,'Useful',21,3,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (305,'Very important',21,3,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (306,'Important',21,3,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (307,'Optional',21,3,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (308,'Optional',21,3,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (309,'Important',21,3,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (310,'Optional',21,3,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (311,'Useful',21,3,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (312,'Useful',21,3,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (313,'Optional',21,3,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (314,'Useful',21,3,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (315,'Useful',21,3,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (316,'Optional',22,3,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (317,'Useful',22,3,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (318,'Important',22,3,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (319,'Optional',22,3,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (320,'Useful',22,3,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (321,'Useful',22,3,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (322,'Useful',22,3,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (323,'Useful',22,3,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (324,'Useful',22,3,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (325,'Useful',22,3,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (326,'Useful',22,3,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (327,'Useful',22,3,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (328,'Useful',22,3,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (329,'Useful',22,3,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (330,'Useful',22,3,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (331,'Important',23,4,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (332,'Important',23,4,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (333,'Important',23,4,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (334,'Very important',23,4,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (335,'Very important',23,4,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (336,'Very important',23,4,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (337,'Useful',23,4,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (338,'Important',23,4,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (339,'Very important',23,4,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (340,'Useful',23,4,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (341,'Important',23,4,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (342,'Very important',23,4,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (343,'Optional',23,4,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (344,'Optional',23,4,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (345,'Very important',23,4,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (346,'Important',24,4,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (347,'Important',24,4,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (348,'Important',24,4,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (349,'Very important',24,4,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (350,'Very important',24,4,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (351,'Very important',24,4,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (352,'Useful',24,4,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (353,'Important',24,4,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (354,'Very important',24,4,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (355,'Useful',24,4,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (356,'Important',24,4,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (357,'Very important',24,4,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (358,'Optional',24,4,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (359,'Optional',24,4,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (360,'Very important',24,4,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (361,'Useful',25,4,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (362,'Useful',25,4,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (363,'Important',25,4,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (364,'Useful',25,4,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (365,'Useful',25,4,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (366,'Very important',25,4,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (367,'Useful',25,4,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (368,'Important',25,4,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (369,'Very important',25,4,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (370,'Useful',25,4,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (371,'Important',25,4,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (372,'Very important',25,4,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (373,'Optional',25,4,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (374,'Optional',25,4,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (375,'Very important',25,4,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (376,'Useful',26,4,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (377,'Useful',26,4,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (378,'Important',26,4,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (379,'Useful',26,4,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (380,'Useful',26,4,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (381,'Very important',26,4,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (382,'Useful',26,4,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (383,'Important',26,4,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (384,'Very important',26,4,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (385,'Useful',26,4,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (386,'Important',26,4,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (387,'Very important',26,4,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (388,'Optional',26,4,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (389,'Optional',26,4,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (390,'Very important',26,4,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (391,'Optional',27,4,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (392,'Useful',27,4,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (393,'Useful',27,4,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (394,'Optional',27,4,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (395,'Useful',27,4,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (396,'Useful',27,4,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (397,'Useful',27,4,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (398,'Useful',27,4,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (399,'Useful',27,4,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (400,'Useful',27,4,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (401,'Useful',27,4,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (402,'Useful',27,4,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (403,'Optional',27,4,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (404,'Optional',27,4,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (405,'Useful',27,4,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (406,'Optional',28,4,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (407,'Useful',28,4,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (408,'Useful',28,4,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (409,'Optional',28,4,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (410,'Useful',28,4,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (411,'Useful',28,4,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (412,'Useful',28,4,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (413,'Useful',28,4,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (414,'Useful',28,4,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (415,'Useful',28,4,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (416,'Useful',28,4,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (417,'Useful',28,4,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (418,'Optional',28,4,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (419,'Optional',28,4,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (420,'Useful',28,4,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (421,'Important',29,5,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (422,'Important',29,5,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (423,'Important',29,5,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (424,'Very important',29,5,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (425,'Very important',29,5,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (426,'Very important',29,5,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (427,'Very important',29,5,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (428,'Very important',29,5,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (429,'Very important',29,5,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (430,'Important',29,5,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (431,'Important',29,5,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (432,'Useful',29,5,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (433,'Useful',29,5,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (434,'Useful',29,5,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (435,'Important',29,5,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (436,'Useful',30,5,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (437,'Useful',30,5,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (438,'Useful',30,5,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (439,'Useful',30,5,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (440,'Useful',30,5,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (441,'Useful',30,5,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (442,'Useful',30,5,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (443,'Useful',30,5,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (444,'Useful',30,5,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (445,'Useful',30,5,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (446,'Useful',30,5,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (447,'Useful',30,5,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (448,'Useful',30,5,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (449,'Useful',30,5,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (450,'Useful',30,5,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (451,'Useful',31,5,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (452,'Useful',31,5,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (453,'Useful',31,5,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (454,'Useful',31,5,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (455,'Useful',31,5,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (456,'Useful',31,5,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (457,'Useful',31,5,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (458,'Useful',31,5,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (459,'Useful',31,5,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (460,'Useful',31,5,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (461,'Useful',31,5,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (462,'Useful',31,5,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (463,'Useful',31,5,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (464,'Useful',31,5,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (465,'Useful',31,5,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (466,'Useful',32,5,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (467,'Useful',32,5,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (468,'Useful',32,5,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (469,'Useful',32,5,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (470,'Useful',32,5,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (471,'Useful',32,5,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (472,'Useful',32,5,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (473,'Useful',32,5,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (474,'Useful',32,5,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (475,'Useful',32,5,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (476,'Useful',32,5,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (477,'Useful',32,5,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (478,'Useful',32,5,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (479,'Useful',32,5,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (480,'Useful',32,5,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (481,'Very important',33,5,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (482,'Very important',33,5,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (483,'Useful',33,5,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (484,'Very important',33,5,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (485,'Very important',33,5,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (486,'Useful',33,5,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (487,'Very important',33,5,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (488,'Very important',33,5,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (489,'Very important',33,5,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (490,'Optional',33,5,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (491,'Very important',33,5,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (492,'Useful',33,5,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (493,'Optional',33,5,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (494,'Useful',33,5,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (495,'Useful',33,5,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (496,'Useful',34,5,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (497,'Useful',34,5,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (498,'Useful',34,5,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (499,'Useful',34,5,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (500,'Useful',34,5,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (501,'Useful',34,5,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (502,'Useful',34,5,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (503,'Useful',34,5,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (504,'Useful',34,5,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (505,'Useful',34,5,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (506,'Useful',34,5,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (507,'Useful',34,5,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (508,'Useful',34,5,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (509,'Useful',34,5,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (510,'Useful',34,5,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (511,'Important',35,6,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (512,'Important',35,6,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (513,'Important',35,6,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (514,'Very important',35,6,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (515,'Very important',35,6,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (516,'Very important',35,6,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (517,'Very important',35,6,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (518,'Very important',35,6,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (519,'Very important',35,6,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (520,'Important',35,6,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (521,'Important',35,6,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (522,'Very important',35,6,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (523,'Very important',35,6,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (524,'Very important',35,6,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (525,'Very important',35,6,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (526,'Important',36,6,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (527,'Important',36,6,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (528,'Important',36,6,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (529,'Very important',36,6,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (530,'Very important',36,6,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (531,'Very important',36,6,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (532,'Important',36,6,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (533,'Important',36,6,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (534,'Very important',36,6,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (535,'Important',36,6,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (536,'Important',36,6,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (537,'Very important',36,6,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (538,'Very important',36,6,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (539,'Very important',36,6,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (540,'Very important',36,6,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (541,'Useful',37,6,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (542,'Useful',37,6,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (543,'Useful',37,6,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (544,'Useful',37,6,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (545,'Useful',37,6,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (546,'Important',37,6,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (547,'Useful',37,6,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (548,'Important',37,6,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (549,'Very important',37,6,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (550,'Useful',37,6,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (551,'Useful',37,6,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (552,'Important',37,6,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (553,'Useful',37,6,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (554,'Useful',37,6,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (555,'Important',37,6,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (556,'Useful',38,6,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (557,'Useful',38,6,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (558,'Useful',38,6,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (559,'Useful',38,6,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (560,'Useful',38,6,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (561,'Important',38,6,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (562,'Useful',38,6,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (563,'Useful',38,6,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (564,'Important',38,6,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (565,'Useful',38,6,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (566,'Useful',38,6,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (567,'Important',38,6,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (568,'Useful',38,6,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (569,'Useful',38,6,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (570,'Important',38,6,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (571,'Useful',39,6,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (572,'Useful',39,6,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (573,'Useful',39,6,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (574,'Useful',39,6,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (575,'Useful',39,6,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (576,'Important',39,6,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (577,'Useful',39,6,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (578,'Useful',39,6,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (579,'Very important',39,6,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (580,'Useful',39,6,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (581,'Useful',39,6,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (582,'Important',39,6,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (583,'Useful',39,6,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (584,'Useful',39,6,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (585,'Important',39,6,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (586,'Useful',40,6,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (587,'Useful',40,6,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (588,'Useful',40,6,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (589,'Useful',40,6,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (590,'Useful',40,6,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (591,'Important',40,6,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (592,'Useful',40,6,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (593,'Useful',40,6,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (594,'Important',40,6,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (595,'Useful',40,6,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (596,'Useful',40,6,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (597,'Important',40,6,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (598,'Useful',40,6,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (599,'Useful',40,6,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (600,'Important',40,6,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (601,'Important',41,7,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (602,'Important',41,7,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (603,'Important',41,7,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (604,'Very important',41,7,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (605,'Very important',41,7,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (606,'Very important',41,7,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (607,'Very important',41,7,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (608,'Important',41,7,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (609,'Important',41,7,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (610,'Very important',41,7,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (611,'Very important',41,7,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (612,'Very important',41,7,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (613,'Very important',41,7,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (614,'Very important',41,7,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (615,'Very important',41,7,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (616,'Useful',42,7,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (617,'Useful',42,7,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (618,'Useful',42,7,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (619,'Useful',42,7,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (620,'Useful',42,7,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (621,'Useful',42,7,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (622,'Useful',42,7,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (623,'Useful',42,7,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (624,'Useful',42,7,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (625,'Useful',42,7,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (626,'Useful',42,7,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (627,'Useful',42,7,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (628,'Very important',42,7,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (629,'Useful',42,7,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (630,'Very important',42,7,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (631,'Useful',43,7,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (632,'Useful',43,7,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (633,'Useful',43,7,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (634,'Useful',43,7,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (635,'Useful',43,7,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (636,'Useful',43,7,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (637,'Useful',43,7,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (638,'Useful',43,7,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (639,'Useful',43,7,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (640,'Important',43,7,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (641,'Useful',43,7,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (642,'Important',43,7,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (643,'Very important',43,7,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (644,'Very important',43,7,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (645,'Very important',43,7,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (646,'Useful',44,7,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (647,'Useful',44,7,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (648,'Useful',44,7,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (649,'Useful',44,7,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (650,'Useful',44,7,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (651,'Useful',44,7,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (652,'Useful',44,7,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (653,'Useful',44,7,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (654,'Useful',44,7,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (655,'Useful',44,7,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (656,'Useful',44,7,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (657,'Useful',44,7,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (658,'Important',44,7,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (659,'Important',44,7,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (660,'Important',44,7,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (661,'Useful',45,7,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (662,'Useful',45,7,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (663,'Useful',45,7,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (664,'Useful',45,7,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (665,'Useful',45,7,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (666,'Useful',45,7,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (667,'Useful',45,7,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (668,'Useful',45,7,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (669,'Useful',45,7,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (670,'Useful',45,7,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (671,'Useful',45,7,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (672,'Useful',45,7,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (673,'Important',45,7,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (674,'Important',45,7,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (675,'Important',45,7,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (676,'Optional',46,7,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (677,'Optional',46,7,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (678,'Optional',46,7,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (679,'Optional',46,7,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (680,'Optional',46,7,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (681,'Optional',46,7,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (682,'Optional',46,7,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (683,'Optional',46,7,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (684,'Optional',46,7,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (685,'Optional',46,7,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (686,'Optional',46,7,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (687,'Optional',46,7,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (688,'Optional',46,7,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (689,'Optional',46,7,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (690,'Optional',46,7,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (691,'Very important',47,8,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (692,'Useful',47,8,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (693,'Very important',47,8,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (694,'Very important',47,8,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (695,'Useful',47,8,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (696,'Very important',47,8,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (697,'Important',47,8,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (698,'Useful',47,8,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (699,'Useful',47,8,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (700,'Optional',47,8,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (701,'Important',47,8,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (702,'Important',47,8,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (703,'Very important',47,8,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (704,'Very important',47,8,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (705,'Very important',47,8,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (706,'Useful',48,8,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (707,'Useful',48,8,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (708,'Important',48,8,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (709,'Useful',48,8,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (710,'Useful',48,8,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (711,'Useful',48,8,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (712,'Useful',48,8,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (713,'Useful',48,8,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (714,'Useful',48,8,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (715,'Useful',48,8,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (716,'Useful',48,8,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (717,'Useful',48,8,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (718,'Very important',48,8,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (719,'Useful',48,8,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (720,'Very important',48,8,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (721,'Useful',49,8,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (722,'Optional',49,8,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (723,'Optional',49,8,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (724,'Useful',49,8,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (725,'Useful',49,8,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (726,'Useful',49,8,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (727,'Useful',49,8,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (728,'Optional',49,8,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (729,'Optional',49,8,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (730,'Useful',49,8,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (731,'Useful',49,8,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (732,'Important',49,8,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (733,'Very important',49,8,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (734,'Very important',49,8,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (735,'Very important',49,8,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (736,'Useful',50,8,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (737,'Optional',50,8,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (738,'Useful',50,8,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (739,'Useful',50,8,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (740,'Useful',50,8,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (741,'Useful',50,8,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (742,'Useful',50,8,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (743,'Optional',50,8,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (744,'Useful',50,8,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (745,'Useful',50,8,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (746,'Useful',50,8,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (747,'Useful',50,8,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (748,'Useful',50,8,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (749,'Useful',50,8,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (750,'Very important',50,8,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (751,'Useful',51,8,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (752,'Useful',51,8,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (753,'Useful',51,8,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (754,'Useful',51,8,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (755,'Useful',51,8,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (756,'Useful',51,8,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (757,'Useful',51,8,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (758,'Optional',51,8,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (759,'Optional',51,8,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (760,'Useful',51,8,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (761,'Useful',51,8,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (762,'Useful',51,8,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (763,'Useful',51,8,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (764,'Useful',51,8,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (765,'Very important',51,8,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (766,'Optional',52,8,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (767,'Optional',52,8,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (768,'Optional',52,8,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (769,'Useful',52,8,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (770,'Useful',52,8,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (771,'Useful',52,8,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (772,'Optional',52,8,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (773,'Optional',52,8,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (774,'Optional',52,8,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (775,'Useful',52,8,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (776,'Useful',52,8,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (777,'Useful',52,8,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (778,'Useful',52,8,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (779,'Useful',52,8,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (780,'Very important',52,8,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (781,'Optional',53,8,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (782,'Optional',53,8,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (783,'Optional',53,8,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (784,'Useful',53,8,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (785,'Useful',53,8,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (786,'Useful',53,8,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (787,'Optional',53,8,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (788,'Optional',53,8,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (789,'Optional',53,8,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (790,'Useful',53,8,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (791,'Useful',53,8,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (792,'Useful',53,8,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (793,'Useful',53,8,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (794,'Useful',53,8,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (795,'Very important',53,8,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (796,'Optional',54,8,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (797,'Optional',54,8,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (798,'Optional',54,8,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (799,'Useful',54,8,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (800,'Useful',54,8,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (801,'Useful',54,8,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (802,'Optional',54,8,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (803,'Optional',54,8,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (804,'Optional',54,8,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (805,'Useful',54,8,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (806,'Useful',54,8,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (807,'Useful',54,8,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (808,'Useful',54,8,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (809,'Useful',54,8,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (810,'Very important',54,8,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (811,'Useful',55,8,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (812,'Useful',55,8,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (813,'Optional',55,8,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (814,'Useful',55,8,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (815,'Useful',55,8,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (816,'Useful',55,8,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (817,'Useful',55,8,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (818,'Optional',55,8,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (819,'Optional',55,8,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (820,'Useful',55,8,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (821,'Useful',55,8,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (822,'Useful',55,8,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (823,'Useful',55,8,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (824,'Useful',55,8,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (825,'Very important',55,8,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (826,'Optional',56,8,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (827,'Optional',56,8,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (828,'Optional',56,8,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (829,'Useful',56,8,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (830,'Useful',56,8,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (831,'Useful',56,8,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (832,'Optional',56,8,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (833,'Optional',56,8,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (834,'Optional',56,8,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (835,'Useful',56,8,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (836,'Useful',56,8,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (837,'Useful',56,8,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (838,'Useful',56,8,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (839,'Useful',56,8,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (840,'Very important',56,8,5,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (841,'Optional',57,8,1,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (842,'Optional',57,8,1,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (843,'Optional',57,8,1,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (844,'Useful',57,8,2,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (845,'Useful',57,8,2,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (846,'Useful',57,8,2,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (847,'Optional',57,8,3,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (848,'Optional',57,8,3,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (849,'Optional',57,8,3,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (850,'Useful',57,8,4,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (851,'Useful',57,8,4,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (852,'Useful',57,8,4,3);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (853,'Useful',57,8,5,1);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (854,'Useful',57,8,5,2);
INSERT INTO `msp_importance_levels` (`id_importance_level`, `importance_level`, `guideline_id`, `category_id`, `stage_id`, `role_id`) VALUES (855,'Very important',57,8,5,3);
/*!40000 ALTER TABLE `msp_importance_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msp_person`
--

DROP TABLE IF EXISTS `msp_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msp_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `registered` date NOT NULL,
  `email` varchar(75) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3187 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msp_person`
--

LOCK TABLES `msp_person` WRITE;
/*!40000 ALTER TABLE `msp_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `msp_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msp_roles`
--

DROP TABLE IF EXISTS `msp_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msp_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msp_roles`
--

LOCK TABLES `msp_roles` WRITE;
/*!40000 ALTER TABLE `msp_roles` DISABLE KEYS */;
INSERT INTO `msp_roles` (`id`, `name`) VALUES (1,'Principal Investigator');
INSERT INTO `msp_roles` (`id`, `name`) VALUES (2,'Researcher');
INSERT INTO `msp_roles` (`id`, `name`) VALUES (3,'Data Manager');
/*!40000 ALTER TABLE `msp_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msp_sphere`
--

DROP TABLE IF EXISTS `msp_sphere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msp_sphere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msp_sphere`
--

LOCK TABLES `msp_sphere` WRITE;
/*!40000 ALTER TABLE `msp_sphere` DISABLE KEYS */;
INSERT INTO `msp_sphere` (`id`, `name`) VALUES (1,'Strategic Planning');
INSERT INTO `msp_sphere` (`id`, `name`) VALUES (2,'Legal');
INSERT INTO `msp_sphere` (`id`, `name`) VALUES (3,'Managerial');
INSERT INTO `msp_sphere` (`id`, `name`) VALUES (4,'Communications');
INSERT INTO `msp_sphere` (`id`, `name`) VALUES (5,'Technical');
INSERT INTO `msp_sphere` (`id`, `name`) VALUES (6,'Data Management');
INSERT INTO `msp_sphere` (`id`, `name`) VALUES (7,'Using the Data');
/*!40000 ALTER TABLE `msp_sphere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msp_stages`
--

DROP TABLE IF EXISTS `msp_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msp_stages` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msp_stages`
--

LOCK TABLES `msp_stages` WRITE;
/*!40000 ALTER TABLE `msp_stages` DISABLE KEYS */;
INSERT INTO `msp_stages` (`id`, `name`) VALUES (1,'Proposal Stage');
INSERT INTO `msp_stages` (`id`, `name`) VALUES (2,'Grant Opening');
INSERT INTO `msp_stages` (`id`, `name`) VALUES (3,'Project Research');
INSERT INTO `msp_stages` (`id`, `name`) VALUES (4,'Publishing');
INSERT INTO `msp_stages` (`id`, `name`) VALUES (5,'Grant Close out');
/*!40000 ALTER TABLE `msp_stages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-17 14:40:41
