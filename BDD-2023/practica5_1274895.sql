CREATE DATABASE  IF NOT EXISTS `ControlEscolar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ControlEscolar`;
-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: ControlEscolar
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

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
-- Table structure for table `Curso`
--

DROP TABLE IF EXISTS `Curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Curso` (
  `NumCurso` int NOT NULL AUTO_INCREMENT,
  `NombreCurso` varchar(10) DEFAULT NULL,
  `HorasCreditos` double DEFAULT NULL,
  `Departamento` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`NumCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Curso`
--

LOCK TABLES `Curso` WRITE;
/*!40000 ALTER TABLE `Curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `Curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estudiante`
--

DROP TABLE IF EXISTS `Estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estudiante` (
  `NumEstudiante` varchar(10) NOT NULL,
  `Nombre` varchar(25) DEFAULT NULL,
  `Grado` int DEFAULT NULL,
  `Carrera` varchar(25) DEFAULT NULL,
  `Estatus` enum('A','B','EG') DEFAULT NULL,
  PRIMARY KEY (`NumEstudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estudiante`
--

LOCK TABLES `Estudiante` WRITE;
/*!40000 ALTER TABLE `Estudiante` DISABLE KEYS */;
INSERT INTO `Estudiante` VALUES ('123456','Blanca',7,'Psicología','A'),('456789','Blas',10,'Administración','A'),('789123','Héctor',9,'Economía','B'),('983117','Arely',6,'Economía','B'),('988941','Raul',9,'Administración','B'),('991028','Martin',7,'Psicología','B'),('992400','Arely',8,'Economía','A'),('994864','Damaris',7,'Administración','B'),('996248','Jazmin',3,'Administración','A'),('996424','Edgar',8,'Psicología','A');
/*!40000 ALTER TABLE `Estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InformeNotas`
--

DROP TABLE IF EXISTS `InformeNotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InformeNotas` (
  `NumEstudiante` varchar(10) NOT NULL,
  `IdentSeccion` int NOT NULL,
  `Notas` float DEFAULT NULL,
  PRIMARY KEY (`NumEstudiante`,`IdentSeccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InformeNotas`
--

LOCK TABLES `InformeNotas` WRITE;
/*!40000 ALTER TABLE `InformeNotas` DISABLE KEYS */;
INSERT INTO `InformeNotas` VALUES ('123456',1,1),('456789',3,3),('789123',2,2),('983117',9,9),('988941',8,8),('991028',4,4),('992400',5,5),('994864',10,10),('996248',6,6),('996424',7,7);
/*!40000 ALTER TABLE `InformeNotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profesor`
--

DROP TABLE IF EXISTS `Profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Profesor` (
  `NumeroProfesor` int NOT NULL AUTO_INCREMENT,
  `NombreProfesor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NumeroProfesor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profesor`
--

LOCK TABLES `Profesor` WRITE;
/*!40000 ALTER TABLE `Profesor` DISABLE KEYS */;
INSERT INTO `Profesor` VALUES (1,'Bernardo'),(2,'Emiliano'),(3,'Ignacio'),(5,'Dalia'),(6,'Marina'),(7,'Laura'),(8,'Alonso'),(9,'Astrid'),(10,'Carlos');
/*!40000 ALTER TABLE `Profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Requisitos`
--

DROP TABLE IF EXISTS `Requisitos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Requisitos` (
  `NumCurso` int NOT NULL,
  `NumRequisito` int NOT NULL,
  PRIMARY KEY (`NumCurso`,`NumRequisito`),
  CONSTRAINT `FK_Requisito_NumCurso` FOREIGN KEY (`NumCurso`) REFERENCES `Curso` (`NumCurso`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Requisitos`
--

LOCK TABLES `Requisitos` WRITE;
/*!40000 ALTER TABLE `Requisitos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Requisitos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seccion`
--

DROP TABLE IF EXISTS `Seccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Seccion` (
  `IdentSeccion` int NOT NULL AUTO_INCREMENT,
  `NumCurso` int DEFAULT NULL,
  `Semestre` int DEFAULT NULL,
  `Anio` int DEFAULT NULL,
  `NumeroProfesor` int DEFAULT NULL,
  `NumEstudiante` varchar(10) DEFAULT NULL,
  `Notas` float DEFAULT NULL,
  PRIMARY KEY (`IdentSeccion`),
  KEY `FK_SeccionProfesor_NumeroProfesor` (`NumeroProfesor`),
  CONSTRAINT `FK_SeccionProfesor_NumeroProfesor` FOREIGN KEY (`NumeroProfesor`) REFERENCES `Profesor` (`NumeroProfesor`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seccion`
--

LOCK TABLES `Seccion` WRITE;
/*!40000 ALTER TABLE `Seccion` DISABLE KEYS */;
INSERT INTO `Seccion` VALUES (1,1,1,2018,1,'123456',9),(2,1,1,2018,1,'123456',9),(3,4,3,2020,1,'123456',9),(4,4,1,2018,1,'994864',9),(5,3,3,2019,2,'456789',4),(6,4,3,2019,2,'456789',4),(7,2,3,2019,1,'123456',9),(8,5,5,2022,1,'123456',4),(9,5,3,2023,1,'994864',5),(10,4,7,2013,2,'456789',6),(11,5,9,2014,2,'456789',4);
/*!40000 ALTER TABLE `Seccion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-12 18:31:54
