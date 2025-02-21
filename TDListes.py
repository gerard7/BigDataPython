# Exercice 1 : Manipulation de listes
# Créez une liste fruits contenant : ["pomme", "banane", "cerise"].
# Ajoutez "orange" à la fin de la liste.
# Ajoutez "ananas" à l’index 1.
# Supprimez "cerise" de la liste.
# Récupérez et supprimez le dernier élément de la liste en utilisant pop().
# Affichez la liste finale.

# Étape 1 : Créer la liste fruits
fruits = ["pomme", "banane", "cerise"]
print("Liste de départ=", fruits)
# Étape 2 : Ajouter "orange" à la fin de la liste
fruits.append("orange")

# Étape 3 : Ajouter "ananas" à l’index 1
fruits.insert(1, "ananas")

# Étape 4 : Supprimer "cerise" de la liste
fruits.remove("cerise")

# Étape 5 : Récupérer et supprimer le dernier élément
dernier_element = fruits.pop()

# Étape 6 : Afficher la liste finale
print("Liste finale :", fruits)




# Exercice 2 : Slicing et compréhension de liste
# Créez une liste de nombres de 1 à 10.
# Extraire :
# Les 3 premiers éléments.
# Les 3 derniers éléments.
# Les éléments aux indices pairs.
# La liste inversée.
# À partir de cette liste, créez :
# Une liste contenant les carrés des nombres.
# Une liste contenant uniquement les nombres pairs.

# Créer une liste de nombres de 1 à 10
nombres = list(range(1, 11))

# Extraction des éléments
trois_premiers = nombres[:3]
trois_derniers = nombres[-3:]
indices_pairs = nombres[::2]
indices_impairs = nombres[1:][::2]
liste_inversee = nombres[::-1]

# Création de nouvelles listes
print('Carré des élements de la liste: ')
carres = [x**2 for x in nombres]
print(carres)
nombres_pairs = [x for x in nombres if x % 2 == 0]
print('Les nombres pairs :')
print(nombres_pairs)
# Affichage des résultats
print("Les nombres = ", nombres)
print("3 premiers :", trois_premiers)
print("3 derniers :", trois_derniers)
print("Les nombres d'Indices pairs :", indices_pairs)
print("Les nombres d'Indices impairs :", indices_impairs)
print("Liste inversée :", liste_inversee)
print("Carrés :", carres)
print("Nombres pairs :", nombres_pairs)



# Exercice 3 : Validation d'un ensemble de conditions (all() et any())
# Vous êtes responsable de vérifier si les données d'une liste respectent certaines règles.
# Créez une liste temperatures représentant les températures relevées sur une semaine : [22, 24, 19, 21, 23, 20, 18].
# Vérifiez :
# Si toutes les températures sont supérieures à 15°C.
# Si au moins une température est inférieure à 20°C.
# Retournez les résultats.
# Explication :
# all() est utile pour s'assurer que tous les éléments respectent une règle.
# any() est utile pour détecter si une condition est vraie pour au moins un élément.

# Liste des températures
temperatures = [22, 24, 19, 21, 23, 20, 18]

# Vérifications
toutes_sup_15 = all(temp > 15 for temp in temperatures)
au_moins_une_inf_20 = any(temp < 20 for temp in temperatures)

# Affichage des résultats
print("Toutes les températures > 15°C :", toutes_sup_15)
print("Au moins une température < 20°C :", au_moins_une_inf_20)


# Exercice 4 : Analyse d'une liste numérique (len(), sum(), max(), min())
# Un système de gestion de stock vous fournit une liste des quantités d'articles vendus par jour : [12, 15, 20, 8, 25, 18, 10].
# Trouvez :
# Le nombre total de jours enregistrés (len()).
# Le nombre total d'articles vendus (sum()).
# Le nombre maximum d'articles vendus en une journée (max()).
# Le nombre minimum d'articles vendus en une journée (min()).
# Affichez ces informations sous forme de phrase compréhensible.

# Liste des quantités
quantites = [12, 15, 20, 8, 25, 18, 10]

# Calculs
nb_jours = len(quantites)
total_vendus = sum(quantites)
max_vendus = max(quantites)
min_vendus = min(quantites)

# Affichage
print(f"Jours enregistrés : {nb_jours}")
print(f"Articles vendus : {total_vendus}")
print(f"Max articles/jour : {max_vendus}")
print(f"Min articles/jour : {min_vendus}")



# Exercice 5 :  Tri et inversion d'une liste (sorted() et reversed())
# On vous fournit une liste des scores d'une équipe lors de plusieurs matchs :.
# Classez la liste dans l'ordre croissant et affichez-la.
# Classez la liste dans l'ordre décroissant (utilisez sorted() avec un paramètre spécial).
# Inversez l'ordre actuel des éléments de la liste sans les trier (utilisez reversed()).

