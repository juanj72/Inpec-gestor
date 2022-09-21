-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: inpec_gestor
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;

/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gestor_pplxubicacion`
--

DROP TABLE IF EXISTS `gestor_pplxubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestor_pplxubicacion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_ubicacion` date NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `PPL_id_ppl_id` bigint NOT NULL,
  `Ubicacion_id_ubicacion_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gestor_pplxubicacion_PPL_id_ppl_id_31f8efff_fk` (`PPL_id_ppl_id`),
  KEY `gestor_pplxubicacion_Ubicacion_id_ubicacion_id_06f6a9d6_fk` (`Ubicacion_id_ubicacion_id`),
  CONSTRAINT `gestor_pplxubicacion_PPL_id_ppl_id_31f8efff_fk` FOREIGN KEY (`PPL_id_ppl_id`) REFERENCES `gestor_ppl` (`id`),
  CONSTRAINT `gestor_pplxubicacion_Ubicacion_id_ubicacion_id_06f6a9d6_fk` FOREIGN KEY (`Ubicacion_id_ubicacion_id`) REFERENCES `gestor_ubicacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestor_pplxubicacion`
--

LOCK TABLES `gestor_pplxubicacion` WRITE;
/*!40000 ALTER TABLE `gestor_pplxubicacion` DISABLE KEYS */;
INSERT INTO `gestor_pplxubicacion` VALUES (1,'2000-02-01',0,1,1),(2,'2000-02-02',0,2,2),(3,'2000-03-03',0,3,3),(4,'2000-04-04',0,4,4),(5,'2000-05-05',0,5,5),(6,'2000-06-06',0,6,6),(7,'2000-07-07',0,7,7),(8,'2000-08-08',0,8,8),(9,'2000-09-09',0,9,9),(10,'2000-10-10',0,10,1),(11,'2000-02-01',1,1,100),(12,'2000-02-02',1,2,73),(13,'2000-03-03',1,3,148),(14,'2000-04-04',1,4,44),(15,'2000-05-05',1,5,81),(16,'2000-06-06',1,6,49),(17,'2000-07-07',1,7,5),(18,'2000-08-08',1,8,44),(19,'2000-09-09',1,9,143),(20,'2000-10-10',1,10,93),(21,'2000-02-01',1,11,14),(22,'2000-02-02',1,12,125),(23,'2000-03-03',1,13,35),(24,'2000-04-04',1,14,126),(25,'2000-05-05',1,15,158),(26,'2000-06-06',1,16,54),(27,'2000-07-07',1,17,5),(28,'2000-08-08',1,18,51),(29,'2000-09-09',1,19,138),(30,'2000-10-10',1,20,106),(31,'2000-02-01',1,21,127),(32,'2000-02-02',1,22,58),(33,'2000-03-03',1,23,141),(34,'2000-04-04',1,24,162),(35,'2000-05-05',1,25,81),(36,'2000-06-06',1,26,177),(37,'2000-07-07',1,27,75),(38,'2000-08-08',1,28,4),(39,'2000-09-09',1,29,160),(40,'2000-10-10',1,30,20),(41,'2000-02-01',1,31,81),(42,'2000-02-02',1,32,30),(43,'2000-03-03',1,33,73),(44,'2000-04-04',1,34,40),(45,'2000-05-05',1,35,53),(46,'2000-06-06',1,36,110),(47,'2000-07-07',1,37,7),(48,'2000-08-08',1,38,7),(49,'2000-09-09',1,39,168),(50,'2000-10-10',1,40,48),(51,'2000-02-01',1,41,120),(52,'2000-02-02',1,42,51),(53,'2000-03-03',1,43,143),(54,'2000-04-04',1,44,10),(55,'2000-05-05',1,45,16),(56,'2000-06-06',1,46,165),(57,'2000-07-07',1,47,100),(58,'2000-08-08',1,48,47),(59,'2000-09-09',1,49,178),(60,'2000-10-10',1,50,148),(61,'2000-02-01',1,51,129),(62,'2000-02-02',1,52,107),(63,'2000-03-03',1,53,50),(64,'2000-04-04',1,54,160),(65,'2000-05-05',1,55,168),(66,'2000-06-06',1,56,137),(67,'2000-07-07',1,57,6),(68,'2000-08-08',1,58,176),(69,'2000-09-09',1,59,162),(70,'2000-10-10',1,60,19),(71,'2000-02-01',1,61,28),(72,'2000-02-02',1,62,5),(73,'2000-03-03',1,63,20),(74,'2000-04-04',1,64,147),(75,'2000-05-05',1,65,111),(76,'2000-06-06',1,66,86),(77,'2000-07-07',1,67,90),(78,'2000-08-08',1,68,161),(79,'2000-09-09',1,69,34),(80,'2000-10-10',1,70,20),(81,'2000-02-01',1,71,148),(82,'2000-02-02',1,72,154),(83,'2000-03-03',1,73,161),(84,'2000-04-04',1,74,123),(85,'2000-05-05',1,75,50),(86,'2000-06-06',1,76,177),(87,'2000-07-07',1,77,29),(88,'2000-08-08',1,78,124),(89,'2000-09-09',1,79,92),(90,'2000-10-10',1,80,107),(91,'2000-02-01',1,81,53),(92,'2000-02-02',1,82,127),(93,'2000-03-03',1,83,9),(94,'2000-04-04',1,84,127),(95,'2000-05-05',1,85,6),(96,'2000-06-06',1,86,166),(97,'2000-07-07',1,87,36),(98,'2000-08-08',1,88,55),(99,'2000-09-09',1,89,30),(100,'2000-10-10',1,90,136);
/*!40000 ALTER TABLE `gestor_pplxubicacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-05 19:31:05
