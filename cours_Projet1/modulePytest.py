# Pytest est un framework de test python simple et puissant
# Il y a aussi unittest
# Cela nous permet d'exécuiter des tests unitaires et fonctionnels
# de Détecter des erreurs automatiqueme,nt et afficher des rapports détaillés
# Cela permet de simplifier la gestion des exceptions, des fixtures et des tests paramétrés


# Son utilisation nécessite l'installation du module pytest via : pip install pytest
# Tester sa version avec pytest --version

# Pour tester, il faudra mettre dans le terminal : pytest test_mafonction.py

# On mettra les fichiers tests ( dont le nom commence forcément par test_....) dans un dossier test de DataPulse


# Exemple :

def addition(a,b):
    return a+b

import pytest

def test_addition():
    assert addition(2,3)==5
    assert addition(-1,1)==0
    assert addition(0,0)==0

# assert est une instruction pour vérifier qu'une condition est vraie lors de l'exécution d'un programme
# Si c'est faux, python lève une exception AssertionError

def addition2(a,b):
    if not isinstance(a,(int,float)) or not isinstance(b,(int,float)):
        raise TypeError("Les deux valeurs ne sont pas des entiers ou des Float. Or, je ne sais faire que des "
                        "additions entre int ou entre float ou entre les deux.")
    print("Toto")
    return a+b

def test_addition2_error():
    with pytest.raises(TypeError,match="Les deux valeurs ne sont pas des entiers ou des Float. Or, "
                                       "je ne sais faire que des additions entre int ou entre float ou entre les deux."):
    # Le match n'est pas obligatoire
        addition2(2,"3")
    with pytest.raises(TypeError):
        addition2(None,5)


# ********************* Afficher les détails des tests
# Avec le mode -v (verbose) , on obtient plus de détails
# Il y a l'option -s qui affiche les print qui sont dans les fonctions testées

# Tests paramétrés avec pytest.mark.parametrize

# C'est une décoration qui permet d'exécuter un même test avec des entrées différentes.

# Nous allons mettre les tests paramétrés sur l'addition. ON va mettre un décorateur

import random
@pytest.mark.parametrize("a, b ,expected",[(2,3,5),(-1,1,0),(0,0,0),(-5,8,3),])
def test_addition_param(a,b,expected):
    assert addition(a,b) == expected

# Installer pytest-repeat
# @pytest.repeat(n=10) # Répète n fois le test en dessous . Attention : il faut installer d'abord le package : pytest-repeat
def test_addition_random():
    a = random.randint(-100,100)
    b  = random.randint(-100,100)
    expected = a+b
    assert addition(a,b) == expected

# LE MODULE FAKER

# from faker import Faker  # A Installer
# C"est un module qui a pour possibilité de générerd es valeurs aléatoires que ce soit des nombres,des villes,
# adresse, mail, numéros de téléphones... Bref, des données aléatoires réalistes

from faker import Faker
def test_addition_faker():
    faker = Faker() # Regarder les nombreuses possibilités dans Faker(), en faisant faker.
    a = faker.random_int(-100,100)
    b = faker.random_int(-100,100)
    assert addition(a,b) == a+b



