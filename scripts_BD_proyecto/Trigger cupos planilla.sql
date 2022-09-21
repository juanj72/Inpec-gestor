DELIMITER //
CREATE TRIGGER actualizar_planilla BEFORE INSERT ON gestor_pplxplanilla
FOR EACH ROW BEGIN
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
END //
DELIMITER ;

DROP TRIGGER actualizar_planilla;