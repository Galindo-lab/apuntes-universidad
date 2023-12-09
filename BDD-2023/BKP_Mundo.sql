CREATE DATABASE  IF NOT EXISTS `mundo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mundo`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mundo
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `ID` int NOT NULL DEFAULT '0',
  `Name` char(35) NOT NULL DEFAULT '',
  `CountryCode` char(3) NOT NULL DEFAULT '',
  `District` char(20) NOT NULL DEFAULT '',
  `Population` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Kabul','AFG','Kabol',1780000),(34,'Tirana','','Tirana',270000),(56,'Luanda','','Luanda',2022000),(62,'The Valley','AIA','–',595),(129,'Oranjestad','ABW','–',29034),(1890,'Shanghai','','Shanghai',9696300),(2401,'Athenai','GRC','Attika',772072),(2521,'Tijuana','','Baja California',1212232),(3746,'Kinešma','RUS','Ivanovo',100000),(3793,'New York','','New York',8008278);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `code` char(3) NOT NULL DEFAULT '',
  `name` char(52) NOT NULL DEFAULT '',
  `continent` enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') NOT NULL DEFAULT 'Asia',
  `region` char(26) NOT NULL DEFAULT '',
  `surfacearea` decimal(10,2) NOT NULL DEFAULT '0.00',
  `indepyear` smallint DEFAULT NULL,
  `population` int NOT NULL DEFAULT '0',
  `lifeexpectancy` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('ABW','Aruba','North America','Caribbean',193.00,NULL,103000,78.4),('AFG','Afghanistan','Asia','Southern and Central Asia',652090.00,1919,22720000,45.9),('AGO','Angola','Africa','Central Africa',1246700.00,1975,12878000,38.3),('AIA','Anguilla','North America','Caribbean',96.00,NULL,8000,76.1),('ALB','Albania','Europe','Southern Europe',28748.00,1912,3401200,71.6),('AND','Andorra','Europe','Southern Europe',468.00,1278,78000,83.5),('ARE','United Arab Emirates','Asia','Middle East',83600.00,1971,2441000,74.1),('ARG','Argentina','South America','South America',2780400.00,1816,37032000,75.1),('CHE','Switzerland','Europe','Western Europe',41284.00,1499,7160400,79.6),('GRC','Greece','Europe','Southern Europe',131626.00,1830,10545700,78.4);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countrylanguage`
--

DROP TABLE IF EXISTS `countrylanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countrylanguage` (
  `countrycode` char(3) NOT NULL DEFAULT '',
  `language` char(30) NOT NULL DEFAULT '',
  `isofficial` enum('T','F') NOT NULL DEFAULT 'F',
  PRIMARY KEY (`countrycode`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countrylanguage`
--

LOCK TABLES `countrylanguage` WRITE;
/*!40000 ALTER TABLE `countrylanguage` DISABLE KEYS */;
INSERT INTO `countrylanguage` VALUES ('AFG','Balochi','F'),('AFG','Dari','T'),('AFG','Pashto','T'),('AFG','Turkmenian','F'),('AFG','Uzbek','F'),('AIA','English','T'),('CHE','French','T'),('CHE','German','T'),('CHE','Italian','T'),('CHE','Romansh','T'),('GRC','Greek','T'),('GRC','Turkish','F');
/*!40000 ALTER TABLE `countrylanguage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-21 16:02:54
