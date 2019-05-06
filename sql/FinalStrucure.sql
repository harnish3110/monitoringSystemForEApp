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
  PRIMARY KEY (`IncidentId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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

INSERT INTO `login` VALUES ('Harnish','Shah','admin','21232f297a57a5a743894a0e4a801fc3',1);

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(30) NOT NULL,
  `UserPassword` varchar(30) NOT NULL,
  `UserEmail` varchar(100) NOT NULL,
  `UserTypeId` int(11) NOT NULL,
  `LastUpdated` datetime NOT NULL,
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `User` (`UserEmail`),
  KEY `FK_UserUserType_idx` (`UserTypeId`),
  CONSTRAINT `FK_UserUserType` FOREIGN KEY (`UserTypeId`) REFERENCES `usertype` (`UserTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
INSERT INTO `master_project`.`usertype` (`UserType`) VALUES ('Type 1');
INSERT INTO `master_project`.`usertype` (`UserType`) VALUES ('Type 2');
INSERT INTO `master_project`.`usertype` (`UserType`) VALUES ('Type 3');
INSERT INTO `master_project`.`usertype` (`UserType`) VALUES ('Type 4');
INSERT INTO `master_project`.`usertype` (`UserType`) VALUES ('Type 5');


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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-06 13:47:22
