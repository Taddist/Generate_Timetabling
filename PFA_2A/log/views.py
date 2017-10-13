
from django import forms
from django.db import models
from django.contrib.auth.models import User
from django.shortcuts import get_object_or_404, render,render_to_response
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
import datetime
from datetime import timedelta
from django.utils import timezone
from django.forms import ModelForm
from django.contrib.auth.decorators import login_required
from django.utils.timezone import utc
from .models import Year ,MyCsvModel, Filiere ,Group, Room ,Subject ,Exam , Timeslote ,Tag, Notification , Contact,FileCsv,Semaine,FreeTime,TrashNotification,SubActivity
from .forms import ExamForm ,FileForm ,ContactForm ,FreeTimeForm ,SemaineForm
from django.shortcuts import redirect
from reportlab.pdfgen import canvas
from django.db.models import Sum , Count
from django.core.exceptions import ValidationError
from adaptor.model import CsvModel
import os
import csv
from constraint import *



@login_required(login_url="login/")
def home(request):
	notif=Notification.objects.filter(destinataire_id__exact=request.user.id)
	SumNotif=notif.count()
	return render(request,"home.html",locals())

#Page Index    
def index(request):
	ListExam = Exam.objects.all()
	return render(request, 'index.html', locals())

#Page pour declarer un exam 
def declarerExam(request):
	notif=Notification.objects.filter(destinataire_id__exact=request.user.id)
	SumNotif=notif.count()
	if request.method == "POST":
		form = ExamForm(request.POST)
		if form.is_valid():
			exam = form.save(commit=False)
			exam.user_id=request.user.id
			exam.save()
			envoi = True
			form = ExamForm()
	else:
		form = ExamForm()

	return render(request, 'declarerExam.html',locals())






def creerEmploi(request):
	#in html to have the url of a file we use {{file.url}}
	#in html to have the path of a file we use {{file.path}}
	#in html to have the name of a file we use {{file.name}}
	#{{ form.as_ul }} | {{ form.as_table }} | form.as_ul
	# window.location="/";
	notif=Notification.objects.filter(destinataire_id__exact=request.user.id)
	SumNotif=notif.count()
	now = timezone.now().date()

	if request.method == "POST":
		
		form = FileForm(request.POST,request.FILES)
		formFree = FreeTimeForm(request.POST)
		if "file" in request.POST:
			if form.is_valid():
				file = form.save(commit=False)
				file.user_id=request.user.id
				name_file=str(request.FILES['file'])
				semaine_file=Semaine.objects.get(semaine=file.semaine)
				if(semaine_file.date_debut>now):
					if not os.path.exists('media/' + name_file):
						file.save()
						SuccesSave= True
						form = FileForm()
						import_db(request.user.id,file.semaine,str(request.FILES['file']))
					else :
						erreurFileName=True
				else : 
					semaineNotValid=True
	
			else :
				erreurSave=True
		if "free" in request.POST:
			if formFree.is_valid():
				freet = formFree.save(commit=False)
				freet.user_id=request.user.id
				semaine=Semaine.objects.get(semaine=freet.semaine)
				
				if(semaine.date_debut>now):
					try:
						freetime=FreeTime.objects.get(semaine_id=freet.semaine,user_id=request.user.id,timeslote_id=freet.timeslote)
						erreurFree=True
					except FreeTime.DoesNotExist:
						freetime = None
						freet.save()
						envoi = True
						formFree = FreeTimeForm()
				else : 
					semaineNotValid=True

	else:

		form = FileForm()
		formFree = FreeTimeForm()

	fileList = FileCsv.objects.filter(user_id__exact=request.user.id).order_by('date_upload').reverse()
	exemple = FileCsv.objects.get(user_id__exact=1)

	return render(request, 'creerEmploi.html',locals())





	
def import_db(us_id,sem,filename):
	with open('media/' + filename, 'r') as f:
        	reader = csv.reader(f, delimiter=';')
        	for row in reader:
        		if row:
        			print(row)
        			x = Timeslote.objects.get(jour__exact=row[0],horaire__exact=row[1])
        			s=Semaine.objects.get(semaine__exact=sem)
        			print("object",x)
        			print("id",x.id)
        			print("id semaine ",s.id)
        			tmp = FreeTime(user_id=us_id ,timeslote_id=x.id,semaine_id=s.id)
			        tmp.save()
		

