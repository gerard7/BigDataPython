# Cours : St(

# Fichier __init__.py
from functools import reduce

# Ce fichier est fondamental pour transformer un dossier en package Python
# Il peut être vide ou contenir du code / Ce serait alors du code d'initialisation:
# - Dans ce __init__.py, on peut Importer certains modules du package pour une accessibilité plus simple
# On peut également définir des variables globales , configurations, log.

# Imaginons qu'on a un dossier projet. On va avoir : projet/__init__.py
# Alors mon projet devient un package
# __init__.py s'appelle méthode magique (spécial) : Car, il s'appelle sans être appelé

# ========= main.py ==============
# Il s'agit ici du point d'entrée du projet où s'exécute le code principal

# C'est l'équivalent d'un main en C ou Java

# Dans ce main.py, on a forcément une fonction classique qui s'appelle main()
# C'est elle qui contient l'ensemble des fonctions

# Contient une fonction main()
# Le if __name__=="__main__" : signifie que main() sera exécutée 
# seulement si le script est exécuté directement et non s'il est importé dans un autre fichier

# =============== requirements.txt ==========
# Fichier qui liste toutes les dépendances ( modules python ) dans un projet
# Nécessaire pour exécuter un projet
# pip install -r requirements.txt
# Générer automatiquement par: pip freeze > requirements.txt

# MISE à JOUR DES requirements.txt se fait par : pip install --upgrade -r requirements.txt
# l'option -r : pour parcourir et lire

