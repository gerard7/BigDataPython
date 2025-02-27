
# decouverte du module sys
# decouverte de la taille


# interet : fonctionnalités liées qu systeme d'exploitation et à
# lenvironnement d'exécution et d'interragir avec l'interpreteur python.

import sys

print(sys.version) # donne la version de python
taille_liste =[1,2,3,5,88]
taille_tuple = (144664,2888979,34646,457,9)
print(f"taille de la liste = {sys.getsizeof(taille_liste)} octets")
print(f"taille du tuple = {sys.getsizeof(taille_tuple)} octets")

# decouverte de la fonction zip
# la fonction zip va combiner plusieurs itérables en cregroupant leut élément
# par paire . Elle renvoie un itérateur de tuples.
# TRES UTILE pour parcourir plusieurs itérablese en parallèlgee
# Ou associer les données

names = ("Armand", "Paul","Remi")
ages =(22,35,29)
# combiner deux tuples en 1 itérable de tuple.
combined = zip(names,ages)
print(combined)
print("type de combined =",{type(combined)})
# convertir en liste
print("Convertir en liste ")
print(list(combined))
##print("Convertir en tuple ")
##print(tuple(combined))
# ATTENTION, lorsque qu'on utilise tuple ou liste sur un zip
#Si en premier on a utilsé d'abord list, alors si on rappelle tuple sur le zip, on aura
# un zip nul. Et vice versa
#apres, l'autre élement est vide
#
# exemple d'itérartion avec zip
for name, age  in zip(names, ages):
    print(f"{names} : {ages}")


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


# 2 Usage

#Cas de fonction anonyme lambda --> action à l'instant

data = [(1,3),(4,1),(2,9),(5,2)]
# Je veux trier par rapport au 2ème élément de chaque tuple.

sorted_data= sorted(data,key=lambda x: x[1])

print('sorted_data=',sorted_data)
# RETENONS QU'IL NE FAUT PAS FAIRE DE TESTE DANS LAMBDA

# TD TUPLES:
# https://sharemycode.fr/3gy
products = [
    (1, "Laptop", 1500.0),
    (2, "Mouse", 25.0),
    (3, "Keyboard", 75.0),
    (4, "Monitor", 300.0)]
# Trie les produits par prix croissant.
produits_prix_croissants =sorted(products,key=lambda x:x[2])
print(produits_prix_croissants)

# Affiche uniquement les produits ayant un prix supérieur à 100.
print('---- prix sup 100 ----')
produits_prix_sup_cent = [x for x in produits_prix_croissants if x[2]>100]
print(produits_prix_sup_cent)

# Génère une nouvelle liste où chaque produit est représenté
# par un tuple (nom, prix après une réduction de 10%).


def reduce_dix_sur_cent(list_tuple_data):
    nouv_produit = []
    for x in list_tuple_data:
        nouv_produit.append((x[1],x[2]-x[2]*0.1))
    return  nouv_produit
nouv_produit = reduce_dix_sur_cent(products)
print('****** Reduction')
print(sorted(nouv_produit,key=lambda x: x[1]))


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

# Trie les employés par salaire décroissant.

print("Tri par Employer, salaire décroissant")
employes_salaire_dec = sorted(employees,key=lambda x:x[2],reverse=True)
print(employes_salaire_dec)

# Trouve l'employé le plus jeune ayant un salaire supérieur à 50000

print('employé le plus jeune ayant un salaire supérieur à 50000')
emplye_jeune_sup_50M = min(
    (x for x in employes_salaire_dec if x[2]>50000),key=lambda x:x[1])
print(emplye_jeune_sup_50M)


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

def sumPoint(point):
    return sum(point)

# Tuple de coordonnées
coordinates = ((1, 2, 3), (4, 5, 6), (7, 8, 9), (10, 11, 12))

# Affiche la somme des coordonnées pour chaque point.

somme_coord = reduce(lambda x,y : (x[0]+y[0],x[1]+y[1],x[2]+y[2]),coordinates)
print("somme des coordonnees")
print(somme_coord)

