# decouverte du module sys
# decouverte de la taille

# interet : fonctionnalités liées qu systeme d'exploitation et à
# l'environnement d'exécution et d'interragir avec l'interpreteur python.

import sys

print(sys.version) # donne la version de python

taille_liste =[1,2,3,5,88]
taille_tuple = (144664,2888979,34646,457,9)
print(f"taille de la liste = {sys.getsizeof(taille_liste)} octets")
print(f"taille du tuple = {sys.getsizeof(taille_tuple)} octets")

print("*********************************************************************************")

# decouverte de la fonction zip
# la fonction zip va combiner plusieurs itérables en regroupant leur élément
# par paire . Elle renvoie un itérateur de tuples.
# TRES UTILE pour parcourir plusieurs itérablese en parallèle
# Ou associer les données

print("*********************************************************************************")

names = ("Armand", "Paul","Remi")
ages =(22,35,29)
# combiner deux tuples en 1 itérable de tuple.
combined = zip(names,ages)
print(combined)
print("type de combined =",{type(combined)})
# convertir en liste
print("Convertir en liste ")
print(list(combined))

print("*********************************************************************************")
##print("Convertir en tuple ")
##print(tuple(combined))
# ATTENTION, lorsque qu'on utilise tuple ou liste sur un zip
#Si en premier on a utilsé d'abord list, alors si on rappelle tuple sur le zip, on aura
# un zip nul. Et vice versa
#apres, l'autre élement est vide

# exemple d'itérartion avec zip
for name, age  in zip(names, ages):
    print(f"{names} : {ages}")


print("*********************************************************************************")

# Déballage complet

#(name1,age1), (name2,age2),(name3,age3) = combined
#print(f"premiere identite: ",{(name1,age1)})

# Déballage partiel : Operateur *

# (first_pair,*autrespairs) =combined
# print(first_pair,autrespairs)

# récupérer la derniere paire en ignorant les autres :
#(*lesautres_ignores, derniere_paire) = combined

# zip renvoie un itérateur: consommation uen seule fois
# gestion et stockage des paires non immédiate

print("*********************************************************************************")

# -------- APPROFONDISSEMENT DES FONCTION : MIN, MAX ,SORTED,MAP, REDUCE FILTER ----

# Ces focntions agissent uniquement sur les itérables
# Liste, tuples, chaines de caractères, dictionnires , ensembles, générateur

# CAS 1 : Avec une fonction personnalisée  ou existante

words =['apple','banana','cherry','date']

# 1 usage
def last_caractere(s):
    return s[-1] # retourne le dernier caractère. Attntion, cette focntion doit avoir un return
sorted_words = sorted(words,key=last_caractere) # Attention,pas de parenthèse à la fonction. key est obligatoire
print(sorted_words)

print("*********************************************************************************")

# 2 Usage

#Cas de fonction anonyme lambda --> action à l'instant

data = [(1,3),(4,1),(2,9),(5,2)]
# Je veux trier par rapport au 2ème élément de chaque tuple.

sorted_data= sorted(data,key=lambda x: x[1])

print('sorted_data=',sorted_data)
# RETENONS QU'IL NE FAUT PAS FAIRE DE TEST DANS LAMBDA

print("*********************************************************************************")

# TD TUPLES:
# https://sharemycode.fr/3gy
products = [
    (1, "Laptop", 1500.0),
    (2, "Mouse", 25.0),
    (3, "Keyboard", 75.0),
    (4, "Monitor", 300.0)]
# Exercice : Trie les produits par prix croissant.

print("A FAIRE ******")

print("*********************************************************************************")

# Affiche uniquement les produits ayant un prix supérieur à 100.
print('---- prix sup 100 ----')

print("*********************************************************************************")
# Génère une nouvelle liste où chaque produit est représenté
# par un tuple (nom, prix après une réduction de 10%).

print("*********************************************************************************")

def reduce_dix_sur_cent(list_tuple_data): ****


print("*********************************************************************************")


# ---- Exercice 3 : Tuples imbriqués et tris avancés ----
# On te donne une liste de tuples représentant des employés, chaque tuple contient le nom, l’âge et le salaire :
# Trie les employés par salaire décroissant.
# Trouve l'employé le plus jeune ayant un salaire supérieur à 50000.

employees = [
    ("Djamen", 30, 50000),
    ("Jarfar", 25, 45000),
    ("Aurelien", 35, 70000),
    ("Robert", 40, 65000)
]
print("*********************************************************************************")

