-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: inpec_gestor
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `gestor_planilla`
--

DROP TABLE IF EXISTS `gestor_planilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestor_planilla` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo_planilla` varchar(45) NOT NULL,
  `nombre_planilla` varchar(50) NOT NULL,
  `nombre_actividad` varchar(80) NOT NULL,
  `cmp` int NOT NULL,
  `cap` int NOT NULL,
  `cdp` int NOT NULL,
  `actividad_id_actividad_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gestor_planilla_actividad_id_actividad_id_2e9da859_fk` (`actividad_id_actividad_id`),
  CONSTRAINT `gestor_planilla_actividad_id_actividad_id_2e9da859_fk` FOREIGN KEY (`actividad_id_actividad_id`) REFERENCES `gestor_actividad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestor_planilla`
--

LOCK TABLES `gestor_planilla` WRITE;
/*!40000 ALTER TABLE `gestor_planilla` DISABLE KEYS */;
INSERT INTO `gestor_planilla` VALUES (1,'586N','PLAN1','Peluqueria',7,0,7,1),(2,'571V','PLAN2','Reciclaje',5,2,3,10),(3,'518Z','PLAN3','Aseo',3,1,2,2),(4,'522X','PLAN4','Cocina',4,2,2,9),(5,'501Q','PLAN5','Estudio1',2,1,1,3),(6,'591X','PLAN6','Auxiliar',8,3,5,8),(7,'544Z','PLAN7','Aprendizaje1',9,0,9,4),(8,'547P','PLAN8','Embolador',5,2,3,7),(9,'557O','PLAN9','Marroquineria',4,0,4,5),(10,'525K','PLAN10','Lavanderia',3,2,1,6),(11,'546N','PLAN11','Guadaña',7,0,7,1),(12,'519V','PLAN12','Panadero',5,3,2,10),(13,'507Z','PLAN13','Lavanderia',3,0,3,2),(14,'576X','PLAN14','Tejer',3,1,2,9),(15,'573Q','PLAN15','Estudio2',5,0,5,3),(16,'589X','PLAN16','Pintura',4,1,3,8),(17,'548Z','PLAN17','Aprendizaje2',9,0,9,4),(18,'553P','PLAN18','Artesanias',5,1,4,7),(19,'575O','PLAN19','Estudio3',4,0,4,5),(20,'558K','PLAN20','Aprendizaje3',2,0,2,6);
/*!40000 ALTER TABLE `gestor_planilla` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-05 19:31:04
