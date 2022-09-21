USE inpec_gestor;

DELIMITER //
CREATE  TRIGGER control_cupos BEFORE INSERT ON gestor_pplxplanilla
FOR EACH ROW BEGIN
    declare v_total  int;
    declare v_asignado  int;
    declare v_id  int;
        
	SELECT 
		patio.id,
		patio.cupo_maximo_actividades,
		patio.cupos_asignados
        INTO v_id , v_total , v_asignado
	FROM
		gestor_pplxubicacion AS pplxubicacion
			INNER JOIN
		gestor_ppl AS ppl ON pplxubicacion.PPL_id_ppl_id = ppl.id
			INNER JOIN
		gestor_ubicacion AS ubicacion ON pplxubicacion.Ubicacion_id_ubicacion_id = ubicacion.id
			INNER JOIN
		gestor_patio AS patio ON ubicacion.patio_id = patio.id
	WHERE
		ppl.id = new.PPL_id_PPL_id AND pplxubicacion.estado = 1;
        
	IF v_asignado<v_total THEN
		IF NEW.PPL_id_PPL_id NOT IN (SELECT PPL_id_PPL_id FROM gestor_pplxplanilla WHERE estado=1) THEN
			UPDATE gestor_patio set gestor_patio.cupos_asignados=gestor_patio.cupos_asignados+1 
				WHERE gestor_patio.id=v_id;
		END IF;
    ELSE 
    	SIGNAL sqlstate '45001' set message_text = "supera el maximo de actividades disponibles para el patio";
    END IF;
END//
DELIMITER ;

DROP TRIGGER control_cupos;