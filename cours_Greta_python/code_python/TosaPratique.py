# -*- encoding: utf-8 -*-
# # pratique 2:
# #prend une liste et returne un tuples
# # def find_first(f_list):
# #     for i in range(len(f_list)):
# #         if isinstance(f_list[i],str):
# #             return i + 1,f_list[i]
# import copy
# import itertools
#
# # from cloudinit.net import find_fallback_nic_on_freebsd
# # from louis import dotsIO
#
# # Résultat
#
# # print(find_first([1, 2, "Fizz",4,5,"Fizz",7,8,"Fizz",10,11,"Fizz",13,14,"Fizz",16,17,"Fizz",19,20]))
#
# # Devra afficher (3,'Fizz')
# # print(find_first([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, "Buzz", 14, 15, 16, 17, 18, 19, 20]))
# # doit retourner (13,'Buzz')
#
#
# # ----- EXERCICE 02 ------
# # Vous êtes chargé d'analyser les logs d'un serveur pour identifier les erreurs les plus fréquentes.
# # Le fichier de logs contient des lignes au format suivant :
# # 200 OK
# # 404 Not Found
# # 500 Internal Server Error
# # Chaque ligne commence par un code HTTP, suivi d'une description.
#
#
# # -----------------------------------------------------------------
#
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
#
#
# # -----------------------------------------------------------------
#
# # LES ENSEMBLES
#
#
# # Un ensemble (set) est une collection non ordonnée sans doublon d'informations
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
# squared_set ={x**2 for x in my_set}
# print('le carré = ',squared_set)
#
# # Vérifier la présence d'un élément dans un ensemble. ( in ultra rapide : O(1)
# if 4 in my_set:
# 	print('ok')
#
# # Eliminer les doublons rapidement
# numbers =[1,2,3,2,4,4,5]
# unique_numbers =set(numbers)  # REND UN ENSEMBLE QU'ON PEUT CONVERTIR EN LISTE BIEN SUR : list(set(numbers))
# print('Unique valeurs = ',unique_numbers)
#
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
#
#
# # ----------------- PRATIQUE 3 6min
#
# from collections import defaultdict
#
# def generate_datastructure():
# 	obj = defaultdict(lambda: 'Anonymous')
# 	return obj
#
# # ============ 7/02/25 ===================
# # def to_iterator(malitse):
# # 	return iter(malitse)
# #
# # it =to_iterator([5,10,15])
# # print(next(it))
# # print(next(it))
# # print(next(it))
# # print(next(it))
#
# #print(next(it,'Fin de l\'itérateur'))
#
# print("/////////////////")
# import sys
# #crée une focntion qui génère les carré des nombres de 0 à n-1
# def square_number(n, use_generator=True):
# 	'''Une liste (mode use_generator = False)
#     Affiche la mémoire utilisée pour chaque version'''
# 	if use_generator:
# 		return iter((x**2 for x in range(n)))
# 	else:
# 		return [x**2 for x in range(n)]
#
# print("use_generator=True",sys.getsizeof((square_number(10 ** 6, use_generator=True))),"octets")  # Faible mémoire
# print("use_generator=False",sys.getsizeof((square_number(10 ** 6,use_generator=False))),"octets") # élevée
#
# print("+++++++++++++++++++++++")
#
# #qui génère toutes les  paires  uniques(combinaisons  de  2 élémenrtsd
# # un itérable en utilisant itertools.comninations()
#
# def pair_combinations(iterable):
# 	return itertools.combinations(iterable,2)
#
#
# # exeemple result = list(pair_combinations([1, 2, 3, 4])) = [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4), (3, 4)]
# result = list(pair_combinations([1, 2, 3, 4]))
# print("Result =",result)
#
# print("---------------------------")
#
# # ---------------- Pratique 7 : 10min  --------------------
#
# # Ecrire une fonction group_scores(scores) qui :
#
# # Prend une liste de scores triés sous forme (nom, score).
# # Regroupe les scores par valeur en utilisant itertools.groupby().
# # Renvoie un dictionnaire {score: [noms]}
#
# def group_scores(scores_donne):
# 	scores_donne.sort(key=lambda x:x[1],reverse=True)
# 	print("****",scores)
# 	return {scor:[nom for nom,_ in list(gr)] for scor,gr in itertools.groupby(scores_donne,lambda x:x[1])}
#
# # Exemple :
# scores = [("Alice", 90), ("Bob", 80), ("Charlie", 90), ("David", 70), ("Eve", 80)]
# result = group_scores(scores)
# print(result)
# # {90: ["Alice", "Charlie"], 80: ["Bob", "Eve"], 70: ["David"]}
#
#
# print('ppppppppppppppppppppppppppppppppppppppppppppppp')
#
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
#
#
# # def presence_equipe_partielle_ou_non(eq,dico_equipe_tache):
# # 	"""
# # 	Indique True si Un membre de eq est dans dico_equipe_tache
# # 	:param eq: (nom_un,nom_deux)
# # 	:param dico_equipe_tache: {(nom1,nom2):('Lundi','Matin'),(nom3,nom4):('Lundi','soir')....}
# # 	:return:
# # 	"""
# # 	reponse = False
# # 	for clef in dico_equipe_tache.keys():
# # 		if clef[0] == eq[0] or clef[0]==eq[1] or clef[1]==eq[0] or clef[1]==eq[1]:
# # 			reponse = True
# # 			return reponse
# # 		else:pass
# # 	return reponse
#
# # def recherche_tous_les_moments_travail(equipe,dico):
# # 	jours=[]
# # 	moments = []
# # 	for k in dico.keys():
# # 		if presence_equipe_partielle_ou_non(equipe,dico):
# # 			jours.append(dico[k][0])
# # 			moments.append(dico[k][1])
# # 		else:pass
# # 	return jours,moments
#
#
# def valider_entrer_equipe(equipe,dico,moment_tuple):
# 	"""
# 	Cette fonction valide si l'équipe : equipe peut être intégrer au dictionnaire : dico  avec
# 	son moment de travail moment_tuple
# 	:param equipe:
# 	:param dico:
# 	:param moment_tuple:
# 	:return: Boolean
# 	"""
# 	toutes_les_reponse = []
# 	if dico=={}:
# 		return True
# 	else:
# 		for cle,moment_courant in dico.items():
# 			if equipe[0]==cle[0] or equipe[0]==cle[1] or equipe[1]==cle[0] or equipe[1]==cle[0]:
# 				if moment_courant[0]!=moment_tuple[0] and moment_courant[1]!=moment_tuple[1]:
# 					toutes_les_reponse.append("True")
# 				# else:toutes_les_reponse.append("False")
# 			else:toutes_les_reponse.append("True")
#
# 		if "False" not in toutes_les_reponse:
# 			return True
# 		else:
# 			return False
#
#
# def generate_schedule(employees, days, shifts):
# 	"""
# 	:param employees:
# 	:param days:
# 	:param shifts:
# 	:return:
# 	"""
# 	#Générer toutes les permutations possibles des employés pour s'assurer qu'ils travaillent avec différents
#     # collègues chaque jour.
# 	toutes_permut_employes = list(itertools.permutations(employees,2))
# 	print('Les permutations employés possibles =',toutes_permut_employes)
# 	# Utiliser itertools.product pour combiner les jours de la semaine avec les horaires disponibles.
# 	combine_jours_horaires = list(itertools.product(days,shifts))
# 	# print('Les combinaisons ,jours-horaires =',combine_jours_horaires)
# 	# Utiliser itertools.cycle pour assurer une rotation équilibrée sur les horaires.
# 	planning_groupe_travail = itertools.cycle(combine_jours_horaires)
# 	taille_base =len(toutes_permut_employes)
# 	tasks = [next(planning_groupe_travail) for _ in range(120)]
# 	print("Horaire groupe de travail =",tasks,'taille =',len(tasks))
# 	# si par exemple :('Jarfar', 'Aurelien') travaillent Lundi-Matin, le couple ('Jarfar', 'Paly') ne
# 	# sera plus mis sur Lundi. A cause de la présence de Jarfar. Mais Parly peut travailler Lundi
# 	# Parcourons toute la liste toutes_permut_employes
# 	dico_equipe_tache = {}
# 	compteur =0
# 	iter_cycle_equipe= itertools.cycle(toutes_permut_employes)
# 	equipe_cycle = [next(iter_cycle_equipe) for _ in range(120)]  # Mettre un random ici pour changer l'ordre
# 	# Possibilité d'ordonner equipe_cycle
# 	print("Toute l'équipe =",equipe_cycle)
# 	for eq in equipe_cycle:
# 		if valider_entrer_equipe(eq, dico_equipe_tache, tasks[compteur]):
# 			# print("L'équipe:",eq,"Moment:",tasks[compteur],"Dictionnaire :",dico_equipe_tache)
# 			dico_equipe_tache[eq] = tasks[compteur]
# 			compteur += 1
# 			if compteur == len(tasks) - 1:
# 				compteur = 0
# 		else:pass
#
# 	print('Les associations equipe-horaire =',dico_equipe_tache)
#
# generate_schedule(employees, days, shifts)
# # def display_schedule(schedule):
# #     pass
#
# # ===================== 11 Février =====================
#
# # TOSA PRATIQUE
#
# # Ecrivez un modèle d'expression régulière nommé regex qui ne correspond qu'aux chaines de caractères
# # contenant au moins 3 chiffres à la suite dans une fonction check_condition(regex, s)
# # Par exemple, il doit correspondre à 'zt904a' mais pas à 'qwerty' et ni à '1a2b3c'
#
# # La fonction retourne un booléen en fonction de la recherche.
#
# # Temps par TOSA : 5min
# import re
#
# def check_condition(reg:str, mon_string:str)->bool: # Les paramètres peuvent être typés :
# 	# Même si le typage est renseigné, ce n'est pas fort comme dans C ou C++
# 	"""
# 	Verifie si la chaine mon_string contient au moins 3 chiffres
# 	:param reg: : C'est l'expression régulière utilisée pour tester mon_string
# 	type: regex
# 	:param mon_string: : C'est la chaine qui est testée.
# 	type : str
# 	:return: True mon_string contient si au moins 3 chiffres consécutifs ou False sinon
# 	type : bool
# 	"""
# 	match= re.search(reg,mon_string)
# 	return bool(match)
#
#
# regex = r'\d{3,}' # {3,} signifie: au moins 3 chiffres ou aussi {3}+
# s = 'zt904a'
# print("Réponse=",check_condition(regex,s))
#
#
#
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
#
# import re
# def extract_numbers(text)->[]:
# 	"""
# 	Cette fonction prent une chaine de caractères et retourne les chiffres qui sont dedans avec leur position
# 	:param text:
# 	:return: Retourne tous les nombres dans une chaine
# 	"""
# 	motif = re.compile(r'\d+')
#
# 	return [(match.start(),match.end(),match.group()) for match in re.finditer(motif, text)]
#
#
# text = "Prix : 199€, Promo:50%, Quantité : 3 unités"
# # Résultat attendu : [(7, 10, '199'), (19, 21, '50'), (35, 36, '3')]
# print(extract_numbers(text))
#
# # EXERCICE TOSA ~ 7min
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
#
#
# def regroupement_par_categorie(produits):
# 	# Pour utiliser itertools.groupby, on doit d'abord nécessairement trier la liste par catégorie
# 	produits.sort(key=lambda x:x["categorie"])
# 	# print(produits)
# 	print({fruit:[val["nom"] for val in elem] for fruit,elem in itertools.groupby(produits, key=lambda x:x["categorie"])})
#
# regroupement_par_categorie(produits)
# # Entrée : produits
# # Exemple de Sortie : {'Fruits': ['Pomme', 'Banane', 'Orange'], 'Légumes': ['Carotte', 'Tomate']}
#
#
# # TOSA PRATIQUE ~5min
# # Trouver la première lettre qui ne se répète pas dans une chaîne avec le module Counter
#
#
# from collections import Counter
#
# def first_non_repeating_char(st):
# 	reg= Counter(st).most_common() # Le retour est une liste de tuples
# 	print("reg=",reg)
# 	for i in reg:
# 		if i[1]==1:
# 			return i[0]
# from TDListes import nombres
from linecache import cache

