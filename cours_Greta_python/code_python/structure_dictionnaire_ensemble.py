# LES DICTIONNAIRES

# Les dictionnaires sont des structures de données ordonnées non ordonnées
# de : cléfs-valeurs
# En python, l'accès à l'élément à partir d'une clef se fait de manière très rapide en python
# Cela fonctionne avec une table de hashage

# ---Principe
# Une clef est transformée en un  indice unique avec une fonction de hashage
# Cet indice est justement l'adresse de la valeur. Cela permet de localiser la valeur dans la
# mémoire

# Avantage : Rapidité des opérations: accéder , insérer , suppprimer une valeur tourne au temps moyen de O(1)
# Flexibilité : On peut définir presque tout comme clef - Objets immuables (int, float,str, tuple)


# Création d'un dictionnaire

my_dict ={
    'name': 'Sam',
    'city': 'Paris',
    'age' : 12,
}
print('dictionnaire =',my_dict)

# ------------ Accès et modification
# Les dictionnaires sont mutables
# Les accès et modifications sont en O(1)
# L'insertion en moyenne est également en O(1) . De même que la suppression
# L'itération sur les clefs-valeurs sont en O(n). n étant la taille du dictionnaire

# Ajout et modification

my_dict['job'] = 'Développeur'
my_dict['age']= 17
print(my_dict)

# Accès aux valeurs
print('Accès aux valeurs :')
print(my_dict['job'])

# Une fonction permet d'accéder directement aux valeurs
print(my_dict.get('age'))

# accéder à une valeur dont je ne suis pas sûr de la clef
# Ici, j'ai fait exprès de fournir une fausse clef. pour éviter une KeyError
print(my_dict.get('ageee','default_value'))

# Suppression:
print(my_dict)
del(my_dict['city'])
print(my_dict)
# On peut aussi utiliser pop()
valeur_sup = my_dict.pop('age')
print('Suppresion de la clef : age et sa valeur',my_dict)

# Itération

my_dict ={
    'name': 'Sam',
    'city': 'Paris',
    'age' : 12,
}
my_dict['job'] = 'Développeur'
for key,value in my_dict.items():
    print(f"{key}: {value}")

# Attention. La fonction .items() renvoie un TUPLE

# Pour le parcours uniquement des clef
print('---------------------------------')

for key in my_dict.keys():
    print(f"Clef : {key}")

# Pour le parcours uniquement des valeurs
print('---------------------------------')
for value in my_dict.values():
    print(f"Valeur : {value}")

# Compréhension de dictionnaire
# x sensé représenter les clefs 1,2,3,4,5 et les valeurs seront simplement le carré de chaque clef
squared_dict ={x : x**2 for x in range(1,6)}
print(f"Liste des éléments au carré : {squared_dict}")
print('Ancien dictionnaire :',my_dict)
# Fusion de dictionnaires à partir de python 3.9
new_dict = my_dict | {'country': 'France'}
print('Dictionnaire après fusion =',new_dict)
print('Ancien dictionnaire reste inchangé :',my_dict)

user = {'name' :'Sam',
'age':20,
'adresse':{'city':'Paris', 'zipcode':75001}
}

print('Adresse user =',user['adresse']['zipcode'])

# ----- Filter des données avec dictionnaires ------

students = {'Dan':85,'Armand':92,'Jarfar':78,'Lucas':90}

# Trier par ordre croissant
sorted_students =dict(sorted(students.items(),key=lambda item:item[1]))
# Tri par le score : d'où []
print('Dictionnaire trié = ',sorted_students)

# Trier par ordre décroissant
sorted_students =dict(sorted(students.items(),key=lambda item:item[1],reverse=True))

print('Tri en ordre décroissant = ',sorted_students)

#  Autre exemples : Filter, Renvoie seulement des éléments qui nous intéressent

filtered_students =dict(filter(lambda item:item[1]>90, students.items()))
print('Filtered students =',filtered_students)

# On peut faire autrement : Ecriture plus, pythonique
filtered_students_autre ={k: v for k,v in students.items() if v >90}

print('Filtered students =',filtered_students_autre)

# Le defaultdict
# c'est une version améliorée des dictionnaires standards
# Les valeurs par defaut lorsqu'une clef inexistante est accédée
my_dict={}
# Si on écrit my_dict['key'], cela génère une erreur: KeyError
# Pour éviter des erreurs, on va aller dans collections
from collections import defaultdict
my_dict = defaultdict(int) # C'est la valeur par défaut lorsqu'une clef inexistante est accédée. Ici
# La valeur par défaut est un entier : 0

# Pour lui imposer une valeur par défaut , on écrit:
my_dict=defaultdict(lambda: 'Valeur inconnue')

# Si on veut 100 comme valeur par défaut,on écrit :

my_dict=defaultdict(lambda: 100)


my_dict=defaultdict(lambda: {"note":0})
my_dict = defaultdict(int)
# si je fais my_dict['key']+=1 il ne dira rien
my_dict['key']+=1
my_dict['3']='Alpha'
print('mon dictionnaire sans dict=',my_dict)
print('mon dictionnaire avec dict =',dict(my_dict))
print('mon dictionnaire sans dict mais avec accès aux fonction attachées',my_dict.items())

# Le counter
# Utilité : Obtenir les éléments les plus fréquents (mots_common)
# Fusionner ou soustraire des comptages
# Gérer automatiquement des valeurs ,négatives
# Les occurrences
# Optimiser , rapide pour les opérations avancées : counter est codé en C
# dans l'interpreteur python .Pourquoi c'est mieux ? Vitesse, Optimisation,Mémoire...)

