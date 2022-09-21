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
-- Table structure for table `gestor_ppl`
--

DROP TABLE IF EXISTS `gestor_ppl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestor_ppl` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `td` int NOT NULL,
  `nui` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `documento` int NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fase_tratamiento` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestor_ppl`
--

LOCK TABLES `gestor_ppl` WRITE;
/*!40000 ALTER TABLE `gestor_ppl` DISABLE KEYS */;
INSERT INTO `gestor_ppl` VALUES (1,80000,62500,'Juan Lopez',1112586927,'1991-02-22','Mediana Seguridad'),(2,80001,62501,'Brayan Uribe',1356562667,'1989-11-02','Baja Seguridad'),(3,80002,62502,'Jose Garavito',1325709844,'1970-09-09','Confianza'),(4,80003,62503,'Sneider Rosas',1952002369,'1999-10-14','Baja Seguridad'),(5,80004,62504,'Stiven Lorata',1005377101,'1993-12-06','Alta Seguridad'),(6,80005,62505,'Jorge Camargo',1755158935,'1971-05-21','Mediana Seguridad'),(7,80006,62506,'Jesus Olivera',1578462232,'1973-01-22','Baja Seguridad'),(8,80007,62507,'Raul Pardo',1597693925,'1982-06-11','Confianza'),(9,80008,62508,'Pepito Perez',1028788762,'1986-06-21','Baja Seguridad'),(10,80009,62509,'Pepita Rosas',1794212389,'1979-11-02','Confianza'),(11,80010,62510,'Juan Gavilan',1886182772,'1990-12-16','Mediana Seguridad'),(12,80011,62511,'Ivan Duque',1417341793,'1999-08-19','Mediana Seguridad'),(13,80012,62512,'Alvaro Rosas',1993657542,'1996-07-08','Mediana Seguridad'),(14,80013,62513,'Fulano Gomez',1224032870,'1986-07-10','Alta Seguridad'),(15,80014,62514,'Alberto Perez',1290208467,'1994-12-15','Baja Seguridad'),(16,80015,62515,'John Doe',1712473704,'1978-04-17','Alta Seguridad'),(17,80016,62516,'John Doe',1315153478,'1995-03-28','Mediana Seguridad'),(18,80017,62517,'John Doe',1050017426,'1997-12-28','Alta Seguridad'),(19,80018,62518,'John Doe',1823339450,'1972-06-19','Confianza'),(20,80019,62519,'John Doe',1959299952,'1997-07-25','Baja Seguridad'),(21,80020,62520,'John Doe',1701862557,'1981-06-23','Mediana Seguridad'),(22,80021,62521,'John Doe',1792547560,'1987-10-14','Confianza'),(23,80022,62522,'John Doe',1967773079,'1977-04-08','Baja Seguridad'),(24,80023,62523,'John Doe',1947523970,'1972-05-21','Confianza'),(25,80024,62524,'John Doe',1286642453,'2000-07-04','Baja Seguridad'),(26,80025,62525,'John Doe',1109950216,'2000-05-06','Confianza'),(27,80026,62526,'John Doe',1130537624,'1999-07-03','Baja Seguridad'),(28,80027,62527,'John Doe',1251213037,'1985-11-27','Confianza'),(29,80028,62528,'John Doe',1035331658,'1994-02-22','Confianza'),(30,80029,62529,'John Doe',1050115024,'1984-10-21','Mediana Seguridad'),(31,80030,62530,'John Doe',1289856557,'1996-04-20','Baja Seguridad'),(32,80031,62531,'John Doe',1412864608,'1992-04-21','Mediana Seguridad'),(33,80032,62532,'John Doe',1003908386,'1994-10-14','Mediana Seguridad'),(34,80033,62533,'John Doe',1008506350,'2000-08-05','Alta Seguridad'),(35,80034,62534,'John Doe',1296891768,'1998-05-07','Baja Seguridad'),(36,80035,62535,'John Doe',1692120655,'1987-12-19','Mediana Seguridad'),(37,80036,62536,'John Doe',1452732522,'1999-12-06','Confianza'),(38,80037,62537,'John Doe',1087878059,'1991-02-04','Alta Seguridad'),(39,80038,62538,'John Doe',1859663726,'1998-05-03','Alta Seguridad'),(40,80039,62539,'John Doe',1099086009,'1990-11-16','Alta Seguridad'),(41,80040,62540,'John Doe',1941572081,'1996-09-27','Alta Seguridad'),(42,80041,62541,'John Doe',1166981028,'1991-03-07','Confianza'),(43,80042,62542,'John Doe',1530476080,'1983-02-01','Confianza'),(44,80043,62543,'John Doe',1730596434,'1974-10-21','Confianza'),(45,80044,62544,'John Doe',1959814405,'1988-08-07','Baja Seguridad'),(46,80045,62545,'John Doe',1386492695,'1999-03-16','Mediana Seguridad'),(47,80046,62546,'John Doe',1930375139,'1977-12-22','Mediana Seguridad'),(48,80047,62547,'John Doe',1205942012,'1987-06-24','Alta Seguridad'),(49,80048,62548,'John Doe',1401906032,'1992-06-14','Confianza'),(50,80049,62549,'John Doe',1921847699,'1988-11-04','Baja Seguridad'),(51,80050,62550,'John Doe',1268765248,'1975-02-21','Confianza'),(52,80051,62551,'John Doe',1739323041,'1973-12-26','Mediana Seguridad'),(53,80052,62552,'John Doe',1037961215,'1993-04-22','Confianza'),(54,80053,62553,'John Doe',1292300964,'1970-08-27','Alta Seguridad'),(55,80054,62554,'John Doe',1920695812,'1977-07-09','Baja Seguridad'),(56,80055,62555,'John Doe',1708888463,'1971-10-05','Alta Seguridad'),(57,80056,62556,'John Doe',1645825672,'1982-12-23','Baja Seguridad'),(58,80057,62557,'John Doe',1262020605,'1986-01-01','Baja Seguridad'),(59,80058,62558,'John Doe',1769477611,'1972-07-24','Mediana Seguridad'),(60,80059,62559,'John Doe',1340229404,'1987-12-12','Confianza'),(61,80060,62560,'John Doe',1406992837,'1981-08-28','Mediana Seguridad'),(62,80061,62561,'John Doe',1769521784,'1991-11-09','Mediana Seguridad'),(63,80062,62562,'John Doe',1383569666,'2000-05-17','Alta Seguridad'),(64,80063,62563,'John Doe',1373861437,'1990-01-16','Alta Seguridad'),(65,80064,62564,'John Doe',1726692318,'1993-06-17','Alta Seguridad'),(66,80065,62565,'John Doe',1386476079,'1998-03-09','Confianza'),(67,80066,62566,'John Doe',1138666891,'1984-01-11','Alta Seguridad'),(68,80067,62567,'John Doe',1359955509,'1992-05-23','Confianza'),(69,80068,62568,'John Doe',1723534145,'1978-03-11','Baja Seguridad'),(70,80069,62569,'John Doe',1732725738,'1993-10-26','Baja Seguridad'),(71,80070,62570,'John Doe',1465583717,'1983-04-17','Baja Seguridad'),(72,80071,62571,'John Doe',1483349183,'1999-03-10','Baja Seguridad'),(73,80072,62572,'John Doe',1586513260,'1972-07-24','Baja Seguridad'),(74,80073,62573,'John Doe',1187437162,'1976-09-17','Baja Seguridad'),(75,80074,62574,'John Doe',1288842000,'1985-10-05','Confianza'),(76,80075,62575,'John Doe',1861859298,'1979-12-28','Baja Seguridad'),(77,80076,62576,'John Doe',1210927880,'1974-11-09','Baja Seguridad'),(78,80077,62577,'John Doe',1018863952,'1988-09-23','Alta Seguridad'),(79,80078,62578,'John Doe',1398571769,'1984-04-12','Baja Seguridad'),(80,80079,62579,'John Doe',1367379741,'1971-04-19','Alta Seguridad'),(81,80080,62580,'John Doe',1936773421,'1972-02-26','Baja Seguridad'),(82,80081,62581,'John Doe',1347551285,'1996-06-16','Alta Seguridad'),(83,80082,62582,'John Doe',1924954994,'1976-02-14','Confianza'),(84,80083,62583,'John Doe',1728461292,'1990-04-04','Baja Seguridad'),(85,80084,62584,'John Doe',1012927660,'1987-11-03','Alta Seguridad'),(86,80085,62585,'John Doe',1838502827,'1976-06-03','Mediana Seguridad'),(87,80086,62586,'John Doe',1900513488,'1978-06-08','Baja Seguridad'),(88,80087,62587,'John Doe',1922134581,'1991-10-11','Baja Seguridad'),(89,80088,62588,'John Doe',1344172808,'1986-03-09','Confianza'),(90,80089,62589,'John Doe',1317914153,'1984-11-05','Mediana Seguridad');
/*!40000 ALTER TABLE `gestor_ppl` ENABLE KEYS */;
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
