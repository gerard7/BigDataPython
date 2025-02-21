# Test de benchmark : c'est simplement un test de performance . c'est de mesure le temps d'exévcution
# d'un morceau de code et de le comparer à différentes solutions et de chosir la plus performante.
# Ce test concerne à la fois le temps d'exécution et la consommation mémoire.
# Trois modules seront abordés : time-os-psutil

import time
import os
import psutil


print("Version de psutil =",psutil.__version__)
# Permet d'interagir avec le processus et les ressources système (CPU,mémoire,disque,...)
# Le module psutils est très utilié pour surveiller / analyser et gérer les performances d'un système.

# 1 : Création d'un fichier de test avec 1 million de lignes

NOMBRE_LIGNES =10**10
FICHIER_TEST = "data.txt"

if not os.path.exists(FICHIER_TEST): # Recherche sur l'ensemble du disque
    with open(FICHIER_TEST,'w') as f:
        for i in range(NOMBRE_LIGNES):
            f.write(f"ligne {i}\n")
    print("Fichier de test benchmark créé !")

# On va créer deux fonctions pour lire ce fichier et tester le la mémoire consommée par chacune d'elle.

# Lecture classique (chargement en mémoire)

def lire_fichier_classique(nom_fichier):
    with open(nom_fichier,'r',encoding='utf-8') as f:
        return f.readlines()

# data =lire_fichier_classique('data.txt') # Lecture classique !!! NON CONSEILLÉ !!!
# print(data)

# Lecture utilisant un générateur (fonction qui contient yield
# A ne pas confondre avec un itérateur qui est une CLASSE
# Un générateur fait partie de la classe des itérateurs
def lire_fichier_en_stream(nom_fichier):
    with open(nom_fichier,'r',encoding='utf-8') as file:
        for line in file:
            yield line.strip() # avec yield , c'est qu'on a un générateur .
            # Faire next ou for pour avoir le contenu. Un simple print ne suffit pas

# J'utilise un générateur pour lire, ligne par ligne. ET NON STOCKER TOUT LE FICHIER EN MÉMOIRE
# comme dans le cas classique
# D'où optimisation de la mémoire.

# Créons une fonction pour mesurer la mémoire utilisée
def memoire_utilisee():
    return psutil.Process(os.getpid()).memory_info().rss / (1024**2)

# os.getpid() renvoie l'identifiant du processus en cours... : PID
# je le passe ensuite à psutil.Process qui me donnera toutes les informations du processus actuel

# Dans psutil , il y a une fonction du nom de .memory()_info.rss : Elle Permet de retourner la mémoire
# Consommée par le processus en Octets.


# On va ensuite diviser le résultat par 1024**2: pour convertir la mémoire ( au départ en octets) en mégacotets (Mo)

# Pas de getsizeof ; car, cela donne simplement la taille mémoire d'un objet. Du genre une liste, un dictionaire..
# Alors que memory()_info.rss donne la memoire d'un programme , d'une fonction

# Expérience : comparer les deux programmmes : lire_fichier_classique et lire_fichier_en_stream

print('Test de lecture avec yield')
start_time = time.time()
memoire_avant= memoire_utilisee()
for _ in lire_fichier_en_stream(FICHIER_TEST):
    pass
memoire_apres  =memoire_utilisee()
print(f"Temps écoulé pour stream =  {time.time()-start_time:.2f} s") # ou
print(f" !! Autre écriture du Temps écoulé =","{:.2f}".format(time.time()-start_time))
print(f"Mémoire utilisée avec stream= {memoire_apres - memoire_avant:.2f} Mo")

# Temps d'éxécution et calcul de mémoire avec  : lire_fichier_classique

print('Test de lecture avec lire_fichier_classique')

start_time = time.time()
memoire_avant= memoire_utilisee()
contenu = lire_fichier_classique(FICHIER_TEST)

memoire_apres  =memoire_utilisee()
print(f"Temps écoulé pour lecture Classique =  {time.time()-start_time:.2f} s") # ou print(f"Temps écoulé =  ","{:.2f}".format(time.time()-start_time))
print(f"Mémoire utilisée pour lecture classique = {memoire_apres - memoire_avant:.2f} Mo")

# Conclusion sur les modules :
# Os : interraction avec le système (fichier,répertoire, processus,environnement..°
# psutil = Moritoring du sustème avancé (CPU, RAM,disque, réseau...)
# sys.getsizeof() : utile pour mesurer la taille mémoire d'un objet python
# Alors que avec psutil, on mesure la mémoire d'un programme

# Dans l'environnement virtuel :
# Installation de package XXX: pip install XXX
# pip list , donne tous les packages installés dans l'environnement
# Information sur un module XXX : pip show XXX

# Mettre à jour un module XXX : pip install --upgrade XXX
# Désinstaller un module XXX : pip uninstall XXX


