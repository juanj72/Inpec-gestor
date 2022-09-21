CREATE DEFINER=`root`@`localhost` PROCEDURE `informacion_ppl`(nui INT)
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
		pplxubicacion.estado = 1 AND (pplxplanilla.estado = 1 OR ppl.id NOT IN (SELECT PPL_id_PPL_id FROM gestor_pplxplanilla)) AND ppl.nui =nui;
END