def consulterEmploi(request):
	notif=Notification.objects.filter(destinataire_id__exact=request.user.id)
	SumNotif=notif.count()
	if request.method == "POST":
		formS = SemaineForm(request.POST)
		if formS.is_valid():
			s = formS.save(commit=False)
			id_semaine=Semaine.objects.get(semaine__exact=s.semaine)
			
			formS = SemaineForm()

			try:
				
				
				
				freetime = FreeTime.objects.filter(user_id__exact=request.user.id,semaine_id=id_semaine).reverse()
				l=[]
				for i in range(0,20):
					l.append(-1)
		
				for ft in freetime :
			
					if(ft.timeslote.jour=="Lundi" and ft.timeslote.horaire=="8h-10h"):
						l.insert(0,ft.id)
					elif (ft.timeslote.jour=="Lundi" and ft.timeslote.horaire=="10h-12h"):
						l.insert(1,ft.id)
					elif (ft.timeslote.jour=="Lundi" and ft.timeslote.horaire=="14h-16h"):
						l.insert(3,ft.id)
					elif (ft.timeslote.jour=="Lundi" and ft.timeslote.horaire=="16h-18h"):
						l.insert(3,ft.id)

					elif (ft.timeslote.jour=="Mardi" and ft.timeslote.horaire=="8h-10h"):
						l.insert(4,ft.id)
					elif (ft.timeslote.jour=="Mardi" and ft.timeslote.horaire=="10h-12h"):
						l.insert(5,ft.id)
					elif (ft.timeslote.jour=="Mardi" and ft.timeslote.horaire=="14h-16h"):
						l.insert(6,ft.id)
					elif (ft.timeslote.jour=="Mardi" and ft.timeslote.horaire=="16h-18h"):
						l.insert(7,ft.id)
					

					elif (ft.timeslote.jour=="Mercredi" and ft.timeslote.horaire=="8h-10h"):
						l.insert(8,ft.id)
					elif (ft.timeslote.jour=="Mercredi" and ft.timeslote.horaire=="10h-12h"):
						l.insert(9,ft.id)


					elif (ft.timeslote.jour=="Jeudi" and ft.timeslote.horaire=="8h-10h"):
						l.insert(12,ft.id)
					elif (ft.timeslote.jour=="Jeudi" and ft.timeslote.horaire=="10h-12h"):
						l.insert(13,ft.id)
					elif (ft.timeslote.jour=="Jeudi" and ft.timeslote.horaire=="14h-16h"):
						l.insert(14,ft.id)
					elif (ft.timeslote.jour=="Jeudi" and ft.timeslote.horaire=="16h-18h"):
						l.insert(15,ft.id)


					elif (ft.timeslote.jour=="Vendredi" and ft.timeslote.horaire=="8h-10h"):
						l.insert(16,ft.id)
					elif (ft.timeslote.jour=="Vendredi" and ft.timeslote.horaire=="10h-12h"):
						l.insert(17,ft.id)
					elif (ft.timeslote.jour=="Vendredi" and ft.timeslote.horaire=="14h-16h"):
						l.insert(18,ft.id)
					elif (ft.timeslote.jour=="Vendredi" and ft.timeslote.horaire=="16h-18h"):
						l.insert(19,ft.id)

				
				
			except FreeTime.DoesNotExist:
				erreurSemaine=True
				
			
			
			

			
	else:
		formS = SemaineForm()

	
		
	
	return render(request, 'consulterEmploi.html',locals())


	

def contacterAdmin(request):
	notif=Notification.objects.filter(destinataire_id__exact=request.user.id)
	SumNotif=notif.count()
	if request.method == "POST":
		form = ContactForm(request.POST)
		if form.is_valid():
			contact = form.save(commit=False)
			contact.user_id=request.user.id
			contact.save()
			envoi = True
			form = ContactForm()
	else:
		form = ContactForm()

	return render(request, 'contacterAdmin.html',locals())



