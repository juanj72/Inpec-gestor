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
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add actividad',7,'add_actividad'),(26,'Can change actividad',7,'change_actividad'),(27,'Can delete actividad',7,'delete_actividad'),(28,'Can view actividad',7,'view_actividad'),(29,'Can add planilla',8,'add_planilla'),(30,'Can change planilla',8,'change_planilla'),(31,'Can delete planilla',8,'delete_planilla'),(32,'Can view planilla',8,'view_planilla'),(33,'Can add ppl',9,'add_ppl'),(34,'Can change ppl',9,'change_ppl'),(35,'Can delete ppl',9,'delete_ppl'),(36,'Can view ppl',9,'view_ppl'),(37,'Can add proyecto',10,'add_proyecto'),(38,'Can change proyecto',10,'change_proyecto'),(39,'Can delete proyecto',10,'delete_proyecto'),(40,'Can view proyecto',10,'view_proyecto'),(41,'Can add ubicacion',11,'add_ubicacion'),(42,'Can change ubicacion',11,'change_ubicacion'),(43,'Can delete ubicacion',11,'delete_ubicacion'),(44,'Can view ubicacion',11,'view_ubicacion'),(45,'Can add pp lx ubicacion',12,'add_pplxubicacion'),(46,'Can change pp lx ubicacion',12,'change_pplxubicacion'),(47,'Can delete pp lx ubicacion',12,'delete_pplxubicacion'),(48,'Can view pp lx ubicacion',12,'view_pplxubicacion'),(49,'Can add pp lx planilla',13,'add_pplxplanilla'),(50,'Can change pp lx planilla',13,'change_pplxplanilla'),(51,'Can delete pp lx planilla',13,'delete_pplxplanilla'),(52,'Can view pp lx planilla',13,'view_pplxplanilla'),(53,'Can add patio',14,'add_patio'),(54,'Can change patio',14,'change_patio'),(55,'Can delete patio',14,'delete_patio'),(56,'Can view patio',14,'view_patio'),(57,'Can add patiox planilla',15,'add_patioxplanilla'),(58,'Can change patiox planilla',15,'change_patioxplanilla'),(59,'Can delete patiox planilla',15,'delete_patioxplanilla'),(60,'Can view patiox planilla',15,'view_patioxplanilla');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
