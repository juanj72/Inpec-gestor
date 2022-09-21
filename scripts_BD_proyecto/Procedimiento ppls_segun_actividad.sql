USE inpec_gestor;

DELIMITER //
CREATE PROCEDURE `mostrar_ppl_segun_actividad`(actividad VARCHAR(80))
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
END //
DELIMITER ;