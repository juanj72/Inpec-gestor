USE inpec_gestor;

DELIMITER //
CREATE PROCEDURE `resumen_inicio`()
BEGIN
	DECLARE total_ppls INT;
    DECLARE porcentaje_cupos DOUBLE;
    DECLARE ppls_con_actividad INT;
    
	SELECT 
		COUNT(ppl.id),
        (COUNT(ppl.id)/360)*100
        INTO total_ppls,porcentaje_cupos
	FROM
		gestor_ppl AS ppl;
        
	SELECT
		COUNT(pplxplanilla.id)
        INTO ppls_con_actividad
	FROM
		gestor_pplxplanilla AS pplxplanilla
	WHERE pplxplanilla.estado = 1;
	
    SELECT total_ppls, porcentaje_cupos, ppls_con_actividad;
END //
DELIMITER ;

CALL resumen_inicio;