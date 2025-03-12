from django.contrib.auth.views import LoginView, LogoutView
from django.db import IntegrityError
from django.shortcuts import render
from django.shortcuts import redirect
from django.urls import reverse_lazy
from apps.account.forms.login_forms import LoginForm

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

class CustomLoginView(LoginView):
    print("/////////// Appel de : CustomLoginView ")
    # LoginView hérite lui-même de FormView
    # On hérite de LoginView pour écrire notre propre login
    # On va d'abord initialiser les variables de la classe parente LoginView
    template_name = "account/login.html"
    authentication_form = LoginForm
    redirect_authenticated_user = True
    success_url = reverse_lazy("home") # C'est pour dire que l'url sera créé lorsque l'objet sera crée. Et pas tout de suite
    # reverse_lazy se trouve dans les classes.
    # CBV: Vue Basée sur les Classes


    def get_success_url(self):
        # Détermine url de redirection après déconnexion
        return self.success_url
        # Si on a des redirection particulière en fonction de l'application en cours d'utilisation, c'est ici q'il faudra élaborer
        # cette personnalisation

    def form_valid(self, form):
        print(" *** Entrée dans le valid form")
        # connexion er message de succès !
        messages.success(self.request,"Connexion Réussie !")
        return super().form_valid(form)  # On écrit comme ça parceque Cette méthode form_valid appelle automatiquement get_success_url
        # c'est pour cela qu'on n'a pas de redirect dans le return

    def form_invalid(self, form):
        print(" *** Entrée dans le Invalid form")
        # En cas d'échec de connexion,ou de message d'erreur
        messages.error(self.request,"Identifiant et/ou Mot de passe Invalide(s)")
        return super().form_invalid(form)

    def dispatch(self,request,*args,**kwargs):
        # Si l'utilisateur est déja connecté, il faut le rediriger
        if request.user.is_authenticated:
            return redirect(self.get_success_url())
        return super().dispatch(request,*args,**kwargs)

class CustomLogoutView(LogoutView):
    # Vue de déconnexion personnalisée
    next_page =reverse_lazy("login") # C'est un attribut pour désigner où diriger le client après redirection


    def dispatch(self, request, *args, **kwargs):
        print(" *** Entrée dans le Dispatch de CustomLogoutView")
        messages.success(request,"Vous avez été déconnecté avec succès !")
        return super().dispatch(request,*args,**kwargs)