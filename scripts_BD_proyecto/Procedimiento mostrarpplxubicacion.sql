USE inpec_gestor;

DELIMITER //
CREATE PROCEDURE `mostrar_PPLxUbicacion`(nui INT)
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
END //
DELIMITER ;