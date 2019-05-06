CREATE DATABASE  IF NOT EXISTS `master_proje` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `master_proje`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: master_proje
-- ------------------------------------------------------
-- Server version	5.5.58

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
-- Table structure for table `bluetooth`
--

DROP TABLE IF EXISTS `bluetooth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bluetooth` (
  `BluetoothId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Type` int(11) NOT NULL,
  `Address` varchar(50) NOT NULL,
  PRIMARY KEY (`BluetoothId`),
  KEY `FK_BluetoothUser` (`UserId`),
  CONSTRAINT `FK_BluetoothUser` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bluetooth`
--

LOCK TABLES `bluetooth` WRITE;
/*!40000 ALTER TABLE `bluetooth` DISABLE KEYS */;
INSERT INTO `bluetooth` VALUES (1,3,'MyBlyetooth',1,'00:11:22:33:FF:EE'),(2,3,'Beats',2,'00:11:22:33:FF:EE'),(3,2,'Chevy_Imapal',3,'00:11:22:33:FF:EE');
/*!40000 ALTER TABLE `bluetooth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incident`
--

DROP TABLE IF EXISTS `incident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident` (
  `TimeOfEvent` datetime NOT NULL,
  `IncidentId` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(1000) NOT NULL,
  `IncidentType` varchar(50) NOT NULL,
  `Source` varchar(50) DEFAULT NULL,
  `User` varchar(24) DEFAULT NULL,
  `Url` varchar(200) DEFAULT NULL,
  `SourceId` varchar(50) DEFAULT NULL,
  `IncidentSize` double NOT NULL,
  PRIMARY KEY (`IncidentId`),
  UNIQUE KEY `Incident` (`SourceId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incident`
--

LOCK TABLES `incident` WRITE;
/*!40000 ALTER TABLE `incident` DISABLE KEYS */;
INSERT INTO `incident` VALUES ('2019-01-01 08:00:00',1,'Missing Kid','Amber Alert','Police Dept','user','www.example1.com','UPD',50),('2019-03-25 09:00:00',2,'Blizzard Warning','Weather Forecast','National Weather Service','user','www.example2.com','NWS',100),('2019-04-01 12:30:00',3,'Flu shot','Health','Health service Department','user','www.example3.com','HSW',200),('2019-05-05 14:00:00',4,'Road block','Traffic Safety','Traffic Department','user','www.example4.com','TSD',350),('2019-05-06 09:00:00',6,'Swine Flu','Health','Health Service Department','user','www.example5.com','HSD',250);
/*!40000 ALTER TABLE `incident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidentexchange`
--

DROP TABLE IF EXISTS `incidentexchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incidentexchange` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IncidentId` int(11) NOT NULL,
  `From` int(11) DEFAULT NULL,
  `To` int(11) NOT NULL,
  `TimeStamp` datetime NOT NULL,
  `Via` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_IncidentId_idx` (`IncidentId`),
  KEY `FK_User_From_idx` (`From`),
  KEY `FK_User_To_idx` (`To`),
  CONSTRAINT `FK_IncidentId` FOREIGN KEY (`IncidentId`) REFERENCES `incident` (`IncidentId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_User_From` FOREIGN KEY (`From`) REFERENCES `user` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_User_To` FOREIGN KEY (`To`) REFERENCES `user` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidentexchange`
--

LOCK TABLES `incidentexchange` WRITE;
/*!40000 ALTER TABLE `incidentexchange` DISABLE KEYS */;
INSERT INTO `incidentexchange` VALUES (4,1,4,4,'2019-01-02 08:00:00','Wifi'),(5,2,6,3,'2019-03-26 09:00:00','P2P'),(6,3,3,3,'2018-09-09 08:08:00','Celluar'),(7,2,3,5,'2019-08-08 07:07:00','P2P'),(8,2,3,2,'2019-08-08 07:10:00','P2P'),(9,1,4,1,'2018-08-08 05:00:00','P2P'),(10,1,4,2,'2018-08-08 05:00:00','P2P'),(11,1,4,2,'2018-08-08 05:00:00','P2P'),(12,1,1,3,'2018-08-08 05:00:00','P2P'),(13,1,1,5,'2018-08-08 05:00:00','P2P'),(14,1,5,6,'2018-08-08 05:00:00','P2P'),(15,1,5,11,'2018-08-08 05:00:00','P2P'),(16,1,8,8,'2018-08-08 05:00:00','wifi'),(17,1,9,9,'2018-08-08 05:00:00','wifi'),(18,1,11,7,'2018-08-08 05:00:00','P2P'),(19,1,7,10,'2018-08-08 05:00:00','P2P'),(20,2,3,1,'2018-08-08 05:00:00','P2P'),(21,2,5,4,'2018-08-08 05:00:00','P2P'),(22,2,2,6,'2018-08-08 05:00:00','P2P'),(23,2,2,7,'2018-08-08 05:00:00','P2P'),(24,2,6,8,'2018-08-08 05:00:00','P2P'),(25,2,6,9,'2018-08-08 05:00:00','P2P'),(26,2,3,10,'2018-08-08 05:00:00','P2P'),(27,2,3,11,'2018-08-08 05:00:00','P2P'),(28,3,3,1,'2018-08-08 05:00:00','P2P'),(29,3,3,10,'2018-08-08 05:00:00','P2P'),(30,3,10,2,'2018-08-08 05:00:00','P2P'),(31,3,10,11,'2018-08-08 05:00:00','P2P'),(32,3,2,4,'2018-08-08 05:00:00','P2P'),(33,3,2,5,'2018-08-08 05:00:00','P2P'),(34,3,6,6,'2018-08-08 05:00:00','P2P'),(35,3,4,7,'2018-08-08 05:00:00','P2P'),(36,3,4,8,'2018-08-08 05:00:00','P2P'),(37,3,4,9,'2018-08-08 05:00:00','P2P'),(38,4,3,3,'2018-08-08 05:00:00','P2P'),(39,4,1,1,'2018-08-08 05:00:00','P2P'),(40,4,1,10,'2018-08-08 05:00:00','P2P'),(41,4,10,2,'2018-08-08 05:00:00','P2P'),(42,4,10,11,'2018-08-08 05:00:00','P2P'),(43,4,2,4,'2018-08-08 05:00:00','P2P'),(44,4,2,5,'2018-08-08 05:00:00','P2P'),(45,4,6,6,'2018-08-08 05:00:00','P2P'),(46,4,5,7,'2018-08-08 05:00:00','P2P'),(47,4,5,8,'2018-08-08 05:00:00','P2P'),(48,4,9,9,'2018-08-08 05:00:00','P2P'),(50,6,1,1,'2018-08-08 05:00:00','P2P'),(51,6,1,10,'2018-08-08 05:00:00','P2P'),(52,6,10,2,'2018-08-08 05:00:00','P2P'),(53,6,10,11,'2018-08-08 05:00:00','P2P'),(54,6,2,4,'2018-08-08 05:00:00','P2P'),(55,6,2,5,'2018-08-08 05:00:00','P2P'),(56,6,6,6,'2018-08-08 05:00:00','P2P'),(57,6,5,7,'2018-08-08 05:00:00','P2P'),(58,6,5,8,'2018-08-08 05:00:00','P2P'),(59,6,9,9,'2018-08-08 05:00:00','P2P'),(60,6,3,3,'2018-08-08 05:00:00','P2P'),(121,3,128,69,'2019-10-01 12:22:05','P2P'),(122,1,79,129,'2019-09-15 02:58:38','P2P'),(123,2,148,68,'2018-09-08 03:57:24','P2P'),(124,3,107,157,'2018-06-20 11:12:05','P2P'),(125,3,123,158,'2019-09-04 06:15:12','P2P'),(126,2,114,131,'2019-07-18 19:42:26','P2P'),(127,2,90,129,'2018-06-22 00:57:46','P2P'),(128,1,105,121,'2020-01-08 04:21:44','P2P'),(129,1,111,97,'2019-06-03 20:41:31','P2P'),(130,4,79,155,'2019-08-03 11:11:11','P2P'),(131,1,130,114,'2019-10-05 12:34:57','WiFi'),(132,2,159,65,'2020-04-26 20:10:13','WiFi'),(133,3,90,79,'2020-01-30 14:20:00','WiFi'),(134,2,86,121,'2019-02-22 15:14:44','WiFi'),(135,3,107,71,'2019-01-06 21:07:58','WiFi'),(136,4,115,89,'2019-02-20 08:30:56','WiFi'),(137,2,123,108,'2019-09-07 05:20:10','WiFi'),(138,3,96,118,'2020-04-15 15:18:30','WiFi'),(139,3,74,121,'2019-09-28 09:01:40','WiFi'),(140,1,78,151,'2018-06-23 13:47:59','WiFi'),(141,2,117,108,'2018-10-08 16:49:56','P2P'),(142,1,138,73,'2018-12-24 22:39:34','P2P'),(143,1,127,115,'2019-03-31 00:24:30','P2P'),(144,1,64,97,'2019-09-04 13:38:23','P2P'),(145,2,89,82,'2018-12-13 12:18:52','P2P'),(146,4,145,95,'2018-05-14 08:47:18','P2P'),(147,4,122,114,'2019-06-07 20:18:03','P2P'),(148,4,75,106,'2019-07-16 03:22:00','P2P'),(149,1,73,73,'2019-11-26 12:41:07','P2P'),(150,1,136,67,'2020-01-27 07:19:37','P2P'),(151,1,94,86,'2019-08-06 04:11:41','WiFi'),(152,4,69,146,'2018-09-23 10:33:11','WiFi'),(153,1,107,139,'2018-08-21 12:26:45','WiFi'),(154,1,135,159,'2018-10-28 15:16:24','WiFi'),(155,3,161,87,'2019-12-20 13:15:08','WiFi'),(156,2,91,69,'2019-02-06 18:55:12','WiFi'),(157,1,113,139,'2019-01-22 08:34:51','WiFi'),(158,2,159,70,'2019-07-11 13:14:40','WiFi'),(159,2,96,95,'2018-09-17 16:16:09','WiFi'),(160,2,94,84,'2019-08-08 00:28:19','WiFi'),(161,3,83,161,'2020-04-16 03:28:35','P2P'),(162,3,114,138,'2020-01-16 03:18:54','P2P'),(163,1,95,84,'2019-11-15 04:21:55','P2P'),(164,2,105,158,'2018-12-04 22:22:53','P2P'),(165,1,123,110,'2018-07-12 22:28:45','P2P'),(166,2,148,158,'2018-12-24 15:14:02','P2P'),(167,4,115,144,'2018-11-23 07:34:18','P2P'),(168,2,67,72,'2019-12-22 12:09:16','P2P'),(169,1,143,126,'2020-02-01 15:44:01','P2P'),(170,4,138,99,'2019-01-09 01:50:52','P2P'),(171,4,137,107,'2018-08-10 08:25:23','WiFi'),(172,1,63,161,'2018-10-05 01:42:33','WiFi'),(173,1,113,81,'2019-09-18 22:39:09','WiFi'),(174,3,114,119,'2018-11-12 04:33:22','WiFi'),(175,2,73,91,'2019-04-11 17:32:16','WiFi'),(176,4,156,73,'2018-12-23 17:46:14','WiFi'),(177,1,89,151,'2019-10-26 02:51:19','WiFi'),(178,1,129,78,'2018-10-26 10:40:30','WiFi'),(179,3,161,80,'2019-01-26 04:26:33','WiFi'),(180,1,112,75,'2018-06-04 14:03:02','WiFi'),(181,1,71,68,'2020-03-05 05:56:05','P2P'),(182,4,122,139,'2019-09-01 23:51:14','P2P'),(183,3,66,153,'2019-11-19 16:30:36','P2P'),(184,2,118,150,'2018-07-14 19:44:17','P2P'),(185,2,160,133,'2019-12-04 05:55:11','P2P'),(186,3,147,125,'2018-07-28 06:41:35','P2P'),(187,1,129,114,'2018-09-01 18:56:12','P2P'),(188,3,159,154,'2019-09-27 19:43:52','P2P'),(189,4,152,157,'2020-04-29 00:00:44','P2P'),(190,3,79,122,'2020-02-09 13:04:00','P2P'),(191,4,65,96,'2018-11-19 06:26:17','WiFi'),(192,1,117,103,'2019-05-23 19:07:52','WiFi'),(193,3,139,81,'2019-10-09 05:14:20','WiFi'),(194,2,113,108,'2020-02-23 12:18:56','WiFi'),(195,2,123,105,'2019-01-23 04:28:03','WiFi'),(196,4,64,101,'2019-10-30 05:11:24','WiFi'),(197,3,80,115,'2018-09-09 02:08:19','WiFi'),(198,2,141,159,'2019-05-15 15:40:33','WiFi'),(199,1,160,158,'2019-02-12 14:48:43','WiFi'),(200,1,111,107,'2020-02-29 06:48:06','WiFi'),(201,2,143,143,'2020-04-27 12:28:49','P2P'),(202,3,89,118,'2018-09-23 11:13:17','P2P'),(203,1,117,107,'2020-04-29 06:41:51','P2P'),(204,3,79,73,'2018-11-07 05:54:20','P2P'),(205,4,122,96,'2019-03-29 16:13:15','P2P'),(206,2,155,82,'2020-04-15 04:53:46','P2P'),(207,1,155,125,'2020-04-15 00:51:50','P2P'),(208,1,71,106,'2018-10-26 16:31:49','P2P'),(209,2,105,89,'2019-08-19 20:51:53','P2P'),(210,1,91,128,'2019-05-04 13:40:59','P2P'),(211,4,108,155,'2019-01-26 20:32:38','WiFi'),(212,2,143,104,'2019-06-29 03:18:50','WiFi'),(213,2,129,121,'2019-01-29 02:37:06','WiFi'),(214,3,112,139,'2020-01-31 05:38:40','WiFi'),(215,4,88,149,'2019-08-15 12:13:14','WiFi'),(216,4,70,79,'2020-02-26 00:06:18','WiFi'),(217,1,144,107,'2019-08-08 04:36:44','WiFi'),(218,2,112,152,'2020-03-15 19:41:57','WiFi'),(219,4,68,101,'2019-06-12 20:42:51','WiFi'),(220,1,121,83,'2018-06-26 22:19:45','WiFi');
/*!40000 ALTER TABLE `incidentexchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidenttype`
--

DROP TABLE IF EXISTS `incidenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incidenttype` (
  `IncidentTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `IncidentType` varchar(50) NOT NULL,
  PRIMARY KEY (`IncidentTypeId`),
  UNIQUE KEY `IncidentType` (`IncidentType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidenttype`
--

LOCK TABLES `incidenttype` WRITE;
/*!40000 ALTER TABLE `incidenttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `incidenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `LocationId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `Longtitude` double NOT NULL,
  `Altitude` double NOT NULL,
  `Latitude` double NOT NULL,
  `Bearing` double DEFAULT NULL,
  `BearingAccuracy` double DEFAULT NULL,
  `VerticalAccuracy` double DEFAULT NULL,
  `SpeedAccuracy` double DEFAULT NULL,
  `Provider` varchar(50) DEFAULT NULL,
  `Speed` double DEFAULT NULL,
  `SpeedAccuracyMetersPerSecond` double DEFAULT NULL,
  `VerticalAccuracyMeters` double DEFAULT NULL,
  `Time` bigint(20) NOT NULL,
  PRIMARY KEY (`LocationId`),
  KEY `FK_LocationUser` (`UserId`),
  CONSTRAINT `FK_LocationUser` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,3,116.318417,12.2,39.984702,5.5,4.4,8.8,8.8,'google',1.1,2.2,3.3,123456),(2,3,116.31845,12.2,39.984683,5.5,4.4,8.8,8.8,'google',1.1,2.2,3.3,123456),(3,3,116.318417,12.2,39.984686,5.5,4.4,8.8,8.8,'google',1.1,2.2,3.3,123456),(4,3,116.318385,12.2,39.984688,5.5,4.4,8.8,8.8,'google',1.1,2.2,3.3,123456),(5,3,116.318263,12.2,39.984655,5.5,4.4,8.8,8.8,'google',1.1,2.2,3.3,123456),(6,3,116.318026,12.2,39.984611,5.5,4.4,8.8,8.8,'google',1.1,2.2,3.3,123456),(7,3,116.317761,12.2,39.984608,5.5,4.4,8.8,8.8,'google',1.1,2.2,3.3,123456),(8,3,116.317517,12.2,39.984563,5.5,4.4,8.8,8.8,'google',1.1,2.2,3.3,123456),(9,3,116.317294,12.2,39.984539,5.5,4.4,8.8,8.8,'google',1.1,2.2,3.3,123456),(10,3,116.317065,12.2,39.984606,5.5,4.4,8.8,8.8,'google',1.1,2.2,3.3,123456),(11,3,116.316911,12.2,39.984568,5.5,4.4,8.8,8.8,'google',1.1,2.2,3.3,123456),(12,3,116.316716,12.2,39.984586,5.5,4.4,8.8,8.8,'google',1.1,2.2,3.3,123456);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('Harnish','Shah','admin','21232f297a57a5a743894a0e4a801fc3',1);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peertopeer`
--

DROP TABLE IF EXISTS `peertopeer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peertopeer` (
  `TransactionId` int(11) NOT NULL AUTO_INCREMENT,
  `SenderId` int(11) NOT NULL,
  `ReceiverId` int(11) NOT NULL,
  `IncidentId` int(11) NOT NULL,
  PRIMARY KEY (`TransactionId`),
  UNIQUE KEY `PeerToPeer` (`SenderId`,`ReceiverId`,`IncidentId`),
  KEY `FK_ReceiverUser` (`ReceiverId`),
  KEY `FK_IncidentTransferred` (`IncidentId`),
  CONSTRAINT `FK_IncidentTransferred` FOREIGN KEY (`IncidentId`) REFERENCES `incident` (`IncidentId`),
  CONSTRAINT `FK_ReceiverUser` FOREIGN KEY (`ReceiverId`) REFERENCES `user` (`UserId`),
  CONSTRAINT `FK_SenderUser` FOREIGN KEY (`SenderId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peertopeer`
--

LOCK TABLES `peertopeer` WRITE;
/*!40000 ALTER TABLE `peertopeer` DISABLE KEYS */;
/*!40000 ALTER TABLE `peertopeer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(30) NOT NULL,
  `UserPassword` varchar(30) NOT NULL,
  `UserEmail` varchar(45) NOT NULL,
  `UserTypeId` int(11) NOT NULL,
  `LastUpdated` datetime NOT NULL,
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `User` (`UserEmail`),
  KEY `FK_UserUserType_idx` (`UserTypeId`),
  CONSTRAINT `FK_UserUserType` FOREIGN KEY (`UserTypeId`) REFERENCES `usertype` (`UserTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'John','password','john@albany.edu',1,'2019-02-02 02:02:02'),(2,'Jane','password','jane@albany.edu',1,'2018-05-05 05:05:05'),(3,'Mark','password','mark@albany.edu',1,'2021-05-06 01:01:00'),(4,'Cardi','password','cardi@albany.edu',1,'2017-05-05 07:08:09'),(5,'Ross','password','ross@albany.edu',1,'2018-12-12 12:12:22'),(6,'Monica','password','monica@geller.edu',1,'2019-01-01 05:00:22'),(7,'Rachel','password','rachel@albany.edu',1,'2019-08-08 18:55:15'),(8,'Joey','password','joey@albany.edu',1,'2018-05-09 17:15:16'),(9,'Chandler','password','chandler@albany.edu',1,'2019-07-09 07:39:59'),(10,'Phoebe','password','phoebe@albany.edu',1,'2017-12-12 23:59:59'),(11,'Harnish','password','user1@albany.edu',2,'2019-05-05 09:00:00'),(62,'Linus','password','blandit@tempus.org',1,'2019-03-05 19:38:12'),(63,'Orla','password','Cras.vulputate@Donecfelis.com',1,'2018-06-23 23:27:18'),(64,'Claudia','password','eu@Aliquam.net',1,'2019-12-04 19:43:04'),(65,'Evan','password','scelerisque@loremegetmollis.com',1,'2020-02-04 19:57:43'),(66,'Rhea','password','massa.rutrum@accumsanlaoreetipsum.edu',1,'2019-02-01 13:57:51'),(67,'Ignatius','password','tellus@vulputatevelit.net',1,'2019-11-28 14:14:27'),(68,'Tanek','password','natoque@hendrerit.ca',1,'2019-04-13 05:17:02'),(69,'Stacey','password','lectus@quamelementum.org',1,'2020-04-22 10:51:13'),(70,'Isabella','password','Suspendisse.sed.dolor@Duisac.net',1,'2020-02-10 14:21:01'),(71,'Kevin','password','Aliquam.vulputate@in.edu',1,'2018-12-30 15:25:05'),(72,'Halee','password','pretium@Nullaegetmetus.ca',1,'2019-09-18 00:58:05'),(73,'Stephanie','password','quis.pede@etipsumcursus.com',1,'2020-02-22 00:42:50'),(74,'Irma','password','turpis@sapien.org',1,'2018-10-21 21:56:15'),(75,'Germane','password','tempus@luctusaliquetodio.edu',1,'2020-03-21 05:19:44'),(76,'Flavia','password','amet.diam@idblandit.co.uk',1,'2018-10-13 16:02:47'),(77,'Lilah','password','eu.dolor.egestas@Integer.com',1,'2019-02-01 02:17:01'),(78,'Teegan','password','risus.a.ultricies@nisi.net',1,'2019-11-13 07:07:40'),(79,'Audrey','password','metus.In@idmagnaet.org',1,'2019-05-12 19:57:55'),(80,'Pamela','password','Aliquam.rutrum.lorem@tellus.co.uk',1,'2019-08-22 16:08:54'),(81,'Kiara','password','sed.sem@purus.co.uk',1,'2019-03-23 19:33:56'),(82,'Briar','password','primis.in.faucibus@vestibulummassarutrum.net',1,'2018-07-23 09:54:53'),(83,'Nasim','password','Quisque.nonummy.ipsum@nequesedsem.net',1,'2019-08-14 03:24:22'),(84,'Leilani','password','a@etultrices.ca',1,'2019-05-17 01:21:52'),(85,'Cain','password','velit.Quisque@aptenttaciti.org',1,'2019-03-15 20:21:50'),(86,'Lynn','password','Aenean.eget@mollisInteger.org',1,'2018-07-29 02:45:48'),(87,'Chelsea','password','ante.Vivamus@semegestasblandit.ca',1,'2019-09-04 11:05:55'),(88,'Savannah','password','metus@in.com',1,'2019-01-22 03:18:02'),(89,'Mark','password','mus.Donec.dignissim@pharetrasedhendrerit.com',1,'2018-05-20 04:02:50'),(90,'Lane','password','luctus@dapibusrutrum.com',1,'2018-10-10 04:02:58'),(91,'Cade','password','aliquet.magna@metus.net',1,'2020-01-30 03:22:34'),(92,'Hyatt','password','ut.nisi@fringillapurusmauris.edu',1,'2020-03-24 15:10:32'),(93,'Fay','password','Aliquam.adipiscing@quis.net',1,'2018-12-29 08:43:33'),(94,'Alan','password','dolor.elit.pellentesque@cubiliaCurae.edu',1,'2019-04-16 01:14:41'),(95,'Burton','password','et.rutrum.eu@habitantmorbi.edu',1,'2018-05-12 22:04:05'),(96,'Megan','password','leo@Donecporttitor.com',1,'2018-08-05 09:19:46'),(97,'Vanna','password','Nunc.mauris@mollisvitaeposuere.ca',1,'2019-07-03 20:03:42'),(98,'John','password','non@convallisincursus.ca',1,'2020-04-22 17:53:13'),(99,'Martin','password','ac.mi.eleifend@id.net',1,'2019-05-23 14:23:21'),(100,'Joel','password','parturient@diam.com',1,'2018-10-19 06:09:44'),(101,'Aretha','password','vitae@eget.edu',1,'2019-09-18 10:34:27'),(102,'Randall','password','senectus.et.netus@urnaUt.org',1,'2019-12-06 04:25:39'),(103,'Yvonne','password','mollis.non.cursus@dis.edu',1,'2019-06-05 04:35:32'),(104,'Sharon','password','netus@velitegestaslacinia.ca',1,'2019-06-25 18:31:10'),(105,'Cora','password','libero@sempererat.edu',1,'2019-10-24 03:48:43'),(106,'Scott','password','Suspendisse@penatibusetmagnis.net',1,'2018-06-21 05:02:42'),(107,'Sandra','password','luctus.aliquet.odio@nuncid.org',1,'2020-04-27 22:09:58'),(108,'Vance','password','amet.nulla@lobortismaurisSuspendisse.net',1,'2019-08-25 21:50:31'),(109,'Micah','password','ipsum.nunc.id@porttitortellus.com',1,'2020-04-06 13:59:39'),(110,'Mara','password','sem.vitae.aliquam@aliquetodioEtiam.edu',1,'2019-09-17 14:55:01'),(111,'Kirestin','password','nibh.enim.gravida@dolorvitaedolor.org',1,'2019-07-10 20:25:20'),(112,'Linus','password','lacinia@nectellus.org',1,'2019-11-17 17:24:05'),(113,'Keith','password','sit.amet.nulla@tristiquealiquetPhasellus.edu',1,'2019-04-15 00:52:15'),(114,'Sonya','password','nec@nibh.com',1,'2019-01-26 05:53:05'),(115,'Shelly','password','quam.a@risusMorbimetus.co.uk',1,'2018-10-14 19:09:34'),(116,'Brenda','password','ullamcorper@malesuadaaugueut.ca',1,'2019-03-04 06:16:46'),(117,'Rahim','password','mauris.sit@convallisligulaDonec.com',1,'2018-10-09 05:51:52'),(118,'Carol','password','nulla.Donec.non@Cras.co.uk',1,'2019-04-10 11:32:47'),(119,'Darrel','password','dignissim@semvitaealiquam.org',1,'2019-12-13 01:07:29'),(120,'Geraldine','password','magna@In.co.uk',1,'2019-04-17 10:26:43'),(121,'Caldwell','password','mattis.Cras.eget@diam.com',1,'2019-12-06 06:41:56'),(122,'Nolan','password','mi.felis@dolordolor.org',1,'2019-02-01 05:30:49'),(123,'Erin','password','sed@lobortismaurisSuspendisse.co.uk',1,'2018-12-12 09:01:36'),(124,'Francis','password','molestie.pharetra.nibh@semutcursus.com',1,'2018-09-08 10:38:15'),(125,'Kristen','password','sed.dolor@Praesentluctus.net',1,'2019-01-11 18:31:34'),(126,'Baxter','password','Phasellus@orciluctuset.com',1,'2018-10-28 00:45:07'),(127,'Cooper','password','enim.nec.tempus@sollicitudin.com',1,'2018-09-11 13:58:15'),(128,'Zane','password','massa@Praesent.com',1,'2019-03-10 23:41:28'),(129,'Haviva','password','iaculis.lacus.pede@turpisAliquam.co.uk',1,'2018-06-08 15:18:11'),(130,'Daphne','password','interdum.enim@erat.edu',1,'2020-03-25 05:59:41'),(131,'Callie','password','et.magnis.dis@laoreetposuereenim.org',1,'2019-06-08 16:17:35'),(132,'Reagan','password','mi.Duis.risus@variusNam.org',1,'2018-05-06 16:58:57'),(133,'Xerxes','password','sapien.imperdiet@Maecenasmi.edu',1,'2019-12-14 06:12:59'),(134,'Patrick','password','nibh@euismod.com',1,'2019-09-13 06:29:10'),(135,'Cedric','password','ultricies.ornare@orci.net',1,'2018-05-24 19:35:28'),(136,'Jescie','password','vitae.semper.egestas@fames.com',1,'2018-10-06 11:18:20'),(137,'Cairo','password','ac.eleifend.vitae@nonfeugiat.co.uk',1,'2020-03-06 22:00:45'),(138,'Driscoll','password','posuere@Phasellus.org',1,'2020-02-26 21:26:12'),(139,'Tatum','password','pharetra@Vestibulumante.co.uk',1,'2020-04-28 01:28:49'),(140,'Kermit','password','mus.Donec@facilisis.ca',1,'2018-09-21 03:31:17'),(141,'Luke','password','adipiscing.ligula.Aenean@maurisidsapien.ca',1,'2019-05-26 22:34:24'),(142,'Kessie','password','nulla@Quisqueliberolacus.com',1,'2020-03-12 02:48:30'),(143,'Vance','password','ac.risus@penatibusetmagnis.ca',1,'2018-08-26 08:09:32'),(144,'Trevor','password','mauris@Utsemperpretium.edu',1,'2018-08-17 18:16:20'),(145,'Ignacia','password','Sed@tincidunt.com',1,'2020-04-14 00:05:19'),(146,'Haviva','password','iaculis.odio@orcilacus.ca',1,'2020-01-14 04:26:10'),(147,'Ruth','password','torquent.per@CurabiturdictumPhasellus.co.uk',1,'2019-01-11 03:19:42'),(148,'Morgan','password','natoque.penatibus.et@atvelit.edu',1,'2019-03-06 06:36:26'),(149,'Lacota','password','erat.volutpat.Nulla@nisi.org',1,'2019-09-13 05:23:42'),(150,'Kaseem','password','neque.Nullam@ultricies.ca',1,'2019-09-14 07:30:30'),(151,'Phoebe','password','ac@sem.net',1,'2018-06-02 11:26:27'),(152,'Scarlett','password','nascetur.ridiculus@pedeSuspendisse.edu',1,'2018-07-13 17:51:39'),(153,'Kristen','password','fermentum.metus.Aenean@sitamet.edu',1,'2018-08-23 20:39:21'),(154,'Erica','password','Pellentesque.ultricies@Duis.net',1,'2019-12-28 18:45:36'),(155,'Reuben','password','consectetuer@tinciduntDonecvitae.net',1,'2018-10-31 07:16:02'),(156,'Ivana','password','quam.quis@Nullaaliquet.edu',1,'2019-12-04 15:31:24'),(157,'Hedwig','password','egestas@congueturpis.edu',1,'2020-04-03 13:47:21'),(158,'Veda','password','ipsum.Curabitur.consequat@Proinnonmassa.ca',1,'2019-08-18 07:04:35'),(159,'Macey','password','vitae.orci.Phasellus@sagittislobortis.com',1,'2020-01-04 06:39:02'),(160,'Barrett','password','sit.amet.ornare@sociis.net',1,'2018-11-30 19:46:55'),(161,'Ariel','password','dolor.sit.amet@eu.org',1,'2018-11-25 00:02:52');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertype` (
  `UserTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `UserType` varchar(20) NOT NULL,
  PRIMARY KEY (`UserTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertype`
--

LOCK TABLES `usertype` WRITE;
/*!40000 ALTER TABLE `usertype` DISABLE KEYS */;
INSERT INTO `usertype` VALUES (1,'Type 1'),(2,'Type 2');
/*!40000 ALTER TABLE `usertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wifi`
--

DROP TABLE IF EXISTS `wifi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wifi` (
  `WifiId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `ChannelWidth` int(11) NOT NULL,
  `SSID` varchar(50) NOT NULL,
  `BSSID` varchar(50) NOT NULL,
  `Level` int(11) NOT NULL,
  `Frequency` int(11) NOT NULL,
  `CenterFreq0` int(11) NOT NULL,
  `CenterFreq1` int(11) NOT NULL,
  `Capabilities` varchar(50) NOT NULL,
  `ChannelWidth20` int(11) NOT NULL,
  `ChannelWidth40` int(11) NOT NULL,
  `ChannelWidth80` int(11) NOT NULL,
  `ChannelWidth160` int(11) NOT NULL,
  `ChannelWidth80Plus` int(11) NOT NULL,
  PRIMARY KEY (`WifiId`),
  KEY `FK_WifiUser` (`UserId`),
  CONSTRAINT `FK_WifiUser` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wifi`
--

LOCK TABLES `wifi` WRITE;
/*!40000 ALTER TABLE `wifi` DISABLE KEYS */;
INSERT INTO `wifi` VALUES (1,3,20,'UAlbany','Albany',2,200,200,200,'FIle Sharing',20,40,80,160,200);
/*!40000 ALTER TABLE `wifi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-06 16:00:10
