from django import forms
from django.core.exceptions import ValidationError
import re

from apps.account.validators import validate_alpha
from apps.account.validators import validate_password_strength
from apps.account.validators import validate_mail

class RegisterForm(forms.Form):
    firstname = forms.CharField(
        max_length=50,
        label="Prenom",
        validators=[validate_alpha],
        required=True,
        widget=forms.TextInput(
            attrs={
                "placeholder":"Prenom",
                "class":"form-control", # C'est pour utiliser les formulaires de Boostrap
                 }
        )

    )

    lastname = forms.CharField(
        max_length=50,
        label ="NOM",
        validators=[validate_alpha],
        required=True,
        widget=forms.TextInput(
            attrs={
                "placeholder": "Prenom",
                "class": "form-control",  # C'est pour utiliser les formulaires de Boostrap
            }
        )

    )

    email = forms.EmailField(
        required = True,
        label = "Email",
        validators=[validate_mail],
        widget=forms.EmailInput(
           attrs ={
               "placeholder":"Email",
               "class" : "form-control"
           }

        )
    )

    password = forms.CharField(
        required=True,
        label="Mot de passe",
        validators=[validate_password_strength],
        widget=forms.PasswordInput(
            attrs={
                "placeholder": "Mot de passe",
                "class": "form-control"
            }

        )
    )

    confirme_password = forms.CharField(
        required=True,
        label="Confirmez Mot de passe",
        validators=[validate_password_strength],
        widget=forms.PasswordInput(
            attrs={
                "placeholder": "Confirmez Mot de passe",
                "class": "form-control"
            }

        )
    )
