LEER:

1. Nosotros los del backend debemos tener el mismo nombre de la BD y por lo tanto debemos crear una base de datos en workbench
con el mismo nombre:

inpec_gestor

2. Lo unico que cada uno de nosotros deberá modificar es el puerto de MySQL dao por el Xampp, para ello en settings.py
deben buscar el siguiente bloque de codigo y modificar exclusivamente donde dice PORT

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'inpec_gestor',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': 'localhost',
        'PORT': 'Coloca Tu Puerto' <------
    }
}
```

3. Si aun no hacen la migración del modelo

    - intalar paquete MySQL client con:

        ```
        pip install mysqlclient
        ```

    - Luego de haber creado ya la BD en workbench y cambiar el puerto con lo indicado en el paso 2, debes migrar el
    modelo con:

        ```
        python manage.py migrate
        ```

GRACIAS!!