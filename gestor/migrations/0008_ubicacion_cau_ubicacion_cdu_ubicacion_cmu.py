# Generated by Django 4.0.3 on 2022-05-02 19:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gestor', '0007_patioxplanilla'),
    ]

    operations = [
        migrations.AddField(
            model_name='ubicacion',
            name='cau',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='ubicacion',
            name='cdu',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='ubicacion',
            name='cmu',
            field=models.IntegerField(null=True),
        ),
    ]