def supprimerfile(request,id_demande):	
	file=FileCsv.objects.get(id__exact=id_demande)
	file.delete()
	freetime=FreeTime.objects.filter(semaine_id=file.semaine,user_id=request.user.id)
	freetime.delete()
	os.remove('media/' +str(file.file))
	return redirect('/creerEmploi') 



def modifierfile(request,id_demande):

	return  render(request, 'modifierFile.html',locals())


def supprimerCreneau(request,id_demande):	

	freetime=FreeTime.objects.get(id__exact=id_demande)
	ob=Semaine.objects.get(id__exact=freetime.semaine_id)
	
	text = "/consulterEmploiNext/%s/" %ob.id
	freetime.delete()
	return redirect(text) 





def consulterEmploiNext(request,id_demande):
	notif=Notification.objects.filter(destinataire_id__exact=request.user.id)
	SumNotif=notif.count()

	try:
		freetime = FreeTime.objects.filter(user_id__exact=request.user.id,semaine_id=id_demande).reverse()


		l=[]
		for i in range(0,20):
			l.append(-1)
		for ft in freetime :
			
				
				print(ft.timeslote.jour)
				print(ft.timeslote.horaire)
				if(ft.timeslote.jour=="Lundi" and ft.timeslote.horaire=="8h-10h"):
					l.insert(0,ft.id)

				elif (ft.timeslote.jour=="Lundi" and ft.timeslote.horaire=="10h-12h"):
					l.insert(1,ft.id)
				
				elif (ft.timeslote.jour=="Lundi" and ft.timeslote.horaire=="14h-16h"):
					l.insert(3,ft.id)
				elif (ft.timeslote.jour=="Lundi" and ft.timeslote.horaire=="16h-18h"):
					l.insert(3,ft.id)

				elif (ft.timeslote.jour=="Mardi" and ft.timeslote.horaire=="8h-10h"):
					l.insert(4,ft.id)
				elif (ft.timeslote.jour=="Mardi" and ft.timeslote.horaire=="10h-12h"):
					l.insert(5,ft.id)
				elif (ft.timeslote.jour=="Mardi" and ft.timeslote.horaire=="14h-16h"):
					l.insert(6,ft.id)
				elif (ft.timeslote.jour=="Mardi" and ft.timeslote.horaire=="16h-18h"):
					l.insert(7,ft.id)

				elif (ft.timeslote.jour=="Mercredi" and ft.timeslote.horaire=="8h-10h"):
					l.insert(8,ft.id)
				elif (ft.timeslote.jour=="Mercredi" and ft.timeslote.horaire=="10h-12h"):
					l.insert(9,ft.id)

				elif (ft.timeslote.jour=="Jeudi" and ft.timeslote.horaire=="8h-10h"):
					l.insert(12,ft.id)
				elif (ft.timeslote.jour=="Jeudi" and ft.timeslote.horaire=="10h-12h"):
					l.insert(13,ft.id)
				elif (ft.timeslote.jour=="Jeudi" and ft.timeslote.horaire=="14h-16h"):
					l.insert(14,ft.id)
				elif (ft.timeslote.jour=="Jeudi" and ft.timeslote.horaire=="16h-18h"):
					l.insert(15,ft.id)

				elif (ft.timeslote.jour=="Vendredi" and ft.timeslote.horaire=="8h-10h"):
					l.insert(16,ft.id)
				elif (ft.timeslote.jour=="Vendredi" and ft.timeslote.horaire=="10h-12h"):
					l.insert(17,ft.id)
				elif (ft.timeslote.jour=="Vendredi" and ft.timeslote.horaire=="14h-16h"):
					l.insert(18,ft.id)
				elif (ft.timeslote.jour=="Vendredi" and ft.timeslote.horaire=="16h-18h"):
					l.insert(19,ft.id)

	except FreeTime.DoesNotExist:
		erreurSemaine=True


	return render(request, 'consulterEmploi.html',locals())

	

def notification(request):
	notif=Notification.objects.filter(destinataire_id__exact=request.user.id)
	SumNotif=notif.count()
	return render(request,'notification.html',locals())


