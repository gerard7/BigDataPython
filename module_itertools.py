# ------------------ ITERTOOLS --------------------
# Permet d'accéder au niveau expert du TOSA

# C'est un module Python qui fournit des outils puissants pour manipuler des itérateurs
# de manière efficace.
# Concrètement, il permet de générer des combinaisons, des permutations, création de cycle
# de grouper des données et d'autres opérations sur des séquences de données.
# Intérêt : Optimisation de la mémoire et des performances sur la gestion de grandes données.

# Itérateur, c'est quoi ?
# C'est un objet qui permet de parcourir une séquence d'éléments UN PAR UN ( sans stockage en mémoire)
# En revanche, Une liste contient tous les éléments en mémoire ([1,2,3,4])
# Un itérateur génère les éléments au fur et à mesure. Ce qui économise de la mémoire

# Comment fonctionne un itérateur ?
# iter(objt): objet --> itérateur
# next(itérateur): renvoie l'élément suivant.

# Contexte - IDEAL SI :
# on ne veut pas charger toutes les données en mémoire
# On traite des fichiers volumineux ( BDD, Data science,IA...)

# Contexte - A ÉVITER SI
# On doit revenir en arrière ou accéder directement aux éléments précis
# On a peu de données et qu'une liste est plus simple et courte . AVEC: pas d'éléments imbriqués
# les uns dans les autres


import itertools

numbers = iter([1, 2, 3, 4])
print("itérateur numbers est :",numbers)
# next permet de renvoyer l'élément
print("next(numbers)=", next(numbers))
print("next(numbers)=", next(numbers))
print("next(numbers)=", next(numbers))
# Pour accéder au suivant : c'est le dernier
# print("next(numbers)=", next(numbers))

# LA LIGNE SUIVANTE NE MARCHE PAS SI ON SOUHAITE ACCÉDER A UN ÉLÉMENTS PRÉCIS
# print("next(numbers)=", numbers[2])

# si On ne veut/peut pas compter tous les next. Puis-je savoir sa position actuelle ? OUI en utilisant enumerate
print('*************************************')
# ACCEDER AUX VALEURS SANS NEXT
for num in numbers:  # python utilise next en interne
    print("parcourir la liste",num)
# !!! rien ne s'affiche parceque nous sommes au bout de l'iter
# Mais, si on n'avait pas itéré 4 fois, c'est à dire si on avait utilisé
# 3 fois next dans ce cas précis, et bien, dans une boucle : for, il va afficher le reste


# 1: itertools.count() : générer des ID uniques
# .count(start,step)
id_generator = itertools.count(1001,1) # création d'un générateur qui commence à 1001 et qui augmente de 1 à chaque appel de next
# Un générateur est une fonction alors qu'un itérateur est une classe(object)

# Ecrire id_generator = itertools.count(10001,2 ) génère un générateur à partir de 10001 inclus par pas de 2
print("Le générateur =",id_generator)
ids = [next(id_generator) for _ in range(10)] # Envie de récupérer uniquement les 5 premières valeurs
print('Les 10 premiers éléments =',ids)


# 2.  itertools.cycle() : Alternance entre plusieurs tâches
# .cycle fait quoi ? Ele permet de créer un itérateur qui boucle indéfiniment sur les éléments de l'itérable

# Permet d'alterner entre plusieurs valeurs de manière circulaire

# Exemple

# Permet d'alterner entre plusieurs valeurs de manière circulaire
tasks = itertools.cycle(["Analyse","Développement","Test"])
# tup = ("Analyse","Développement","Test")
tasks = [next(tasks) for _ in range(8)]
print("Ordre des tâches=",tasks)
# print(" 3 X tuple =",3*tup)

# 3. intertools.repeat() : Générer des valeurs par défaut
# Exemple
default_values = itertools.repeat("N/A",4)
print("retour de default_values=", default_values)

print("retour de default_values=", next(default_values))

