

DELIMITER //

CREATE  TRIGGER control_cupos_por_planilla before INSERT ON gestor_pplxplanilla

FOR EACH ROW

BEGIN
    declare v_total  int;
    declare v_asignado  int;
    declare v_id_nuevo  int;
    declare v_id_anterior  int;
    declare patio_actual VARCHAR(45);
    
    SELECT
		patio.id
	INTO patio_actual
	FROM
		gestor_pplxubicacion AS pplxubicacion
			INNER JOIN
		gestor_ppl AS ppl ON pplxubicacion.PPL_id_ppl_id = ppl.id
			INNER JOIN
		gestor_ubicacion AS ubicacion ON pplxubicacion.Ubicacion_id_ubicacion_id = ubicacion.id
			INNER JOIN
		gestor_patio AS patio ON ubicacion.patio_id = patio.id
	WHERE
		ppl.id=NEW.PPL_id_PPL_id AND pplxubicacion.estado=1;
        
	SELECT
		patioxplanilla.id,
        patioxplanilla.cupo_maximo,
        patioxplanilla.cupos_asignados
	INTO v_id_nuevo,v_total,v_asignado
	FROM
		gestor_patioxplanilla AS patioxplanilla
			INNER JOIN
		gestor_pplxplanilla AS pplxplanilla ON pplxplanilla.id = patioxplanilla.planilla_id
			INNER JOIN
		gestor_patio AS patio ON patio.id = patioxplanilla.patio_id
			INNER JOIN
		gestor_planilla AS planilla ON planilla.id = pplxplanilla.planilla_id_planilla_id
			INNER JOIN
		gestor_ppl AS ppl ON ppl.id = pplxplanilla.PPL_id_PPL_id
	WHERE
		patioxplanilla.planilla_id = NEW.planilla_id_planilla_id AND patio.id = patio_actual;
	
	SELECT 
		planilla_id_planilla_id
        INTO v_id_anterior
		FROM 
		gestor_pplxplanilla AS pplxplanilla
	WHERE
		NEW.PPL_id_PPL_id = pplxplanilla.PPL_id_PPL_id AND pplxplanilla.estado = 1;

    
	IF v_total>v_asignado THEN
    	UPDATE `gestor_patioxplanilla` set `gestor_patioxplanilla`.`cupos_asignados`=v_asignado+1 
    		WHERE `gestor_patioxplanilla`.`id`=v_id_nuevo;
		UPDATE `gestor_patioxplanilla` set `gestor_patioxplanilla`.`cupos_asignados`=v_asignado-1 
    		WHERE `gestor_patioxplanilla`.`planilla_id`=v_id_anterior AND `gestor_patioxplanilla`.`patio_id` = patio_actual;
    	
    ELSE 
    	SIGNAL sqlstate '45002' set message_text = "supera el maximo de este tipo de  actividad disponibles para el patio";
    END IF;

END//

DELIMITER ;

DROP TRIGGER control_cupos_por_planilla;