# Exercice :

# Trie les employés par salaire décroissant.

# Trouve l'employé le plus jeune ayant un salaire supérieur à 50000

print("*********************************************************************************")

# Module functools

from functools import reduce

number = [1,2,3,4]
result = reduce(lambda x,y :x*y, number)
print('Utilisation de reduce du module functools',result)

# Autre cas:
#Initialisateur
print("**** initialisateur ******")
result_2 = reduce(lambda x, y:x+y, number,10)
# il fait la somme des élements du tablau number en commencant par 10
# donc , il fait : 10+1+2+3+4
print(result_2)


# Tuple de coordonnées
coordinates = ((1, 2, 3), (4, 5, 6), (7, 8, 9), (10, 11, 12))

# Exercice: Ecrire une fonction sumPoint(coordinates) qui renvoie un point qui vaut la somme des coordonnées
# de tous les points
def sumPoint(point):

# from math import sqrt
# Identifie le point le plus proche de l'origine (0, 0, 0).

print("*********************************************************************************")


# Exercice : Calculer La distance minimale au carré. Retourner le point concerné. Le point dont
# la distance de (0,0,0) est le plus faible

print("*********************************************************************************")

# Crée un nouveau tuple contenant uniquement les coordonnées avec une somme supérieure à 15.
# Utilisez reduce pour filtrer les points avec une somme supérieure à 15.

# (Bonus) : Calculez la somme totale de toutes les coordonnées de tous les points.

meetings = [
    ["09:00", "10:30"],
    ["11:00", "12:00"],
    ["14:00", "15:30"],
    ["16:00", "17:00"]
]

# Etape 1 : Convertissez chaque sous-liste contenant les horaires d'une réunion en un tuple de deux chaînes.
# Par exemple, ["09:00", "10:30"] devient ("09:00", "10:30").

print("*********************************************************************************")

# Source https://www.sharemycode.fr/3gy
# Etape 2 : Écrivez une fonction time_difference qui calcule la différence en minutes entre l'heure de début
# et l'heure de fin d'une réunion.
# Appliquez cette fonction à chaque réunion et affichez les durées calculées.

print("*********************************************************************************")

# Etape 3 : Parcourez les réunions consécutives pour calculer les intervalles libres
# entre la fin d'une réunion et le début de la suivante.
# Identifiez le créneau le plus long, son heure de début et son heure de fin.


print("*********************************************************************************")

# Aide :
# Les horaires sont au format 24 heures (HH:MM).
# Vous pouvez utiliser le module datetime pour gérer les conversions entre chaînes et objets datetime :
# avec la fonction suivante (conversion de chaine à une date) datetime.strptime(xxxx, format) avec format = "%H:%M".


print("*********************************************************************************")

# # pratique 2:
# #prend une liste et returne un tuples
# # def find_first(f_list):

print("*********************************************************************************")
# import copy
# import itertools
# print(find_first([1, 2, "Fizz",4,5,"Fizz",7,8,"Fizz",10,11,"Fizz",13,14,"Fizz",16,17,"Fizz",19,20]))
# # Devra afficher (3,'Fizz')

print("*********************************************************************************")
# print(find_first([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, "Buzz", 14, 15, 16, 17, 18, 19, 20]))
# # doit retourner (13,'Buzz')

print("*********************************************************************************")
# # ----- EXERCICE 02 ------
# # Vous êtes chargé d'analyser les logs d'un serveur pour identifier les erreurs les plus fréquentes.
# # Le fichier de logs contient des lignes au format suivant :
# # 200 OK
# # 404 Not Found
# # 500 Internal Server Error
# # Chaque ligne commence par un code HTTP, suivi d'une description.

print("*********************************************************************************")
# # Objectifs de l'exercice :
# # Compter le nombre d'occurrences de chaque code HTTP dans les logs.
# # Identifier les codes les plus fréquents en utilisant la méthode most_common() de Counter.
# # Simuler un ajout de nouvelles entrées dans les logs et mettre à jour les résultats avec update().
# # Générer un rapport indiquant la proportion de chaque code dans l'ensemble des logs (en pourcentage).
# # Ajouter une étape pour obtenir les codes d’erreurs uniques avec un set.
#
# # def exo02():
# #     from collections import Counter
# #
# #     # Fichier fictif de logs
# #     logs = [
# #         "200 OK",
# #         "404 Not Found",(#         "500 Internal Server Error",
# #         "200 OK",
# #         "404 Not Found",
# #         "500 Internal Server Error",
# #         "500 Internal Server Error"
# #     ]


