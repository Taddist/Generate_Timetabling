# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-05-08 17:31
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('log', '0020_freetime'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='freetime',
            name='timeslote',
        ),
        migrations.RemoveField(
            model_name='freetime',
            name='user',
        ),
        migrations.DeleteModel(
            name='FreeTime',
        ),
    ]
