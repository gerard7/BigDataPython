# EXERCICE 4 : HERITAGE et ABSTRACTION
#
# 1. Transformer Vehicule en classe abstraite
# Créer une classe abstraite Vehicule avec ABC du module abc.
# Définir la méthode abstraite ajouter_personne(self, poids_personne)
# pour obliger les classes filles à l'implémenter.
#
# 2. Implémenter ajouter_personne() dans DeuxRoues
# Dans DeuxRoues, ajouter le poids d'une personne en tenant compte du casque (2kg en plus).
#
# 3. Implémenter ajouter_personne() dans QuatreRoues
# Dans QuatreRoues, réimplémenter ajouter_personne() de la même manière que dans Vehicule.
#
# -- NEW --
#
# 4. Méthode Statique afficher_attributs() dans la classe Vehicule
# Créer une méthode statique afficher_attributs(objet) qui :
# Vérifie si un attribut existe (hasattr).
# Affiche ses valeurs dynamiquement.
#
# EXERCICE 5 : Héritage, Attributs de Classe et Accesseurs
#
# 1. Ajouter un constructeur dans QuatreRoues
# Ajouter un constructeur prenant couleur, poids et nombre_porte.
#
# 2. Substituer ajouter_personne() dans Voiture
# Faire appel à la méthode ajouter_personne() de QuatreRoues avec super().
# Afficher un message si poids >= 1500kg et pneus neige ≤ 2.
#
# 3. Ajouter une constante SAUT_DE_LIGNE dans Vehicule
# 4. Ajouter un attribut protégé statique nombre_changement_couleur
# Définir un attribut statique (@classmethod) pour compter les changements de couleur.
# Utiliser set_couleur() pour incrémenter cet attribut.
# 5. Modifier setPoids() pour limiter le poids à 2100kg
#
# EXERCICE 6 :
#
# 1. Créer une Interface Action
# ⚠ En Python, il n’y a pas d’interface comme en PHP, mais on peut utiliser une
# classe abstraite (ABC) pour forcer l’implémentation de mettre_essence().
#
# 2. Modifier Camion pour implémenter Action
# Camion hérite de QuatreRoues et implémente Action en définissant mettre_essence().
# L’essence ajoute du poids au camion (1L = 1kg).
#
# 3. Création et manipulation d'un camion
# Instancier un camion bleu de 10 000 kg avec 2 portes.
# Fixer la longueur à 10m.
# Mettre 100 litres d’essence.
# Repeindre en vert.
#
# 4. Afficher tous les attributs
# Utiliser afficher_attributs() pour afficher dynamiquement les valeurs.
#
# 5. Implémenter __str__()
# En PHP, __toString() permet d'afficher un objet en echo.
# En Python, on utilise __str__() pour afficher un résumé de l’objet.
#
# EXERCICE 7 : COMPOSITION ET AGREGATION
# Créer une classe Moteur et l’intégrer à Voiture (Composition).
# Créer une classe Garage qui stocke plusieurs Voitures (Agrégation).
#
#
# EXERCICE 8 : Décorateur perso
# Décorateur pour suivre les changements de couleur Nous allons modifier
# la méthode setCouleur() pour qu’elle enregistre chaque changement.
#
#
# EXERCICE 9 : Méthodes magiques
# __eq__() (Comparaison d’égalité)
# Comparer deux Voitures sur leur poids
#
# __lt__() (Comparaison < entre véhicules)
# Comparer Voiture et Camion sur leur poids
#
# __call__() (Faire agir un objet comme une fonction)
# Appeler un Vehicule comme une fonction pour voir ses infos
#
# EXERCICE 10 : Métaclasses
# Forcer les classes enfants de Vehicule à implémenter certaines méthodes (ajouter_personne).
#

from abc import ABC
from abc import abstractmethod

class Vehicule(ABC):
    def __init__(self,couleur,poids):
        self.__couleur =couleur
        self.__poids = float(poids)


    @abstractmethod
    def ajouter_personne(self,poids_personne):
        self.__poids+= poids_personne

    def rouler(self):
        print(f"Le véhicule roule")

    def ajouter_pneu_neige(self,nombre_pneu):
        self.__pneus_neige+=nombre_pneu
    def repeindre(self,couleur):
        self.__couleur = couleur

    def afficher_nombre_pneus_neige(self):
        print(f"Le véhicule possède {self.__pneus_neige} pneus neige")

    def ajouter_personne(self,poids_personnes):
        self.__poids+=float(poids_personnes)

    def afficher_poids_vehicule(self):
        print(f"Le poids du véhicule est {self.__poids} kg")

    def afficher_couleur_vehicule(self):
        print(f"Le véhicule a une couleur {self.__couleur}")