# Generated by Django 4.1 on 2022-08-12 20:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('tasks', '0006_alter_task_date_completed'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='task',
            name='date_completed',
        ),
    ]
