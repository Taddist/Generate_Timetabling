from django.conf.urls import url
from . import views 



app_name = 'log'

urlpatterns=[
	url(r'^$', views.home, name='home'),
	url(r'^index$',views.index,name='index'),
	url(r'^declarerExam$',views.declarerExam,name='declarerExam'),
	url(r'^creerEmploi$',views.creerEmploi,name='creerEmploi'),
	url(r'^contacterAdmin$',views.contacterAdmin,name='contacterAdmin'),
	url(r'^emploiFile/supprimer/(?P<id_demande>[0-9]+)/$', views.supprimerfile, name='supprimerfile'),
	url(r'^emploiFile/modifier/(?P<id_demande>[0-9]+)/$', views.modifierfile, name='modifierfile'),
	url(r'^consulterEmploi$',views.consulterEmploi,name='consulterEmploi'),
	url(r'^emploiCreneau/supprimer/(?P<id_demande>[0-9]+)/$', views.supprimerCreneau, name='supprimerCreneau'),
	url(r'^consulterEmploiNext/(?P<id_demande>[0-9]+)/$',views.consulterEmploiNext,name='consulterEmploiNext'),
	url(r'^notification$',views.notification,name='notification'),
	url(r'^notification/supprimer/(?P<id_demande>[0-9]+)/$', views.supprimerNotification, name='supprimerNotification'),
	url(r'^rattrapage$',views.rattrapage,name='rattrapage'),
	url(r'^generation$',views.generation,name='generation')
	
]


