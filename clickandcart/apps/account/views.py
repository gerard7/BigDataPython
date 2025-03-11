from django.db import IntegrityError
from django.shortcuts import render
from django.shortcuts import redirect

from apps.account.forms.register_forms import RegisterForm
from apps.account.models import Client
from django.contrib import messages

# Create your views here.
def register(request):
    form = RegisterForm(request.POST or None)  # veut dire, soit on crée un formulaire, ou on le crée s'il n'existe pas
    if form.is_valid():
        try:
            Client.objects.create_user(
                email=form.cleaned_data["email"],
                firstname=form.cleaned_data["firstname"],
                lastname=form.cleaned_data["lastname"],
                password=form.cleaned_data["password"]
            )
        except IntegrityError:
            messages.error(request,f"Un utilisateur avec cet email:{form.cleaned_data["email"]} existe déja")
        except Exception as e:
            messages.error(request,f"L'erreur : {e} est survenue !")

        messages.success(request,"Inscription Réussie !")
        print("************  passage ici")
        return redirect("home")
    return render(request,"account/register.html",{"form":form})
