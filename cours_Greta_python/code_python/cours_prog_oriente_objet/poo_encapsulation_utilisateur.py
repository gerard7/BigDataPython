# L'encapsulation est un principe qui permet de cacher les détails internes à la classe
# Et, à ne permettre l'accès aux données que à travers des méthodes dédiées .
# On peut avoir plusieurs niveaux d'encapsulation :
# - Public : self.nom --> Accessible partout
# - Portected : Accès réservé , mais pas interdit
# - Priovate : Accès en interne (name sangling)

# Module de hachage sécurisé pour gérer des mots de passe
import bcrypt
class Utilisateur:
    """
    Classe correspondant à un utilkisateur avec des protection des données sensibles
    """
    def __init__(self,nom,mail,mot_de_pass):
        """
        Initialise un utilisateur avec Nom, Mail; Mot_de_Pass
        Certains attributs sont protégés pour éviter un accès direct
        """
        # Public : accessible librement
        self.nom = nom

        # Protégé # Cela veut dire que cette variable: _mail est accessible MAIS , Signalé comme non modifiable
        self._mail = mail

        # Private :  Le __mot_de_pass ne doit pas être accessible de l'extérieur directement. Voir le setter pour la suite
        self.mot_de_pass = mot_de_pass
        # self.mot_de_pass = mot_de_pass : Car , cette écriture fait automatiquement appel
        # au setter S'IL exite. Ce qui est notre cas : @mot_de_pass.setter , défini plus bas

    #--------- Encapsulation des attributs : getters et setters (accesseurs) ----------
    #  - getters pour les lectures des attributs et les
    #  - setters pour les modifier
    # Cette encapsulation avancée nécessite un décorateur : @property
    # @property pour un getter simple. Mais,si on veut une logique spéciale lors de la
    # récupération  de l'ion,fo --> @email.getter
    @property
    def email(self): # getter
        """
        Permet de retourner le mail de l'utilisateur: Lecture seule
        """
        return self._mail

    @email.setter
    def email(self,nouveau_mail): # setter
        """
        Modifie le mail de l'utilisateur
        """
        if "@" in nouveau_mail:
            self._mail = nouveau_mail
            print(f"Email vient d'être mis à jour : {self._mail}")
        else:
            print(f"Erreur : Email invalide")

    def afficher_infos(self):
        return f"Utilisateur :{self.nom} , Email,{self._mail}"

    def droits(self):
        """
        Méthode Polymorphe : Redefinit Dans chaque classe Filles
        """
        return "Accès Utilisateur Basicè"



    # On ne veut pas de getter pour le mot de passe . Bien sûr

    @property
    def mot_de_pass(self):
        """
        Empêche la lecture directe du mot de passe
        """
        raise ValueError(f"Accès refusé : le mot de passe de : {self.nom} est Protégé ! ")

    @mot_de_pass.setter
    def mot_de_pass(self,nouveau_mot_de_pass):
        """
        Permet de modifier le mot de passe par un hashage
        """
        self.__mot_de_pass= self.__hacher_mot_de_pass(nouveau_mot_de_pass)
        print("Le mot de passe a été mis à jour avec succès !")



    def __hacher_mot_de_pass(self,mot_de_passe):
        """
        C'est une méthode pour hacher le mot de pass
        """
        return bcrypt.hashpw(mot_de_passe.encode(),bcrypt.gensalt())


    def verifier_mot_de_pass(self,mot_de_pass):
        """
        Vérifie que le mot de pass correspond au hash
        """
        return bcrypt.checkpw(mot_de_pass.encode(),self.__mot_de_pass)


class Admin(Utilisateur):
    def __init__(self,nom,mail,mot_de_pass,niveau_acces):
        super().__init__(nom,mail,mot_de_pass)
        self.niveau_acces = niveau_acces

    def afficher_infos(self):
        """
        Affiche aussi le niveau d'accès ici. Le Parent Utilisateur l'a.
        Mais, je vais changer un peu ici. justement je vais particulariser
        en ajoutant {self.niveau_acces}
        """
        # On peut aussi faire : return f"{super().afficher_infos()} Accès Niveau : {self.niveau_acces}"
        # Pour utiliser afficher_infos justement du Parent
        return f"Admin: {self.nom}, Email: {self.email}, Accès Niveau : {self.niveau_acces}"


class Moderateur(Utilisateur):
    def __init__(self,nom, email,mot_de_pass,peut_supprimer_poste=True):
        super().__init__(nom, email,mot_de_pass)
        self.peut_supprimer_poste = peut_supprimer_poste


    def afficher_infos(self):
        """
        Affiche les informations spéciales du Modérateur
        """
        return f"Modérateur :{self.nom} ,Email : {self.email},Suppression Poste : {self.peut_supprimer_poste}"

    def droits(self):
        return "Accès : Modérateur (peut gérer les postes"


