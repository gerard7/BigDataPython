# from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
def home_view(request):
    # return HttpResponse("Bienvenue sur la première page d'accueil !") # Page basic, un peu moche
    return render(request,"home/home.html")  # Pour une vraie page HTML