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
-- Table structure for table `gestor_pplxplanilla`
--

DROP TABLE IF EXISTS `gestor_pplxplanilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestor_pplxplanilla` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `estado` int NOT NULL DEFAULT '1',
  `fehca_inicio` date NOT NULL,
  `fecha_final` date DEFAULT NULL,
  `PPL_id_PPL_id` bigint NOT NULL,
  `planilla_id_planilla_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gestor_pplxplanilla_planilla_id_planilla_id_fad0d19e_fk` (`planilla_id_planilla_id`),
  KEY `gestor_pplxplanilla_PPL_id_PPL_id_77e2aca9_fk` (`PPL_id_PPL_id`),
  CONSTRAINT `gestor_pplxplanilla_planilla_id_planilla_id_fad0d19e_fk` FOREIGN KEY (`planilla_id_planilla_id`) REFERENCES `gestor_planilla` (`id`),
  CONSTRAINT `gestor_pplxplanilla_PPL_id_PPL_id_77e2aca9_fk` FOREIGN KEY (`PPL_id_PPL_id`) REFERENCES `gestor_ppl` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestor_pplxplanilla`
--

LOCK TABLES `gestor_pplxplanilla` WRITE;
/*!40000 ALTER TABLE `gestor_pplxplanilla` DISABLE KEYS */;
INSERT INTO `gestor_pplxplanilla` VALUES (1,0,'2000-09-09',NULL,2,1),(2,0,'1999-06-05','1999-08-05',4,2),(3,0,'1999-05-05','1999-06-05',6,3),(4,0,'1996-05-05','1999-06-05',8,4),(5,0,'1990-06-04','1990-08-04',10,5),(6,0,'2000-06-09','2000-10-09',12,6),(7,0,'1989-05-05','1989-10-05',14,7),(8,0,'1995-05-05','1996-05-05',16,8),(9,0,'1996-07-07','1999-07-07',18,9),(10,0,'1999-07-02','1999-08-02',20,10),(11,0,'2000-09-09','1999-05-05',4,2),(12,1,'1999-05-05',NULL,3,4),(13,1,'1999-05-05',NULL,5,6),(14,1,'1996-05-05',NULL,9,8),(15,1,'1990-06-04',NULL,40,10),(16,1,'2000-06-09',NULL,42,12),(17,1,'1989-05-05',NULL,44,3),(18,1,'1995-05-05',NULL,46,2),(19,1,'1996-07-07',NULL,48,6),(20,1,'1999-07-02',NULL,30,5),(21,1,'2000-09-09',NULL,2,2),(22,1,'1999-08-05',NULL,4,4),(23,1,'1999-06-05',NULL,6,6),(24,1,'1996-06-05',NULL,8,8),(25,1,'1990-08-04',NULL,10,10),(26,1,'2000-10-09',NULL,12,12),(27,1,'1989-10-05',NULL,14,14),(28,1,'1996-05-05',NULL,16,16),(29,1,'1999-07-07',NULL,18,18),(30,0,'1999-08-02','2022-05-02',20,20),(31,0,'2022-05-02','2022-05-02',20,4),(32,0,'2022-05-02','2022-05-02',20,6),(33,0,'2022-05-02','2022-05-02',20,8),(34,0,'2022-05-02','2022-05-02',20,1),(35,1,'2022-05-02',NULL,20,12);
/*!40000 ALTER TABLE `gestor_pplxplanilla` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;

/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizar_planilla` BEFORE INSERT ON `gestor_pplxplanilla` FOR EACH ROW BEGIN
    DECLARE c_asignado INT;
    DECLARE c_restante INT;
    DECLARE id_actividad_ant INT;
    
    SELECT planilla.cap, planilla.cdp INTO c_asignado, c_restante FROM gestor_planilla AS planilla WHERE NEW.planilla_id_planilla_id = planilla.id;
    
    SELECT planilla_id_planilla_id INTO id_actividad_ant FROM gestor_pplxplanilla AS pplxplanilla WHERE NEW.PPL_id_PPL_id = pplxplanilla.PPL_id_PPL_id AND pplxplanilla.estado=1;
    
	IF c_restante > 0 THEN
		UPDATE gestor_planilla AS planilla SET planilla.cap = (c_asignado+1), planilla.cdp = (c_restante-1) WHERE NEW.planilla_id_planilla_id = planilla.id;
        UPDATE gestor_planilla AS planilla SET planilla.cap = (planilla.cap-1), planilla.cdp = (planilla.cdp+1) WHERE id_actividad_ant = planilla.id;
	ELSE 
    	SIGNAL sqlstate '45001' set message_text = "Ya no hay cupos para la actividad";
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;

/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `control_cupos` BEFORE INSERT ON `gestor_pplxplanilla` FOR EACH ROW BEGIN
    declare v_total  int;
    declare v_asignado  int;
    declare v_id  int;

	SELECT DISTINCT
		patio.id, patio.cupo_maximo_actividades, patio.cupos_asignados
	INTO v_id , v_total , v_asignado FROM
		gestor_pplxplanilla AS pplxplanilla
			INNER JOIN
		gestor_ppl AS ppl ON ppl.id = pplxplanilla.PPL_id_PPL_id
			INNER JOIN
		gestor_pplxubicacion AS pplxubicacion ON pplxubicacion.PPL_id_ppl_id = ppl.id
			INNER JOIN
		gestor_ubicacion AS ubicacion ON ubicacion.id = pplxubicacion.Ubicacion_id_ubicacion_id
			INNER JOIN
		gestor_patio AS patio ON patio.id = ubicacion.patio_id
	WHERE
		ppl.id = new.PPL_id_PPL_id;
        
	IF v_total>v_asignado THEN
    	UPDATE gestor_patio set gestor_patio.cupos_asignados=gestor_patio.cupos_asignados+1 
    		WHERE gestor_patio.id=v_id;
    ELSE 
    	SIGNAL sqlstate '45001' set message_text = "supera el maximo de actividades disponibles para el patio";
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;

/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `control_cupos_por_planilla` BEFORE INSERT ON `gestor_pplxplanilla` FOR EACH ROW BEGIN
    declare v_total  int;
    declare v_asignado  int;
    declare v_id  int;




    SELECT DISTINCT pxpl.planilla_id,pxpl.cupo_maximo,pxpl.cupos_asignados
    INTO v_id,v_total,v_asignado
    FROM gestor_planilla as pl
    INNER JOIN  gestor_pplxplanilla as pxp on pxp.planilla_id_planilla_id=pl.id
    INNER JOIN gestor_ppl as ppl on ppl.id=pxp.PPL_id_PPL_id
    INNER JOIN gestor_pplxubicacion as pxu on pxu.PPL_id_ppl_id=ppl.id
    INNER JOIN gestor_ubicacion as u on u.id=pxu.Ubicacion_id_ubicacion_id
    INNER JOIN gestor_patio as p on p.id=u.patio_id 
    INNER JOIN gestor_patioxplanilla as  pxpl on pxpl.planilla_id=p.id
	where ppl.id=new.PPL_id_PPL_id;
    
	IF v_total>v_asignado THEN
    	UPDATE `gestor_patioxplanilla` set `gestor_patioxplanilla`.`cupos_asignados`=`gestor_patioxplanilla`.`cupos_asignados`+1 
    		WHERE `gestor_patioxplanilla`.`id`=v_id;
    	
    ELSE 
    	SIGNAL sqlstate '45002' set message_text = "supera el maximo de este tipo de  actividad disponibles para el patio";
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-05 19:31:05
