USE inpec_gestor;

DELIMITER //
CREATE PROCEDURE `mostrar_PPLxPlanilla`(nui INT)
BEGIN
	IF nui IN (SELECT gestor_ppl.nui FROM gestor_pplxplanilla INNER JOIN gestor_ppl ON gestor_ppl.id = gestor_pplxplanilla.PPL_id_PPL_id) THEN
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
	ELSE 
    	SELECT
			ppl.nui,
			ppl.td,
			ppl.nombre,
            planilla.nombre_actividad AS actividad
		FROM
			gestor_ppl AS ppl
				LEFT JOIN
			gestor_pplxplanilla AS pplxplanilla ON ppl.id = pplxplanilla.PPL_id_PPL_id
				LEFT JOIN
			gestor_planilla AS planilla ON pplxplanilla.planilla_id_planilla_id = planilla.id
		WHERE
			ppl.nui=nui AND ppl.id NOT IN (SELECT PPL_id_PPL_id FROM gestor_pplxplanilla);
	END IF;
END //
DELIMITER ;