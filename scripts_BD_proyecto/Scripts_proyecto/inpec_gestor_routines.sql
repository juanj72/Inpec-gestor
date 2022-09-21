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
-- Dumping events for database 'inpec_gestor'
--

--
-- Dumping routines for database 'inpec_gestor'
--
/*!50003 DROP PROCEDURE IF EXISTS `asignar_actividad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `asignar_actividad`(nui INT, actividad VARCHAR(80))
BEGIN
	DECLARE ppl_id INT;
    DECLARE planilla_id INT;
    
    SELECT ppl.id INTO ppl_id FROM gestor_ppl AS ppl WHERE nui = ppl.nui;
    
    SELECT planilla.id INTO planilla_id FROM gestor_planilla AS planilla WHERE actividad = planilla.nombre_actividad;
    
	INSERT INTO gestor_pplxplanilla (fehca_inicio, PPL_id_PPL_id, planilla_id_planilla_id) VALUES (NOW(), ppl_id, planilla_id);
    
    UPDATE gestor_pplxplanilla SET gestor_pplxplanilla.estado = 0, gestor_pplxplanilla.fecha_final = NOW() WHERE ppl_id = gestor_pplxplanilla.PPL_id_PPL_id AND gestor_pplxplanilla.estado=1 AND gestor_pplxplanilla.planilla_id_planilla_id <> planilla_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_cd_celdas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_cd_celdas`(patio VARCHAR(45))
BEGIN
	SELECT 
		patio.patio,
		ubicacion.piso,
		ubicacion.pasillo,
		ubicacion.celda,
		ubicacion.cmu,
        ubicacion.cau,
        ubicacion.cdu
	FROM
		gestor_ubicacion AS ubicacion
			INNER JOIN
		gestor_patio AS patio ON ubicacion.patio_id = patio.id
	WHERE
		ubicacion.cdu>0 AND patio.patio = patio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_ppl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_ppl`(nui INT)
BEGIN
	SELECT
		ppl.nui,
		ppl.td,
		ppl.nombre,
		ppl.documento,
        ppl.fase_tratamiento,
		TIMESTAMPDIFF(YEAR,
			ppl.fecha_nacimiento,
			NOW()) AS edad,
		IF(planilla.nombre_actividad IS NULL,'Actividad No Asignada',planilla.nombre_actividad) AS nombre_actividad,
		patio.patio,
		ubicacion.piso,
		ubicacion.pasillo,
		ubicacion.celda
	FROM
		gestor_ppl AS ppl
			LEFT JOIN
		gestor_pplxplanilla AS pplxplanilla ON ppl.id = pplxplanilla.PPL_id_PPL_id
			LEFT JOIN
		gestor_planilla AS planilla ON pplxplanilla.planilla_id_planilla_id = planilla.id
			INNER JOIN
		gestor_pplxubicacion AS pplxubicacion ON ppl.id = pplxubicacion.PPL_id_ppl_id
			INNER JOIN
		gestor_ubicacion AS ubicacion ON pplxubicacion.Ubicacion_id_ubicacion_id = ubicacion.id
			INNER JOIN
		gestor_patio AS patio ON ubicacion.patio_id = patio.id
	WHERE
		pplxubicacion.estado = 1 AND (pplxplanilla.estado = 1 OR ppl.id NOT IN (SELECT PPL_id_PPL_id FROM gestor_pplxplanilla))
	ORDER BY ppl.nui;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_PPLxPlanilla` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_PPLxPlanilla`(nui INT)
BEGIN
	SELECT
		ppl.nui,
		ppl.td,
		ppl.nombre,
		planilla.nombre_actividad AS actividad,
		pplxplanilla.fehca_inicio AS fecha_inicio,
		IF(pplxplanilla.fecha_final IS NULL, 'Actualmente', pplxplanilla.fecha_final) AS fecha_final,
		IF(pplxplanilla.estado = 1, 'Actual', 'No Actual') AS estado
	FROM
		gestor_pplxplanilla AS pplxplanilla
			INNER JOIN
		gestor_ppl AS ppl ON pplxplanilla.PPL_id_PPL_id = ppl.id
			INNER JOIN
		gestor_planilla AS planilla ON pplxplanilla.planilla_id_planilla_id = planilla.id
	WHERE
		ppl.nui=nui
	ORDER BY estado DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_PPLxUbicacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_PPLxUbicacion`(nui INT)
BEGIN
	SELECT
		ppl.nui,
		ppl.td,
		ppl.nombre,
		patio.patio,
		ubicacion.piso,
		ubicacion.pasillo,
		ubicacion.celda,
		pplxubicacion.fecha_ubicacion,
		IF(pplxubicacion.estado = 1, 'Actual', 'No Actual') AS estado
	FROM
		gestor_pplxubicacion AS pplxubicacion
			INNER JOIN
		gestor_ppl AS ppl ON pplxubicacion.PPL_id_ppl_id = ppl.id
			INNER JOIN
		gestor_ubicacion AS ubicacion ON pplxubicacion.Ubicacion_id_ubicacion_id = ubicacion.id
			INNER JOIN
		gestor_patio AS patio ON ubicacion.patio_id = patio.id
	WHERE
		ppl.nui=nui
	ORDER BY ppl.nui;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_ppl_segun_actividad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_ppl_segun_actividad`(actividad VARCHAR(80))
BEGIN
	SELECT 
		ppl.nui,
		ppl.nombre,
		planilla.nombre_actividad,
		patio.patio
	FROM
		gestor_ppl AS ppl
			INNER JOIN
		gestor_pplxplanilla AS pplxplanilla ON ppl.id = PPL_id_PPL_id
			INNER JOIN
		gestor_planilla AS planilla ON pplxplanilla.planilla_id_planilla_id = planilla.id
			INNER JOIN
		gestor_pplxubicacion AS pplxubicacion ON ppl.id = pplxubicacion.PPL_id_ppl_id
			INNER JOIN
		gestor_ubicacion AS ubicacion ON pplxubicacion.Ubicacion_id_ubicacion_id = ubicacion.id
			INNER JOIN
		gestor_patio AS patio ON ubicacion.patio_id = patio.id
	WHERE
		planilla.nombre_actividad = actividad AND (pplxubicacion.estado = 1 AND pplxplanilla.estado = 1); 	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_ppl_segun_patio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_ppl_segun_patio`(patio VARCHAR(45))
BEGIN
	SELECT 
		ppl.nui,
		ppl.nombre,
		IF(planilla.nombre_actividad IS NULL,'Actividad No Asignada',planilla.nombre_actividad) AS nombre_actividad,
		patio.patio
	FROM
		gestor_ppl AS ppl
			LEFT JOIN
		gestor_pplxplanilla AS pplxplanilla ON ppl.id = PPL_id_PPL_id
			LEFT JOIN
		gestor_planilla AS planilla ON pplxplanilla.planilla_id_planilla_id = planilla.id
			INNER JOIN
		gestor_pplxubicacion AS pplxubicacion ON ppl.id = pplxubicacion.PPL_id_ppl_id
			INNER JOIN
		gestor_ubicacion AS ubicacion ON pplxubicacion.Ubicacion_id_ubicacion_id = ubicacion.id
			INNER JOIN
		gestor_patio AS patio ON ubicacion.patio_id = patio.id
	WHERE
		patio.patio = patio AND pplxubicacion.estado = 1 AND (pplxplanilla.estado = 1 OR ppl.id NOT IN (SELECT PPL_id_PPL_id FROM gestor_pplxplanilla));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-05 19:31:06
