# Generated by Django 4.1 on 2022-08-11 23:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tasks', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='task',
            name='duration',
            field=models.IntegerField(),
        ),
    ]
