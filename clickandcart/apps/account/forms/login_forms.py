from django.contrib.auth.forms import AuthenticationForm
from django import forms

class LoginForm(AuthenticationForm):
    # Formulaire de connexion
    username = forms.EmailField(
        widget=forms.EmailInput(
            attrs ={
                "class":"form-control",
                "placeholder":"Adresse Email"
            }
        )
    )
    password =forms.CharField(
        widget=forms.PasswordInput(
            attrs = {
                "class":"form-control",
                "placeholder": "Mot de Passe"
            }
        )
    )