# Liste des scores
scores = [85, 78, 92, 66, 88, 73]

# Tri croissant
scores_croissants = sorted(scores)

# Tri décroissant
scores_decroissants = sorted(scores, reverse=True)

# Inversion sans tri
scores_inverses = list(reversed(scores))

# Affichage
print("Scores triés (croissant) :", scores_croissants)
print("Scores triés (décroissant) :", scores_decroissants)
print("Scores inversés :", scores_inverses)



# Exercice 6 : Suppression contrôlée d’éléments (del)
# Vous gérez une liste de tâches tasks = ["Task 1", "Task 2", "Task 3", "Task 4"].
#
# Supprimez la deuxième tâche de la liste (par index).
# Supprimez toutes les tâches sauf les deux dernières (utilisez le slicing).
# Rq : del est plus performant qu’une méthode comme remove() pour supprimer un élément par index.

# Liste des tâches
tasks = ["Task 1", "Task 2", "Task 3", "Task 4"]

# Suppression par index
del tasks[1]

# Suppression des tâches sauf les deux dernières
del tasks[:-2]

# Affichage
print("Tâches restantes :", tasks)


# Exercice 7 : Copier et éviter les effets de bord (copy())
# Vous travaillez avec une liste data = [1, 2, 3, 4].
#
# Créez une copie de cette liste avec copy().
# Modifiez la copie (ajoutez un élément ou modifiez un élément existant).
# Montrez que la liste originale n’a pas été affectée.
# Expliquez ce qui se passe si vous utilisez simplement une affectation classique (copie = data) au lieu de copy().

# Liste originale
data = [1, 2, 3, 4]

# Copie de la liste
copie = data.copy()

# Modification de la copie
copie.append(5)

# Affichage
print("Liste originale :", data)
print("Copie modifiée :", copie)

# Explication : Une affectation classique (copie = data) aurait lié les deux listes.


# Exercice 8 : Utilisation combinée (analyse avancée)
# Vous avez une liste contenant les revenus mensuels de plusieurs employés :
# revenus = [2500, 3200, 4000, 1500, 2800, 4500, 2200].
#
# Calculez :
# Le revenu total de tous les employés (sum()).
# Le revenu moyen.
# Le revenu maximum et minimum (max() et min()).
# Triez les revenus dans l’ordre croissant.
# Vérifiez :
# Si tous les employés gagnent plus de 2000€.
# Si au moins un employé gagne plus de 4000€.
# Supprimez les revenus inférieurs à 2000€ et affichez la nouvelle liste.

# Liste des revenus
revenus = [2500, 3200, 4000, 1500, 2800, 4500, 2200]

# Calculs
revenu_total = sum(revenus)
revenu_moyen = revenu_total / len(revenus)
revenu_max = max(revenus)
revenu_min = min(revenus)
revenus_tries = sorted(revenus)

# Vérifications
tous_sup_2000 = all(r > 2000 for r in revenus)
au_moins_un_sup_4000 = any(r > 4000 for r in revenus)

# Suppression des revenus < 2000
revenus = [r for r in revenus if r >= 2000]

# Affichage
print("Revenu total :", revenu_total)
print("Revenu moyen :", revenu_moyen)
print("Max revenu :", revenu_max)
print("Min revenu :", revenu_min)
print("Revenus triés :", revenus_tries)
print("Tous > 2000€ :", tous_sup_2000)
print("Au moins un > 4000€ :", au_moins_un_sup_4000)
print("Revenus filtrés :", revenus)


# Exercice 9 : Construction de rapports
# On vous fournit une liste de noms d'étudiants : etudiants = ["Alice", "Bob", "Charlie", "Diana", "Eve"].
#
# Générer une liste des noms en majuscules.
# Ajouter un identifiant unique à chaque étudiant (exemple : 1 - Alice, 2 - Bob, ...).
# Trier les étudiants par ordre alphabétique.
# Retourner la liste triée dans l’ordre inverse (utilisez sorted() et reversed() ensemble).

# Liste des étudiants
etudiants = ["Alice", "Bob", "Charlie", "Diana", "Eve"]

# Noms en majuscules
etudiants_maj = [nom.upper() for nom in etudiants]

# Ajout d'identifiants
etudiants_id = [f"{i + 1} - {nom}" for i, nom in enumerate(etudiants)]

# Tri alphabétique
etudiants_trie = sorted(etudiants)

# Liste inversée
etudiants_inverses = list(reversed(etudiants_trie))

# Affichage
print("Étudiants en majuscules :", etudiants_maj)
print("Étudiants avec ID :", etudiants_id)
print("Étudiants triés :", etudiants_trie)
print("Étudiants triés inversés :", etudiants_inverses)