# # Test
# print(first_non_repeating_char("aabccdeff"))  # 'b'
# print(first_non_repeating_char("aabb"))  # None

print("//////////////////////////////////////////////")

# EXERCICE TOSA PYTON ~7min
# Vous devez implémenter une fonction qui calcule des statistiques sur une liste de nombres :

# Moyenne (mean)
# Médiane (median)
# Écart type (std_dev)

# import statistics
#
#
# def compute_statistics(numbers):
# 	"""
#     Calcule la moyenne, la médiane et l'écart-type d'une liste de nombres.
#
#     :param numbers: Liste de nombres (int ou float)
#     :return: Dictionnaire {'mean': ..., 'median': ..., 'std_dev': ...} arrondi à 2 décimales avec round()
#     :raises ValueError: Si la liste est vide
#     :raises TypeError: Si l'entrée n'est pas une liste de nombres
#     """
# 	if len(numbers)==0:
# 		raise ValueError(" La Liste est vide et ne devrait l'être")
# 	else:
# 		if len(numbers)==1:
# 			return {"mean":round(statistics.mean(numbers),2),"median":round(statistics.median(numbers),2),"std_dev":0}
# 		elif len(numbers)>1:
# 			for i in numbers:
# 				try:
# 					if not isinstance(i,int) or not isinstance(i,float):
# 						raise TypeError("Les éléments de la liste doivent être soit des entiers ou des float ou leur mélange.")
# 					else:pass
# 				except:pass
# 			return {"mean":round(statistics.mean(numbers),2),
# 					"median":round(statistics.median(numbers),2),
# 					"std_dev":round(statistics.stdev(numbers),2)
# 				   }


