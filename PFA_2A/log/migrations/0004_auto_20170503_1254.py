# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-05-03 11:54
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('log', '0003_auto_20170503_1233'),
    ]

    operations = [
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tag', models.CharField(max_length=50)),
                ('room', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='log.Room')),
            ],
        ),
        migrations.CreateModel(
            name='Timeslote',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('jour', models.CharField(max_length=20)),
                ('horaire', models.CharField(max_length=20)),
            ],
        ),
        migrations.AddField(
            model_name='tag',
            name='timeslote',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='log.Timeslote'),
        ),
    ]