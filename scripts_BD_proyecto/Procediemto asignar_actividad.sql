DELIMITER //
CREATE PROCEDURE `asignar_actividad`(nui INT, actividad VARCHAR(80))
BEGIN
	DECLARE ppl_id INT;
    DECLARE planilla_id INT;
    
    SELECT ppl.id INTO ppl_id FROM gestor_ppl AS ppl WHERE nui = ppl.nui;
    
    SELECT planilla.id INTO planilla_id FROM gestor_planilla AS planilla WHERE actividad = planilla.nombre_actividad;
    
	
    
	INSERT INTO gestor_pplxplanilla (fehca_inicio, PPL_id_PPL_id, planilla_id_planilla_id) VALUES (NOW(), ppl_id, planilla_id);
    
    UPDATE gestor_pplxplanilla SET gestor_pplxplanilla.estado = 0, gestor_pplxplanilla.fecha_final = NOW() WHERE ppl_id = gestor_pplxplanilla.PPL_id_PPL_id AND gestor_pplxplanilla.estado=1 AND gestor_pplxplanilla.planilla_id_planilla_id <> planilla_id;
END //
DELIMITER ;