# print(compute_statistics([-5, -10, -15]))
#
# import pytest
# #[10, 20, 30, 40],[1, 1, 1, 1],[5],[-5, -10, -15]
#
# @pytest.mark.parametrize("input_numbers",[[1, 2, 3, 4, 5],[10, 20, 30, 40],[1, 1, 1, 1],[5],[-5, -10, -15]])
# def test_compute_statistics(input_numbers):
# 	expected = {"mean":round(statistics.mean(input_numbers),2),"median":round(statistics.median(input_numbers),2),
# 				"std_dev":round(statistics.stdev(input_numbers),2) if len(input_numbers)>1 else 0}
# 	assert compute_statistics(input_numbers) == expected

# /////////////////////////////////////////////////////////////////////////
# Exercice TOSA PRATIQUE
# On veut ajouter une option --verbose (-v) au script ci-dessous qui permet d’afficher un message détaillé si elle est # activée.

# Objectifs :

# Définir un argument obligatoire "valeur" type float
# Définir un argument obligatoire "unite" dont le choix : km ou miles
# Ajouter un argument optionnel --verbose (-v).
# Si l’option est activée, afficher un message détaillé du type :
# "La conversion de 10 km en miles donne 6.21 miles."
# "La conversion de 5 miles en km donne 8.05 km."
# Si --verbose n'est pas activé, garder l'affichage standard :
# 10 km = 6.21
# 5 miles = 8.05

