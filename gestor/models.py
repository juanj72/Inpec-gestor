from django.db import models

# Create your models here.


class Patio(models.Model):
    patio = models.CharField(max_length=45)
    cupo_maximo_actividades = models.IntegerField()
    cupos_asignados = models.IntegerField()
    def __str__(self):
        return self.patio


class Ubicacion(models.Model):
    # Modelo de la tabla Ubicacion
    patio = models.ForeignKey(Patio, on_delete=models.CASCADE)
    piso = models.IntegerField()
    pasillo = models.IntegerField()
    celda = models.IntegerField()
    cmu = models.IntegerField(null=True)
    cau = models.IntegerField(null=True)
    cdu = models.IntegerField(null=True)

    def __str__(self):
        return self.patio


class PPL(models.Model):
    # Modelo de la tabla PPL
    td = models.IntegerField()
    nui = models.IntegerField()
    nombre = models.CharField(max_length=100)
    documento = models.IntegerField()
    fecha_nacimiento = models.DateField()
    fase_tratamiento = models.CharField(max_length=50)

    def __str__(self):
        return self.nombre


class PPLxUbicacion(models.Model):
    # Modelo de la tabla intermedia PPLxUbicacion
    PPL_id_ppl = models.ForeignKey(PPL, on_delete=models.CASCADE)
    Ubicacion_id_ubicacion = models.ForeignKey(
        Ubicacion, on_delete=models.CASCADE)
    fecha_ubicacion = models.DateField()
    estado = models.IntegerField(default=1)


class Proyecto(models.Model):
    # Modelo de la tabla Proyecto
    nombre_proyecto = models.CharField(max_length=50)
    descripcion_proyecto = models.CharField(max_length=80, null=True)






class Actividad(models.Model):
    # Modelo de la tabla Actividad
    proyecto_id_proyecto = models.ForeignKey(
        Proyecto, on_delete=models.CASCADE)
    codigo_actividad = models.CharField(max_length=50)
    nombre_actividad = models.CharField(max_length=80)
    programa = models.CharField(max_length=50)
    cma = models.IntegerField()
    caa = models.IntegerField()
    cda = models.IntegerField()

    def __str__(self):
        return self.nombre_actividad


class Planilla(models.Model):
    # Modelo de la tabla Planilla
    actividad_id_actividad = models.ForeignKey(
        Actividad, on_delete=models.CASCADE)
    codigo_planilla = models.CharField(max_length=45)
    nombre_planilla = models.CharField(max_length=50)
    nombre_actividad = models.CharField(max_length=80)
    cmp = models.IntegerField()
    cap = models.IntegerField()
    cdp = models.IntegerField()

    def __str__(self):
        return self.nombre_actividad



class PatioxPlanilla(models.Model):
    patio = models.ForeignKey(Patio, on_delete=models.CASCADE)
    planilla = models.ForeignKey(Planilla, on_delete=models.CASCADE)
    cupo_maximo = models.IntegerField()
    cupos_asignados = models.IntegerField()



class PPLxPlanilla(models.Model):
    # Modelo de la tabla intermedia PPLxPlanilla
    planilla_id_planilla = models.ForeignKey(
        Planilla, on_delete=models.CASCADE)
    PPL_id_PPL = models.ForeignKey(PPL, on_delete=models.CASCADE)
    estado = models.IntegerField(default=1)
    fehca_inicio = models.DateField()
    fecha_final = models.DateField(null=True)



