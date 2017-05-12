/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  james
 * Created: 22-Mar-2017
 */

CREATE DATABASE  IF NOT EXISTS `dwba_assessmentV5` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dwba_assessmentV5`;
-- MySQL dump 10.13  Distrib 5.1.40, for Win32 (ia32)
--
-- Host: localhost    Database: dwba_assessment
-- ------------------------------------------------------
-- Server version	5.1.47-community-log

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `idCustomer` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `contact_no` varchar(45) NOT NULL,
  `emailaddress` varchar(45) NOT NULL,
  `loginname` varchar(45) NOT NULL,
  `loginpassword` varchar(45) NOT NULL,
  `country_of_origin` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`idCustomer`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'nosferatu','vampire','666','nosvam@dracula.com','nosferatu','vampire','Other European'),(2,'jim','evans','111222333','jevans123@yahoo.co.uk','jevans123','xyz123xyz','UK'),(3,'sid','duguid','77778888','sd7788@yahoo.co.uk','sd7788','qwerty123','UK'),(4,'anna','smith','999999999','asmith@mail.co.uk','asmith','admin','Rep of Ireland'),(5,'andy','belmont','999999999','ab111@mail.com','ab111','admin',''),(6,'dave','sands','12345678','ds@hotmail.com','dsands','abcdefg','UK'),(7,'fred','smith','111111111','fsmith@yahoo.co.uk','fsmith999','admin','Spain'),(8,'jan','sikorsky','555666','js56@yahoo.pl','js56','qwerty7654','Other European'),(9,'xanthe','yeaman','2345465','xyeaman@yahoo.com','xy654','password',''),(10,'fred','smith','111111111','fsmith@yahoo.co.uk','fred','xxxx','UK'),(11,'jill','adams','01343556773','jadams@yahoo.com','jadams123','password','France'),(12,'Frank','Smith','2341556865','ismith@z.com','frankS','password',''),(13,'andzrej','wajda','008977612234','awajda345@gmail.com','awajda345','stalin','Other European'),(14,'alan','smith','987654321','asmith123@gmail.com','asmith123','zxcvbnm','UK'),(15,'alec','jones','333444555','alecjones@gmail.com','xyz','xyz',''),(16,'graeme','french','555777999','gfrench579@yahoo.co.uk','gfrench579','admin','UK'),(17,'andrea','jones','07786233566','ajones@gmail.com','andrea','sesame',''),(18,'ian','collie','333333333','ic@x.com','ianc','admin','UK'),(19,'claire','mcleod','0131332443','cmcleod@gmail.com','cmleod111','PASSWORD','UK'),(20,'fred','bloggs','123456','fred@wanadoo.co.uk','fred','abcdef','UK'),(23,'Kathryn','Foulds','123456789','kfoulds222@yahoo.co.uk','kfoulds222','kfoulds222',''),(100,'James','Chalmers','07790922716','jc184@gmail.com','jc184','sesame','UK'),(101,'John','Smith','01343667334','jsmith100@hotmail.com','jsmith100','gh67kol0987',''),(102,'Jan','Modaal','01330991162','jmodaal@yahoo.com','janm999','1Feyenoord1','NL'),(103,'Michel','Dupont','0033468293357','mdupont@wanadoo.fr','michel189','7montdoreX','FR'),(104,'John','Doe','00516882302','johndoe@gmail.com','johndoe129','NewYorkMets','USA'),(105,'Claudia','Schmidt','03369021568','cschmidt456@gmx.de','cschmidt456','2Wfg56kj79','GER'),(106,'Andrea','Wilson','0131551223','aw444@btinternet.com','andrea444','Wte56BnF2','UK'),(107,'Joe','Bloggs','0141891246','jbloggs@yahoo.co.uk','99jbloggs99','password','UK');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `idRoute` int(11) NOT NULL,
  `route_description` varchar(45) NOT NULL,
  `adult_fare` decimal(6,2) NOT NULL,
  `child_fare` decimal(6,2) NOT NULL,
  PRIMARY KEY (`idRoute`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (322,'Morar to Rum return','20.00','8.00'),(323,'Morar to Muck return','25.00','12.00'),(324,'Morar to Eigg return','16.00','6.00');
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `idBooking` int(11) NOT NULL AUTO_INCREMENT,
  `idCustomer` int(11) NOT NULL,
  `idRoute` int(11) NOT NULL,
  `sailing_date` date NOT NULL,
  `no_of_adults` int(11) NOT NULL,
  `no_of_children` int(11) NOT NULL,
  `otherinfo` varchar(45) DEFAULT NULL,
  `total_cost` decimal(6,2) DEFAULT NULL,
  `payment_received` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idBooking`),
  KEY `fk_Booking_Customer` (`idCustomer`),
  KEY `fk_Booking_Route1` (`idRoute`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--
-- 
LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1,323,'2010-11-24',4,3,'crutches may be required','136.00',0),
                             (2,3,322,'2011-03-25',3,2,'none','76.00',0),
                             (3,4,323,'2010-11-25',2,3,'','86.00',0),
                             (4,2,324,'2010-12-23',3,3,'','66.00',0),
                             (5,3,323,'2011-03-10',2,1,'1234567890','62.00',0),
                             (6,10,324,'2010-11-26',2,0,'wheelchair / ramp required','32.00',0),
                             (7,1,322,'2010-11-30',5,3,'none','124.00',0),
                             (8,13,323,'2010-11-25',4,4,'none','148.00',0),
                             (9,107,322,'2010-11-16',2,2,'wheelchair needed','56.00',0),
                             (10,2,324,'2010-12-23',1,3,'','34.00',0),
                             (11,14,323,'2010-12-23',4,4,'none','148.00',0),
                             (12,28,322,'2012-02-23',1,1,'stretcher needed','28.00',0),
                             (13,30,323,'2010-11-24',1,1,'none','37.00',0),
                             (14,27,322,'2011-02-18',1,3,'none','44.00',0),
                             (15,3,322,'2011-04-14',2,4,'15151515151515','72.00',0),
                             (16,14,323,'2010-12-23',4,4,'none','148.00',0),
                             (17,14,323,'2010-12-23',4,4,'none','148.00',0),
                             (18,14,323,'2010-12-23',4,4,'none','148.00',0),
                             (23,23,323,'2011-04-06',3,3,'','111.00',0);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
