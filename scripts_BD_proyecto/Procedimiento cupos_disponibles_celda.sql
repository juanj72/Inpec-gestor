USE inpec_gestor;

DELIMITER //
CREATE PROCEDURE `mostrar_cd_celdas`(patio VARCHAR(45))
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
END //
DELIMITER ;