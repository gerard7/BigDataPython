from django.contrib.auth.base_user import BaseUserManager, AbstractBaseUser
from django.contrib.auth.models import PermissionsMixin
from django.db import models

class ClientManager(BaseUserManager): # Django a besoin de Manager pour communiquer avec la Base de Données
    # BaseUserManager pour gérer les mots de pass
    def create_user(self,email, firstname, lastname, password):
        email =self.normalize_email(email) # l'utilisation de self, fait référence à la classe Parente
        user = self.model(email=email,firstname=firstname,lastname=lastname) # va créer plutard une table , un objet user
        user.set_password(password) # C'est pour hasher le password et l'attribuer au user
        user.save(using=self._db)
        return user # Retourne l'instance du user qui vient d'être créé

    def create_superuser(self,email, firstname, lastname, password):
        user = self.create_user(email, firstname, lastname, password)
        user.is_staff = True
        user.is_superuser = True
        user.save(usign=self._db)
        return user

class Client(AbstractBaseUser,PermissionsMixin):
    # PermissionsMixin, gère les droits, gère les groupes. Permet d'utiliser les méthodes comme: is_permission... pour
    # savoir si tel utilisateur à tel ou tel droit pour accéder à telle ou telle fonctionnalité.
    # On a besoin de AbstractBaseUser pour créer une Table
    firstname = models.CharField(max_length=50)
    lastname = models.CharField(max_length=50)
    email = models.EmailField(unique=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False) # Indique si l'utilisateur aura droit au provilège d'administration. Par défaut, on le met à False
    objects = ClientManager()
    USERNAME_FIELD ="email" # Impose que les utilisateurs doivent se connecter avec leur mail
    REQUIRED_FIELDS = ["firstname","lastname"]
    def __str__(self):
        return f"{self.firstname} {self.lastname}" # Comme ça , si on print d'uin Client, on aura : firstname lastname