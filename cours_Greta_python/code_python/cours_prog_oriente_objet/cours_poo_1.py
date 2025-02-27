"""
Introduction à la programmation orienté objet POO
Ce qui change, c'est la manière de coder

idée principale
Représenter les éléments (entité) sous forme d'objets qui contiennent des données (attribut)
et des comportements (méthodes)
Programmation procédurale VS POO
- Procédurale: Basée sur des fonctions et des variables alors que POO basée sur des objets et des classes

Exzemple concret:
- Procédurale : Une  liste contenant des infos d'un utilisateur
- POO: un objet utilisateur avec des attributs (nom,age,email) et des méthodes (s'insvcrire, envoyer un email)

Avantage:
- Réutilisable du code grâce à l'héritage
- Meilleures organisation et modularité
- Facilité le travail en équipe
- Plus intuitif

Inconvénients:
- Au début : Dufficile à appréhender
- Légère perte de performance comparée à un code procédurale
"""

# CLASSE ET OBJETS EN PYTHON

# Définition : Une classe C'est un modèle d'objet

# Une méthode est une fonction qui a un rôle . Ici, créons : afficher_info pour afficher les information d'un utilisateur

# self représente l'instance actuelle de la classe : il permet d'accéder aux attributs et méthodes de l'objet
# Quand un objet est créé, self fait référence à cet objet spécifique

class Utilisateur:
    """
    Classe représentant un utilisateur avec un nol et mail.
    """

    # Constructeur de la classe. Qui est automatiquement appelé, lorsqu'il y a un nouvel utilisateur  qui est créé:
    # Il permet d'initialiser les attributs de l'objet
    def __init__(self,nom,mail):
        self.nom = nom
        self.mail = mail

    # Méthode pour afficher les informations de l'utilisateur
    def afficher_info(self):
        """
        Affiche les informations de l'utilisateur
        """
        print(f"Utilisateur - Nom: {self.nom}, Mail: {self.mail}")


# Création d'un objet = INSTANCIANTION à partir de la classe --> OBJETS
user1 = Utilisateur("Saman","sam@gmail.com")
user2 = Utilisateur("Armand","armand@yahoo.fr")
user3 = Utilisateur("Rolande","rolande@camamail.fr")

print(user1)
user1.afficher_info()
user2.afficher_info()
user3.afficher_info()
print(user1.__dict__)  # user1.  le . s'appelle la Dot Notation