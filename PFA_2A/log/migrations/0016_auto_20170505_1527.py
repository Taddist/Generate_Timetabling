# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-05-05 14:27
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('log', '0015_filecsv'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='filecsv',
            name='semaine',
        ),
        migrations.RemoveField(
            model_name='filecsv',
            name='user',
        ),
        migrations.DeleteModel(
            name='FileCsv',
        ),
    ]