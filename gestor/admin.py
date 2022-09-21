from django.contrib import admin
from .models import *

# Register your models here.

admin.site.register(Ubicacion)
admin.site.register(Planilla)
admin.site.register(PPL)
admin.site.register(PPLxPlanilla)
admin.site.register(Actividad)
admin.site.register(Proyecto)
admin.site.register(PPLxUbicacion)
admin.site.register(Patio)
admin.site.register(PatioxPlanilla)

