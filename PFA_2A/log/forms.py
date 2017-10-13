#log/forms.py
from django.contrib.auth.forms import AuthenticationForm 
from django import forms
from .models import Year , Filiere ,Group, Room ,Subject  , Timeslote ,Tag, Notification , Contact,TypeExam,Exam,TypeElement,FileCsv,Semaine,FreeTime
from django.core.exceptions import ValidationError

class LoginForm(AuthenticationForm):
    username = forms.CharField(label="Username", max_length=30, 
                               widget=forms.TextInput(attrs={'class': 'form-control', 'name': 'username'}))
    password = forms.CharField(label="Password", max_length=30, 
                               widget=forms.PasswordInput(attrs={'class': 'form-control', 'name': 'password'}))



class ExamForm(forms.ModelForm):

	class Meta :
		model=Exam
		
		exclude = ('user',)
		labels={
			'element' : ("Element  "),
			'typeExam' : ("Type d'exam :"),
			'groupe' : ("Groupe :"),
		}



class FileForm(forms.ModelForm):
	file = forms.FileField(label='Select a file',widget=forms.FileInput(attrs={'accept': ".csv"}))
	class Meta :
		model=FileCsv
		fields=('semaine','file',)
		labels={
			'semaine' : ("Semaine  "),
			'file' : (""),
		}



class ContactForm(forms.ModelForm):
	class Meta : 
		model=Contact
		fields=('subject','message',)
		labels={
			'subject' :("Subject "),
			'message' :("")
		}




class FreeTimeForm(forms.ModelForm):
	class Meta:
		model=FreeTime
		fields=('timeslote','semaine')
		labels={
			'semaine' : ("Semaine"),
			'timeslote' : ("Créneau libre"),
			
		}


class SemaineForm(forms.ModelForm):
	class Meta :
		model=Semaine
		fields=('semaine',)
		labels={
		'semaine':("Choisissez une semaine"),
		}