class GestionAcces:
    """
    Mixin : C'est une Classe comçue pour être héritée par certaines classes, mais, qui ne doit pas
    être instanciée toute seule. Il sert à ajouter du comportement à d'autres classe sans imposer une hiérarchie rigide
    """
    def verifier_acces(self,niveau_requis):
        """
        Vérifie si l'utilisateur a le bon niveau d'accès
        """
        # Ce self dans le if n'est pas comme le self ordinaire . C'est le self de l'utilisateur qui l'utilise.
        # c'est comme this en C++
        if hasattr(self,"niveau_acces") and self.niveau_acces >= niveau_requis:
            print(f"{self.nom} a accès au niveau {niveau_requis} ")
        else:
            print(f"{self.nom} n'a pas le niveau d'accès requis : {niveau_requis}")

    def afficher_droit_utilisateur(obj):
        """
        Dunk Typing pour exécuter afficher_info
        """
        # Dans le if , opn vérifie si afficher_infos fait partie des méthodes de l'objet qui l'utilise
        if hasattr(obj, "afficher_infos") and  callable(getattr(obj,"afficher_infos")):
            print(obj.afficher_infos())
        else:
            print("Objet ne possèce pas la méthode afficher_infos()")


class SuperAdmin(Admin, GestionAcces):
    def __init__(self,nom,mail,mot_de_passe,niveau_acces, peut_bloquer_comptes=True):
        Admin.__init__(self,nom,mail,mot_de_passe,niveau_acces)
        self.peut_bloquer_comptes = peut_bloquer_comptes

    def afficher_info(self):
        return (f"SuperAdmin : {self.nom}, Email : {self.email},"
                f" Niveau d'accès : {self.niveau_acces},  Bloque Compte ? {self.peut_bloquer_comptes}")

# # @property : c'est pour les getter
# # @NomFonction.setter : C'est pour les setter
#
#
# print("---------- TEST LES NIVEAUX DE PROTECTION----------")
user=Utilisateur("Armand","armand@gmail.com","1234")
# print(" Nom User =",user.nom)
# print("---Modification----- ")
# user.nom="Gérard"
# print(" Nom User, après sa modification =",user.nom)
#
# print("----Accéder au mail---- ")
# print("Le mail de User =",user._mail)
# print("----tentons de modifier l'email---- ")
# user._mail ="autre@autre.fr"
# print("Le mail de User, après modification =",user._mail)
# print("Tentation d'afficher user.__mot_de_pass: Cela génère une erreur")
# # print("Affichage mot de pass =",user.__mot_de_pass)
# print(user.nom,user._mail)
#
#
# print("-------- LES GETTEURS ET SETTERS : ENCAPSULATION 1er ORDRE-------")
# print(user.email)
# print("Impossible de modifier l'émail ")
# # user.email = "nouveau@nouveau.fr"
#
# print("RENDRE POSSIBLE LA MODIFIVATION DE l'EMAIL")
# print("Email avant =",user.email)
# user.email = "nouveau@nouveau.fr"
# print("Email après :",user.email)
#
# print("TENTATION D'AFFICHER LE MOT DE PASSE")
# # print("Affichons le mot de passe :",user.mot_de_pass) # Echec !
# print("Tentons de le modifier")
# user.mot_de_pass="@hetrot"
# print("Affichons le mot de passe :",user.mot_de_pass)

# print(user.verifier_mot_de_pass("123"))
# print(user.verifier_mot_de_pass("1234"))


# ---------- TEST ---------------
print("---------- TEST ---------------")
user = Utilisateur("Albert","albert@wanadoo.fr","7894")
admin = Admin("Roger","roger@gmail.com","412256",5)
modere = Moderateur("Claude","claude@yahoo.fr","7489865",True)
super_admin =SuperAdmin("Jean","jean@google.com","4125536",6,True)

# Vérifions si un objet possède certaines propriétés
# GESTION DU POLYM%ORPHISME VIA DUCK TYPING
print("********* GESTION DU POLYM%ORPHISME VIA DUCK TYPING **********")
print(".......................")
print("User, Droit",GestionAcces.afficher_droit_utilisateur(user))
print("Admin, Droit",GestionAcces.afficher_droit_utilisateur(admin))
print("Admin, Droit",GestionAcces.afficher_droit_utilisateur(super_admin))

super_admin.verifier_acces(7)