# Fichier central pour distribuer un projet Python sous forme de
# package installable
# Cela permet d'installer les dépendances automatiquement
# Cela permet d'enregistrer les scripts pour une exécution en ligne de commande
# Cela permet de gérer la compatilbilité du projet
# Publier le package du Pypi = Python Package Index )

from setuptools import setup
from setuptools import find_packages
from setuptools.config.expand import entry_points

# On va utiliser une bibliothèque setuptools

setup(
    name="DataPulse",
    version="1.0.0",
    description="Outils d'analyse de données",
    author="GANDJI Sovègnon Armand",
    author_email="gerardarm@gmail.com",
    packages= find_packages(), # Celuii-ci permet de détecter automatiquement les packages dans le projet
    #install_requires # Installe tous les modules nécessaires du projet
    entry_points={
        "console_scripts":["DataPulse=DataPulse.main:main", #monprojet = package.main:main , :main est le nom donné à la fonction principale dans main.py

                         ]
    }

)


# Il faut créer un lien symbolique entre le projet(code source) et l'installation python
# pip install -e . (avec ça , on va tester le package localement d'abord)
# Faire cette syntaxe dans le répertoire où se trouve le setup.py . du projet. Ici DataPulse (le premier)
# ou pip install --use-pep517 -e .   A cause de la noubvelle version de pip
# Puis, lancez :