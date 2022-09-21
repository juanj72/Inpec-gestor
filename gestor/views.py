from django.contrib import messages
from django.db import connection
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect
from .models import *
from django.utils.datastructures import MultiValueDictKeyError
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
#import pandas as pd
from datetime import datetime

# Create your views here.


@login_required
def inicio(request):

    return render(request, 'inicio.html')


@login_required
def mostrarPPL(request):

    with connection.cursor() as cursor:  # Activamos un cursor para las consultas a la BD

        # Ejecutar una linea SQL En este caso llamamos un procedimiento almacenado
        cursor.execute('CALL mostrar_ppl()')

        columns = []  # Para guardar el nombre de las columnas

        # Recorrer la descripcion (Nombre de la columna)
        for column in cursor.description:

            columns.append(column[0])  # Guardando el nombre de las columnas

        data = []  # Lista con los datos que vamos a enviar en JSON

        for row in cursor.fetchall():  # Recorremos las fila guardados de la BD

            # Insertamos en data un diccionario
            data.append(dict(zip(columns, row)))

        cursor.close()  # Se cierra el cursor para que se ejecute el procedimiento almacenado

        connection.commit()  # Enviamos la sentencia a la BD
        connection.close()  # Cerramos la conección

        # context = {
        #     "data": data,
        # }

    # Respondemos con un Json que es lo que recibe el Front-End
    return render(request, 'tablappl.html', {'data': data})


@login_required
def mostrarPPLxUbicacion(request):

    try:
        with connection.cursor() as cursor:

            if 'nui' in request.GET:
                nui = request.GET['nui']
            else:
                nui = 62503

            cursor.execute(f'CALL mostrar_PPLxUbicacion({nui})')

            columns = []

            for column in cursor.description:

                columns.append(column[0])

            data = []

            for row in cursor.fetchall():

                data.append(dict(zip(columns, row)))

            cursor.close()

            connection.commit()
            connection.close()

            if data[0]['patio'] == None:
                estado = False
                nombre_ppl = data[0]['nombre']
                nui = data[0]['nui']
            else:
                estado = True
                nombre_ppl = data[0]['nombre']
                nui = data[0]['nui']

            # print(data)

        return render(request, 'tablapatios.html', {
            'data': data,
            'dato_personal': {'nombre_ppl': nombre_ppl, 'nui': nui},
            'estado': estado,
            'error': False
        })

    except:
        return render(request, 'tablapatios.html', {
            'error': True
        })


@login_required
def mostrarPPLxPlanilla(request):

    try:
        with connection.cursor() as cursor:

            if 'nui' in request.GET:
                nui = request.GET['nui']
            else:
                nui = 62503

            cursor.execute(f'CALL mostrar_PPLxPlanilla({nui})')

            columns = []

            for column in cursor.description:

                columns.append(column[0])

            data = []

            for row in cursor.fetchall():

                data.append(dict(zip(columns, row)))

            cursor.close()

            connection.commit()
            connection.close()

            if data[0]['actividad'] == None:
                estado = False
                nombre_ppl = data[0]['nombre']
                nui = data[0]['nui']
            else:
                estado = True
                nombre_ppl = data[0]['nombre']
                nui = data[0]['nui']

            # print(data)

        return render(request, 'tablaactividades.html', {
            'data': data,
            'dato_personal': {'nombre_ppl': nombre_ppl, 'nui': nui},
            'estado': estado,
            'error': False
        })

    except:
        return render(request, 'tablaactividades.html', {
            'error': True
        })


@login_required
def mostrarPPLxPatio(request, patio='colombia'):

    try:
        with connection.cursor() as cursor:

            cursor.execute(f'CALL mostrar_ppl_segun_patio("{patio}")')

            columns = []

            for column in cursor.description:

                columns.append(column[0])

            data = []

            for row in cursor.fetchall():

                data.append(dict(zip(columns, row)))

            cursor.close()

            connection.commit()
            connection.close()

            nombre_patio = patio

        return render(request, 'pplxpatio.html', {
            'data': data,
            'nombre_patio': nombre_patio,
            'error': False
        })

    except:
        return render(request, 'pplxpatio.html', {
            'error': True
        })


@login_required
def mostrarPPLxActividad(request, actividad='reciclaje'):

    try:

        with connection.cursor() as cursor:

            cursor.execute(f'CALL mostrar_ppl_segun_actividad("{actividad}")')

            columns = []

            for column in cursor.description:

                columns.append(column[0])

            data = []

            for row in cursor.fetchall():

                data.append(dict(zip(columns, row)))

            cursor.close()

            connection.commit()
            connection.close()
            print(data)
            nombre_actividad = actividad

        return render(request, 'pplxactividad.html', {
            'data': data,
            'nombre_actividad': nombre_actividad,
            'error': False
        })
    except:
        return render(request, 'pplxactividad.html', {
            'error': True
        })


