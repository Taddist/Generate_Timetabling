-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: timetabling
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add room',7,'add_room'),(20,'Can change room',7,'change_room'),(21,'Can delete room',7,'delete_room'),(22,'Can add subject',8,'add_subject'),(23,'Can change subject',8,'change_subject'),(24,'Can delete subject',8,'delete_subject'),(25,'Can add filiere',9,'add_filiere'),(26,'Can change filiere',9,'change_filiere'),(27,'Can delete filiere',9,'delete_filiere'),(28,'Can add year',10,'add_year'),(29,'Can change year',10,'change_year'),(30,'Can delete year',10,'delete_year'),(31,'Can add group',11,'add_group'),(32,'Can change group',11,'change_group'),(33,'Can delete group',11,'delete_group'),(37,'Can add tag',13,'add_tag'),(38,'Can change tag',13,'change_tag'),(39,'Can delete tag',13,'delete_tag'),(40,'Can add timeslote',14,'add_timeslote'),(41,'Can change timeslote',14,'change_timeslote'),(42,'Can delete timeslote',14,'delete_timeslote'),(43,'Can add contact',15,'add_contact'),(44,'Can change contact',15,'change_contact'),(45,'Can delete contact',15,'delete_contact'),(46,'Can add notification',16,'add_notification'),(47,'Can change notification',16,'change_notification'),(48,'Can delete notification',16,'delete_notification'),(52,'Can add type exam',17,'add_typeexam'),(53,'Can change type exam',17,'change_typeexam'),(54,'Can delete type exam',17,'delete_typeexam'),(55,'Can add type element',19,'add_typeelement'),(56,'Can change type element',19,'change_typeelement'),(57,'Can delete type element',19,'delete_typeelement'),(61,'Can add semaine',21,'add_semaine'),(62,'Can change semaine',21,'change_semaine'),(63,'Can delete semaine',21,'delete_semaine'),(67,'Can add file csv',23,'add_filecsv'),(68,'Can change file csv',23,'change_filecsv'),(69,'Can delete file csv',23,'delete_filecsv'),(70,'Can add exam',24,'add_exam'),(71,'Can change exam',24,'change_exam'),(72,'Can delete exam',24,'delete_exam'),(73,'Can add calendar relation',25,'add_calendarrelation'),(74,'Can change calendar relation',25,'change_calendarrelation'),(75,'Can delete calendar relation',25,'delete_calendarrelation'),(76,'Can add event relation',26,'add_eventrelation'),(77,'Can change event relation',26,'change_eventrelation'),(78,'Can delete event relation',26,'delete_eventrelation'),(79,'Can add event',27,'add_event'),(80,'Can change event',27,'change_event'),(81,'Can delete event',27,'delete_event'),(82,'Can add occurrence',28,'add_occurrence'),(83,'Can change occurrence',28,'change_occurrence'),(84,'Can delete occurrence',28,'delete_occurrence'),(85,'Can add rule',29,'add_rule'),(86,'Can change rule',29,'change_rule'),(87,'Can delete rule',29,'delete_rule'),(88,'Can add calendar',30,'add_calendar'),(89,'Can change calendar',30,'change_calendar'),(90,'Can delete calendar',30,'delete_calendar'),(94,'Can add free time',32,'add_freetime'),(95,'Can change free time',32,'change_freetime'),(96,'Can delete free time',32,'delete_freetime'),(97,'Can add trash notification',33,'add_trashnotification'),(98,'Can change trash notification',33,'change_trashnotification'),(99,'Can delete trash notification',33,'delete_trashnotification'),(103,'Can add sub activity',35,'add_subactivity'),(104,'Can change sub activity',35,'change_subactivity'),(105,'Can delete sub activity',35,'delete_subactivity');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$pjKPRhnzKWwg$moRtctaHFCrQly3dKilnINo4WRxpHC5e1OlAvrqpYC0=','2017-06-29 17:50:31.425340',1,'admin','','','afaf.tadd@gmail.com',1,1,'2017-05-03 10:37:38.000000'),(2,'pbkdf2_sha256$30000$hkMJuwEx92Bu$eGns5d6kF/FCkkLWPy01rStUZjzC42eEAWPo4Yd5pQY=','2017-05-06 01:22:23.929722',0,'afaf','afaf','taddist','afaf.taddist71@gmail.com',0,1,'2017-05-03 14:36:06.000000'),(3,'pbkdf2_sha256$30000$qU79ZNine9Hu$uVsc6Q0V4jUlw0FQMJDk0zKgM++9fg6/JFCpyoV7FcU=','2017-06-29 10:55:03.606974',0,'Elhamlaoui_Mahmoud','Mahmoud','Elhamlaoui','Mahmoud.elhamlaoui@gmail.com',0,1,'2017-05-03 20:45:40.000000'),(4,'pbkdf2_sha256$30000$LPWpsd0bUVCW$dwZnqJOXtrVYBkl2grzFQ6+AHiZo4QA17xgviTAgdjE=','2017-05-08 22:42:49.686887',0,'Abik_Mounia','Mounia','Abik','mounia.abik@gmail.com',0,1,'2017-05-08 22:30:00.000000'),(5,'pbkdf2_sha256$30000$3NGIwacKAnOX$4qsu3r2A/TkmBV4eXw8S24Hp9xrELNBbSq0CHldK/hQ=',NULL,0,'ElAsri','Bouchra','El Asri','ElAsri.Bouchra@gmail.com',0,1,'2017-06-28 23:52:16.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (2,3,43),(1,3,48),(10,4,43),(4,4,67),(5,4,68),(6,4,69),(7,4,70),(8,4,71),(9,4,72),(11,4,94),(12,4,95),(3,4,96),(23,5,46),(24,5,47),(25,5,48),(16,5,67),(17,5,68),(18,5,69),(19,5,70),(20,5,71),(21,5,72),(26,5,94),(27,5,95),(13,5,96),(14,5,97),(15,5,98),(22,5,99);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-05-03 10:42:54.676743','1','GL',1,'[{\"added\": {}}]',9,1),(2,'2017-05-03 10:43:00.863111','2','IWIM',1,'[{\"added\": {}}]',9,1),(3,'2017-05-03 11:56:09.888720','1','L1',1,'[{\"added\": {}}]',7,1),(4,'2017-05-03 11:56:19.590312','2','L2',1,'[{\"added\": {}}]',7,1),(5,'2017-05-03 12:02:38.190634','1','lundi 8h-10h',1,'[{\"added\": {}}]',14,1),(6,'2017-05-03 12:02:49.512162','2','lundi 10h-12h',1,'[{\"added\": {}}]',14,1),(7,'2017-05-03 12:03:49.091552','3','Amphi 1',1,'[{\"added\": {}}]',7,1),(8,'2017-05-03 12:03:59.126616','4','Amphi 2',1,'[{\"added\": {}}]',7,1),(9,'2017-05-03 12:04:16.461006','1','Gl-cours Amphi 1',1,'[{\"added\": {}}]',13,1),(10,'2017-05-03 12:04:36.520646','2','Gl-cours Amphi 2',1,'[{\"added\": {}}]',13,1),(11,'2017-05-03 12:21:19.842496','1','Gl-cours Amphi 1',2,'[]',13,1),(12,'2017-05-03 12:21:31.987367','3','Gl-cours Amphi 1',1,'[{\"added\": {}}]',13,1),(13,'2017-05-03 14:15:36.454226','4','Gl-cours Amphi 2',1,'[{\"added\": {}}]',13,1),(14,'2017-05-03 14:36:06.296398','2','afaf',1,'[{\"added\": {}}]',3,1),(15,'2017-05-03 14:36:28.839148','2','afaf',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]',3,1),(16,'2017-05-03 15:37:33.776341','3','i-el',1,'[{\"added\": {}}]',9,1),(17,'2017-05-03 20:45:40.829527','3','Hamlaoui_Mahmoud',1,'[{\"added\": {}}]',3,1),(18,'2017-05-03 20:48:33.066973','3','Elhamlaoui_Mahmoud',2,'[{\"changed\": {\"fields\": [\"username\", \"first_name\", \"last_name\", \"email\"]}}]',3,1),(19,'2017-05-03 20:53:39.237765','3','Elhamlaoui_Mahmoud',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',3,1),(20,'2017-05-03 20:53:48.020247','3','Elhamlaoui_Mahmoud',2,'[]',3,1),(21,'2017-05-03 23:56:30.691761','1','TP',1,'[{\"added\": {}}]',17,1),(22,'2017-05-03 23:56:58.136376','2','Ecrit',1,'[{\"added\": {}}]',17,1),(23,'2017-05-03 23:59:34.691316','1','TD',1,'[{\"added\": {}}]',19,1),(24,'2017-05-03 23:59:41.241415','2','TP',1,'[{\"added\": {}}]',19,1),(25,'2017-05-03 23:59:47.084359','3','Cours',1,'[{\"added\": {}}]',19,1),(26,'2017-05-04 00:28:59.973469','1','JEE',1,'[{\"added\": {}}]',8,1),(27,'2017-05-04 00:29:13.227901','1','GL3',1,'[{\"added\": {}}]',11,1),(28,'2017-05-04 00:29:18.418854','2','GL2',1,'[{\"added\": {}}]',11,1),(29,'2017-05-04 00:29:22.988881','3','GL1',1,'[{\"added\": {}}]',11,1),(30,'2017-05-04 00:29:55.973249','2','ANDROID',1,'[{\"added\": {}}]',8,1),(31,'2017-05-05 00:12:17.049952','1','s1',1,'[{\"added\": {}}]',NULL,1),(32,'2017-05-05 00:51:38.884126','11','fram',3,'',NULL,1),(33,'2017-05-05 00:51:38.973350','10','nnn',3,'',NULL,1),(34,'2017-05-05 00:51:39.062747','9','nnn',3,'',NULL,1),(35,'2017-05-05 00:51:39.096090','8','s789',3,'',NULL,1),(36,'2017-05-05 00:51:39.185313','7','s789',3,'',NULL,1),(37,'2017-05-05 00:51:39.285460','6','S458',3,'',NULL,1),(38,'2017-05-05 00:51:39.318983','5','S458',3,'',NULL,1),(39,'2017-05-05 00:51:39.352370','4','S14',3,'',NULL,1),(40,'2017-05-05 00:51:39.385907','3','S14',3,'',NULL,1),(41,'2017-05-05 00:51:39.463763','2','S2',3,'',NULL,1),(42,'2017-05-05 00:51:39.497182','1','s1',3,'',NULL,1),(43,'2017-05-05 02:08:20.396226','30','s999',3,'',NULL,1),(44,'2017-05-05 02:08:20.542567','29','s999',3,'',NULL,1),(45,'2017-05-05 02:08:20.576083','28','s999',3,'',NULL,1),(46,'2017-05-05 02:08:20.609456','27','1144',3,'',NULL,1),(47,'2017-05-05 02:08:20.642987','26','1144',3,'',NULL,1),(48,'2017-05-05 02:08:20.676436','25','1144',3,'',NULL,1),(49,'2017-05-05 02:08:20.743320','24','1144',3,'',NULL,1),(50,'2017-05-05 02:08:20.810235','23','test',3,'',NULL,1),(51,'2017-05-05 02:08:20.843670','22','test',3,'',NULL,1),(52,'2017-05-05 02:08:20.877182','21','test',3,'',NULL,1),(53,'2017-05-05 02:08:20.910595','20','test',3,'',NULL,1),(54,'2017-05-05 02:08:20.944019','19','test',3,'',NULL,1),(55,'2017-05-05 02:08:20.977412','18','test',3,'',NULL,1),(56,'2017-05-05 02:08:21.010946','17','test',3,'',NULL,1),(57,'2017-05-05 02:08:21.044343','16','test',3,'',NULL,1),(58,'2017-05-05 02:08:21.122190','15','test',3,'',NULL,1),(59,'2017-05-05 02:08:21.155679','14','test',3,'',NULL,1),(60,'2017-05-05 02:08:21.189106','13','test',3,'',NULL,1),(61,'2017-05-05 02:08:21.222594','12','s1',3,'',NULL,1),(62,'2017-05-05 12:30:27.401421','42','tt 8h-10h',3,'',14,1),(63,'2017-05-05 12:30:27.623431','41','tt 8h-10h',3,'',14,1),(64,'2017-05-05 12:30:27.709379','40','bo 8h-10h',3,'',14,1),(65,'2017-05-05 12:30:27.770157','39','bo 8h-10h',3,'',14,1),(66,'2017-05-05 12:30:27.847875','38','bo 8h-10h',3,'',14,1),(67,'2017-05-05 12:30:27.960832','37','bo 8h-10h',3,'',14,1),(68,'2017-05-05 12:30:28.026371','36','bbbb 8h-10h',3,'',14,1),(69,'2017-05-05 12:30:28.118320','35','bbbb 8h-10h',3,'',14,1),(70,'2017-05-05 12:30:28.241526','34','mm 8h-10h',3,'',14,1),(71,'2017-05-05 12:30:28.517308','33','mm 8h-10h',3,'',14,1),(72,'2017-05-05 12:30:28.629331','32','l 8h-10h',3,'',14,1),(73,'2017-05-05 12:30:28.719308','31','l 8h-10h',3,'',14,1),(74,'2017-05-05 12:30:28.834431','30','vend 8h-10h',3,'',14,1),(75,'2017-05-05 12:30:28.894027','29','vend 8h-10h',3,'',14,1),(76,'2017-05-05 12:30:28.938611','28','vendre 8h-10h',3,'',14,1),(77,'2017-05-05 12:30:29.042309','27','vendre 8h-10h',3,'',14,1),(78,'2017-05-05 12:30:29.132409','26','vendre 8h-10h',3,'',14,1),(79,'2017-05-05 12:30:29.338288','25','vendre 8h-10h',3,'',14,1),(80,'2017-05-05 12:30:29.426303','24','vendre 8h-10h',3,'',14,1),(81,'2017-05-05 12:30:29.522455','23','vendre 8h-10h',3,'',14,1),(82,'2017-05-05 12:30:29.615491','22','vendredi 8h-10h',3,'',14,1),(83,'2017-05-05 12:30:29.709396','21','vendredi 8h-10h',3,'',14,1),(84,'2017-05-05 12:30:29.828980','20','vendredi 8h-10h',3,'',14,1),(85,'2017-05-05 12:30:29.907140','19','vendredi 8h-10h',3,'',14,1),(86,'2017-05-05 12:30:29.962829','18','affafafaffa 11111111',3,'',14,1),(87,'2017-05-05 12:30:30.055377','17','samediiiii 8h-10h',3,'',14,1),(88,'2017-05-05 12:30:30.132275','16','samediiiii 8h-10h',3,'',14,1),(89,'2017-05-05 12:30:30.230255','15','samediiiii 8h-10h',3,'',14,1),(90,'2017-05-05 12:30:30.446542','14','venven 8h-10h',3,'',14,1),(91,'2017-05-05 12:30:30.519070','13','venven 8h-10h',3,'',14,1),(92,'2017-05-05 12:30:30.604314','12','lundi 8h-10h',3,'',14,1),(93,'2017-05-05 12:30:30.707395','11','lundi 8h-10h',3,'',14,1),(94,'2017-05-05 12:30:30.801298','10','lundi 8h-10h',3,'',14,1),(95,'2017-05-05 12:30:30.902464','9','lundi 8h-10h',3,'',14,1),(96,'2017-05-05 12:30:30.991390','8','lundi 8h-10h',3,'',14,1),(97,'2017-05-05 12:30:31.053136','7','lundi 8h-10h',3,'',14,1),(98,'2017-05-05 12:30:31.146491','6','lundi 8h-10h',3,'',14,1),(99,'2017-05-05 12:30:31.197725','5','lundi 8h-10h',3,'',14,1),(100,'2017-05-05 12:30:31.274499','4','lundi 8h-10h',3,'',14,1),(101,'2017-05-05 12:30:31.338385','3','lundi 8h-10h',3,'',14,1),(102,'2017-05-05 12:30:31.420513','2','lundi 10h-12h',3,'',14,1),(103,'2017-05-05 12:30:31.630442','1','lundi 8h-10h',3,'',14,1),(104,'2017-05-05 13:29:59.464626','95','YYYY 8-14h',3,'',14,1),(105,'2017-05-05 13:29:59.559235','94','YYYY 10-12h',3,'',14,1),(106,'2017-05-05 13:29:59.592807','93','YYYY 8-10h',3,'',14,1),(107,'2017-05-05 13:29:59.626180','92','TAT 8-10h',3,'',14,1),(108,'2017-05-05 13:29:59.659561','91','TAT 8-14h',3,'',14,1),(109,'2017-05-05 13:29:59.693036','90','TAT 10-12h',3,'',14,1),(110,'2017-05-05 13:29:59.726572','89','TAT 8-10h',3,'',14,1),(111,'2017-05-05 13:29:59.759933','88','TAT 8-10h',3,'',14,1),(112,'2017-05-05 13:29:59.793543','87','TAT 8-14h',3,'',14,1),(113,'2017-05-05 13:29:59.826870','86','TAT 10-12h',3,'',14,1),(114,'2017-05-05 13:29:59.860255','85','TAT 8-10h',3,'',14,1),(115,'2017-05-05 13:29:59.894073','84','test 8-14h',3,'',14,1),(116,'2017-05-05 13:29:59.927535','83','test 10-12h',3,'',14,1),(117,'2017-05-05 13:29:59.994481','82','test 8-10h',3,'',14,1),(118,'2017-05-05 13:30:00.027434','81','test 8-14h',3,'',14,1),(119,'2017-05-05 13:30:00.061012','80','test 10-12h',3,'',14,1),(120,'2017-05-05 13:30:00.283583','79','test 8-10h',3,'',14,1),(121,'2017-05-05 13:30:00.317065','78','mardi 8-14h',3,'',14,1),(122,'2017-05-05 13:30:00.350409','77','mardi 10-12h',3,'',14,1),(123,'2017-05-05 13:30:00.383819','76','mardi 8-10h',3,'',14,1),(124,'2017-05-05 13:30:00.417234','75','mardi 8-14h',3,'',14,1),(125,'2017-05-05 13:30:00.450916','74','mardi 10-12h',3,'',14,1),(126,'2017-05-05 13:30:00.495343','73','mardi 8-10h',3,'',14,1),(127,'2017-05-05 13:30:16.162751','70','s2',3,'',NULL,1),(128,'2017-05-05 13:30:16.315714','69','s1',3,'',NULL,1),(129,'2017-05-05 13:30:16.349088','68','s0',3,'',NULL,1),(130,'2017-05-05 13:30:16.382445','67','s77',3,'',NULL,1),(131,'2017-05-05 13:30:16.415863','66','s30',3,'',NULL,1),(132,'2017-05-05 13:30:16.532392','65','s25',3,'',NULL,1),(133,'2017-05-05 13:30:16.594309','64','s23',3,'',NULL,1),(134,'2017-05-05 13:30:16.627666','63','s22',3,'',NULL,1),(135,'2017-05-05 13:30:16.661337','62','s21',3,'',NULL,1),(136,'2017-05-05 13:30:16.694716','61','s20',3,'',NULL,1),(137,'2017-05-05 13:30:16.728141','60','s19',3,'',NULL,1),(138,'2017-05-05 13:30:16.761470','59','s18',3,'',NULL,1),(139,'2017-05-05 13:30:16.794930','58','s17',3,'',NULL,1),(140,'2017-05-05 13:30:16.828401','57','s17',3,'',NULL,1),(141,'2017-05-05 13:30:16.861847','56','s17',3,'',NULL,1),(142,'2017-05-05 13:30:16.895421','55','s17',3,'',NULL,1),(143,'2017-05-05 13:52:48.292709','1','S1',1,'[{\"added\": {}}]',21,1),(144,'2017-05-05 13:52:52.551386','2','S2',1,'[{\"added\": {}}]',21,1),(145,'2017-05-05 13:52:56.705127','3','S3',1,'[{\"added\": {}}]',21,1),(146,'2017-05-05 13:53:01.191881','4','S4',1,'[{\"added\": {}}]',21,1),(147,'2017-05-05 13:53:05.475335','5','S5',1,'[{\"added\": {}}]',21,1),(148,'2017-05-06 17:17:49.001579','6','S0',1,'[{\"added\": {}}]',21,1),(149,'2017-05-06 17:19:27.957802','41','FileCsv object',1,'[{\"added\": {}}]',23,1),(150,'2017-05-06 17:32:09.862696','1','admin',2,'[{\"changed\": {\"fields\": [\"last_login\"]}}]',3,1),(151,'2017-05-06 17:43:20.950783','41','  S0',3,'',23,1),(152,'2017-05-06 17:43:43.390089','42','  S0',1,'[{\"added\": {}}]',23,1),(153,'2017-05-07 17:46:44.745091','58','afaf taddist S1',1,'[{\"added\": {}}]',23,1),(154,'2017-05-07 17:48:36.542428','58','afaf taddist S1',3,'',23,1),(155,'2017-05-07 17:48:46.751709','59','afaf taddist S1',1,'[{\"added\": {}}]',23,1),(156,'2017-05-07 17:53:41.662604','10','JEE TP GL3',3,'',24,1),(157,'2017-05-07 17:53:41.998885','9','JEE TP GL2',3,'',24,1),(158,'2017-05-07 17:53:42.036189','8','JEE TP GL3',3,'',24,1),(159,'2017-05-07 17:53:42.080606','7','JEE TP GL3',3,'',24,1),(160,'2017-05-07 17:53:42.125065','6','JEE TP GL3',3,'',24,1),(161,'2017-05-07 17:53:42.169919','5','JEE TP GL2',3,'',24,1),(162,'2017-05-07 17:53:42.214250','4','JEE TP GL2',3,'',24,1),(163,'2017-05-07 17:53:42.258846','3','JEE Ecrit GL3',3,'',24,1),(164,'2017-05-07 17:53:42.304520','2','JEE Ecrit GL1',3,'',24,1),(165,'2017-05-07 17:53:42.349106','1','JEE Ecrit GL1',3,'',24,1),(166,'2017-05-07 18:10:19.885567','60','afaf taddist S4',1,'[{\"added\": {}}]',23,1),(167,'2017-05-07 18:10:29.159444','60','afaf taddist S4',3,'',23,1),(168,'2017-05-07 18:10:29.210575','59','afaf taddist S1',3,'',23,1),(169,'2017-05-07 22:33:31.527019','42','  S0',3,'',23,1),(170,'2017-05-07 22:33:49.643074','63','  S0',1,'[{\"added\": {}}]',23,1),(171,'2017-05-08 00:58:36.692691','4','GL',1,'[{\"added\": {}}]',9,1),(172,'2017-05-08 00:58:51.753998','4','GL',3,'',9,1),(173,'2017-05-08 02:02:07.356135','65','Mahmoud Elhamlaoui S3',1,'[{\"added\": {}}]',23,1),(174,'2017-05-08 02:02:24.581361','66','Mahmoud Elhamlaoui S4',1,'[{\"added\": {}}]',23,1),(175,'2017-05-08 02:02:35.084407','55','Mahmoud Elhamlaoui S2',3,'',23,1),(176,'2017-05-08 02:02:42.048844','66','Mahmoud Elhamlaoui S4',3,'',23,1),(177,'2017-05-08 17:50:00.083132','109','Mahmoud Elhamlaoui S3',3,'',23,1),(178,'2017-05-08 17:50:00.125790','108','Mahmoud Elhamlaoui S3',3,'',23,1),(179,'2017-05-08 17:50:00.170214','107','Mahmoud Elhamlaoui S4',3,'',23,1),(180,'2017-05-08 17:50:00.214809','106','Mahmoud Elhamlaoui S3',3,'',23,1),(181,'2017-05-08 17:50:00.259302','105','Mahmoud Elhamlaoui S4',3,'',23,1),(182,'2017-05-08 17:50:30.489361','104','Mahmoud Elhamlaoui S2',3,'',23,1),(183,'2017-05-08 17:50:30.580298','103','Mahmoud Elhamlaoui S3',3,'',23,1),(184,'2017-05-08 17:50:30.624864','102','Mahmoud Elhamlaoui S2',3,'',23,1),(185,'2017-05-08 17:50:30.669400','101','Mahmoud Elhamlaoui S2',3,'',23,1),(186,'2017-05-08 17:50:30.713967','100','Mahmoud Elhamlaoui S2',3,'',23,1),(187,'2017-05-08 17:50:48.284832','99','Mahmoud Elhamlaoui S3',3,'',23,1),(188,'2017-05-08 17:50:48.397857','98','Mahmoud Elhamlaoui S3',3,'',23,1),(189,'2017-05-08 17:50:48.431242','97','Mahmoud Elhamlaoui S4',3,'',23,1),(190,'2017-05-08 17:50:48.464732','96','Mahmoud Elhamlaoui S3',3,'',23,1),(191,'2017-05-08 17:50:48.498097','95','Mahmoud Elhamlaoui S1',3,'',23,1),(192,'2017-05-08 17:50:48.531673','94','Mahmoud Elhamlaoui S2',3,'',23,1),(193,'2017-05-08 17:50:48.565122','93','Mahmoud Elhamlaoui S3',3,'',23,1),(194,'2017-05-08 17:50:48.598463','92','Mahmoud Elhamlaoui S1',3,'',23,1),(195,'2017-05-08 17:50:48.632033','91','Mahmoud Elhamlaoui S3',3,'',23,1),(196,'2017-05-08 17:50:48.665550','90','Mahmoud Elhamlaoui S1',3,'',23,1),(197,'2017-05-08 17:50:48.732305','89','Mahmoud Elhamlaoui S4',3,'',23,1),(198,'2017-05-08 17:50:48.765729','88','Mahmoud Elhamlaoui S1',3,'',23,1),(199,'2017-05-08 17:50:48.799091','87','Mahmoud Elhamlaoui S3',3,'',23,1),(200,'2017-05-08 17:50:48.832616','86','Mahmoud Elhamlaoui S0',3,'',23,1),(201,'2017-05-08 17:50:48.866023','85','Mahmoud Elhamlaoui S1',3,'',23,1),(202,'2017-05-08 17:50:55.171676','84','Mahmoud Elhamlaoui S2',3,'',23,1),(203,'2017-05-08 17:50:55.260602','83','Mahmoud Elhamlaoui S3',3,'',23,1),(204,'2017-05-08 17:50:55.305243','82','Mahmoud Elhamlaoui S3',3,'',23,1),(205,'2017-05-08 17:50:55.349741','81','Mahmoud Elhamlaoui S2',3,'',23,1),(206,'2017-05-08 17:50:55.394337','80','Mahmoud Elhamlaoui S2',3,'',23,1),(207,'2017-05-08 17:50:55.438855','79','Mahmoud Elhamlaoui S4',3,'',23,1),(208,'2017-05-08 17:50:55.483460','78','Mahmoud Elhamlaoui S2',3,'',23,1),(209,'2017-05-08 17:50:55.527963','77','Mahmoud Elhamlaoui S5',3,'',23,1),(210,'2017-05-08 17:50:55.572628','76','Mahmoud Elhamlaoui S4',3,'',23,1),(211,'2017-05-08 17:50:55.617223','75','Mahmoud Elhamlaoui S3',3,'',23,1),(212,'2017-05-08 17:50:55.661711','74','Mahmoud Elhamlaoui S1',3,'',23,1),(213,'2017-05-08 17:50:55.706232','63','  S0',3,'',23,1),(214,'2017-05-08 17:51:11.515085','3','Mahmoud sccc',3,'',15,1),(215,'2017-05-08 17:51:11.612655','2','Mahmoud ssfsd',3,'',15,1),(216,'2017-05-08 17:51:11.646251','1','Mahmoud Exam Rattrapage',3,'',15,1),(217,'2017-05-08 17:51:28.389215','11','JEE TP GL3',3,'',24,1),(218,'2017-05-08 17:51:40.069478','2','FreeTime object',3,'',32,1),(219,'2017-05-08 18:16:43.318277','16','JEE TP GL1',3,'',24,1),(220,'2017-05-08 18:16:43.450751','15','JEE TP GL2',3,'',24,1),(221,'2017-05-08 18:16:43.584449','14','JEE TP GL3',3,'',24,1),(222,'2017-05-08 18:16:43.629046','13','ANDROID Ecrit GL2',3,'',24,1),(223,'2017-05-08 18:16:43.673801','12','JEE TP GL3',3,'',24,1),(224,'2017-05-08 22:07:53.809454','110','  S0',1,'[{\"added\": {}}]',23,1),(225,'2017-05-08 22:08:20.095566','3','i-el',3,'',9,1),(226,'2017-05-08 22:09:53.294162','4','Iel',1,'[{\"added\": {}}]',9,1),(227,'2017-05-08 22:10:01.440532','5','ISEM',1,'[{\"added\": {}}]',9,1),(228,'2017-05-08 22:10:23.052855','6','BI',1,'[{\"added\": {}}]',9,1),(229,'2017-05-08 22:10:58.101013','7','SSI',1,'[{\"added\": {}}]',9,1),(230,'2017-05-08 22:11:12.670160','4','IWIM1',1,'[{\"added\": {}}]',11,1),(231,'2017-05-08 22:11:19.250826','5','IWIM2',1,'[{\"added\": {}}]',11,1),(232,'2017-05-08 22:11:27.103161','6','ISEM',1,'[{\"added\": {}}]',11,1),(233,'2017-05-08 22:11:36.372386','7','eMBI',1,'[{\"added\": {}}]',11,1),(234,'2017-05-08 22:11:54.504235','8','eMBI',1,'[{\"added\": {}}]',9,1),(235,'2017-05-08 22:12:44.330486','8','SSI',1,'[{\"added\": {}}]',11,1),(236,'2017-05-08 22:12:57.292075','9','BI',1,'[{\"added\": {}}]',11,1),(237,'2017-05-08 22:13:06.336340','10','IeL',1,'[{\"added\": {}}]',11,1),(238,'2017-05-08 22:13:26.907299','11','G1',1,'[{\"added\": {}}]',11,1),(239,'2017-05-08 22:13:30.464459','12','G2',1,'[{\"added\": {}}]',11,1),(240,'2017-05-08 22:13:32.986437','13','G3',1,'[{\"added\": {}}]',11,1),(241,'2017-05-08 22:13:38.671765','14','G4',1,'[{\"added\": {}}]',11,1),(242,'2017-05-08 22:13:44.986857','15','G4',1,'[{\"added\": {}}]',11,1),(243,'2017-05-08 22:13:49.919458','16','G5',1,'[{\"added\": {}}]',11,1),(244,'2017-05-08 22:13:54.684043','17','G6',1,'[{\"added\": {}}]',11,1),(245,'2017-05-08 22:13:58.909320','18','G7',1,'[{\"added\": {}}]',11,1),(246,'2017-05-08 22:14:03.752868','19','G8',1,'[{\"added\": {}}]',11,1),(247,'2017-05-08 22:15:07.040879','351','Lundi 14h-16h',1,'[{\"added\": {}}]',14,1),(248,'2017-05-08 22:15:23.207582','350','Mercredi 10h-12h',3,'',14,1),(249,'2017-05-08 22:15:23.324235','349','Mercredi 8h-10h',3,'',14,1),(250,'2017-05-08 22:15:23.368657','348','Mardi 10-12h',3,'',14,1),(251,'2017-05-08 22:15:49.705146','352','Lundi 16h-18h',1,'[{\"added\": {}}]',14,1),(252,'2017-05-08 22:16:01.685996','353','Mardi 8h-10h',1,'[{\"added\": {}}]',14,1),(253,'2017-05-08 22:16:11.083215','354','Mardi 10h-12h',1,'[{\"added\": {}}]',14,1),(254,'2017-05-08 22:16:22.114563','355','Mardi 14h-16h',1,'[{\"added\": {}}]',14,1),(255,'2017-05-08 22:16:30.502018','356','Mardi 16h-18h',1,'[{\"added\": {}}]',14,1),(256,'2017-05-08 22:16:45.446814','357','Mercredi 8h-10h',1,'[{\"added\": {}}]',14,1),(257,'2017-05-08 22:16:54.998582','358','Mercredi 10h-12h',1,'[{\"added\": {}}]',14,1),(258,'2017-05-08 22:17:04.425242','359','Jeudi 8h-10h',1,'[{\"added\": {}}]',14,1),(259,'2017-05-08 22:17:12.981604','360','Jeudi 10h-12h',1,'[{\"added\": {}}]',14,1),(260,'2017-05-08 22:17:21.582679','361','Jeudi 14h-16h',1,'[{\"added\": {}}]',14,1),(261,'2017-05-08 22:17:29.853731','362','Jeudi 16h-18h',1,'[{\"added\": {}}]',14,1),(262,'2017-05-08 22:17:46.653138','363','Vendredi 8h-10h',1,'[{\"added\": {}}]',14,1),(263,'2017-05-08 22:17:55.240511','364','Vendredi 10h-12h',1,'[{\"added\": {}}]',14,1),(264,'2017-05-08 22:18:31.980602','365','Vendredi 14h-16h',1,'[{\"added\": {}}]',14,1),(265,'2017-05-08 22:18:39.674038','366','Vendredi 16h-18h',1,'[{\"added\": {}}]',14,1),(266,'2017-05-08 22:19:00.145202','5','Amphi 3',1,'[{\"added\": {}}]',7,1),(267,'2017-05-08 22:19:11.869474','6','Amphi 4',1,'[{\"added\": {}}]',7,1),(268,'2017-05-08 22:19:40.222267','7','L27',1,'[{\"added\": {}}]',7,1),(269,'2017-05-08 22:20:10.792802','7','L27',2,'[{\"changed\": {\"fields\": [\"capacite\"]}}]',7,1),(270,'2017-05-08 22:20:19.246908','8','L28',1,'[{\"added\": {}}]',7,1),(271,'2017-05-08 22:20:33.138234','9','A1',1,'[{\"added\": {}}]',7,1),(272,'2017-05-08 22:20:45.054410','10','A2',1,'[{\"added\": {}}]',7,1),(273,'2017-05-08 22:22:45.585705','3','Algorithmique',1,'[{\"added\": {}}]',8,1),(274,'2017-05-08 22:22:54.934653','4','Programmation C',1,'[{\"added\": {}}]',8,1),(275,'2017-05-08 22:23:03.757775','5','Structures de données',1,'[{\"added\": {}}]',8,1),(276,'2017-05-08 22:23:24.377165','6','Electronique numérique',1,'[{\"added\": {}}]',8,1),(277,'2017-05-08 22:23:34.958585','7','circuits logiques',1,'[{\"added\": {}}]',8,1),(278,'2017-05-08 22:23:43.720653','7','Circuits logiques',2,'[{\"changed\": {\"fields\": [\"element\"]}}]',8,1),(279,'2017-05-08 22:23:53.242426','8','Architecture des ordinateurs',1,'[{\"added\": {}}]',8,1),(280,'2017-05-08 22:24:13.902942','9','Eléments de Recherche opérationnelle',1,'[{\"added\": {}}]',8,1),(281,'2017-05-08 22:24:32.355873','10','Probabilité',1,'[{\"added\": {}}]',8,1),(282,'2017-05-08 22:24:39.442875','11','Simulation',1,'[{\"added\": {}}]',8,1),(283,'2017-05-08 22:24:58.986453','12','Gestion, Economie et Finance 1',1,'[{\"added\": {}}]',8,1),(284,'2017-05-08 22:25:38.225593','13','Bases de données Relationnelles',1,'[{\"added\": {}}]',8,1),(285,'2017-05-08 22:25:48.954376','14','Réseaux de communication',1,'[{\"added\": {}}]',8,1),(286,'2017-05-08 22:25:56.668273','15','Système d’exploitation',1,'[{\"added\": {}}]',8,1),(287,'2017-05-08 22:26:05.703613','16','Système d’Information',1,'[{\"added\": {}}]',8,1),(288,'2017-05-08 22:26:16.704630','17','Compilation',1,'[{\"added\": {}}]',8,1),(289,'2017-05-08 22:26:24.193426','18','Génie Logiciel Objet',1,'[{\"added\": {}}]',8,1),(290,'2017-05-08 22:26:34.167004','19','Technologie Web',1,'[{\"added\": {}}]',8,1),(291,'2017-05-08 22:26:47.350960','20','Génie logiciel objet avancé',1,'[{\"added\": {}}]',8,1),(292,'2017-05-08 22:27:03.054884','21','Bases de données avancées',1,'[{\"added\": {}}]',8,1),(293,'2017-05-08 22:27:12.429603','22','Traitement des données Multimédia',1,'[{\"added\": {}}]',8,1),(294,'2017-05-08 22:27:25.271890','2','ANDROID',3,'',8,1),(295,'2017-05-08 22:27:25.416467','1','JEE',3,'',8,1),(296,'2017-05-08 22:27:39.669750','23','Architectures et applications mobiles',1,'[{\"added\": {}}]',8,1),(297,'2017-05-08 22:28:09.918988','1','GL_COURS',1,'[{\"added\": {}}]',13,1),(298,'2017-05-08 22:28:15.743546','2','GL_TP',1,'[{\"added\": {}}]',13,1),(299,'2017-05-08 22:30:00.420251','4','Abik_Mounia',1,'[{\"added\": {}}]',3,1),(300,'2017-05-08 22:38:55.340991','4','Abik_Mounia',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]',3,1),(301,'2017-05-08 22:42:04.818649','1','1A',1,'[{\"added\": {}}]',10,1),(302,'2017-05-08 22:42:09.214149','2','2A',1,'[{\"added\": {}}]',10,1),(303,'2017-05-08 22:42:14.230808','3','3A',1,'[{\"added\": {}}]',10,1),(304,'2017-06-20 16:46:12.690706','6','S0',2,'[{\"changed\": {\"fields\": [\"date_debut\"]}}]',21,1),(305,'2017-06-20 16:46:33.739183','1','S1',2,'[{\"changed\": {\"fields\": [\"date_debut\"]}}]',21,1),(306,'2017-06-20 16:46:42.467457','6','S0',2,'[{\"changed\": {\"fields\": [\"date_debut\"]}}]',21,1),(307,'2017-06-20 16:46:57.019143','2','S2',2,'[{\"changed\": {\"fields\": [\"date_debut\"]}}]',21,1),(308,'2017-06-20 16:48:27.404521','3','S3',2,'[{\"changed\": {\"fields\": [\"date_debut\"]}}]',21,1),(309,'2017-06-22 17:28:46.979849','3','S3',2,'[{\"changed\": {\"fields\": [\"date_debut\"]}}]',21,1),(310,'2017-06-22 17:28:58.375498','4','S4',2,'[{\"changed\": {\"fields\": [\"date_debut\"]}}]',21,1),(311,'2017-06-22 17:29:14.359042','5','S5',2,'[{\"changed\": {\"fields\": [\"date_debut\"]}}]',21,1),(312,'2017-06-22 17:29:44.688317','7','S15',1,'[{\"added\": {}}]',21,1),(313,'2017-06-23 02:04:09.010528','1','Elhamlaoui_Mahmoud 2017-06-23 02:04:09.009825+00:00',1,'[{\"added\": {}}]',16,1),(314,'2017-06-23 02:07:13.446161','2','Elhamlaoui_Mahmoud 2017-06-23 02:07:13.423725+00:00',1,'[{\"added\": {}}]',16,1),(315,'2017-06-23 02:08:05.904978','3','Elhamlaoui_Mahmoud 2017-06-23 02:08:05.904215+00:00',1,'[{\"added\": {}}]',16,1),(316,'2017-06-23 02:08:19.660639','4','Elhamlaoui_Mahmoud 2017-06-23 02:08:19.659940+00:00',1,'[{\"added\": {}}]',16,1),(317,'2017-06-23 02:08:38.167544','5','Elhamlaoui_Mahmoud 2017-06-23 02:08:38.166899+00:00',1,'[{\"added\": {}}]',16,1),(318,'2017-06-25 18:34:20.160519','1','Mahmoud Elhamlaoui GL3 Technologie Web ',1,'[{\"added\": {}}]',NULL,1),(319,'2017-06-25 18:34:33.314551','2','Mahmoud Elhamlaoui GL2 Technologie Web ',1,'[{\"added\": {}}]',NULL,1),(320,'2017-06-25 18:34:46.241536','3','Mahmoud Elhamlaoui GL1 Technologie Web ',1,'[{\"added\": {}}]',NULL,1),(321,'2017-06-26 13:36:55.091953','1','SubActivity object',1,'[{\"added\": {}}]',35,1),(322,'2017-06-26 13:44:44.437284','1','SubActivity object',1,'[{\"added\": {}}]',35,1),(323,'2017-06-26 13:45:34.487534','2','SubActivity object',1,'[{\"added\": {}}]',35,1),(324,'2017-06-26 13:45:50.181318','24','Android',1,'[{\"added\": {}}]',8,1),(325,'2017-06-26 13:46:52.239582','3','SubActivity object',1,'[{\"added\": {}}]',35,1),(326,'2017-06-26 13:47:05.584527','24','Android',3,'',8,1),(327,'2017-06-26 13:48:06.603826','20','2AGL',1,'[{\"added\": {}}]',11,1),(328,'2017-06-26 13:48:16.313132','21','2AIWIM',1,'[{\"added\": {}}]',11,1),(329,'2017-06-26 13:48:33.128267','21','2AIWIM',3,'',11,1),(330,'2017-06-26 13:48:33.221056','20','2AGL',3,'',11,1),(331,'2017-06-26 15:04:43.475499','4','SubActivity object',1,'[{\"added\": {}}]',35,1),(332,'2017-06-26 15:21:12.913497','8','S16',1,'[{\"added\": {}}]',21,1),(333,'2017-06-26 15:32:43.445943','5','SubActivity object',1,'[{\"added\": {}}]',35,1),(334,'2017-06-26 15:33:02.226237','6','SubActivity object',1,'[{\"added\": {}}]',35,1),(335,'2017-06-26 15:33:19.494553','7','SubActivity object',1,'[{\"added\": {}}]',35,1),(336,'2017-06-26 16:39:41.064897','282','FreeTime object',1,'[{\"added\": {}}]',32,1),(337,'2017-06-26 16:39:50.464214','283','FreeTime object',1,'[{\"added\": {}}]',32,1),(338,'2017-06-26 16:39:59.953446','284','FreeTime object',1,'[{\"added\": {}}]',32,1),(339,'2017-06-26 16:40:10.642767','285','FreeTime object',1,'[{\"added\": {}}]',32,1),(340,'2017-06-26 16:40:20.449042','286','FreeTime object',1,'[{\"added\": {}}]',32,1),(341,'2017-06-26 16:40:30.348018','287','FreeTime object',1,'[{\"added\": {}}]',32,1),(342,'2017-06-26 16:40:42.344519','288','FreeTime object',1,'[{\"added\": {}}]',32,1),(343,'2017-06-27 20:50:23.387881','8','S16',2,'[{\"changed\": {\"fields\": [\"date_debut\"]}}]',21,1),(344,'2017-06-27 22:14:24.737841','4','SubActivity object',2,'[{\"changed\": {\"fields\": [\"groupe\", \"semaine\"]}}]',35,1),(345,'2017-06-27 22:14:34.877275','3','SubActivity object',2,'[{\"changed\": {\"fields\": [\"semaine\"]}}]',35,1),(346,'2017-06-27 22:14:44.213077','7','SubActivity object',2,'[{\"changed\": {\"fields\": [\"groupe\"]}}]',35,1),(347,'2017-06-27 22:14:55.850402','6','SubActivity object',2,'[{\"changed\": {\"fields\": [\"groupe\"]}}]',35,1),(348,'2017-06-27 22:15:02.938864','5','SubActivity object',2,'[{\"changed\": {\"fields\": [\"groupe\"]}}]',35,1),(349,'2017-06-27 22:15:19.931436','4','SubActivity object',2,'[{\"changed\": {\"fields\": [\"groupe\"]}}]',35,1),(350,'2017-06-28 00:07:40.798964','8','S16',2,'[{\"changed\": {\"fields\": [\"date_debut\"]}}]',21,1),(351,'2017-06-28 05:09:51.597601','289','FreeTime object',1,'[{\"added\": {}}]',32,1),(352,'2017-06-28 05:10:01.993177','290','FreeTime object',1,'[{\"added\": {}}]',32,1),(353,'2017-06-28 05:10:13.498112','291','FreeTime object',1,'[{\"added\": {}}]',32,1),(354,'2017-06-28 05:10:22.879353','292','FreeTime object',1,'[{\"added\": {}}]',32,1),(355,'2017-06-28 05:10:45.630734','288','FreeTime object',3,'',32,1),(356,'2017-06-28 05:11:11.559316','284','FreeTime object',3,'',32,1),(357,'2017-06-28 05:11:11.635305','283','FreeTime object',3,'',32,1),(358,'2017-06-28 05:11:11.679891','282','FreeTime object',3,'',32,1),(359,'2017-06-28 05:11:26.510607','293','FreeTime object',1,'[{\"added\": {}}]',32,1),(360,'2017-06-28 05:11:35.781682','294','FreeTime object',1,'[{\"added\": {}}]',32,1),(361,'2017-06-28 05:11:47.720684','295','FreeTime object',1,'[{\"added\": {}}]',32,1),(362,'2017-06-28 05:11:57.136261','296','FreeTime object',1,'[{\"added\": {}}]',32,1),(363,'2017-06-28 05:12:08.764229','297','FreeTime object',1,'[{\"added\": {}}]',32,1),(364,'2017-06-28 05:12:20.290948','298','FreeTime object',1,'[{\"added\": {}}]',32,1),(365,'2017-06-28 11:50:37.754854','298','FreeTime object',3,'',32,1),(366,'2017-06-28 11:50:37.810597','297','FreeTime object',3,'',32,1),(367,'2017-06-28 11:50:37.855171','296','FreeTime object',3,'',32,1),(368,'2017-06-28 11:50:37.899739','295','FreeTime object',3,'',32,1),(369,'2017-06-28 11:50:37.944471','294','FreeTime object',3,'',32,1),(370,'2017-06-28 11:50:37.989043','293','FreeTime object',3,'',32,1),(371,'2017-06-28 11:50:38.033429','292','FreeTime object',3,'',32,1),(372,'2017-06-28 11:50:38.077955','291','FreeTime object',3,'',32,1),(373,'2017-06-28 11:50:38.122561','290','FreeTime object',3,'',32,1),(374,'2017-06-28 11:50:38.167271','289','FreeTime object',3,'',32,1),(375,'2017-06-28 11:50:38.211639','287','FreeTime object',3,'',32,1),(376,'2017-06-28 11:50:38.256605','286','FreeTime object',3,'',32,1),(377,'2017-06-28 11:50:38.300767','285','FreeTime object',3,'',32,1),(378,'2017-06-28 12:05:48.681296','116','Mahmoud Elhamlaoui S16',1,'[{\"added\": {}}]',23,1),(379,'2017-06-28 12:07:19.442648','299','FreeTime object',1,'[{\"added\": {}}]',32,1),(380,'2017-06-28 12:07:29.885047','300','FreeTime object',1,'[{\"added\": {}}]',32,1),(381,'2017-06-28 12:07:39.361032','301','FreeTime object',1,'[{\"added\": {}}]',32,1),(382,'2017-06-28 12:07:52.758940','302','FreeTime object',1,'[{\"added\": {}}]',32,1),(383,'2017-06-28 12:08:05.461062','303','FreeTime object',1,'[{\"added\": {}}]',32,1),(384,'2017-06-28 12:08:16.260973','304','FreeTime object',1,'[{\"added\": {}}]',32,1),(385,'2017-06-28 12:08:25.620136','305','FreeTime object',1,'[{\"added\": {}}]',32,1),(386,'2017-06-28 12:08:36.277323','306','FreeTime object',1,'[{\"added\": {}}]',32,1),(387,'2017-06-28 12:08:48.938106','307','FreeTime object',1,'[{\"added\": {}}]',32,1),(388,'2017-06-28 12:09:00.976717','308','FreeTime object',1,'[{\"added\": {}}]',32,1),(389,'2017-06-28 12:09:16.285680','309','FreeTime object',1,'[{\"added\": {}}]',32,1),(390,'2017-06-28 12:09:26.794379','310','FreeTime object',1,'[{\"added\": {}}]',32,1),(391,'2017-06-28 12:09:42.542390','311','FreeTime object',1,'[{\"added\": {}}]',32,1),(392,'2017-06-28 12:10:03.438724','312','FreeTime object',1,'[{\"added\": {}}]',32,1),(393,'2017-06-28 12:10:13.998662','313','FreeTime object',1,'[{\"added\": {}}]',32,1),(394,'2017-06-28 12:10:25.332582','314','FreeTime object',1,'[{\"added\": {}}]',32,1),(395,'2017-06-28 12:10:36.400195','315','FreeTime object',1,'[{\"added\": {}}]',32,1),(396,'2017-06-28 12:10:45.162798','316','FreeTime object',1,'[{\"added\": {}}]',32,1),(397,'2017-06-28 12:13:40.771451','7','SubActivity object',2,'[{\"changed\": {\"fields\": [\"element\", \"typeelement\"]}}]',35,1),(398,'2017-06-28 12:13:58.471025','6','SubActivity object',3,'',35,1),(399,'2017-06-28 12:13:58.572045','5','SubActivity object',3,'',35,1),(400,'2017-06-28 12:13:58.605464','4','SubActivity object',3,'',35,1),(401,'2017-06-28 12:13:58.638894','3','SubActivity object',3,'',35,1),(402,'2017-06-28 12:14:07.234575','2','SubActivity object',3,'',35,1),(403,'2017-06-28 12:14:07.333195','1','SubActivity object',3,'',35,1),(404,'2017-06-28 12:14:28.211939','8','SubActivity object',1,'[{\"added\": {}}]',35,1),(405,'2017-06-28 12:14:44.796883','9','SubActivity object',1,'[{\"added\": {}}]',35,1),(406,'2017-06-28 12:15:16.813291','10','SubActivity object',1,'[{\"added\": {}}]',35,1),(407,'2017-06-28 12:28:04.143251','11','SubActivity object',1,'[{\"added\": {}}]',35,1),(408,'2017-06-28 12:28:23.397054','12','SubActivity object',1,'[{\"added\": {}}]',35,1),(409,'2017-06-28 12:28:54.133851','13','SubActivity object',1,'[{\"added\": {}}]',35,1),(410,'2017-06-28 12:39:35.660643','14','SubActivity object',1,'[{\"added\": {}}]',35,1),(411,'2017-06-28 12:58:59.112941','15','SubActivity object',1,'[{\"added\": {}}]',35,1),(412,'2017-06-28 12:59:18.088386','16','SubActivity object',1,'[{\"added\": {}}]',35,1),(413,'2017-06-28 13:00:47.217717','15','SubActivity object',2,'[{\"changed\": {\"fields\": [\"user\", \"element\"]}}]',35,1),(414,'2017-06-28 13:01:14.351703','17','SubActivity object',1,'[{\"added\": {}}]',35,1),(415,'2017-06-28 13:09:05.336701','16','SubActivity object',3,'',35,1),(416,'2017-06-28 15:43:27.660619','313','FreeTime object',2,'[{\"changed\": {\"fields\": [\"user\"]}}]',32,1),(417,'2017-06-28 15:43:33.732130','314','FreeTime object',2,'[{\"changed\": {\"fields\": [\"user\"]}}]',32,1),(418,'2017-06-28 15:43:38.864124','316','FreeTime object',2,'[{\"changed\": {\"fields\": [\"user\"]}}]',32,1),(419,'2017-06-28 15:43:44.785165','316','FreeTime object',2,'[]',32,1),(420,'2017-06-28 15:43:53.110107','315','FreeTime object',2,'[{\"changed\": {\"fields\": [\"user\", \"timeslote\"]}}]',32,1),(421,'2017-06-28 15:44:07.649840','317','FreeTime object',1,'[{\"added\": {}}]',32,1),(422,'2017-06-28 23:52:16.721125','5','ElAsri',1,'[{\"added\": {}}]',3,1),(423,'2017-06-28 23:53:52.952933','5','ElAsri',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"date_joined\"]}}]',3,1),(424,'2017-06-28 23:54:25.547025','5','ElAsri',2,'[{\"changed\": {\"fields\": [\"email\", \"date_joined\"]}}]',3,1),(425,'2017-06-28 23:58:52.096924','281','FreeTime object',3,'',32,1),(426,'2017-06-28 23:58:52.199294','277','FreeTime object',3,'',32,1),(427,'2017-06-28 23:58:52.232745','275','FreeTime object',3,'',32,1),(428,'2017-06-28 23:58:52.266133','272','FreeTime object',3,'',32,1),(429,'2017-06-28 23:58:52.299560','271','FreeTime object',3,'',32,1),(430,'2017-06-28 23:58:52.332972','269','FreeTime object',3,'',32,1),(431,'2017-06-28 23:58:52.366426','268','FreeTime object',3,'',32,1),(432,'2017-06-28 23:58:52.399894','230','FreeTime object',3,'',32,1),(433,'2017-06-28 23:59:18.873401','307','FreeTime object',3,'',32,1),(434,'2017-06-28 23:59:19.006818','306','FreeTime object',3,'',32,1),(435,'2017-06-28 23:59:19.051209','305','FreeTime object',3,'',32,1),(436,'2017-06-28 23:59:19.095703','304','FreeTime object',3,'',32,1),(437,'2017-06-28 23:59:19.140347','303','FreeTime object',3,'',32,1),(438,'2017-06-28 23:59:19.184934','302','FreeTime object',3,'',32,1),(439,'2017-06-28 23:59:30.149949','308','FreeTime object',2,'[{\"changed\": {\"fields\": [\"timeslote\"]}}]',32,1),(440,'2017-06-28 23:59:37.276994','310','FreeTime object',2,'[{\"changed\": {\"fields\": [\"timeslote\"]}}]',32,1),(441,'2017-06-28 23:59:51.517321','309','FreeTime object',3,'',32,1),(442,'2017-06-29 00:00:21.173010','312','FreeTime object',2,'[{\"changed\": {\"fields\": [\"timeslote\"]}}]',32,1),(443,'2017-06-29 00:00:33.748468','311','FreeTime object',3,'',32,1),(444,'2017-06-29 00:00:58.235008','315','FreeTime object',3,'',32,1),(445,'2017-06-29 00:01:18.568202','317','FreeTime object',3,'',32,1),(446,'2017-06-29 00:02:11.132589','8','S16',2,'[{\"changed\": {\"fields\": [\"date_debut\"]}}]',21,1),(447,'2017-06-29 00:07:08.048337','318','FreeTime object',1,'[{\"added\": {}}]',32,1),(448,'2017-06-29 00:07:19.267511','316','FreeTime object',2,'[{\"changed\": {\"fields\": [\"timeslote\"]}}]',32,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(15,'log','contact'),(24,'log','exam'),(23,'log','filecsv'),(9,'log','filiere'),(32,'log','freetime'),(11,'log','group'),(16,'log','notification'),(7,'log','room'),(21,'log','semaine'),(35,'log','subactivity'),(8,'log','subject'),(13,'log','tag'),(14,'log','timeslote'),(33,'log','trashnotification'),(19,'log','typeelement'),(17,'log','typeexam'),(10,'log','year'),(30,'schedule','calendar'),(25,'schedule','calendarrelation'),(27,'schedule','event'),(26,'schedule','eventrelation'),(28,'schedule','occurrence'),(29,'schedule','rule'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-05-03 00:28:59.473267'),(2,'auth','0001_initial','2017-05-03 00:29:08.317172'),(3,'admin','0001_initial','2017-05-03 00:29:10.861379'),(4,'admin','0002_logentry_remove_auto_add','2017-05-03 00:29:11.118232'),(5,'contenttypes','0002_remove_content_type_name','2017-05-03 00:29:12.768112'),(6,'auth','0002_alter_permission_name_max_length','2017-05-03 00:29:14.152061'),(7,'auth','0003_alter_user_email_max_length','2017-05-03 00:29:15.343947'),(8,'auth','0004_alter_user_username_opts','2017-05-03 00:29:15.384037'),(9,'auth','0005_alter_user_last_login_null','2017-05-03 00:29:16.268981'),(10,'auth','0006_require_contenttypes_0002','2017-05-03 00:29:16.560614'),(11,'auth','0007_alter_validators_add_error_messages','2017-05-03 00:29:16.740355'),(12,'auth','0008_alter_user_username_max_length','2017-05-03 00:29:18.330577'),(13,'log','0001_initial','2017-05-03 00:29:19.545259'),(14,'log','0002_filliere','2017-05-03 00:29:20.227827'),(15,'log','0003_auto_20170503_0033','2017-05-03 00:29:20.504445'),(16,'log','0004_salle','2017-05-03 00:29:21.183293'),(17,'log','0005_auto_20170503_0040','2017-05-03 00:29:21.561665'),(18,'log','0006_subject','2017-05-03 00:29:22.163481'),(19,'log','0007_auto_20170503_0044','2017-05-03 00:29:25.637365'),(20,'log','0008_auto_20170503_0055','2017-05-03 00:29:31.265430'),(21,'log','0009_auto_20170503_0057','2017-05-03 00:29:36.334972'),(22,'log','0010_auto_20170503_0101','2017-05-03 00:29:37.441897'),(23,'log','0011_remove_group_fil','2017-05-03 00:29:38.334235'),(24,'log','0012_delete_filiere','2017-05-03 00:29:38.557326'),(25,'log','0013_auto_20170503_0104','2017-05-03 00:29:40.600246'),(26,'log','0014_auto_20170503_0106','2017-05-03 00:29:46.556410'),(27,'log','0015_auto_20170503_0117','2017-05-03 00:29:48.990368'),(28,'log','0016_auto_20170503_0122','2017-05-03 00:29:54.566717'),(29,'log','0017_auto_20170503_0123','2017-05-03 00:29:57.109224'),(30,'sessions','0001_initial','2017-05-03 00:29:58.290320'),(31,'log','0002_group','2017-05-03 11:31:04.935867'),(32,'log','0003_auto_20170503_1233','2017-05-03 11:33:05.554271'),(33,'log','0004_auto_20170503_1254','2017-05-03 11:55:11.410749'),(34,'log','0005_auto_20170503_2144','2017-05-03 20:44:20.327433'),(35,'log','0006_auto_20170504_0054','2017-05-03 23:54:51.196083'),(36,'log','0007_typeelement','2017-05-03 23:58:46.914359'),(37,'log','0008_filecsv','2017-05-05 00:10:38.114537'),(38,'log','0009_semaine','2017-05-05 13:38:48.855685'),(39,'log','0010_auto_20170505_1439','2017-05-05 13:42:45.203506'),(40,'log','0011_auto_20170505_1440','2017-05-05 13:42:46.470143'),(41,'log','0012_auto_20170505_1443','2017-05-05 13:43:18.337701'),(42,'log','0013_test','2017-05-05 13:48:58.892272'),(43,'log','0014_auto_20170505_1448','2017-05-05 13:49:00.413716'),(44,'log','0015_filecsv','2017-05-05 13:50:08.186933'),(45,'log','0016_auto_20170505_1527','2017-05-05 14:27:24.634139'),(46,'log','0017_filecsv','2017-05-05 14:28:02.287834'),(47,'log','0018_auto_20170505_1541','2017-05-05 14:41:54.394566'),(48,'log','0019_exam','2017-05-05 14:42:53.730691'),(49,'schedule','0001_initial','2017-05-05 21:03:12.486560'),(50,'schedule','0002_event_color_event','2017-05-05 21:03:13.223677'),(51,'log','0020_freetime','2017-05-08 13:13:34.819304'),(52,'log','0021_auto_20170508_1831','2017-05-08 17:31:18.707694'),(53,'log','0022_freetime','2017-05-08 17:32:38.271112'),(54,'log','0023_auto_20170508_1852','2017-05-08 17:52:30.156416'),(55,'log','0024_semaine_date_debut','2017-06-20 16:44:17.364449'),(56,'log','0025_trashnotification','2017-06-23 03:56:03.281321'),(57,'log','0026_subactivity','2017-06-25 18:29:08.306890'),(58,'log','0027_auto_20170626_1335','2017-06-26 13:36:01.419462'),(59,'log','0028_subactivity','2017-06-26 13:36:30.302469'),(60,'log','0029_auto_20170626_1343','2017-06-26 13:43:34.979314'),(61,'log','0030_subactivity','2017-06-26 13:44:08.204895');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('63vitm0f8wiwlmjn2e0t3jtclwozv0f1','ZGNhODQ0YTM4ODVlMWQxODc1NGUwMjZjZDc3ZjRlZWI5Njc0MDE1Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjMiLCJfYXV0aF91c2VyX2hhc2giOiI0OTc2NGFhODMxMjUzMmExNzNjMGE4ZThmNWY0YWRkZjA4ZmNjMjlmIn0=','2017-05-23 00:32:29.249449'),('m8fhayqwf2goroqdrjzasg91kbz9gsst','MTdjOWQyYjQ4YTU3ZmViMDQxM2IwY2MzOWFkZGIyNGU5NmJlYjU3Njp7Il9hdXRoX3VzZXJfaGFzaCI6ImI2MzIzY2ZjNDFkYzI2Mjc0ZDNlMjlkNDRhYjE1ZDE0NTI2ZmIyNjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-05-17 15:37:22.356207'),('soghysswqvd81qyisvcpx97yrz106b75','ZDQ5NTg1M2Q5ZGFhODkwYzhkYTk2YTFkZTNkZWI3NjkyZDIzYmNkMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjMyM2NmYzQxZGMyNjI3NGQzZTI5ZDQ0YWIxNWQxNDUyNmZiMjY2In0=','2017-07-13 17:50:31.559521');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_contact`
--

DROP TABLE IF EXISTS `log_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `message` longtext NOT NULL,
  `subject` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `log_contact_user_id_cd7e5d1f_fk_auth_user_id` (`user_id`),
  CONSTRAINT `log_contact_user_id_cd7e5d1f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_contact`
--

LOCK TABLES `log_contact` WRITE;
/*!40000 ALTER TABLE `log_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_exam`
--

DROP TABLE IF EXISTS `log_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `element_id` int(11) NOT NULL,
  `groupe_id` int(11) NOT NULL,
  `typeExam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `log_exam_element_id_18d8a015_fk_log_subject_id` (`element_id`),
  KEY `log_exam_groupe_id_2fcae11e_fk_log_group_id` (`groupe_id`),
  KEY `log_exam_typeExam_id_3b3bd12c_fk_log_typeexam_id` (`typeExam_id`),
  KEY `log_exam_user_id_5c425de4_fk_auth_user_id` (`user_id`),
  CONSTRAINT `log_exam_element_id_18d8a015_fk_log_subject_id` FOREIGN KEY (`element_id`) REFERENCES `log_subject` (`id`),
  CONSTRAINT `log_exam_groupe_id_2fcae11e_fk_log_group_id` FOREIGN KEY (`groupe_id`) REFERENCES `log_group` (`id`),
  CONSTRAINT `log_exam_typeExam_id_3b3bd12c_fk_log_typeexam_id` FOREIGN KEY (`typeExam_id`) REFERENCES `log_typeexam` (`id`),
  CONSTRAINT `log_exam_user_id_5c425de4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_exam`
--

LOCK TABLES `log_exam` WRITE;
/*!40000 ALTER TABLE `log_exam` DISABLE KEYS */;
INSERT INTO `log_exam` VALUES (1,19,1,1,3),(2,20,3,1,3);
/*!40000 ALTER TABLE `log_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_filecsv`
--

DROP TABLE IF EXISTS `log_filecsv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_filecsv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(100) DEFAULT NULL,
  `date_upload` datetime(6) NOT NULL,
  `semaine_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `log_filecsv_semaine_id_fd280f96_fk_log_semaine_id` (`semaine_id`),
  KEY `log_filecsv_user_id_dfdf49fd_fk_auth_user_id` (`user_id`),
  CONSTRAINT `log_filecsv_semaine_id_fd280f96_fk_log_semaine_id` FOREIGN KEY (`semaine_id`) REFERENCES `log_semaine` (`id`),
  CONSTRAINT `log_filecsv_user_id_dfdf49fd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_filecsv`
--

LOCK TABLES `log_filecsv` WRITE;
/*!40000 ALTER TABLE `log_filecsv` DISABLE KEYS */;
INSERT INTO `log_filecsv` VALUES (110,'Semaine_0.csv','2017-05-08 22:07:53.808700',6,1),(112,'Semaine_1.csv','2017-05-10 14:11:21.206089',1,3),(115,'Semaine_15.csv','2017-06-23 01:11:31.224425',7,3),(116,'Semaine_16.csv','2017-06-28 12:05:48.656572',8,3);
/*!40000 ALTER TABLE `log_filecsv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_filiere`
--

DROP TABLE IF EXISTS `log_filiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_filiere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filiere` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_filiere`
--

LOCK TABLES `log_filiere` WRITE;
/*!40000 ALTER TABLE `log_filiere` DISABLE KEYS */;
INSERT INTO `log_filiere` VALUES (1,'GL'),(2,'IWIM'),(4,'Iel'),(5,'ISEM'),(6,'BI'),(7,'SSI'),(8,'eMBI');
/*!40000 ALTER TABLE `log_filiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_freetime`
--

DROP TABLE IF EXISTS `log_freetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_freetime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semaine_id` int(11) NOT NULL,
  `timeslote_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `log_freetime_semaine_id_7a85256a_fk_log_semaine_id` (`semaine_id`),
  KEY `log_freetime_timeslote_id_d723027d_fk_log_timeslote_id` (`timeslote_id`),
  KEY `log_freetime_user_id_9f957084_fk_auth_user_id` (`user_id`),
  CONSTRAINT `log_freetime_semaine_id_7a85256a_fk_log_semaine_id` FOREIGN KEY (`semaine_id`) REFERENCES `log_semaine` (`id`),
  CONSTRAINT `log_freetime_timeslote_id_d723027d_fk_log_timeslote_id` FOREIGN KEY (`timeslote_id`) REFERENCES `log_timeslote` (`id`),
  CONSTRAINT `log_freetime_user_id_9f957084_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_freetime`
--

LOCK TABLES `log_freetime` WRITE;
/*!40000 ALTER TABLE `log_freetime` DISABLE KEYS */;
INSERT INTO `log_freetime` VALUES (299,8,346,3),(300,8,347,3),(301,8,351,3),(308,8,346,4),(310,8,347,4),(312,8,352,4),(313,8,363,4),(314,8,364,4),(316,8,365,4),(318,8,366,4);
/*!40000 ALTER TABLE `log_freetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_group`
--

DROP TABLE IF EXISTS `log_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupe` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_group`
--

LOCK TABLES `log_group` WRITE;
/*!40000 ALTER TABLE `log_group` DISABLE KEYS */;
INSERT INTO `log_group` VALUES (1,'GL3'),(2,'GL2'),(3,'GL1'),(4,'IWIM1'),(5,'IWIM2'),(6,'ISEM'),(7,'eMBI'),(8,'SSI'),(9,'BI'),(10,'IeL'),(11,'G1'),(12,'G2'),(13,'G3'),(14,'G4'),(15,'G4'),(16,'G5'),(17,'G6'),(18,'G7'),(19,'G8');
/*!40000 ALTER TABLE `log_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_notification`
--

DROP TABLE IF EXISTS `log_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datenotif` datetime(6) NOT NULL,
  `message` longtext NOT NULL,
  `destinataire_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `log_notification_destinataire_id_7449b1c5_fk_auth_user_id` (`destinataire_id`),
  CONSTRAINT `log_notification_destinataire_id_7449b1c5_fk_auth_user_id` FOREIGN KEY (`destinataire_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_notification`
--

LOCK TABLES `log_notification` WRITE;
/*!40000 ALTER TABLE `log_notification` DISABLE KEYS */;
INSERT INTO `log_notification` VALUES (1,'2017-06-23 02:04:09.009825','Veuillez Ajouter plus de créneaux libres avant le vendredi 24/06/2017',3),(2,'2017-06-23 02:07:13.423725','L\'emploi du temps est généré . Bon journée',3),(3,'2017-06-23 02:08:05.904215','Veuillez remplir au minimum 20 heures !',3);
/*!40000 ALTER TABLE `log_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_room`
--

DROP TABLE IF EXISTS `log_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salle` varchar(20) NOT NULL,
  `capacite` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_room`
--

LOCK TABLES `log_room` WRITE;
/*!40000 ALTER TABLE `log_room` DISABLE KEYS */;
INSERT INTO `log_room` VALUES (1,'L1',30),(2,'L2',30),(3,'Amphi 1',100),(4,'Amphi 2',100),(5,'Amphi 3',100),(6,'Amphi 4',100),(7,'L27',40),(8,'L28',40),(9,'A1',100),(10,'A2',40);
/*!40000 ALTER TABLE `log_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_semaine`
--

DROP TABLE IF EXISTS `log_semaine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_semaine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semaine` varchar(5) NOT NULL,
  `date_debut` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_semaine`
--

LOCK TABLES `log_semaine` WRITE;
/*!40000 ALTER TABLE `log_semaine` DISABLE KEYS */;
INSERT INTO `log_semaine` VALUES (1,'S1','2016-09-17'),(2,'S2','2016-09-24'),(3,'S3','2016-10-01'),(4,'S4','2016-10-08'),(5,'S5','2016-10-15'),(6,'S0','2016-09-10'),(7,'S15','2017-06-24'),(8,'S16','2017-07-02');
/*!40000 ALTER TABLE `log_semaine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_subactivity`
--

DROP TABLE IF EXISTS `log_subactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_subactivity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `element_id` int(11) NOT NULL,
  `groupe_id` int(11) NOT NULL,
  `semaine_id` int(11) NOT NULL,
  `typeelement_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `log_subactivity_element_id_29ec577e_fk_log_subject_id` (`element_id`),
  KEY `log_subactivity_groupe_id_10214564_fk_log_group_id` (`groupe_id`),
  KEY `log_subactivity_semaine_id_ba39dbac_fk_log_semaine_id` (`semaine_id`),
  KEY `log_subactivity_typeelement_id_04d1930e_fk_log_typeelement_id` (`typeelement_id`),
  KEY `log_subactivity_user_id_a503a69e_fk_auth_user_id` (`user_id`),
  CONSTRAINT `log_subactivity_element_id_29ec577e_fk_log_subject_id` FOREIGN KEY (`element_id`) REFERENCES `log_subject` (`id`),
  CONSTRAINT `log_subactivity_groupe_id_10214564_fk_log_group_id` FOREIGN KEY (`groupe_id`) REFERENCES `log_group` (`id`),
  CONSTRAINT `log_subactivity_semaine_id_ba39dbac_fk_log_semaine_id` FOREIGN KEY (`semaine_id`) REFERENCES `log_semaine` (`id`),
  CONSTRAINT `log_subactivity_typeelement_id_04d1930e_fk_log_typeelement_id` FOREIGN KEY (`typeelement_id`) REFERENCES `log_typeelement` (`id`),
  CONSTRAINT `log_subactivity_user_id_a503a69e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_subactivity`
--

LOCK TABLES `log_subactivity` WRITE;
/*!40000 ALTER TABLE `log_subactivity` DISABLE KEYS */;
INSERT INTO `log_subactivity` VALUES (7,23,3,8,2,4),(8,23,2,8,2,4),(9,23,1,8,2,4),(10,23,1,8,3,4),(11,23,1,8,1,4),(12,23,2,8,1,4),(13,23,3,8,1,4),(14,19,1,8,3,3),(15,19,1,8,2,3),(17,19,2,8,2,3);
/*!40000 ALTER TABLE `log_subactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_subject`
--

DROP TABLE IF EXISTS `log_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `element` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_subject`
--

LOCK TABLES `log_subject` WRITE;
/*!40000 ALTER TABLE `log_subject` DISABLE KEYS */;
INSERT INTO `log_subject` VALUES (3,'Algorithmique'),(4,'Programmation C'),(5,'Structures de données'),(6,'Electronique numérique'),(7,'Circuits logiques'),(8,'Architecture des ordinateurs'),(9,'Eléments de Recherche opérationnelle'),(10,'Probabilité'),(11,'Simulation'),(12,'Gestion, Economie et Finance 1'),(13,'Bases de données Relationnelles'),(14,'Réseaux de communication'),(15,'Système d’exploitation'),(16,'Système d’Information'),(17,'Compilation'),(18,'Génie Logiciel Objet'),(19,'Technologie Web'),(20,'Génie logiciel objet avancé'),(21,'Bases de données avancées'),(22,'Traitement des données Multimédia'),(23,'Architectures et applications mobiles');
/*!40000 ALTER TABLE `log_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_tag`
--

DROP TABLE IF EXISTS `log_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_tag`
--

LOCK TABLES `log_tag` WRITE;
/*!40000 ALTER TABLE `log_tag` DISABLE KEYS */;
INSERT INTO `log_tag` VALUES (1,'GL_COURS'),(2,'GL_TP');
/*!40000 ALTER TABLE `log_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_timeslote`
--

DROP TABLE IF EXISTS `log_timeslote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_timeslote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jour` varchar(20) NOT NULL,
  `horaire` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_timeslote`
--

LOCK TABLES `log_timeslote` WRITE;
/*!40000 ALTER TABLE `log_timeslote` DISABLE KEYS */;
INSERT INTO `log_timeslote` VALUES (346,'Lundi','8h-10h'),(347,'Lundi','10h-12h'),(351,'Lundi','14h-16h'),(352,'Lundi','16h-18h'),(353,'Mardi','8h-10h'),(354,'Mardi','10h-12h'),(355,'Mardi','14h-16h'),(356,'Mardi','16h-18h'),(357,'Mercredi','8h-10h'),(358,'Mercredi','10h-12h'),(359,'Jeudi','8h-10h'),(360,'Jeudi','10h-12h'),(361,'Jeudi','14h-16h'),(362,'Jeudi','16h-18h'),(363,'Vendredi','8h-10h'),(364,'Vendredi','10h-12h'),(365,'Vendredi','14h-16h'),(366,'Vendredi','16h-18h');
/*!40000 ALTER TABLE `log_timeslote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_trashnotification`
--

DROP TABLE IF EXISTS `log_trashnotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_trashnotification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datenotif` datetime(6) NOT NULL,
  `message` longtext NOT NULL,
  `date_delete` datetime(6) NOT NULL,
  `destinataire_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `log_trashnotification_destinataire_id_3276b810_fk_auth_user_id` (`destinataire_id`),
  CONSTRAINT `log_trashnotification_destinataire_id_3276b810_fk_auth_user_id` FOREIGN KEY (`destinataire_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_trashnotification`
--

LOCK TABLES `log_trashnotification` WRITE;
/*!40000 ALTER TABLE `log_trashnotification` DISABLE KEYS */;
INSERT INTO `log_trashnotification` VALUES (1,'2017-06-23 02:08:38.166899','Notif notif notif','2017-06-23 04:05:26.988607',3),(2,'2017-06-23 02:08:19.659940','Test test test','2017-06-23 16:28:06.989531',3);
/*!40000 ALTER TABLE `log_trashnotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_typeelement`
--

DROP TABLE IF EXISTS `log_typeelement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_typeelement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeElement` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_typeelement`
--

LOCK TABLES `log_typeelement` WRITE;
/*!40000 ALTER TABLE `log_typeelement` DISABLE KEYS */;
INSERT INTO `log_typeelement` VALUES (1,'TD'),(2,'TP'),(3,'Cours');
/*!40000 ALTER TABLE `log_typeelement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_typeexam`
--

DROP TABLE IF EXISTS `log_typeexam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_typeexam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeExam` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_typeexam`
--

LOCK TABLES `log_typeexam` WRITE;
/*!40000 ALTER TABLE `log_typeexam` DISABLE KEYS */;
INSERT INTO `log_typeexam` VALUES (1,'TP'),(2,'Ecrit');
/*!40000 ALTER TABLE `log_typeexam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_year`
--

DROP TABLE IF EXISTS `log_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annee` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_year`
--

LOCK TABLES `log_year` WRITE;
/*!40000 ALTER TABLE `log_year` DISABLE KEYS */;
INSERT INTO `log_year` VALUES (1,'1A'),(2,'2A'),(3,'3A');
/*!40000 ALTER TABLE `log_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_calendar`
--

DROP TABLE IF EXISTS `schedule_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_calendar_2dbcba41` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_calendar`
--

LOCK TABLES `schedule_calendar` WRITE;
/*!40000 ALTER TABLE `schedule_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_calendarrelation`
--

DROP TABLE IF EXISTS `schedule_calendarrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_calendarrelation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `distinction` varchar(20) DEFAULT NULL,
  `inheritable` tinyint(1) NOT NULL,
  `calendar_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_calendarre_calendar_id_0a50be2e_fk_schedule_calendar_id` (`calendar_id`),
  KEY `schedule_cale_content_type_id_f2a42f5b_fk_django_content_type_id` (`content_type_id`),
  CONSTRAINT `schedule_cale_content_type_id_f2a42f5b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `schedule_calendarre_calendar_id_0a50be2e_fk_schedule_calendar_id` FOREIGN KEY (`calendar_id`) REFERENCES `schedule_calendar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_calendarrelation`
--

LOCK TABLES `schedule_calendarrelation` WRITE;
/*!40000 ALTER TABLE `schedule_calendarrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_calendarrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_event`
--

DROP TABLE IF EXISTS `schedule_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` datetime(6) NOT NULL,
  `end` datetime(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `end_recurring_period` datetime(6) DEFAULT NULL,
  `calendar_id` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `rule_id` int(11),
  `color_event` varchar(10),
  PRIMARY KEY (`id`),
  KEY `schedule_event_calendar_id_eb1c700f_fk_schedule_calendar_id` (`calendar_id`),
  KEY `schedule_event_creator_id_d2ffab6e_fk_auth_user_id` (`creator_id`),
  KEY `schedule_event_e1150e65` (`rule_id`),
  CONSTRAINT `schedule_event_calendar_id_eb1c700f_fk_schedule_calendar_id` FOREIGN KEY (`calendar_id`) REFERENCES `schedule_calendar` (`id`),
  CONSTRAINT `schedule_event_creator_id_d2ffab6e_fk_auth_user_id` FOREIGN KEY (`creator_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `schedule_event_rule_id_90b83d31_fk_schedule_rule_id` FOREIGN KEY (`rule_id`) REFERENCES `schedule_rule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_event`
--

LOCK TABLES `schedule_event` WRITE;
/*!40000 ALTER TABLE `schedule_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_eventrelation`
--

DROP TABLE IF EXISTS `schedule_eventrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_eventrelation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `distinction` varchar(20) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_even_content_type_id_d4187723_fk_django_content_type_id` (`content_type_id`),
  KEY `schedule_eventrelation_event_id_8c57a7b4_fk_schedule_event_id` (`event_id`),
  CONSTRAINT `schedule_even_content_type_id_d4187723_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `schedule_eventrelation_event_id_8c57a7b4_fk_schedule_event_id` FOREIGN KEY (`event_id`) REFERENCES `schedule_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_eventrelation`
--

LOCK TABLES `schedule_eventrelation` WRITE;
/*!40000 ALTER TABLE `schedule_eventrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_eventrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_occurrence`
--

DROP TABLE IF EXISTS `schedule_occurrence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_occurrence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `start` datetime(6) NOT NULL,
  `end` datetime(6) NOT NULL,
  `cancelled` tinyint(1) NOT NULL,
  `original_start` datetime(6) NOT NULL,
  `original_end` datetime(6) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_occurrence_event_id_ade47cd8_fk_schedule_event_id` (`event_id`),
  CONSTRAINT `schedule_occurrence_event_id_ade47cd8_fk_schedule_event_id` FOREIGN KEY (`event_id`) REFERENCES `schedule_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_occurrence`
--

LOCK TABLES `schedule_occurrence` WRITE;
/*!40000 ALTER TABLE `schedule_occurrence` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_occurrence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_rule`
--

DROP TABLE IF EXISTS `schedule_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` longtext NOT NULL,
  `frequency` varchar(10) NOT NULL,
  `params` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_rule`
--

LOCK TABLES `schedule_rule` WRITE;
/*!40000 ALTER TABLE `schedule_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_rule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-06  1:45:12