# Rappel :
# resultat = args.valeur * 1.60934  # Conversion miles → km
# resultat = args.valeur / 1.60934  # Conversion km → miles

# import argparse
#
# def main():
# 	parser = argparse.ArgumentParser(description="Script de conversion d'unités")
# 	parser.add_argument("valeur", type=float, help="Veuillez renseigner la distance soit en km soit en miles")
# 	parser.add_argument("mode", help="Mode", choices=["km", "miles"])
# 	parser.add_argument("-v","--verbose",action="store_true",help="Vous êtes en mode verboose")
#
# 	# Completer ICI
# 	args = parser.parse_args()
#
# 	if args.mode=="km":
# 		distance = str("{:.5f}".format(args.valeur * 1.60934)) +" miles"
#
# 	if args.mode=="miles":
# 		distance = str("{:.5f}".format(args.valeur / 1.60934))+ " km"
#
#
# 	if args.verbose:
# 		print("La consersion de :",args.valeur,args.mode,"est :",distance)
# 	else:
# 		print(args.valeur,"=",distance)
#
#
# main()

#================================= 24 Février 2025 ===========================
# Compléter la fonction launcher de façon à ce qu'elle accepte comme paramètre , en plus
# de my_callable,un nombre quelconque d'arguments positionnels
# (positionnel arguments) par mot-cles (keymord arguments)
# La fonction launcher doit exécuter my_callable avec tous les arguments fournis, et retourner
# son résultat