print("retour de default_values=", list(default_values))


# 4. itertools.permutations() :# Générer toutes les façons d'organiser une équipe
team = ["Paly","Luca","Arnaud","Assade"]
# ATTENTION l'ORDRE EST IMPORTANT ("tata","toto") est différent de ("toto","tata")
arrangement = itertools.permutations(team,r=3) # on prend toutes les permutations de 2 personnes à partir de team
print("les différentes combinaisons possibles =",arrangement)
print("les différentes combinaisons possibles =",list(arrangement))

# avec r = la longueur prise parmi les éléments iterable

# 5. itertools.product() : Planification des horaires
# Exemple
jours =["lundi","Mardi"]
horaires = ["Matin","Aprem","Soir","Nuit"]
#  c'est le Produit Cartésien . Génère toutes les combinaisons possibles entre deux listes.
planning =list(itertools.product(jours, horaires))
print("Planning =",planning)

# 6. itertools.groupby() : Regrouper des achats par catégories

# La fonction permet de regrouper des éléments consécutifs dans un itérable en fonction d'une clé commune

achats=[("Fruit","Pomme"),("Fruit" ,"Banane"),("Légume","carotte"),("Fruit","Orange")]

# Il faut absolument trier avant l'utilisation de itertools.groupby(....)
achats.sort()
# Groupby fonctionne si les éléments à grouper sont consécutifs
print("Achat.sort()= ",achats)
grouped = {key:list(group) for key,group in itertools.groupby(achats,lambda x:x[0])}
# Regroupement des éléments en fonction de la premiere valeur du tuple
print("Groupement grouped=",grouped)

# 7. itertools.islice() : Extraire une partie d'un journal de logs
logs = range(100,190)
print(logs) # Crée un itérable contenant les nombre de 100 à 189
extracted_logs = list(itertools.islice(logs,2,20,3))
# Parametre de isslice

# 2-> début de l'extraction (index 2 dans logs)
# 20-> fin de l'extraction (index 20 non inclus)
# 3-> Le Pas: (on prend 1 élément à chaque 3 pas)
print('Extracted log =',extracted_logs)

# 8. itertools.chain : Fusionner plusieurs listes
clients_online = ["Alice","Sam"]
clients_offline = ["Heer","Paly"]
# réunir les deux listes
all_clients  =list(itertools.chain(clients_online,clients_offline))
autre_all_clients= iter(itertools.chain(clients_offline))
# itertools.chain, crée un itérateur unique qui parcourt les éléments des listes dans
# l'ordre list()-> itérateur en une seule fusionnée
print("Résultat de chain =",all_clients)
# On peut aussi le faire avec []+[] ou extend() et surtout [] + iter()
# Avantages:
# Fonctionne avec n'importe quel itérable (= liste, tuples, générateurs)
# Ne crée pas une nouvelle liste immédiatement (gain de mémoire)
# Peut fusionner plusieurs sources de données sans duplication.

autre_all_clients= iter(itertools.chain(clients_offline))
clients_online.append(next(autre_all_clients))

print('client + = ',clients_online)

clients_online.append(next(autre_all_clients))
print('client + = ',clients_online)

# 9. itertools.tee : Dupliquer un itérable pour analyser.
# Cela permer de dupliquer un itérable en plusieurs flux indépedants
# Parcourir les copies séparément sans modifier l'original
data = iter(range(5))
data_copy1,data_copy2 = itertools.tee(data) # Création de 2 itérateurs indépendants
print("Flux original :",list(data_copy1))
print("Copie indépendante :",list(data_copy2))

# Si votre itérateur est très long, mieux vaut le transformer en list
# ou utiliser un générateur sur mesure pour éviter les problèmes
# de mémoire. Car , chaque valeur consommée (= utilisé par exemple avec next)
# sera stockée par tee.


# Axe d'amélioration : combinaison , combinaison remplacement