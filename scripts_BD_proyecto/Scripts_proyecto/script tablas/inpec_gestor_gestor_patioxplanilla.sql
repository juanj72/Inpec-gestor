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
-- Table structure for table `gestor_patioxplanilla`
--

DROP TABLE IF EXISTS `gestor_patioxplanilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestor_patioxplanilla` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cupo_maximo` int NOT NULL,
  `cupos_asignados` int NOT NULL,
  `patio_id` bigint NOT NULL,
  `planilla_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gestor_patioxplanilla_patio_id_a978ac0b_fk_gestor_patio_id` (`patio_id`),
  KEY `gestor_patioxplanilla_planilla_id_bb8b1839_fk_gestor_planilla_id` (`planilla_id`),
  CONSTRAINT `gestor_patioxplanilla_patio_id_a978ac0b_fk_gestor_patio_id` FOREIGN KEY (`patio_id`) REFERENCES `gestor_patio` (`id`),
  CONSTRAINT `gestor_patioxplanilla_planilla_id_bb8b1839_fk_gestor_planilla_id` FOREIGN KEY (`planilla_id`) REFERENCES `gestor_planilla` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestor_patioxplanilla`
--

LOCK TABLES `gestor_patioxplanilla` WRITE;
/*!40000 ALTER TABLE `gestor_patioxplanilla` DISABLE KEYS */;
INSERT INTO `gestor_patioxplanilla` VALUES (1,3,0,1,1),(2,4,0,2,1),(3,2,0,3,1),(4,5,0,4,1),(5,3,0,5,1),(6,4,0,6,1),(7,3,0,7,1),(8,2,0,8,1),(9,5,0,9,1),(10,5,0,10,1),(11,3,0,1,2),(12,4,0,2,2),(13,2,1,3,2),(14,5,0,4,2),(15,3,1,5,2),(16,4,0,6,2),(17,3,0,7,2),(18,2,0,8,2),(19,5,0,9,2),(20,5,1,10,2),(21,3,1,1,3),(22,4,0,2,3),(23,2,0,3,3),(24,5,0,4,3),(25,3,0,5,3),(26,4,0,6,3),(27,3,0,7,3),(28,2,0,8,3),(29,5,0,9,3),(30,5,0,10,3),(31,3,0,1,4),(32,4,0,2,4),(33,2,1,3,4),(34,5,0,4,4),(35,3,0,5,4),(36,4,0,6,4),(37,3,0,7,4),(38,2,0,8,4),(39,5,1,9,4),(40,5,0,10,4),(41,3,0,1,5),(42,4,1,2,5),(43,2,0,3,5),(44,5,0,4,5),(45,3,0,5,5),(46,4,0,6,5),(47,3,0,7,5),(48,2,0,8,5),(49,5,0,9,5),(50,5,0,10,5),(51,3,0,1,6),(52,4,0,2,6),(53,2,2,3,6),(54,5,0,4,6),(55,3,1,5,6),(56,4,0,6,6),(57,3,0,7,6),(58,2,0,8,6),(59,5,0,9,6),(60,5,0,10,6),(61,3,0,1,7),(62,4,0,2,7),(63,2,0,3,7),(64,5,0,4,7),(65,3,0,5,7),(66,4,0,6,7),(67,3,0,7,7),(68,2,0,8,7),(69,5,0,9,7),(70,5,0,10,7),(71,3,0,1,8),(72,4,0,2,8),(73,2,1,3,8),(74,5,0,4,8),(75,3,0,5,8),(76,4,0,6,8),(77,3,0,7,8),(78,2,1,8,8),(79,5,0,9,8),(80,5,0,10,8),(81,3,0,1,9),(82,4,0,2,9),(83,2,0,3,9),(84,5,0,4,9),(85,3,0,5,9),(86,4,0,6,9),(87,3,0,7,9),(88,2,0,8,9),(89,5,0,9,9),(90,5,0,10,9),(91,3,0,1,10),(92,4,0,2,10),(93,2,1,3,10),(94,5,0,4,10),(95,3,0,5,10),(96,4,1,6,10),(97,3,0,7,10),(98,2,0,8,10),(99,5,0,9,10),(100,5,0,10,10),(101,3,0,1,11),(102,4,0,2,11),(103,2,0,3,11),(104,5,0,4,11),(105,3,0,5,11),(106,4,0,6,11),(107,3,0,7,11),(108,2,0,8,11),(109,5,0,9,11),(110,5,0,10,11),(111,3,0,1,12),(112,4,0,2,12),(113,2,0,3,12),(114,5,0,4,12),(115,3,0,5,12),(116,4,1,6,12),(117,3,1,7,12),(118,2,0,8,12),(119,5,0,9,12),(120,5,0,10,12),(121,3,0,1,13),(122,4,0,2,13),(123,2,0,3,13),(124,5,0,4,13),(125,3,0,5,13),(126,4,0,6,13),(127,3,0,7,13),(128,2,0,8,13),(129,5,0,9,13),(130,5,0,10,13),(131,3,0,1,14),(132,4,0,2,14),(133,2,0,3,14),(134,5,0,4,14),(135,3,0,5,14),(136,4,0,6,14),(137,3,1,7,14),(138,2,0,8,14),(139,5,0,9,14),(140,5,0,10,14),(141,3,0,1,15),(142,4,0,2,15),(143,2,0,3,15),(144,5,0,4,15),(145,3,0,5,15),(146,4,0,6,15),(147,3,0,7,15),(148,2,0,8,15),(149,5,0,9,15),(150,5,0,10,15),(151,3,0,1,16),(152,4,0,2,16),(153,2,1,3,16),(154,5,0,4,16),(155,3,0,5,16),(156,4,0,6,16),(157,3,0,7,16),(158,2,0,8,16),(159,5,0,9,16),(160,5,0,10,16),(161,3,0,1,17),(162,4,0,2,17),(163,2,0,3,17),(164,5,0,4,17),(165,3,0,5,17),(166,4,0,6,17),(167,3,0,7,17),(168,2,0,8,17),(169,5,0,9,17),(170,5,0,10,17),(171,3,0,1,18),(172,4,0,2,18),(173,2,1,3,18),(174,5,0,4,18),(175,3,0,5,18),(176,4,0,6,18),(177,3,0,7,18),(178,2,0,8,18),(179,5,0,9,18),(180,5,0,10,18),(181,3,0,1,19),(182,4,0,2,19),(183,2,0,3,19),(184,5,0,4,19),(185,3,0,5,19),(186,4,0,6,19),(187,3,0,7,19),(188,2,0,8,19),(189,5,0,9,19),(190,5,0,10,19),(191,3,0,1,20),(192,4,0,2,20),(193,2,0,3,20),(194,5,0,4,20),(195,3,0,5,20),(196,4,0,6,20),(197,3,0,7,20),(198,2,0,8,20),(199,5,0,9,20),(200,5,0,10,20);
/*!40000 ALTER TABLE `gestor_patioxplanilla` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-05 19:31:06
