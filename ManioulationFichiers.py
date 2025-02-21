# -----------------Manipulation fichier basique ----------------
# with open() permet d'ouvrir un fichier et de s'assurer qu'il est bien fermé après utilisation
# Sans with open , il  faut manuellement fermer le fichier avec file.close()
import statistics

# Exemple Ecrire dans un fichier:
    # with open() permet d'ouvrir un fichier et de s'assurer qu'il est bien fermé après utilisation
    # Sans with open , il  faut manuellement fermer le fichier avec file.close()

    # Exemple Ecrire dans un fichier:
data={'name':'Sam', 'city':'Paris','age':18}
import json
with open('mon_fichier.txt', 'w',encoding='utf-8') as f:  #'w' pour écriture, 'a' : pour lecture
    f.write("Bonjour GRETA 91 \n")
    f.write("Découvrons le with open()\n")
    f.write("Blablabla\n")
    json.dump(data, f)  # sérialisation de data dans f

# Ouverture de fichier
with open('mon_fichier.txt', 'r') as file:
  contenu = file.read()
  print(contenu)

try:
 with open('mon_fichier.txt','r') as file:
 	contenu =file.read()
    # Quand on souhaite lire du JSON, on fait:
    # json.load(file) # Cette ligne permet de lire un fichier json dans une variable pour l'exploiter
 	print(contenu)
except FileNotFoundError:
	print("Erreur : Le fichiers n'existe pas! ")
except Exception as e:
	print(" Une erreur s'est produite {e}")


# ----- EXERCICE 03 ------
# Charger et manipuler des données complexes issues d'une chaine JSON.
# Charger les données JSON
# Filtrer les utilisateurs actifs
# Afficher les utilisateurs actifs
# Utiliser un set pour récupérer les âges uniques des utilisateurs actifs.

# ------------------ EXO 3
print('EXO3')
def exo03():
    json_data = '''
        {
            "users": [
                {"id": 1, "name": "Alice", "age": 30, "active": true},
                {"id": 2, "name": "Bob", "age": 25, "active": false},
                {"id": 3, "name": "Charlie", "age": 35, "active": true}
            ]
        }
        '''
    # Charger et manipuler des données complexes issues d'une chaine JSON.
    dict_data = json.loads(json_data)
    dict_data = dict_data['users']
    print('dict_data = ',dict_data)
    print(dict_data[0]['id'],dict_data[0]['name'],dict_data[0]['age'],'ans',dict_data[0]['active'])
    # Charger les données JSON
    # Filtrer les utilisateurs actifs
    utilisateurs_actifs = []
    utilisateurs_actifs.append([dict_data[i] for i in range(len(dict_data)) if dict_data[i]['active']])
    print('Utilisateur actifs = ', utilisateurs_actifs)
    # Afficher les utilisateurs actifs
    utilisateurs_actifs = utilisateurs_actifs[0]
    for j in range(len(utilisateurs_actifs)):
        print('Utilisateur actif Nom:',utilisateurs_actifs[j]['name'])

    # Utiliser un set pour récupérer les âges uniques des utilisateurs actifs.
    age_unique = [i['age'] for i in dict_data]
    print('Ages uniques =',set(age_unique))
exo03()




# ----- EXERCICE 06 : module statistics et math (découverte en autonomie/groupe) -----
# Vous devez analyser les scores d’un groupe d’étudiants en utilisant le module statistics.
# L’objectif est de fournir des informations détaillées, comme :
# La moyenne des scores avec statistics.mean(xx).
# La médiane (score central) avec statistics.median(xx).
# L’écart-type (dispersion des scores) avec statistics.stdev(xx).
# Les scores minimum et maximum.
# Le 25e et 75e percentiles.
# La variance des scores avec statistics.variance(xx).
# Afficher l'ensemble des résultats
# Ajouter un score et voir si les paramètres (moyenne etc..) sont à jour
# Vérifier et Afficher si un score est supérieur ou inférieur à la moyenne

# -------------------------------------------------------

import statistics as stat
from math import *
# Scores fictifs
scores = [85, 90, 78, 92, 88, 76, 95, 89]

