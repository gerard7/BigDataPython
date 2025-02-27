class Employe:
    """
    Classe représentant un employé avec un badge d'accès
    """
    # ATTRIBUT DE CLASSE. Cela se définit ici ! Avant le __init__
    # Partagée par toutes les INSTANCES de Employe. Elles vont utiliser cette même règle d'accès
    regles_acces ={
        "Employé" : ["Salle de Repos"],
        "Manager":["Salle de réunion","Bureau RH"],
        "Directeur" : ["Salle des Serveurs","Bureau RH","Comptabilité"]
        }

    def __init__(self,nom,poste):
        self.nom=nom # Atttribut INSTANCE
        self.poste=poste  # Attribut INSTANCE

    def afficher_informlations(self):
        """
        Affiche les informations de l'employé
        """
        return f"Employé : {self.nom} | Poste : {self.poste}"

    def verifier_acces(self,zone):
        """
        Vérifie si l'employé a accès à une Zone
        """
        if zone in Employe.regles_acces.get(self.poste,[]):
            return f"{self.nom} A ACCÈS à : {zone}"
        else:
            return f"{self.nom} n'a pas ACCÈS à : {zone}"

    # Méthode de Clase: C'est une méthode qui agit au niveau de la Classe (plutôt qu'une instance)
    # Elle est partagée par toutes les instances
    @classmethod
    def modifier_regle_acces(cls,poste,nouvelle_zone_acces):
        """
        Modifie les règles d'accès pour un Poste
        """
        cls.regles_acces[poste] = nouvelle_zone_acces
        return f"Nouvelle règle d'accès pour le poste : {poste}; la nouvelle zonne d'accès est : {nouvelle_zone_acces}"

    # Methode static : Ce sont des méthodes qui ne prennent ni self, ni cls
    # Cela se comporte comme une fonction normale mais, incluses dans la classe pour une meilleure organisation.
    # Elle est utilisée lorsque la méthode n'a pas besoin d'accéder à des données spécifiques de l'instance ou de la classe

    @staticmethod
    def verifier_validite_badge(expiration):
        from datetime import date
        return expiration >=date.today()

    # ------------ METHODE MAGIQUE : Méthode scpéciale via __
    # Elle permettent de définir un comportement d'un objet dans certaines situations
    def __str__(self): #Définir ce qui s'affiche lorsqu'on utilise un print
        return f"{self.nom} - {self.poste}"

    def __len__(self): # Définir ce qui est retourné lorsqu'on applique len() sur un objet
        return len(self.nom)

    # def __del__(self): # Lorsqu'un objet est supprimé , avec : del objet, il faudra faire ce code
    #     print(f"Suppression du profil de {self.nom} au poste {self.poste}")

    def __call__(self, *args, **kwargs): #Permet d'appler une instance comme une fonction. c'est à dire: Pouvoir écrire: emp1()
        acces =",".join(Employe.regles_acces.get(self.poste,[])) or "Aucun accès"
        print(f"Accès de {self.nom} : {acces}")

    def __repr__(self):
        return f"Individu('{self.nom}','{self.poste}')"


emp1 = Employe("Charle","Employé")
emp2 = Employe("Roland","Manager")
emp3 = Employe("Armand","Directeur")

print(emp1.afficher_informlations())

# On peut accéder à l'information générale . C'est à dire accéder à l'attribut de classe via LA CLASSE
print(Employe.regles_acces)
print("---------------------------")
# On peut accéder à l'information générale . C'est à dire accéder à l'attribut de classe via une Instance
print(emp1.regles_acces)
print("---------------------")
# Tentons de modifier les Attributs de classe
print("Tentative de modification de  l'attribut de Classe en PASSANT PAR LA CLASSE")
Employe.regles_acces["Manager"].append("Salle des Serveurs")
print(Employe.regles_acces)

print("Regardons si cela est visible chez un employé défini")
print(emp1.regles_acces)

print("=======================")
print("Tentative de modification de  l'attribut de Classe en PASSANT PAR L'INSTANCE")
emp1.regles_acces["Manager"].append("Salle des Débats")
# emp1.regles_acces = {"Employé":["Accès Spécial"]}
# print(emp1.regles_acces) # Visible seulement pour emp1
print(emp2.regles_acces) # Modification faite au niveau de emp1 non visible chez emp2

# Par contre si la modification a lieu VIA LA CLASSE, et non via l'instance, elle est vue par TOUT LE MONDE

print("---------------Méthode : verification_acces---------------------------")

print(emp1.verifier_acces("Salle de Repos"))
print(emp2.verifier_acces("Salle des Serveurs"))
print(emp3.verifier_acces("Salle de repos"))

print("---------------- METHODE DE CLASSE --------------")
Employe.modifier_regle_acces("Manager",["Salle de réunion","Bureau RH","Salle des serveurs"])
print(emp2.regles_acces)
print("-------------- Modifier la Regle d'accès au niveau de l'instance emp1 -----------------------")
emp1.modifier_regle_acces("Electricien",["Salle de Repos","Salle de Réunion"])
print("Classe Employe:",Employe.regles_acces)
print("Info via l'Instance emp1\n")
print(emp1.regles_acces)

print("-------------- METHODE STATIC----------")
from datetime import date
# badge = Employe.verifier_validite_badge((2025,12,31))
# print(f"Badge valide ou pas ? {badge.va}")

print("----------------- UTILISATION DES METHODE MAGIQUE-------------------------")
print("Appel __str__")
print(emp1)
print("Appel __len__")
print(len(emp1))
# print("Appel __del__")
# # del emp1
print("La suppression est utilisée plusieurs fois à cause du ramasse miette: gestion de la mémoire")
# C'est à cause du module ge (garbage collector) : ramasse miettes de python pour gérer la mémoire
print("********** Appel de __call__ ********")
print(emp2())
print("***************** REPRESENTATION D'UN OBJET ************")
print(repr(emp1))








































