import numpy as np

"""
# Numpy est une Bibliothèque puissante pour le calcul numérique en python
# Elle est optimisée pour travailler avec des tableaux (array) et de matrices
# bien plus rapides que des listes python classique
# En Entreprise : 
#     - Datascience Il est beaucoup utilisé en Analyse et manipulation des Données (Numpy est le socle de Pandas)
#     - Machine Learning et IA : TensorFloa ,Scikit-learn...Numpy est intégré dans ces modules 
#     - Calcul Scientifique et Ingénierie avancée

Pourquoi pertinent ? 
- Optimisation des performances car les calculs de Numpy sont écrits en C
- Efficace lors des traitements des GRANDES MATRICES
- Généralement en O(n) MAIS plus rapide que Python natif grace à l'optimisation C

"""

# Création d'un tableau Numpy (array)
print("Création d'un  tableau numpy")
array = np.array([1,2,3,4,5])
print(array)

# Création d'une matrice numpy (tableau à 2 dimensions)
print("Création d'une matrice Numpy")
matrix = np.array([[1,2,3],[4,5,6]])
print(matrix)

# Contrairement aux listes python, Un array consomme moins de mémoire et est plus rapide qu'une liste Python.

# Génération d'un tableau de nombres aléatoires.

random_array = np.random.randint(0,100,(3,3)) # Génère une matrice (3,3) de nombres aléatoires de 0 à 100.
print("Matrice de nombres aléatoires : \n",random_array)

# Opération Mathématiques rapide
print("Opération Mathématiques")

print("Somme des tous les éléments de la matrice =",np.sum(random_array))

print("Moyenne de la Matrice arrondie:","{:.3f}".format(np.mean(random_array)),"Sans arrondi =",np.mean(random_array))
print("Ecart-type des éléments de la matrice arrondi:","{:.3f}".format(np.std(random_array)),"Sans arrondi = ",np.std(random_array))

# Indexaction
print("Accès aux valeurs d'un tableau Numpy")
print("Premlière ligne de la matrice :",random_array[0])
print("Valeur en position (1,2) :", random_array[1,2])
# L'écriture random_array[1][2] est équivalente en résultat à random_array[1,2] , MAIS:
# pour numpy random_array[1,2] est PLUS RAPIDE QUE random_array[1][2]

# Autre manipulation des Tableaux
array = np.array([10,20,30,40,51])

# Division par un scalaire:
n=10.3
print(f"Division par le scalaire :","array=",array, "# array divisé par ",n,"=",array/n)

# Transformation en, Matrix 2D
matrix = array.reshape(1,5)  # Cela transforme le tableau simple (vecteur) en Matrice 2D : 1 Ligne , 5 Colonne
print("Reshape de ",array,"en Matrice (1,5) = ",matrix)  #
# Son utilisation ; Comme une image est une matrice de pixel, leur manipulation amène à faire ce genre de chose


# Faire un exemple avec array([[1,2,3],[5,6,7]]
v =np.array([[1,2,3],[5,6,7]])
print("Valeur de v qui va etre reshape =\n",v)
m = v.reshape((2,3))
n= v.reshape((3,2))

print("Matrice 2,3 avec reshape = \n",m)
print("Matrice 2,3 avec reshape = \n",n)
# ne_peut_pas = v.reshape(3,3)
# print("Ne peut pas faire de v (2,3)  donc de 6 éléments , en une reshape en matrice (3,3) car celle-ci fait 9 éléments",ne_peut_pas)

# Gestion de valeurs manquantes (Utile en DataScience)
matrix = np.array([[1,2,np.nan],[4,np.nan,6]])
print("Matrice avec des valeurs Nan (Not a Number) \n",matrix)

# Remplacer des Nan par la moyenne"
matrix[np.isnan(matrix)] = np.nanmean(matrix) # Calcule les moyennes en ignorant les Nan
print("Matrice après remplacement des Nan par la moyenne des autres nombres:\n",matrix)

## VOIRE rapidement cette notion :
# nanmean(matrix , axis=1, np.where, ...) où les endroits Nan seront remplacés par la moyenne des colonnes ou celle des lignes

# Algèbre linéaire, (physique,IA, Finances ...°
A =np.array([[2,3],[1,4]])
B = np.array([[5,6],[7,8]])
C = np.array([[0,0],[0,0]])
print("A=",A,"B=",B)
print("Produit de A par B\n",np.dot(A,B,C))
# inversion de matrice
A_inv = np.linalg.inv(A)
print("L'inverse de A :\n",A, "\nvaut\n",A_inv)

# Pandas est basé sur Numpy








































































































































