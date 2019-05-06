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

-- Dump completed on 2019-05-06 14:01:35