def supprimerNotification(request,id_demande):
	
	trash=TrashNotification()
	trash.datenotif=notif.datenotif
	trash.message=notif.message
	trash.destinataire_id=request.user.id
	trash.save()
	notif.delete()
	return redirect('/notification') 



def rattrapage(request):
	notif=Notification.objects.filter(destinataire_id__exact=request.user.id)
	SumNotif=notif.count()
	return render(request,'rattrapage.html',locals())



def generation(request):

	#Extraction of all Data that we need to generate Timetable

	#Get the id of the week to generate its timatabling . The timetable is generating on friday that is why we add 3 days to get monday of the week to generate
	now = timezone.now().date()
	try:
		NextWeek=Semaine.objects.get(date_debut__exact=now+timedelta(days=3))
		ErrorWeek=False	
		WeekToGenerate=NextWeek.id		
	except Semaine.DoesNotExist:
		ErrorWeek=True
		WeekToGenerate=10
	
	print("-------------Week TO Generate -----------------")
	print(WeekToGenerate)



	#We should add if to weekToGenerate 

	#Get all the SubActivity of the week to generate 
	subActivity=SubActivity.objects.filter(semaine_id__exact=WeekToGenerate)
	nbrSub=subActivity.count()
	print("---------------Number of subActivity to work on ---------------")
	print(nbrSub)
	Teachers=[]
	T=len(Teachers)

	#Get all the id of teachers who are going to work on the week to generate 
	for SA in subActivity :
		
		idUser=SA.user.id
		
		#Append distinct id in the list Teachers 
		if idUser not in Teachers:
			Teachers.append(idUser)
			print("--------------Teacher Name and ID Working this week ----------------")
			print(SA.user.username)
			print(idUser)
	print("--------------All the id of teachers ----------------")
	print(Teachers)
	T=len(Teachers)
	

	#Get elements and typeElement teaching by every teacher 
	DictElementType={}
	ListElementType=[]
	ElementType=[]
	
	for k in range (0,T):
		subActivity=SubActivity.objects.filter(user_id__exact=Teachers[k],semaine_id__exact=WeekToGenerate)

		for SU in subActivity:

			ElementType.append(SU.element.element)
			ElementType.append(SU.typeelement.typeElement)
			ElementType.append(SU.groupe.groupe)
			ListElementType.append(ElementType)
			ElementType=[]

		DictElementType[Teachers[k]]=ListElementType
		ListElementType=[]
	print("--------------------Dictionnaire Teacher : ELEMENT , TYPE , GROUPE -----------------")
	print(DictElementType)
	


	"""
	print(DictElementType.keys())
	for common_key in DictElementType.keys():
		print(common_key)  #print key

	print(DictElementType.values())
	print(DictElementType.items() )

    """


	#Get Freetime of teachers in list Teachers and store them in DictTeacherFree
	DictTeacherFree={}
	Free=[]
	for i in range(0,T):
		
		Freetime=FreeTime.objects.filter(user_id__exact=Teachers[i],semaine_id__exact=WeekToGenerate)
		#Get all the id of Freetime of the Teacher[i] 
		for F in Freetime :
			Free.append(F.timeslote.id)

		DictTeacherFree[Teachers[i]]=Free
		Free=[]


	print("-------------Dictionnaire Teacher : FreeTime ----------------")
	print(DictTeacherFree)

	#Get all the id of timeslote 
	timeslote=[]

	Time=Timeslote.objects.all()
	for TS in Time :
		timeslote.append(TS.id)

	print("------------All Possible timeslote -----------------")
	print(timeslote)

	#End of extraction Variable : WeekToGenerate ,Teachers,DictElementType , DictTeacherFree

	#Begin of assignment of timeslote 

	timetabling=Problem()

	ConstCours=[]
	ConstTD=[[],[],[]]
	ConstTP=[[],[],[]]
	AllTD=[[],[],[]]
	AllTP=[[],[],[]]
	DictConstTD={}
	DictConstTP={}

	for a in range (0,T):

		FT=DictTeacherFree[Teachers[a]]
		print("------------FreeTime of Teacher -----------------",Teachers[a])
		print(FT)

		ET=DictElementType[Teachers[a]]
		print("------------All Element teached by teacher a -----------------")
		print(ET)
		LET=len(ET)

		

		for b in range(0,LET):

			Var=ET[b][0]+"_"+ET[b][1]+"_"+ET[b][2]

			if (ET[b][1]=="Cours"):
				print("----------------- Declaration Variable Cours ---------------------------")
				timetabling.addVariable(ET[b][0],FT)
				ConstCours.append(ET[b][0])

			if(ET[b][1]=="TD"):

				print("----------------- Declaration Variable TD ---------------------------")
				timetabling.addVariable(Var,FT)

				if(ET[b][2]=="GL1"):
					ConstTD[0].append(Var)
					AllTD[0].append(Var)
				if(ET[b][2]=="GL2"):
					ConstTD[1].append(Var)
					AllTD[1].append(Var)
				if(ET[b][2]=="GL3"):
					ConstTD[2].append(Var)
					AllTD[2].append(Var)

			if(ET[b][1]=="TP"):
				print("------------------ Declaration Variable TP ---------------------------")
				timetabling.addVariable(Var,FT)

				if(ET[b][2]=="GL1"):
					ConstTP[0].append(Var)
					AllTP[0].append(Var)
				if(ET[b][2]=="GL2"):
					ConstTP[1].append(Var)
					AllTP[1].append(Var)
				if(ET[b][2]=="GL3"):
					ConstTP[2].append(Var)
					AllTP[2].append(Var)

		DictConstTP[Teachers[a]]=ConstTP
		DictConstTD[Teachers[a]]=ConstTD
		ConstTD=[[],[],[]]
		ConstTP=[[],[],[]]

		

		print("--------------- Dictionnaire TP selon prof ---------------------")
		#print("\n")
		print(DictConstTP)
		print("--------------- Dictionnaire TD selon prof ---------------------")
		print(DictConstTD)
		print("--------------- Liste Cours ------------------------------------")
		print(ConstCours)
		print("--------------- Liste TD ------------------------------------")
		print(AllTD)
		print("--------------- Liste TP ------------------------------------")
		print(AllTP)

		




	CC=len(ConstCours)
	CD=len(ConstTD)
	CP=len(ConstTP)

	for l in range (0,T):

		TPST=DictConstTP[Teachers[l]]
		TDST=DictConstTD[Teachers[l]]


		 
		for f in range(0,3):

			
			if(TPST[f]!=[]):
				CPF=len(TPST[f])
				#All groups must have one timeslote of activity "Cours",the 3 groups can't be in any other different class "TP" at the same time
				for j in range(0,CPF):
					
					for c in range(0,CC):
						print("++++++++++++++++++++++++++")
						print(ConstCours[c])
						print(TPST[f][j])
						print("++++++++++++++++++++++++++")
						print("-------------------- Add Constraint Activity 'Cours' & 'TP' of sa---------------------------------- ")
						timetabling.addConstraint(lambda row1, row2: row1 != row2,(ConstCours[c], TPST[f][j]))	


			if(TDST[f]!=[]):
				CDF=len(TDST[f])
				#All groups must have one timeslote of activity "Cours",the 3 groups can't be in any other different class "TD" at the same time
				for j in range(0,CDF):
					
					for c in range(0,CC):
						print("++++++++++++++++++++++++++")	
						print(ConstCours[c])
						print(TDST[f][j])
						print("++++++++++++++++++++++++++")
						timetabling.addConstraint(lambda row1, row2: row1 != row2,(ConstCours[c], TDST[f][j]))



		
		TotalTD=DictConstTD[Teachers[l]][0]+DictConstTD[Teachers[l]][1]+DictConstTD[Teachers[l]][2]
		TTD=len(TotalTD)
		print("-----------------Somme TD of the same teacher---------------------")
		print(TotalTD)
		TotalTP=DictConstTP[Teachers[l]][0]+DictConstTP[Teachers[l]][1]+DictConstTP[Teachers[l]][2]
		TTP=len(TotalTP)
		print("-----------------Somme TP of the same teacher ---------------------")
		print(TotalTP)

		#Total "TD" and "TP" of a specific teacher
		TDTP=TotalTD+TotalTP
		lenTDTP=len(TDTP)

		for tt in range(0,lenTDTP-1):
			for stt in range(tt+1,lenTDTP):
				print("-------------------- Add Constraint Activity 'TP' & 'TD' of the same teacher  ---------------------------------- ")
				timetabling.addConstraint(lambda row1, row2: row1 != row2,(TDTP[tt], TDTP[stt]))






	#Each Group should have different timeslote for "TD" AND "TP"
	#Vue groupe 

	for g in range(0,3):

		total = AllTD[g]+AllTP[g] 
		Ind=len(total)
		print("------------------- Total Activity 'TD' AND 'TP' of the same groupe -------------------------")
		print(total) 

		for x in range(0,Ind-1):
			for sx in range(x+1,Ind):
				print("-------------------- Add Constraint Activity 'TD' & 'TP' of the same groupe ---------------------------------- ")
				timetabling.addConstraint(lambda row1, row2: row1 != row2,(total[x], total[sx]))



	#Total "TD" & "TP" of all groups
	TDTPG=AllTD[0]+AllTP[0]+AllTD[1]+AllTP[1]+AllTD[2]+AllTP[2] 
	Gr=len(TDTPG)
    
	 
	for g in range(0,CC-1):

		#All Activities "Cours" must be different
		for sg in range(g+1,CC):
			print("-------------------- Add Constraint Activity 'Cours' & 'Cours' ---------------------------------- ")
			print(g,sg)
			print(ConstCours[g])
			print(ConstCours[sg])
			timetabling.addConstraint(lambda row1, row2: row1 != row2,(ConstCours[g], ConstCours[sg]))


		#Activity "Cours" must be different of the rest of Activities "TP" and "TD"
		for y in range(0,Gr):
			print("-------------------- Add Constraint Activity 'Cours' & 'TP' | 'Cours' & 'TP' ---------------------------------- ")
			timetabling.addConstraint(lambda row1, row2: row1 != row2,(ConstCours[g], TDTPG[y]))


	


	print("------------- Solution Aléatoire d'affectation des timeslotes----------------------")
	print(timetabling.getSolution())
	RandomSolution=timetabling.getSolution()
	
	for cle in RandomSolution:
		print(cle , " ===>" ,RandomSolution[cle])



	

	Emploi=[[[],[],[],[]],[[],[],[],[]],[[],[]],[[],[],[],[]],[[],[],[],[]] ]

	for key in RandomSolution:

		if(RandomSolution[key]==timeslote[0]):
			Emploi[0][0].append(key)

		if(RandomSolution[key]==timeslote[1]):
			Emploi[0][1].append(key)

		if(RandomSolution[key]==timeslote[2]):
			Emploi[0][2].append(key)

		if(RandomSolution[key]==timeslote[3]):
			Emploi[0][3].append(key)



		if(RandomSolution[key]==timeslote[4]):
			Emploi[1][0].append(key)

		if(RandomSolution[key]==timeslote[5]):
			Emploi[1][1].append(key)

		if(RandomSolution[key]==timeslote[6]):
			Emploi[1][2].append(key)

		if(RandomSolution[key]==timeslote[7]):
			Emploi[1][3].append(key)




		if(RandomSolution[key]==timeslote[8]):
			Emploi[2][0].append(key)

		if(RandomSolution[key]==timeslote[9]):
			Emploi[2][1].append(key)




		if(RandomSolution[key]==timeslote[10]):
			Emploi[3][0].append(key)

		if(RandomSolution[key]==timeslote[11]):
			Emploi[3][1].append(key)

		if(RandomSolution[key]==timeslote[12]):
			Emploi[3][2].append(key)

		if(RandomSolution[key]==timeslote[13]):
			Emploi[3][3].append(key)




		if(RandomSolution[key]==timeslote[14]):
			Emploi[4][0].append(key)

		if(RandomSolution[key]==timeslote[15]):
			Emploi[4][1].append(key)

		if(RandomSolution[key]==timeslote[16]):
			Emploi[4][2].append(key)

		if(RandomSolution[key]==timeslote[17]):
			Emploi[4][3].append(key)



	print("-----------------------------------------------------------------")
	print(Emploi)


	EmploiFinal=[[[],[],[],[]],[[],[],[],[]],[[],[]],[[],[],[],[]],[[],[],[],[]] ]
	

	tag_Cours=[100,200]
	tag_tp=[10,20,60]
	tag_td=[2,7,8]

	lenE=len(Emploi)
	for j in range(0,lenE):

		#Specific day 
		Jour=Emploi[j]
		lenJ=len(Jour)

		#Specific periode of time ex:8h-10h
		for s in range(0,lenJ):

			Salle=Problem()

			#All activities in a specific periode
			slot=Jour[s]

			SpecificTP=[]
			SpecificTD=[]

			for item in slot : 
				print("..............................................")
				print(item)

				SplitItem=item.split('_')
				n=len(SplitItem)
				print("hnaaaaaaaaaaaaaaaaaaaaaaaaaaa")
				if(n==1):
					if(SplitItem[0]=="Cours"):
						Salle.addVariable(SplitItem[0],tag_Cours)
						print(SplitItem[0])
				

				else : 
					if(SplitItem[1]=="TP"):
						print(tag_tp)
						Salle.addVariable(item,tag_tp)
						SpecificTP.append(item)


					if(SplitItem[1]=="TD"):
						Salle.addVariable(item,tag_td)
						SpecificTD.append(item)


			for p in range(0,len(SpecificTP)-1):
				for sp in range(p+1,len(SpecificTP)):
					Salle.addConstraint(lambda row1, row2: row1 != row2,(SpecificTP[p], SpecificTP[sp]))

			for d in range(0,len(SpecificTD)):
				for sd in range(d+1,len(SpecificTD)):
					Salle.addConstraint(lambda row1, row2: row1 != row2,(SpecificTD[d], SpecificTD[sd]))


			solutionSalle=Salle.getSolution()

			EmploiFinal[j][s]=solutionSalle


	print("------------- Solution Aléatoire d'affectation des salles----------------------")
	print(EmploiFinal)








	
	print("********************************************** Emploi du temps filiere GL 2A ***************************************************************")
	
	print("----------------------------------------- Lundi ---------------------------------------------------------------")
	test(request,EmploiFinal[0])
	print("\n")
	print("\n")	
	print("----------------------------------------- Mardi ----------------------------------------------------------------")
	test(request,EmploiFinal[1])
	print("\n")
	print("\n")
	print("-----------------------------------------Mercredi ----------------------------------------------------------------")
	test(request,EmploiFinal[2])
	print("\n")
	print("\n")
	print("-----------------------------------------Jeudi ----------------------------------------------------------------")
	test(request,EmploiFinal[3])
	print("\n")
	print("\n")
	print("-----------------------------------------Vendredi ----------------------------------------------------------------")
	test(request,EmploiFinal[4])
	print("\n")
	print("\n")
	












	return render(request,'generation.html',locals())



def test(request,list):
	n=len(list)
	for i in range(0,n) :
		
		
		
		cle=list[i]
		

		if(i==0):
			print("---------- 8-10h --------------------")
		if(i==1):
			print("---------- 10-12h --------------------")
		if(i==2):
			print("---------- 14-16h --------------------")
		if(i==3):
			print("---------- 16-18h --------------------")


		
		
		LCL=[]
		if cle != None :
			for common_key in cle.keys():
				print(common_key)
				if(cle[common_key]==100):
					print("Salle:Amphi 1")
					print("\n")
				if(cle[common_key]==200):
					print("Salle:Amphi 2")
					print("\n")
				if(cle[common_key]==10):
					print("Salle:L1")
					print("\n")
				if(cle[common_key]==20):
					print("Salle:L2")
					print("\n")
				if(cle[common_key]==60):
					print("Salle:L6")
					print("\n")
				if(cle[common_key]==2):
					print("Salle:A2 ")
					print("\n")
				if(cle[common_key]==7):
					print("Salle:A7 ")
					print("\n")
				if(cle[common_key]==8):
					print("Salle:A8 ")
					print("\n")
				
		
		else :
			LCL.append("NONE")	
			print("\n")








