from django.contrib import admin
from log.models import Year , Filiere ,Group, Room ,Subject  , Timeslote ,Tag, Notification , Contact,TypeExam,Exam,TypeElement,FileCsv ,Semaine,FreeTime ,SubActivity
# Register your models here.
@admin.register(FileCsv)
class FileCsvAdmin(admin.ModelAdmin):
    list_display = ('user','file', 'semaine', 'date_upload')
    search_fields = ['user__username','file','semaine__semaine','date_upload']
    #search_fields = ('user', 'file','semaine')
    list_per_page = 15

@admin.register(Timeslote)
class TimesloteAdmin(admin.ModelAdmin):
    list_display = ('jour','horaire')
    search_fields = ['jour','horaire']

@admin.register(Room)
class RoomAdmin(admin.ModelAdmin):
    list_display = ('salle','capacite')
    search_fields = ['salle','capacite']


@admin.register(Exam)
class ExamAdmin(admin.ModelAdmin):
    list_display = ('user','element', 'typeExam', 'groupe')
    search_fields = ['user__username','groupe__groupe','typeExam__typeExam','element__element']

@admin.register(Contact)
class ContactAdmin(admin.ModelAdmin):
    list_display = ('user','date', 'message', 'subject')
    search_fields = ['user__username','date','message','subject__element']


@admin.register(FreeTime)
class FreeTimeAdmin(admin.ModelAdmin):
    list_display = ('user','timeslote','semaine')
    search_fields = ['user__username','timeslote__jour','timeslote__horaire','semaine__semaine']

@admin.register(SubActivity)
class SubActivityAdmin(admin.ModelAdmin):
	list_display=('user','groupe','element','semaine','typeelement')
	search_fields = ['user__username','groupe__groupe','element__element','semaine__semaine','typeelement__typeElement']
	list_per_page = 18 #number max of Activity in a week 


@admin.register(Semaine)
class SemaineAdmin(admin.ModelAdmin):
	list_display=('semaine','date_debut')
	search_fields = ['semaine','date_debut']






admin.site.register(Year)
admin.site.register(Filiere)
admin.site.register(Group)
admin.site.register(Subject)
admin.site.register(Tag)
admin.site.register(Notification)
admin.site.register(TypeExam)
admin.site.register(TypeElement)
#admin.site.register(FileCsv,FileCsvAdmin)



