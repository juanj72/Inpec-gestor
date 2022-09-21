DELIMITER //

CREATE  PROCEDURE consultar_cupos_actividades_disponibles_patio  (in nombre VARCHAR(100))


BEGIN

SELECT pl.nombre_actividad,pxp.cupo_maximo,pxp.cupos_asignados,pxp.cupo_maximo-pxp.cupos_asignados 'cupos disponibles'
FROM gestor_patio as p 
INNER JOIN gestor_patioxplanilla AS pxp  ON p.id=pxp.patio_id
INNER JOIN gestor_planilla AS pl ON pxp.planilla_id=pl.id
WHERE (pxp.cupo_maximo-pxp.cupos_asignados) <> 0 AND p.patio=nombre;

END//

DELIMITER ;