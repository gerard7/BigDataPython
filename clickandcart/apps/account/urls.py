from django.urls import path

from apps.account.views import register
urlpatterns =[
    path("register/",register,name="register")


]