from django import forms
from django.core.exceptions import ValidationError
import re

from apps.account.validators import validate_alpha
from apps.account.validators import validate_password_strength
from apps.account.validators import validate_mail

class RegisterForm(forms.Form):
    firstname = forms.CharField(
        max_length=50,
        label="Prénom :",
        validators=[validate_alpha],
        required=True,
        widget=forms.TextInput(
            attrs={
                "placeholder":"Prénom",
                "class":"form-control", # C'est pour utiliser les formulaires de Boostrap
                 }
        )

    )

    lastname = forms.CharField(
        max_length=50,
        label ="NOM :",
        validators=[validate_alpha],
        required=True,
        widget=forms.TextInput(
            attrs={
                "placeholder": "NOM",
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
                "placeholder": "Mot de passe ( > 8 caractères + carac spéciaux): Ex: aerAhftp&#_",
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

    def clean(self): # C'est une méthode que Django connait pour vérifier que password=confirme_password
        # Elle est automatiquement appelé lorsqu'on fait : form.is_value() dans views.py
        cleaned_data = super().clean()
        password_ = cleaned_data.get("password")
        confirme_passwword_ = cleaned_data.get("confirme_password")
        if (password_ and confirme_passwword_) and (password_!=confirme_passwword_):
            self.add_error("confirme_password","Les mots de passe ne correspondent pas ")
            # Lever une erreur ciblée en précisant la clé d'un champ!
        return cleaned_data
