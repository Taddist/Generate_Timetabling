# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-06-26 13:36
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('log', '0027_auto_20170626_1335'),
    ]

    operations = [
        migrations.CreateModel(
            name='SubActivity',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('element', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='log.Subject')),
                ('groupe', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='log.Group')),
                ('semaine', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='log.Semaine')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
