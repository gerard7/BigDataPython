import bcrypt


class Utilisateur:
    """
    Classe representant un utilisateur avec protection des données sensibles
    """

    def __init__(self, nom, email, mot_de_passe):
        """
        Initialise un utilisateur avec un nom, mail, mdp
        Certains attributs sont protégés pour éviter un accès direct
        """
        # Public : accessible librement
        self.nom = nom

        # Protégé : _email est accessible mais signalé comme non modifiable directement
        self._email=email

        # Private : __mot_de_passe ne doit pas être accessible directement
        #self.__mot_de_passe = self.__hacher_mot_de_passe(mot_de_passe)
        self.mot_de_passe = mot_de_passe # Utilise le setter

    # --------- Encapsulation avancée des attributs : getters et setters (accesseurs) ---------
    @property
    def email(self):
        """
        Retourne l'email de l'utilisateur (lecture seule)
        """
        return self._email

    @email.setter
    def email(self, nouveau_email):
        """
        Modifie l'email de l'utilisateur après validation
        """
        if "@" in nouveau_email:
            self._email= nouveau_email
            print(f"Email mis à jour: {self._email}")
        else :
            print(f"Erreur : Email invalide")

    # Getter pour le mdp (aucun accès direct)
    @property
    def mot_de_passe(self):
        """
        Empêche la lecture directe du mdp
        """
        raise ValueError("Accès refusé : le mpd est protégé")

    @mot_de_passe.setter
    def mot_de_passe(self, nouveau_mdp):
        """
        Permet de modifier le mdp avec un hachage
        """
        self.__mot_de_passe=self.__hacher_mot_de_passe(nouveau_mdp)
        print(f"Mot de passe mis à jour avec succès !")

    # Méthode PRIVATE
    def __hacher_mot_de_passe(self, mot_de_passe):
        """
        Hache le mot de passe avec bcrypt
        """
        return bcrypt.hashpw(mot_de_passe.encode(), bcrypt.gensalt())

    def verifier_mot_de_passe(self,mot_de_passe):
        """
        Vérifie que le mot de passe corrrespond au hash
        """
        return bcrypt.checkpw(mot_de_passe.encode(), self.__mot_de_passe)


    def afficher_infos(self):
        return f"Utilisateur : {self.nom}, Email: {self._email}"

    def droits(self):
        """
        Méthode polymorphe : redefinie dans chaque classe fille
        """
        return "Accès : Utilisateur Basique"


class Admin(Utilisateur): #admin = Admin()
    def __init__(self, nom, email, mot_de_passe, niveau_acces):
        super().__init__(nom, email, mot_de_passe)
        self.niveau_acces = niveau_acces

    def afficher_infos(self):
        """
        Affiche aussi le niveau d'acces
        """
        #return f"Admin : {self.nom}, Email : {self._email}, Accès niveau {self.niveau_acces} "
        return f"{super().afficher_infos()}, Accès niveau {self.niveau_acces} "

    def droits(self):
        return "Accès : Admin (peut gérer les utilisateurs)"

class Moderateur(Utilisateur):
   def __init__(self, nom, email, mot_de_passe, peut_supprimer_posts=True):
       super().__init__(nom, email, mot_de_passe)
       self.peut_supprimer_posts= peut_supprimer_posts

   def afficher_infos(self):
        return f"Moderateur : {self.nom}, Email : {self._email}, Suppression posts {self.peut_supprimer_posts}"

   def droits(self):
       return "Accès : Modérateur (peut gérer les posts)"



class GestionAcces:
    """
    Mixin : classe conçue pour etre héritée par certaines classes mais qui ne doit pas être instanciée seule.
    Il sert à ajouter du comportement à d'autres classes sans imposer une hierarchie rigide
    SI ON VEUT AJOUTER UNE FONCTIONNALITE OPTIONNELLE --> UTILISE MIXIN
    """
    def verifier_acces(self, niveau_requis):
        """
        Vérifie si l'utilisateur a le bon niveau d'acces
        """
        if hasattr(self, "niveau_acces") and self.niveau_acces >= niveau_requis:
            print(f" {self.nom} a accès au niveau {niveau_requis}")
        else:
            print(f"{self.nom} n'a pas le niveau d'accès requis {niveau_requis}")

    @staticmethod
    def afficher_droits_utilisateur(obj):
        """
        Duck Typing pour executer afficher_infos()  si elle est présente
        """
        if hasattr(obj, "afficher_infos") and callable(getattr(obj, "afficher_infos")):
            print(obj.afficher_infos())
        else :
            print("Objet ne possède pas la méthode afficher_infos()")

class SuperAdmin(Admin, GestionAcces):
    def __init__(self, nom, email, mot_de_passe, niveau_acces, peut_bloquer_comptes=True):
        Admin.__init__(self, nom, email, mot_de_passe, niveau_acces)
        self.peut_bloquer_comptes=peut_bloquer_comptes

    def afficher_infos(self):
        return f"SuperAdmin : {self.nom}, Email : {self._email}, Niveau : {self.niveau_acces}, Bloque comptes : {self.peut_bloquer_comptes}"


# ------------ TESTS -------------
user = Utilisateur("Sam", "sam@sam.fr", "123")
admin = Admin("Saman", "saman&k.fr", "1234", 5)
moderateur = Moderateur("Arnaud", "Arnaud@a.fr", "123")
super_admin = SuperAdmin("Aurelien", "aurelien@d.fr", "13", 10)

# -------- DEMONSTRATION DU POLYMORPHISME VIA DUCK TYPING --------
GestionAcces.afficher_droits_utilisateur(user)
GestionAcces.afficher_droits_utilisateur(admin)
GestionAcces.afficher_droits_utilisateur(moderateur)
GestionAcces.afficher_droits_utilisateur(super_admin)

super_admin.verifier_acces(15)