#scores = [11,12,51,33,21,85, 90, 78, 92, 88, 76, 95, 89]
# La moyenne des scores avec statistics.mean(xx).
moyenne_score = stat.mean(scores)
print('La moyenne des scores= ',"{:.2f}".format(moyenne_score))
# La médiane (score central) avec statistics.median(xx).
print('La médiane (score central) = ',"{:.2f}".format(stat.median(scores)))
# L’écart-type (dispersion des scores) avec statistics.stdev(xx).
print("L'écart-type (dispersion des scores) = ","{:.2f}".format(stat.stdev(scores)))
# Les scores minimum et maximum.
print('Le plus grand scrore = ',max(scores),'Le plus petit score =',min(scores))
# Le 25e et 75e percentiles.
# Le premier quantile Q1 est la plus petite valeur Q1 de la série de données tel que 25% au moins des autres
# valeurs lui sont inférieures ou égales.
# print('Le 25ème =',np.quantiles(scores,25,),'Le 75ème = ',)
# ********** EXPLICATION ****************
# On range la liste par ordre croissant.
# Q1 est le point de données situé exactement à mi-chemin
# de la moitié inférieure de
# l 'ensemble de données. Trouvez-le en '
# trouvant la médiane des données situées en dessous de la
# médiane. Q3 est le point à mi-chemin entre la médiane et la fin
# de l(')ensemble de données. Trouvez-le en trouvant la médiane de la '
# moitié des données situées au-dessus de la médiane.)
scores.sort()
print("//////// Score trié :",scores)
taille = len(scores)
position_q1 = scores[ceil(taille/2)]
position_q3 = scores[ceil((taille + ceil(taille/2))/2)]
print("Le premier quantile (25% des valeurs) Q1=",position_q1)

# Le troisième quartile est la plus petite valeur Q_{3} de la série de données tel
# que 75% au moins des autres valeurs lui sont inférieures ou égales.
print("Le troisième quantile (75% des valeurs) Q3=",position_q3)

#La variance des scores avec statistics.variance(xx).
print('La variance des scores =',"{:3.2f}".format(stat.variance(scores)))
# Vérifier et Afficher si un score est supérieur ou inférieur à la moyenne
score_inf_moy = [m for m in scores if m<=moyenne_score]
print('Score inférieur ou égal à la moyenne = ',score_inf_moy,'moyenne =',moyenne_score)
score_sup_moy = [s for s in scores if s > moyenne_score]
print('Score inférieur ou égal à la moyenne = ',score_sup_moy,'moyenne =',moyenne_score)


# ----- EXERCICE 07 : JSON COMPLEXES -----
# Vous devez analyser un fichier JSON contenant des informations sur plusieurs projets.
# Chaque projet est constitué d'un nom et d'une liste de tâches avec leur statut (done ou pending).

# Objectifs :
# Récupérer les donnnées d'un fichier json
# Charger et parser des données JSON pour extraire des informations avec json.loads.
# Identifier les projets inachevés (contenant au moins une tâche avec le statut pending).
# Afficher les projets inachevés
# Exporter les projets inachevés dans un nouveau fichier JSON avec json.dump.
print("///////////////////////////////////////////////////////")
def exo07():
    # Récupérer les donnnées d'un fichier json
    with open('large_projects.json','r') as fiche:
        data_json = json.load(fiche)
        # Identifier les projets inachevés (contenant au moins une tâche avec le statut pending).
    taches_inachevees =[]
    les_projets_inacheves =[]
    for i in range(len(data_json)):
        data = data_json[i]
        # print('---',data['tasks'])
        tach = data['tasks']
        memoire =[]
        for j in tach:
            if 'pending' in j.values() and data['title'] not in memoire:
                memoire.append(data['title'])
                taches_inachevees.append({data['title']:data['tasks']})
                les_projets_inacheves.append(data['title'])
            else:pass
    print('taches inachevées =',taches_inachevees)
    # Afficher les projets inachevés
    print('+++++++++++++++++++++++++++++++')
    print('Les Projets inachevés = ',memoire)
    print('Nombre de projets inachevés = ',len(les_projets_inacheves))
    # Exporter les projets inachevés dans un nouveau fichier JSON avec json.dump
    with open('projets_inacheves.txt', 'w', encoding='utf-8') as proj_ina:
        json.dump(taches_inachevees, proj_ina)  # sérialisation de data

# exo07()