# Sans counter

data =['a','b','a','c']
count = {}
for item in data:
    count[item] = count.get(item,0) + 1
print('Count sans counter =',count)

# Avec count

from collections import Counter # Dès Python 3.1

count = Counter(data)  # Data peut être une liste, tuple, chaine, dictionnaire
print('Count AVEC counter =',count)
print('Count AVEC counter ,sans afficher Counter =',dict(count))

text = "abracadabra"
freq = Counter(text)
print('frequence =',freq)

print('Plus fréquent = ',freq.most_common(2))

# Counter fonctionne en O(n) dans la plupart des cas

# most_common permet de récupérer le top dans le nombre de répétition (O(n log k))
# Avec k : most_common(k)

# ChainMap : Alternative à la fusion (avant python 3.9)
# Dans chainMap, c'est la PRIORITÉ qui importe ici. Ce n'est pas un update ordinaire.
# le premier dictionnaire est prioritaire sur le 2ème. (C'est à dire que les valeurs
# du 1er dictionnaire sont prioritaires sur le 2ème )

# Situation précises : avec des priorités entre plusieurs dictionnaires , éviter les coûts en mémoire

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# REGARDER SUR LE NET : ChainMap

from collections import  ChainMap

baseline = {'music': 'bach', 'art': 'rembrandt'}
print('BaseLine =',baseline)
adjustments = {'art': 'van gogh', 'opera': 'carmen'}
print('Adjustements =',adjustments)
listeChainMap = list(ChainMap(adjustments,baseline))
print(' listeChainMap = ',listeChainMap)

combined = baseline.copy()

combined.update(adjustments)


print('ListeCombined =',list(combined))
print('combined = ',combined)

# OrderedDict : dictionnaire ordonné . C'est une garantie sur l'ordre d'insertion
# Les clefs sont toujours maintenues dans l'ordre dans lequel elles ont été ajoutées
# Fonctionnalité implementée en python 3.7

# Méthodes spécifiques pour manipuler les clefs en fonction de leur ordre.

# Par exemple : move_to_end(key,last=True/False) : elle déplace la clef soit au débit soit à la fin


# popitem(last=True)
from collections import OrderedDict

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# ----------------- TD DICTIONNAIRES : TOSA PYTHON EXPERT -------------

# Objectifs :
# - Manipulation basiques et avancées des dictionnaires
# - TOSA PYTHON EXPERT
# - Utilisation de modules: collections, itertools, statistics, bisect, random, json

# ----- EXERCICE 01 ------
# Implémenter une recherche par mots-clés dans une base de données fictive.
# Recherche insensible à la casse
def exo01(mot_clef):
    # Base de données fictive
    database = {
        1: {"title": "Learn Python Programming", "tags": ["python", "programming", "tutorial"]},
        2: {"title": "Advanced Data Science", "tags": ["data", "science", "machine learning"]},
        3: {"title": "Introduction to Django", "tags": ["django", "python", "web"]},
    }
    filtered_database =[]
    filtered_database.append({k2:v2 for k2,v2 in database.items() if mot_clef.lower() in str(v2.values()).lower()})
    print('occurrence= ',filtered_database)
    return filtered_database
exo01('Django')


# ----- EXERCICE 02 ------
# Vous êtes chargé d'analyser les logs d'un serveur pour identifier les erreurs les plus fréquentes.
# Le fichier de logs contient des lignes au format suivant :
# 200 OK
# 404 Not Found
# 500 Internal Server Error
# Chaque ligne commence par un code HTTP, suivi d'une description.

# Objectifs de l'exercice :
# Compter le nombre d'occurrences de chaque code HTTP dans les logs.
# Identifier les codes les plus fréquents en utilisant la méthode most_common() de Counter.
# Simuler un ajout de nouvelles entrées dans les logs et mettre à jour les résultats avec update().
# Générer un rapport indiquant la proportion de chaque code dans l'ensemble des logs (en pourcentage).
# Ajouter une étape pour obtenir les codes d’erreurs uniques avec un set.

from collections import Counter
def exo02():
    # Fichier fictif de logs
    logs = [
        "200 OK",
        "404 Not Found",
        "500 Internal Server Error",
        "200 OK",
        "404 Not Found",
        "500 Internal Server Error",
        "500 Internal Server Error"
    ]

    # Compter le nombre d'occurrences de chaque code HTTP dans les logs.
    count = {}
    count = Counter(logs)
    print('Les occurrence de chaque code =',count)
    # Identifier les codes les plus fréquents en utilisant la méthode most_common() de Counter.
    print('Les codes les plus fréquents =',count.most_common(2)) # Les 2 plus fréquents codes
    # Simuler un ajout de nouvelles entrées dans les logs et mettre à jour les résultats avec update().
    dic = {i+1:logs[i] for i in range(len(logs))}
    dic.update({len(logs)+1:"503 nouvelle erreur"})
    print('dic = ',dic)
    # Générer un rapport indiquant la proportion de chaque code dans l'ensemble des logs (en pourcentage).
    stat= count.most_common()
    print('Les codes les plus fréquents =', stat)
    print(["{:.2f}%".format(stat[i][1]*100/len(logs)) for i in range(len(stat))])
    # Ajouter une étape pour obtenir les codes d’erreurs uniques avec un set.
    print('logs=',logs)
    le_set = set(logs)
    print('le_set',le_set)

exo02()
