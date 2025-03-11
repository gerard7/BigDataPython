from django.core.exceptions import ValidationError
import re

def validate_alpha(value):
    """
    Valider que le champs contient uniquement des lettres
    :param value:
    :return:
    """
    if not value.isalpha():
        raise ValidationError(f"La valeur entrée : {value} n'est pas une chaine de lettres uniquement.")

def validate_password_strength(value):
    """"
    :param value : c'est la chaine dont on veut vérifier certains critères
    :return
    """
    if len(value)<8:
        raise ValidationError(f"Le mot de passe doit contenir au moins 8 caractères.")

    if not re.search(r'[A-Z]',value):
        raise ValidationError("Le mot de passe doit contenir au moins une lettre majuscule.")

    if not re.search(r'[a-z]',value):
        raise ValidationError("Le mot de passe doit contenir au moins une lettre miniscule.")

    if not re.search(r'\d',value):
        raise ValidationError("Le mot de passe doit contenir au moins un chiffre.")

    if not re.search(r'[!@#%_&():?$]',value):
        raise ValidationError("Le mot de passe doit contenir au moins un caractère spécial.")

def validate_mail(value):
    """
    Vérifier si le symbole @ se trouve dans l'émail
    :param value:
    :return:
    """
    if not "@" in value:
        raise ValidationError("Le symbole : @ doit se trouver dans le mail !")