print("*********************************************************************************")

# # LES ENSEMBLES


 # Un ensemble (set) est une collection non ordonnée sans doublon d'informations
#
# # Création d'un ensemble
# my_set ={1,2,3,4,5}
# another_set ={4,5,6,7}
# my_set.add(12)
# print('Ensemble my_set et another_set = ',my_set,another_set)
#
# # Intérêt des ensembles :
# # Gestion efficace des valeurs uniques
#
# # Opération mathématiques rapides (intersection,union,difference..)
#
# # Optimisation des recherches (in est O(1) en moyenne pour les ensembles et
# # dictionnaires, contre O(n) pour les listes )
#
# # Application : Data science et lorsqu'on souhaite optimiser
#
# # Ajout et suppression d'éléments
# my_set.add(18)
# print('my_set =',my_set)
#
# my_set.discard(3) # va supprimer 3 de l'ensemble
# print('my_set =',my_set)
#
# # Opération d'ensemble
# print('Ensemble my_set et another_set = ',my_set,another_set)
# print('Union entre my_set et another_set =',my_set | another_set)
#
# print('Intersection entre my_set et another_set',my_set & another_set)
# print('Difference entre my_set et another_set',my_set - another_set)
# print('Difference entre another_set et my_set',another_set - my_set)
#
# # Ne conserve pas l'ordre des éléments
# # Ne permet pas d'accéder aux éléments via index
# # Ne permet pas d'ajouter un élément à une position précise
#
# # Vérification d'inclusion SOUS et SUR
#
# subset ={4,5}
#
# # On veut savoir si subset est un sous ensemble de my_set ou another_set
#
# print('subset est-il un SOUS ensemble de another_set ?',subset.issubset(another_set))
#
# print('another_set est-il un SUR ensemble de subset ?',another_set.issuperset(subset))
#
#
# # Ensembles immuables : frosenset : Ce sont des ensembles gelés. On ne peut pas les modifier.
#
# # Création :
# immuable_set =frozenset([1,2,3,4])
# print('frozenset , immuable_set=',immuable_set)
#
# #immuable_set.add(5)
# # le print suivant génère une erreur. Normal. Les frozenset NE SE MODIFIENT PAS
# # print('frozenset , immuable_set plus 5 =',immuable_set)
#
# # Compréhension d'ensemble
#
# Exercice: renvoyez le carré de chaque élément de my_set
# print('le carré = ',squared_set)
#
# # Vérifier la présence d'un élément dans un ensemble. ( in ultra rapide : O(1)

#
# # Eliminer les doublons rapidement
# numbers =[1,2,3,2,4,4,5]
# REND UN ENSEMBLE QU'ON PEUT CONVERTIR EN LISTE BIEN SUR : list(set(numbers))

#

print("*********************************************************************************")

# # CONCLUSION mémoire :
# # Tuple : meilleure optimisation mémoire
# # Liste : assez compact.... plus que les Tuple
# # Ensemble: plus lourd car, utilisation d'une table de hachage
# # Dictionnaire : le plus coûteux . Car, stockage des clef, valeur,table de hachage
#
# # Conclusion Vitesse :
# # Tuple O(n) pour les recherches
# # Liste : O(n)
# # Ensemble : O(1)
# # Dictionnaire : ( O(1) mais lourd )

print("*********************************************************************************")
# # ----------------- PRATIQUE 3 6min
#
# from collections import defaultdict
#
# def generate_datastructure():

# # ============ 7/02/25 ===================
# # def to_iterator(malitse):
# # 	return iter(malitse)
# #
# # it =to_iterator([5,10,15])
# # print(next(it))
# # print(next(it))
# # print(next(it))
# # print(next(it))
print("*********************************************************************************")
# import sys
# #crée une fonction qui génère les carré des nombres de 0 à n-1


# #qui génère toutes les  paires  uniques(combinaisons  de  2 éléments
# # un itérable en utilisant itertools.comninations()
#
print("*********************************************************************************")
# def pair_combinations(iterable):


print("*********************************************************************************")

