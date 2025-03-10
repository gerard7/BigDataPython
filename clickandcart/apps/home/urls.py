from apps.home.views import home_view

from django.urls import  path

urlpatterns =[
    path("",home_view,name="home")  # "", c'est l'url : ici / suffit pour l'appeler . Ensuite , c'est le nom de la méthode name="home" c'est le nom de la route

]