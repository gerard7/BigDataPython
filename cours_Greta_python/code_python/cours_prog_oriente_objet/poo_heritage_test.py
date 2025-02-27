class Parent:
    def __init__(self):
        print("Constructeur Parent Appelé")

# La foncrtion super , pemet d'appeler le constructeur du Parent

class Enfant(Parent):
    def __init__(self):
        super().__init__()  # Avec cette ligne , on fait appel au constructeur du Parent
        print("Constructeur Parent occulté")


class Animal:
    def __init__(self,espece):
        self.espece = espece

class Chien(Animal):
    def __init__(self,nom):
        super().__init__("Chien")
        self.nom = nom


rex= Chien("Rex")
print(rex.nom)
print("Espece :",rex.espece)


enf = Enfant()
# Pour savoir si le Classe Enfant hérite d'une autre classe, on fait:
print(issubclass(Enfant,Parent))
# On aussi :
print(isinstance(enf,Parent))
print(Enfant.mro())  # Permet par exemple de décrire une classe et savoir si elle hérite d'un autre..
import inspect
print(inspect.getmro(Enfant))

# MRO = Methode Resolution Order:  de L'algorithme C3 MRO
# Liste la classe actuelle"
# ajouter les classes parent  dans l'ordre défini dans la déclaration B puis C
# Traiter les classes parentes en profondeur donc A
# Respecter l'ordre des parent en évitant les doublons.


class A:
    def __init__(self):
        print("Constructeur A")

class B(A):
    def __init__(self):
        super().__init__()
        print("Constructeur B")

class C(A):
    def __init__(self):
        super().__init__()
        print("Constructeur C")

class D(B,C):
    def __init__(self):
        super().__init__()
        print("Constructeur D")

d = D()
print(D.mro())
help(D)