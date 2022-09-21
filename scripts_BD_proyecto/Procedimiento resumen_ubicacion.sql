USE inpec_gestor;

DELIMITER //
CREATE PROCEDURE `resumen_ubicacion`()
BEGIN
	SELECT 
		patio.patio, 
        SUM(ubicacion.cau) AS asignados_patio, 
        ROUND((SUM(ubicacion.cau)/36)*100, 2) AS porcentaje_cupo
	FROM 
		gestor_patio AS patio
			INNER JOIN
		gestor_ubicacion AS ubicacion ON patio.id = ubicacion.patio_id
	GROUP BY patio.patio;
END //
DELIMITER ;

CALL resumen_ubicacion;