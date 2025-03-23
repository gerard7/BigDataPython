# Cours : Les modules essentiels en, python
# Pour la gestion des fichiers + traitement des données

# Modules :

# 1: logging : Gestion des log et erreurs
# 2: Gestion des expressions régulières
# 3: os et sys
# 4: csv : Lecture et écriture des fichiers csv
# pandas : Manipulation avancée de donnés tabbulaire

# =========== MODULE logging =================

# Le module logging gère efficacement les erreurs
# Configuration du logging qui sera dans un fichier importable dans tous les modules

import logging
import re
from re import finditer


logging.basicConfig(
    filename ='app.log',
    level=logging.DEBUG,
    # Niveau minimal des log
    # (DEBUG, INFO, WARNING, ERROR ,CRITICAL )
    format='%(asctime)s - %(levelname)s - %(message)s'
)
# '%(asctime)s : c'est pour la date et l'heure
# %(levelname)s : c'est le niveau de l'erreur
# %(message)s : C'est le message qu'on écrit et qui permet de se répérer par rapport au lieu et autre


# Voici comment l'utiliser dans un module par exemple
logging.info("Ceci est une information")
logging.warning("Attention : Avertissement mauvais appel de la methode")
logging.error("Ceci est une erreur")
logging.exception("Ceci est une exception !")


# =========== Module re ==========
# Ce module permet d'effectuer des recheches avancées et de manipuler les chaines

import re #

texte = "Bonjour, python je suis développeur python"
resultat = re.findall("python",texte)
res = re.search("python",texte)
print(resultat)
print(res)
mon_mail = "Mon email est contact@example.com"
motif =r"\w+@\w+.\w+" # Regex pour un email
# r = raw string --> évite l'interprétation de \
match = re.search(motif,mon_mail)
print(match)

# Comment l'exploiter
if match :
    print(f"Émail trouvé : {match.groups()}")
    print(match.start())
    print(match.end())
    print(match.span())

# Objet type Match contient le texte trouvé et la position à partir de laquelle on le trouve ainsi que la position finale

# re - sub
# Permet de remplacer un motif par une autre chaine
texte2 = "Ceci  est     un texte mal formatté "
texte_propre =re.sub(r'\s+',' ',texte2) # r'\s+ veut dire : plusieurs espaces consécutifs
texte_propre = re.sub('mal','bien',texte2)
texte_propre = re.sub(r'\s+',' ',texte_propre)
print(texte_propre)

texte = "Il y a 3 chats , 5 chiens et 9 éléphants"
# on souhaite remplacer chaque nombre, par son double
nouveau = re.sub(r"\d+", lambda x:str(int(x.group())*2),texte)
# Si on souhaite multiplier la première occurrence par 2 et la 2ème par 3, par exemple
# Il vaut mieux écrire carrément un autre algorithme dans une fonction et appeler cette fonction
# en lieu et place de lambda
print("Nouveau =",nouveau)

logs = """
192.168.1.1 - - [10/Feb/2025:15:30:45 +0000] "GET /index.html HTTP/1.1" 200 5123
203.0.113.5 - - [10/Feb/2025:15:30:50 +0000] "POST /login HTTP/1.1" 403 1520
198.51.100.7 - - [10/Feb/2025:15:30:55 +0000] "GET /dashboard HTTP/1.1" 200 3421
"""

motif = r'(\d+\.\d+\.\d+\.\d+) .*? "(GET|POST) (\S+) HTTP'  # Regex pour IP, méthode et URL
# Lorsqu'on va utiliser x.group dans lambda, si on écrit x.group(1), il va traiter la 1ère parenthèse
# si on écrit x.group(2) , il va traiter la 2ème parenthèse. group commence de 1,2.. en fonction de
# comment est formattée l'expression régulière
match = re.search(motif,logs)
# On capture une adresse IP par des groupes d e3 chiffres séparés par des .
# .*? Permet de récupérer tous les caractères
# (GET|POST) : veut dire , qu'on attend soit GET, soit POST
# (\S+) Ce motif signifie une chaine non vide . Alors que \s signie Espace