# # ---------------- Pratique 7 : 10min  --------------------
#
# # Ecrire une fonction group_scores(scores) qui :
#
# # Prend une liste de scores triés sous forme (nom, score).
# # Regroupe les scores par valeur en utilisant itertools.groupby().
# # Renvoie un dictionnaire {score: [noms]}


print("*********************************************************************************")
 # Exemple :
# scores = [("Alice", 90), ("Bob", 80), ("Charlie", 90), ("David", 70), ("Eve", 80)]

# # Exercice: Optimisation d’un planning de rotation d’équipe
# # Contexte professionnel :
# # Une entreprise de support technique doit organiser le planning hebdomadaire de ses employés en assurant :
#
# # Une rotation équilibrée des employés.
# # Une alternance entre matin, après-midi et soir.
# # Un travail en binôme (chaque employé travaille avec un autre différent chaque jour).
# # Aucun employé ne travaille deux fois de suite au même horaire.
# # L’objectif est de générer un planning optimisé en utilisant itertools.
#
#
# # Générer toutes les permutations possibles des employés pour s'assurer qu'ils travaillent avec différents collègues chaque jour.
# # Utiliser itertools.product pour combiner les jours de la semaine avec les horaires disponibles.
# # Utiliser itertools.cycle pour assurer une rotation équilibrée sur les horaires.
# # Utiliser itertools.tee pour analyser le planning généré sans épuiser l’itérable.
# # S’assurer que chaque employé ne travaille pas deux fois consécutivement sur le même créneau.
#
# ## Question : Equité : S'assurer qu'aucun employé n'ai plus X jours de repos avant son travail suivant
# # Autrement : Que tous les employés aient le même nombre de jours de repos entre deux moments de travail
#
# employees = ["Jarfar", "Aurelien", "Paly", "Lucas", "Dan", "Arnaud"]
# days = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi"]
# shifts = ["Matin", "Après-midi", "Soir"]

print("*********************************************************************************")
# # ===================== 11 Février =====================
#
# # TOSA PRATIQUE
#
# # Ecrivez un modèle d'expression régulière nommé regex qui ne correspond qu'aux chaines de caractères
# # contenant au moins 3 chiffres à la suite dans une fonction check_condition(regex, s)
# # Par exemple, il doit correspondre à 'zt904a' mais pas à 'qwerty' et ni à '1a2b3c'
#
# # La fonction retourne un booléen en fonction de la recherche.

print("*********************************************************************************")

# # ================= 12 Fevrier 25 ==============================
#
# # Exercice TOSA PYTHON (6min)
#
# # Trouver tous les nombres dans une chaîne et retourner leurs positions (start, end, valeur).
#
# # Contraintes :
# # Compilez la regex
# # Utilisez une compréhension de liste
# # Précisez la docString de la fonction

print("*********************************************************************************")

 # EXERCICE TOSA ~ 7min
#
# # Regrouper une liste de produits par catégorie avec une fonction regroupement_par_categorie(). Cette fonction retourne # un dictionnaire.
# # Compétences évaluées :
# # Utilisation de groupby() de itertools sur des données triées.
# # Construction d’un dictionnaire de catégories automatiquement.
# # Manipulation avancée de listes de dictionnaires.
#
# produits = [
# 	{"nom": "Pomme", "categorie": "Fruits"},
# 	{"nom": "Banane", "categorie": "Fruits"},
# 	{"nom": "Carotte", "categorie": "Légumes"},
# 	{"nom": "Tomate", "categorie": "Légumes"},
# 	{"nom": "Orange", "categorie": "Fruits"},
# ]


print("*********************************************************************************")

# # TOSA PRATIQUE ~5min
# # Trouver la première lettre qui ne se répète pas dans une chaîne avec le module Counter


print("*********************************************************************************")

# from linecache import cache
#
# from pyarrow.lib import Type_RUN_END_ENCODED

# # Test
# print(first_non_repeating_char("aabccdeff"))  # 'b'
# print(first_non_repeating_char("aabb"))  # None


print("*********************************************************************************")
# EXERCICE TOSA PYTON ~7min
# Vous devez implémenter une fonction qui calcule des statistiques sur une liste de nombres :

# Moyenne (mean)
# Médiane (median)
# Écart type (std_dev)
#[10, 20, 30, 40],[1, 1, 1, 1],[5],[-5, -10, -15]
print("*********************************************************************************")

# import statistics