@login_required
def asignarActividad(request):

    try:
        with connection.cursor() as cursor:

            if request.method == "GET":

                nui = request.GET['nui']
                print(nui)

                actividad = request.GET['actividad']
                print(actividad)
                cursor.execute(f'CALL asignar_actividad({nui}, "{actividad}")')

                cursor.close()

                connection.commit()
                connection.close()

                messages.success(
                    request, f"Actividad {actividad} asignada al NUI {nui}")
                return render(request, 'asignar.html', {'nui':nui})

    except:
        print("mal")
        messages.error(request, f"No hay cupo en la actividad")
        return render(request, 'asignar.html', {'nui':nui})

@login_required
def vista_asignar(request, nui):
    return render(request, 'asignar.html', {'nui':nui})


@login_required
def prueba(request):

    return render(request, 'login.html',)


@login_required
def cuposCeldaDisponible(request, patio="colombia"):

    with connection.cursor() as cursor:

        cursor.execute(f'CALL mostrar_cd_celdas("{patio}")')

        columns = []

        for column in cursor.description:

            columns.append(column[0])

        data = []

        for row in cursor.fetchall():

            data.append(dict(zip(columns, row)))

        cursor.close()

        connection.commit()
        connection.close()

        nombre_patio = patio

        return render(request, 'cuposxpatio.html', {
            'data': data,
            'nombre_patio': nombre_patio
        })


@login_required
def mostrarActividadxCupo(request, patio = 'peru'):

    try:
        with connection.cursor() as cursor:

            cursor.execute(
                f'CALL consultar_cupos_actividades_disponibles_patio("{patio}")')

            columns = []

            for column in cursor.description:

                columns.append(column[0])

            data = []

            for row in cursor.fetchall():

                data.append(dict(zip(columns, row)))

            cursor.close()

            connection.commit()
            connection.close()

            nombre_patio = patio

        return render(request, 'cuposactividad.html', {
            'data': data,
            'nombre_patio': nombre_patio,
            'error': False
        })
    except:
        return render(request, 'tablaactividades.html', {
            'error': True
        })


@login_required
def resumenUbicacion(request):

    with connection.cursor() as cursor:

        cursor.execute('CALL resumen_ubicacion()')

        columns = []

        for column in cursor.description:

            columns.append(column[0])

        data = []

        for row in cursor.fetchall():

            data.append(dict(zip(columns, row)))

        cursor.close()

        connection.commit()
        connection.close()
        context = {
            "data": data,
        }

    return render(request, 'resumenxubicacion.html', context)


@login_required
def resumenInicio(request):

    with connection.cursor() as cursor:

        cursor.execute('CALL resumen_inicio()')

        columns = []

        for column in cursor.description:

            columns.append(column[0])

        data = []

        for row in cursor.fetchall():

            data.append(dict(zip(columns, row)))

        cursor.close()

        connection.commit()
        connection.close()

        context = {
            "data": data
        }

    return render(request, 'inicio.html', context)

@login_required
def info_ppl(request, nui):

    with connection.cursor() as cursor:

        cursor.execute(f'CALL informacion_ppl({nui})')

        columns = []

        for column in cursor.description:

            columns.append(column[0])

        data = []

        for row in cursor.fetchall():

            data.append(dict(zip(columns, row)))

        cursor.close()

        connection.commit()
        connection.close()

        return render(request, 'info_ppl.html', {'data': data})


@login_required
def resumen_actividadxpatio(request):

    patios = []
    actividades = []

    with connection.cursor() as cursor2:

        cursor2.execute('SELECT nombre_actividad FROM gestor_planilla ')

        for row in cursor2.fetchall():

            actividades.append(row[0])

        cursor2.close()

        connection.commit()
        connection.close()

    consulta = "select p.patio,"
    for a in actividades:
        consulta = consulta + "SUM(CASE WHEN  pla.nombre_actividad='" + \
            a+"' THEN 	   pxp.cupos_asignados ELSE 0 END) AS "+a+","

    consulta = consulta + \
        "    SUM( pxp.cupos_asignados) AS total from gestor_patio P	INNER JOIN gestor_patioxplanilla pxp ON pxp.patio_id=p.id INNER JOIN   gestor_planilla pla ON pla.id=pxp.planilla_id GROUP BY p.patio"

    with connection.cursor() as cursor:

        cursor.execute(consulta)

        columns = []

        for column in cursor.description:

            columns.append(column[0])

        data = []

        for row in cursor.fetchall():

            data.append(dict(zip(columns, row)))

        cursor.close()

        connection.commit()
        connection.close()

    # cols=list(data[0].keys())
    # rows=[]

    # # for row in data:
    #   # print(list(row.values()))
    #    rows.append(list(row.values()))
    return render(request, 'resumenactividad.html', {'data': data})


def cerrar_sesion(request):

    logout(request)

    return redirect('/')


# def exportar_info(request, ruta='historial'):

#     data = [{'nombre': 'julio', 'edad': 12}, {'nombre': 'joswe', 'edad': 15}]
#     print('Exportado2')
#     data_json = pd.DataFrame(data)
#     print(data_json)
#     # fecha_actual = datetime.today().strftime('%Y/%m/%d %H:%M:%S')
#     data_json.to_excel(
#         rf'C:\Users\ANDRES TORRES\Downloads\Reporte-{ruta}.xlsx', index=False)
#     print('Exportado')
#     return HttpResponse('Reporte generado')
