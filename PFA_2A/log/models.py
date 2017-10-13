from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
from django.core.exceptions import ValidationError
from adaptor.model import CsvDbModel


class Semaine(models.Model):
        semaine=models.CharField(max_length=5)
        date_debut=models.DateField()
        def __str__(self):
                return self.semaine
class Year(models.Model):
        annee=models.CharField(max_length=3)
        def __str__(self):
                return self.annee

class Filiere(models.Model):
        filiere=models.CharField(max_length=10)
        def __str__(self):
                return self.filiere

class Group(models.Model):
		groupe=models.CharField(max_length=10)
		def __str__(self):
				return self.groupe

class Subject(models.Model):
        element=models.CharField(max_length=500)
        def __str__(self):
                return self.element
# TP | ECRIT 
class TypeExam(models.Model):
		typeExam=models.CharField(max_length=50)
		def __str__(self):
			return self.typeExam
#COURS | TD | TP 			
class TypeElement(models.Model):
		typeElement=models.CharField(max_length=50)
		def __str__(self):
			return self.typeElement

class Timeslote(models.Model):
		jour=models.CharField(max_length=20)
		horaire=models.CharField(max_length=20)
		def __str__(self):
			return '%s %s' % (self.jour, self.horaire)

class Room(models.Model):
		salle=models.CharField(max_length=20)
		capacite=models.PositiveIntegerField()
		def __str__(self):
			return self.salle
			
class Tag(models.Model):
		tag=models.CharField(max_length=50)
		def __str__(self):
			return self.tag



class MyCsvModel(CsvDbModel):	
	class Meta:
		dbModel = Timeslote
		delimiter = ";"





class FreeTime(models.Model):
		user=models.ForeignKey(User,unique=False,on_delete=models.CASCADE,)
		timeslote=models.ForeignKey(Timeslote,unique=False,on_delete=models.CASCADE,)
		semaine=models.ForeignKey(Semaine,unique=False,on_delete=models.CASCADE,)
	  	







class FileCsv(models.Model):
		user=models.ForeignKey(User,unique=False,on_delete=models.CASCADE,)
		file=models.FileField(null=True,blank=True,)
		semaine=models.ForeignKey(Semaine,unique=False,on_delete=models.CASCADE,)
		date_upload=models.DateTimeField(auto_now_add=True, blank=True)
		def __str__(self):
			return '%s %s %s' % (self.user.first_name, self.user.last_name , self.semaine.semaine)




class Notification(models.Model):
		datenotif=models.DateTimeField(auto_now_add=True, blank=True)
		message=models.TextField()
		destinataire=models.ForeignKey(User,unique=False,on_delete=models.CASCADE,)
		def __str__(self):
			return '%s %s' % (self.destinataire, self.datenotif)

class Exam(models.Model):
	    user=models.ForeignKey(User,unique=False,on_delete=models.CASCADE,)
	    element=models.ForeignKey(Subject,unique=False,on_delete=models.CASCADE,)
	    typeExam=models.ForeignKey(TypeExam,unique=False,on_delete=models.CASCADE,)
	    groupe=models.ForeignKey(Group,unique=False,on_delete=models.CASCADE,)
	    def __str__(self):
	    	return '%s %s %s' % (self.element, self.typeExam, self.groupe)

class Contact(models.Model):
	    user=models.ForeignKey(User,unique=False,on_delete=models.CASCADE,)
	    date=models.DateTimeField(auto_now_add=True, blank=True)
	    message=models.TextField()
	    subject=models.CharField(max_length=50)
	    def __str__(self):
	    	return '%s %s' % (self.user.first_name, self.subject)


class TrashNotification(models.Model):
		datenotif=models.DateTimeField()
		message=models.TextField()
		destinataire=models.ForeignKey(User,unique=False,on_delete=models.CASCADE,)
		date_delete=models.DateTimeField(auto_now_add=True, blank=True)
		def __str__(self):
			return '%s %s' % (self.destinataire, self.datenotif)



class SubActivity(models.Model):
		user=models.ForeignKey(User,unique=False,on_delete=models.CASCADE,)
		groupe=models.ForeignKey(Group,unique=False,on_delete=models.CASCADE,)
		element=models.ForeignKey(Subject,unique=False,on_delete=models.CASCADE,)
		semaine=models.ForeignKey(Semaine,unique=False,on_delete=models.CASCADE,)
		typeelement=models.ForeignKey(TypeElement,unique=False,on_delete=models.CASCADE,)
		