# def launcher(my_callable,*arg ,**kwgs):
# 	# if isinstance(arg[0],list):
# 	# 	for i in arg:
# 	# 		res= my_callable(i)
# 	# 	return res
# 	# else:
# 	# 	return my_callable(arg)
# 	return my_callable(*arg,**kwgs)
#
#
# print(launcher(sum, [1,2,3]))
# print(launcher(max,1,2,3))
# print(launcher(int,"100",base=2))
# #
# Exemple d'utilisation :
# assert launcher(sum,[1,2,3]))==6
# assert launcher (max, 1,2,3)==3
# assert launcher(int,"100",base=2)==4

# import numpy as np
# def graphe_matrix_to_list(m):
#     res=[[]]
#     for i in range(len(m)):
#         for j in range(len(m)):
#             if m[i,j]==True:
#                 res.insert(i,[1])
#             else:pass
#     return res
#
# m1= np.array([[False,True],[False,False]]) # Doit retourner  [[1],[]]
# m2 = np.array([[False,True,False],[True,False,True],[False,True,False]])
# print("Adjacent Matrice =",graphe_matrix_to_list(m1))



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
#         return "Je suis une Voiture"
#
#
#
# class Moto(Vehicule):
#     def __int__(self):
#         pass
#
#     def decrire(self):
#         return "Je suis une Moto"
#
#
# ma_voiture = Voiture()
# ma_moto = Moto()
#
# print(ma_voiture.decrire())
# print(ma_moto.decrire())



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

# class Memorizer:
#     def __int__(self):
#         self.cache = {}
#         self.count = 0
#
#     def __call__(self,n):
#         # self.count+=1
#         print(f"Count = {self.count}")
#         # if n in self.cache.keys():
#         #     print("Je ne calcule rien. Je retourne seulement")
#         #     return self.cache[n]
#         # else:
#         #    self.cache[n] = n*2
#         #    return self.cache[n]
#
# memo =Memorizer()
# print(memo(5))

print("************************* 6 MARS : 5 Exercices ********************")

print("---------- Exerciuce 1 -------------")
# ---- Exercice
# TOSA
# ---- Exercice TOSA 1 ---- :
# Complétez la classe suivante pour que l’affichage print(dog)
# retourne "Chien de race Labrador".
# class Dog:
#     def __init__(self, breed):
#         self.breed = breed
#
#     def __str__(self):
#         return f"Chien de race : {self.breed}"
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
#         commun_nom = self.owner + " & " + obj.owner
#         commune_somme = self.balance + obj.balance
#         return BankAccount(commun_nom,commune_somme)
#
#
# acc1 = BankAccount("Sam", 1000)
# acc2 = BankAccount("Nad", 1500)


# acc3 = acc1 + acc2  # Devrait créer un nouveau compte avec balance 2500
# # print(acc3.owner)  # Doit afficher : "Sam & Nad"
# # print(acc3.balance)  # Doit afficher : 2500

print("--------- Exercice 3---------")
# A REVOIR
"""
def __call__(cls, *args, **kwargs):
        # Vérifier si l'instance existe déjà
        if cls not in cls._instances:
            # Si l'instance n'existe pas, créer une nouvelle instance
            instance = super().__call__(*args, **kwargs)
            # Enregistrer cette instance
            cls._instances[cls] = instance
        # Retourner l'instance existante
        return cls._instances[cls]
"""

# ---- Exercice TOSA 3 ----:
# Complétez la classe Singleton pour qu'elle respecte le design pattern Singleton
#
# class Singleton(type):
#    _instances = {}
#
#    def __call__(cls, *args, **kwargs):
#         # Si l'instance n'existe pas encore, on la crée
#         if cls not in cls._instances:
#             cls._instances[cls] = super().__call__(*args, **kwargs)
#         # On retourne toujours la même instance
#         return cls._instances[cls]
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