# Définir un argument obligatoire "valeur" type float
# Définir un argument obligatoire "unite" dont le choix : km ou miles
# Ajouter un argument optionnel --verbose (-v).
# Si l’option est activée, afficher un message détaillé du type :
# "La conversion de 10 km en miles donne 6.21 miles."
# "La conversion de 5 miles en km donne 8.05 km."
# Si --verbose n'est pas activé, garder l'affichage standard :
# 10 km = 6.21
# 5 miles = 8.05

print("*********************************************************************************")

#================================= 24 Février 2025 ===========================
# Compléter la fonction launcher de façon à ce qu'elle accepte comme paramètre , en plus
# de my_callable,un nombre quelconque d'arguments positionnels
# (positionnel arguments) par mot-cles (keymord arguments)
# La fonction launcher doit exécuter my_callable avec tous les arguments fournis, et retourner
# son résultat
print("*********************************************************************************")

# EXERCICE TOSA PRATIQUE - OBJET
#
# Créer une classe abstraite Vehicule avec une méthode abstraite decrire().
# Créer ensuite deux sous-classes Voiture et Moto, chacune implémente decrire() différemment.
#
#
# La classe Vehicule est abstraite (ABC).
# Voiture et Moto héritent de Vehicule.
# decrire() doit renvoyer une description du véhicule.
#
#
#
# Sortie attendue :
# Je suis une voiture.
# Je suis une moto.
print("*********************************************************************************")

from abc import ABC
from abc import abstractmethod


# class Vehicule(ABC):
#     """
#     Classe véhicule qui est une classe abstraite . Donc qui hérite de ABC
#     """
#     @abstractmethod
#     def decrire(self):
#         return " Je suis un Véhicule"
#
#
#
# class Voiture(Vehicule):
#     def __init__(self):
#         pass
#
#     def decrire(self):
#
#
#
#
# class Moto(Vehicule):
#     def __int__(self):
#         pass
#
#     def decrire(self):
#
#
#
# ma_voiture = Voiture()
# ma_moto = Moto()
#
# print(ma_voiture.decrire())
# print(ma_moto.decrire())

print("*********************************************************************************")
print("***************** 4 Mars *****************")
"""
EXERCICE TOSA 6min

Créer une classe Memorizer qui :

Stocke les résultats des appels précédents dans un dictionnaire (cache).
Compte le nombre total d’appels (appel_count).
Implémente __call__(n) pour calculer n * 2, sauf si le résultat est déjà en cache.
Tester avec plusieurs appels et afficher le cache et le nombre d’appels.


# ----- TESTS ----- : 
memo = Memorizer()
print(memo(5))  #  Calculé : 5 → 10
print(memo(3))  #  Calculé : 3 → 6
print(memo(5))  #  Récupéré depuis le cache : 5 → 10

print(f" Nombre d'appels réels : {memo.appel_count}")  #  2 (seuls 5 et 3 ont été calculés)


"""



print("************************* 6 MARS : 5 Exercices ********************")

print("---------- Exerciuce 1 -------------")
# ---- Exercice
# TOSA
# ---- Exercice TOSA 1 ---- :
# Complétez la classe suivante pour que l’affichage print(dog)
# retourne "Chien de race Labrador".
# class Dog:
#


# dog = Dog("Labrador")
# print(dog)  # Doit afficher : Chien de race Labrador

print("///// Exo 2 /////")


# ---- Exercice TOSA 2 ---- :
# Complétez la classe BankAccount pour permettre l’addition de deux comptes
# bancaires en surchargeant l’opérateur +.L’addition de deux comptes doit
# retourner un nouveau compte avec la somme des soldes des deux comptes.
# class BankAccount:
#     def __init__(self, owner, balance):
#         self.owner = owner
#         self.balance = balance
#
#     # Complétez ici
#
# acc1 = BankAccount("Sam", 1000)
# acc2 = BankAccount("Nad", 1500)
#
# acc3 = acc1 + acc2  # Devrait créer un nouveau compte avec balance 2500
# print(acc3.owner)  # Doit afficher : "Sam & Nad"
# print(acc3.balance)  # Doit afficher : 2500

# class BankAccount:
#     def __init__(self, owner, balance):
#         self.owner = owner
#         self.balance = balance
#
#     def __add__(self,obj):

#
#
# acc1 = BankAccount("Sam", 1000)
# acc2 = BankAccount("Nad", 1500)


