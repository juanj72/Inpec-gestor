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
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-05-02 19:49:36.049643'),(2,'auth','0001_initial','2022-05-02 19:49:36.404344'),(3,'admin','0001_initial','2022-05-02 19:49:36.524864'),(4,'admin','0002_logentry_remove_auto_add','2022-05-02 19:49:36.532864'),(5,'admin','0003_logentry_add_action_flag_choices','2022-05-02 19:49:36.540865'),(6,'contenttypes','0002_remove_content_type_name','2022-05-02 19:49:36.628864'),(7,'auth','0002_alter_permission_name_max_length','2022-05-02 19:49:36.676865'),(8,'auth','0003_alter_user_email_max_length','2022-05-02 19:49:36.708865'),(9,'auth','0004_alter_user_username_opts','2022-05-02 19:49:36.724896'),(10,'auth','0005_alter_user_last_login_null','2022-05-02 19:49:36.780897'),(11,'auth','0006_require_contenttypes_0002','2022-05-02 19:49:36.780897'),(12,'auth','0007_alter_validators_add_error_messages','2022-05-02 19:49:36.796866'),(13,'auth','0008_alter_user_username_max_length','2022-05-02 19:49:36.852872'),(14,'auth','0009_alter_user_last_name_max_length','2022-05-02 19:49:36.908865'),(15,'auth','0010_alter_group_name_max_length','2022-05-02 19:49:36.932897'),(16,'auth','0011_update_proxy_permissions','2022-05-02 19:49:36.948897'),(17,'auth','0012_alter_user_first_name_max_length','2022-05-02 19:49:37.004865'),(18,'gestor','0001_initial','2022-05-02 19:49:37.343778'),(19,'gestor','0002_auto_20220404_0825','2022-05-02 19:49:38.114905'),(20,'gestor','0003_alter_pplxplanilla_fecha_final_and_more','2022-05-02 19:49:38.174492'),(21,'gestor','0004_alter_actividad_id_alter_planilla_id_alter_ppl_id_and_more','2022-05-02 19:49:38.978233'),(22,'gestor','0005_auto_20220412_1011','2022-05-02 19:49:39.762597'),(23,'gestor','0006_patio_alter_actividad_id_alter_planilla_id_and_more','2022-05-02 19:49:40.607238'),(24,'gestor','0007_patioxplanilla','2022-05-02 19:49:40.710218'),(25,'gestor','0008_ubicacion_cau_ubicacion_cdu_ubicacion_cmu','2022-05-02 19:49:40.774749'),(26,'sessions','0001_initial','2022-05-02 19:49:40.806725');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-05 19:31:05
