from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from apps.account.models import Client
# Register your models here.

# admin.site.register(Client) # Permet de connecter le model à l'administrateur
#
@admin.register(Client)
class ClientAdmin(UserAdmin):
    list_display = ("email","firstname","lastname","is_staff","is_superuser","is_active")
    search_fields = ("email","firstname","lastname")
    list_filter = ("is_staff","is_superuser","is_active")
    ordering = ("email",)
    readonly_fields = ("last_login",)
    fieldsets = (
        (None,{"fields":("email","password")}),
        ("Informations personnelles",{"fields":("firstname","lastname")}),
        ("Permission",{"fields":("is_active","is_staff","is_superuser","groups","user_permissions")}),
        ("Dates importantes",{"fields":("last_login",)})
    )
    add_fieldsets = (
        (None,{
            "classes":("wide",),
            "fields":("email","firstname","lastname","password1","password2","is_staff","is_superuser")
        }),
    )