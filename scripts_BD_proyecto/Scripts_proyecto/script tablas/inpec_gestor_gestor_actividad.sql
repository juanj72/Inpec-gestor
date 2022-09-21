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
-- Table structure for table `gestor_actividad`
--

DROP TABLE IF EXISTS `gestor_actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestor_actividad` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo_actividad` varchar(50) NOT NULL,
  `nombre_actividad` varchar(80) NOT NULL,
  `programa` varchar(50) NOT NULL,
  `cma` int NOT NULL,
  `caa` int NOT NULL,
  `cda` int NOT NULL,
  `proyecto_id_proyecto_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gestor_actividad_proyecto_id_proyecto_id_1bdbbccf_fk` (`proyecto_id_proyecto_id`),
  CONSTRAINT `gestor_actividad_proyecto_id_proyecto_id_1bdbbccf_fk` FOREIGN KEY (`proyecto_id_proyecto_id`) REFERENCES `gestor_proyecto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestor_actividad`
--

LOCK TABLES `gestor_actividad` WRITE;
/*!40000 ALTER TABLE `gestor_actividad` DISABLE KEYS */;
INSERT INTO `gestor_actividad` VALUES (1,'101','RESOCIALIZACION','CONFI',5,3,2,1),(2,'102','COMUNICACION','TERA',8,5,3,10),(3,'103','COMPARTIR','FINDE',9,8,1,2),(4,'104','ETICA','YUN',9,9,0,9),(5,'105','COMPROMISO','FENX',7,5,2,3),(6,'106','CONTINUAR','HBEN',3,3,0,8),(7,'107','SEGUIR','DENDE',1,1,0,4),(8,'108','CONPE','JUST',8,0,8,7),(9,'109','LEALTAD','LOYAL',5,4,1,5),(10,'110','HONES','JULC',7,3,4,6);
/*!40000 ALTER TABLE `gestor_actividad` ENABLE KEYS */;
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