# acc3 = acc1 + acc2  # Devrait créer un nouveau compte avec balance 2500
# # print(acc3.owner)  # Doit afficher : "Sam & Nad"
# # print(acc3.balance)  # Doit afficher : 2500

print("--------- Exercice 3---------")


# ---- Exercice TOSA 3 ----:
# Complétez la classe Singleton pour qu'elle respecte le design pattern Singleton
#
# class Singleton(type):
#    _instances = {}
#
#    def __call__(cls, *args, **kwargs):
#
# # #
# s1 = Singleton()
# s2 = Singleton()
#
# print(s1 is s2)  # Doit afficher True

print("********* Exo 4 *******************")

# ---- EXERCICE TOSA 4 ---- :
# Complétez la classe Point pour qu’elle soit immutable
#
# from dataclasses import dataclass
#
# @dataclass(frozen=True)
# class Point:
#     x:int
#     y:int
#
# p = Point(x=1, y=2)
# # p.x = 10  # Doit lever une erreur à cause de frozen=True


print("////// Exo 5//////")

# ---- EXERCICE TOSA 5 ----:
# Complétez la classe pour que isinstance(obj, A)
# retourne True uniquement si obj a l’attribut special_attr
#
# class Meta(type):
#     # Lorsqu'on fait isinstance , c'est __instancecheck__  qui est appelé
#     def __instancecheck__(cls, instance):
#         if hasattr(instance,"special_attr"):
#             return True
#         else:
#             return False
#
# class A(metaclass=Meta):
#     pass
#
# class B:
#     special_attr = True
#
# b = B()
# print(isinstance(b, A))  # Doit afficher True
#

print("**************** Vendredi 7 Mars 2025 ************************")
print("Exercice 1")
from abc import ABC, abstractmethod
import math

class Forme(ABC):
    @abstractmethod
    def aire(self):
        pass

class Carre(Forme):
    def __init__(self, cote):


    def aire(self):



class Cercle(Forme):
    def __init__(self, rayon):
        self.rayon  =rayon

    def aire(self):


# TESTS :
c1 = Carre(4)
print(c1.aire())  # Doit afficher 16

c2 = Cercle(3)
print(round(c2.aire(), 2))  # Doit afficher 28.27


print("Exercice 2")

print("------ EXERCICE TOSA 2 ------:")

# Compléter la fonction pour retourner la liste
# des fichiers .txt présents dans un dossier donné.

from pathlib import Path

def fichiers_txt(dossier):



# Exemple d'utilisation
dossier = "mon_dossier"  # Remplacez par le chemin de votre dossier
liste_fichiers_txt = fichiers_txt(dossier)
print(liste_fichiers_txt)

# TESTS :
print(fichiers_txt("."))
# Affiche ["exemple.txt", "notes.txt"] si ces fichiers existent



print("------ EXERCICE TOSA 3 ------ : ")
import pandas as pa
import json

def charger_json(fichier):




# TESTS :

# Supposons un fichier JSON {"nom": "Sam", "age": 30, "ville": "Paris"}
print(charger_json("data.json"))
# Doit afficher :
#     nom  âge
# 0  Sam  30


print("------ EXERCICE TOSA 4 ------:")

# Compléter la fonction nettoyer_df(df), qui :
#
# Remplace les valeurs manquantes (NaN)
# par la moyenne de la colonne.
# Trie le DataFrame par ordre décroissant
# de la colonne revenu.


import pandas as pa
import numpy as np

def nettoyer_df(df_):
    # remplaçons les NaN existants par la moyenne, avec l'option : inplace=True

# TESTS :
data = {"nom": ["Sam", "Bob", "Charlie"], "revenu": [50000, np.nan, 70000]}
df = pa.DataFrame(data)
print(nettoyer_df(df))


print("------ EXERCICE TOSA 5 ---------:")
# Compléter la fonction
# moyenne_par_groupe(df, colonne_groupe,
# colonne_valeur), qui :
#
# Groupe les données par colonne_groupe.
# Retourne la moyenne de colonne_valeur
# pour chaque groupe.

import pandas as pa

def moyenne_par_groupe(df, colonne_groupe, colonne_valeur):
    return

# TESTS :
data = {"categorie": ["A", "B", "A", "B", "A"], "valeur": [10, 20, 30, 40, 50]}
df = pa.DataFrame(data)
print(moyenne_par_groupe(df, "categorie", "valeur"))
# Doit afficher :
# categorie
# A    30.0
# B    30.0