# Trouver toutes les occurrence dans une chaine
ip_list =[]
methode_list=[]
url_list =[]
for match in re.finditer(motif,logs):
    ip=match.group(1)
    ip_list.append(ip)
    methode = match.group(2)
    methode_list.append(methode)
    url= match.group(3)
    url_list.append(url)
print("IP=",{"ip":ip_list},"Méthode =", {"methode":methode_list},"URL=",{"url":url_list})

#finditer(): Trouver toutes mes occurrence d'un regex dans une chaine et de retourner
# un itérateur de match object
# CONTRE findall(): liste contenant toutes les occurrences en texte brut

# Precompilation

motif_compile =re.compile(r'(\d+\.\d+\.\d+\.\d+) .*? "(GET|POST) (\S+) HTTP')
# On compile 1 seule fois l'expression régulière et on l'utilise partout. C'est très performant sur
# Les très gros fichiers
# Réutilisation efficace . Sans cela, On recompile la regexe ce qui est moins performant sur de gros fichiers.

# Simulation d'un fichier avec 100000
log_simule = logs * 100000
for match in motif_compile.finditer(log_simule):
    pass

# UTILISER re.search()-> si un motif est présent et régulière : indique seulement la 1ère occurrence

# UTILISER re.findall() -> si on veut toutes les occurrences mais sans avoir besoin d'information
# précise comme les positions. Cela retourne une Liste

# UTILISER re.finditer() ->  si on veut toutes les occurrences avec les positions sur de gros fichiers
# ( car itérateur) . CEla retourne un itérateur. for m in iterator print(m.span()) Retourne des tuples

# Module CSV
# Le module CSV est utilisé pour lire et écrire les fichier CSV. Utile pour manipuler les données
# tabulaires.

# AVANTAGES :
# Possibilité de traiter de gros fichiers sans plus charger le tout en mémoire. Il est aussi compatible
# avec Excel - Pandas et les Base de Données
# On peut le convertir



import csv

# Données de TEST

donnees = [ ["ID", "Nom", "Email","Age","Pays"] ,
    ["1", "Armand", "geradarm@yahoo.fr","22","BURUNDI"],
    [2, "Armand", "tata@yahoo.fr","25","BENIN"] ,
    [3, "Armand", "toto@yahoo.fr","32","GHANA"] ,
    [4, "Armand", "titi@yahoo.fr","28","FRANCE"] ,
    [5, "Armand", "monmail@yahoo.fr","42","ALLEMAGNE"] ,
    [6, "Armand", "tonmail@yahoo.fr","27","COTE D'IVOIRE"],
]
# Création de notre fichier CSV : Passer de liste --> CSV
with open("data1.csv","w",encoding="utf-8",newline="") as fichier:
    writer = csv.writer(fichier,delimiter=";")
    writer.writerow(donnees)
# csv.writer utilise des listes

# On va créer un dictionnaire et le mettre en CSV
data =[
    {"nom":"sa","age":2,"ville":"Nice"},
    {"nom":"sa","age":2,"ville":"Nice"},
    {"nom":"sa","age":2,"ville":"Nice"},
    {"nom":"sa","age":2,"ville":"Nice"},
]

with open("data2.csv","w",encoding="utf-8",newline="") as fichier:
    fieldnames =["nom","age","ville"]
    writer = csv.DictWriter(fichier,fieldnames=fieldnames,delimiter=";")
    writer.writeheader()
    writer.writerows(data)

with open("data1.csv",mode='r',encoding="utf-8") as fichier:
    lecteur_csv = csv.reader(fichier)
    for ligne in lecteur_csv:
        print(ligne)
        " Affichage de chaque ligne sous forme de liste"
        # !!! csv.dictreader --> resultat en dictionnaire