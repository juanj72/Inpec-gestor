"""inpec URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from xml.etree.ElementInclude import include
from django.contrib import admin
from django.urls import path
from gestor import views
from django.contrib.auth import views as auth_views
from django.urls.conf import include


urlpatterns = [

    path('admin/', admin.site.urls, name='adminsite'),

    # url de front------------------------------------------------
    path('', views.resumenInicio, name=""),
    # ---------------------------------------------------------------

    path('mostrarPPL/', views.mostrarPPL, name='mostrarppl'),
    path('mostrarPPLxUbicacion/', views.mostrarPPLxUbicacion,name='historialubicaciones'),
    path('mostrarPPLxUbicacion/', views.mostrarPPLxUbicacion, name='historialubicaciones'),
    path('mostrarPPLxPlanilla/', views.mostrarPPLxPlanilla, name='historialactividades'),
    path('mostrarPPLxActividad/', views.mostrarPPLxActividad, name='pplxactividad'),
    path('mostrarPPLxActividad/<actividad>', views.mostrarPPLxActividad, name='pplxactividad'),
    path('mostrarPPLxPatio/', views.mostrarPPLxPatio, name='pplxpatio'),
    path('mostrarPPLxPatio/<patio>', views.mostrarPPLxPatio, name='pplxpatio'),
    path('cuposCeldaDisponible/', views.cuposCeldaDisponible, name='cuposxcelda'),
    path('cuposCeldaDisponible/<patio>', views.cuposCeldaDisponible, name='cuposxcelda'),
    path('mostrarActividadxCupo/', views.mostrarActividadxCupo, name='cuposxactividad'),
    path('mostrarActividadxCupo/<patio>', views.mostrarActividadxCupo, name='cuposxactividad'),
    path('asignar_actividad/', views.asignarActividad, name='asignar'),
    path('resumenxubicacion/', views.resumenUbicacion, name='resumenxubicacion'),
    path('resumen_actividadxpatio/',views.resumen_actividadxpatio, name="resumenactividad"),
    path('prueba', views.prueba, name="prueba"),
    path('accounts/', include('django.contrib.auth.urls')),
    path('salir/', views.cerrar_sesion, name="cerrar"),
    path('asignar/<nui>', views.vista_asignar, name="vista_asignar"),
    # path('exportar/', views.exportar_info),
    path('info_ppl/<nui>', views.info_ppl, name='info_ppl'),

]