# from math import sqrt
# Identifie le point le plus proche de l'origine (0, 0, 0).
point_proche_origine =  [(x[0]*x[0],x[1]*x[1],x[2]*x[2]) for x in coordinates]
print(point_proche_origine)
point_proche_origine = [x[0]+x[1]+x[2] for x in point_proche_origine]
print("point proche de origine")
print(point_proche_origine)
print("La distance minimale au carré =", min(point_proche_origine))
def retourne_point(coord, minimum):
    j = None
    for i in coord:
        if i[0]*i[0]+i[1]*i[1]+i[2]*i[2]==minimum:
            j=i
            print(i)
    return j

print("Element point le plus proche de l origine = ",retourne_point(coordinates,min(point_proche_origine)))


# Crée un nouveau tuple contenant uniquement les coordonnées avec une somme supérieure à 15.
# Utilisez reduce pour filtrer les points avec une somme supérieure à 15.
print("*****",coordinates)
#coord_som_sup_15 = [x for x in coordinates if sum(x)>15 ]
coord_som_sup_15 = [reduce(lambda y,t:y+(t,) if sumPoint(t)>15 else y,coordinates,())]
print('Tuple dont la Somme des coordonnées est superieure a 15 ')
print(coord_som_sup_15)


# (Bonus) : Calculez la somme totale de toutes les coordonnées de tous les points.

somtotale = sum(sum(x) for x in coordinates)

print('somme totale =',somtotale)


meetings = [
    ["09:00", "10:30"],
    ["11:00", "12:00"],
    ["14:00", "15:30"],
    ["16:00", "17:00"]
]

# Etape 1 : Convertissez chaque sous-liste contenant les horaires d'une réunion en un tuple de deux chaînes.
# Par exemple, ["09:00", "10:30"] devient ("09:00", "10:30").

horaire_reunion =[(x[0],x[1]) for x in meetings]
print("Reunion en tuple = ",horaire_reunion)

# Source https://www.sharemycode.fr/3gy
# Etape 2 : Écrivez une fonction time_difference qui calcule la différence en minutes entre l'heure de début
# et l'heure de fin d'une réunion.
# Appliquez cette fonction à chaque réunion et affichez les durées calculées.

import datetime
def time_difference(tuple_t):
    heure_debut = datetime.timedelta(hours=int(tuple_t[0].split(':')[0]),minutes=int(tuple_t[0].split(':')[1]))
    heure_fin = datetime.timedelta(hours=int(tuple_t[1].split(':')[0]), minutes=int(tuple_t[1].split(':')[1]))
    delta = heure_fin -  heure_debut
    return delta.total_seconds()/60

print('temps de la reunion =  ',time_difference(horaire_reunion[0]), 'min')

# Etape 3 : Parcourez les réunions consécutives pour calculer les intervalles libres
# entre la fin d'une réunion et le début de la suivante.
# Identifiez le créneau le plus long, son heure de début et son heure de fin.



def creneau_plus_long(les_horaires_reunion):
    delta_entre_deux_reunions_consec = []
    for h in range(1,len(horaire_reunion)):
        delta_entre_deux_reunions_consec.append(time_difference((horaire_reunion[h-1][1],horaire_reunion[h][0])))
        m =max(delta_entre_deux_reunions_consec)
    horaire_reunion[delta_entre_deux_reunions_consec.index(m)]
    creneaux = [time_difference((horaire[0],horaire[1])) for horaire in horaire_reunion ]
    max_temps = max(delta_entre_deux_reunions_consec)
    reunion_concernee = horaire_reunion[delta_entre_deux_reunions_consec.index(max_temps)+1]
    print('Les Créneaux  =',creneaux)
    return (max_temps,delta_entre_deux_reunions_consec,max(creneaux),reunion_concernee)

cre_horaire= creneau_plus_long(horaire_reunion)
print('Intervalle le plus long entre deux réunions est : ',cre_horaire[0],'min;','tous les créneaux =',
      cre_horaire[1],'Réunion concernée =',cre_horaire[3],';Créneau le plus long =',cre_horaire[2])

# Aide :
# Les horaires sont au format 24 heures (HH:MM).
# Vous pouvez utiliser le module datetime pour gérer les conversions entre chaînes et objets datetime :
# avec la fonction suivante (conversion de chaine à une date) datetime.strptime(xxxx, format) avec format = "%H:%M".