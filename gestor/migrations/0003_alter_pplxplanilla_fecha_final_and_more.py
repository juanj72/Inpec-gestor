# Generated by Django 4.0.3 on 2022-04-05 23:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gestor', '0002_auto_20220404_0825'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pplxplanilla',
            name='fecha_final',
            field=models.DateField(null=True),
        ),
        migrations.AlterField(
            model_name='proyecto',
            name='descripcion_proyecto',
            field=models.CharField(max_length=80, null=True),
        ),
    ]
