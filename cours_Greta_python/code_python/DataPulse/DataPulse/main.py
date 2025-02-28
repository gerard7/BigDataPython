import argparse
from DataPulse.commands import load_subcommands

def main():
    parser = argparse.ArgumentParser(description="DataPulse avec les sous commandes")
    subparsers = parser.add_subparsers(dest="command", required=True)

    # Charger automatiquement les sous commandes
    load_subcommands(subparsers)

    # Parser les arguments
    args = parser.parse_args()

    # Executer la fonction asscoiée
    if hasattr(args, "func"):
        args.func(args)
    else:
        parser.print_help()


if __name__== "__main__":
    main()

# Générer le fichier requirements.txt : pip freeze > requirements.txt

# Installation avec requirements.txt : pip install requirements.txt
# ----------------------------------------------------------------------------
# Se mettre dans : ...../cours_Greta_python/code_python/DataPulse
#   python -m DataPulse.main preview --file data/clients.csv

#   python -m DataPulse.main preview --file data/clients.csv --verbose

#   python -m DataPulse.main preview --file data/clients.csv --verbose --read 2

#   python -m DataPulse.main preview --file data/clients.csv --read 5

#   python -m DataPulse.main filter --file data/clients.csv --keyword Michel

# Lien de github de Saman : http://github.com/SamanBaobab/datapulse91


# Git : First commit/
# After modification : Push : 

# Après : l'installation de l'exécutable
# DataPulse preview --file data/clients.csv
# DataPulse analyse --file data/clients.csv --chunk 500 --verbose --output resultats.txt

 # git commit -am "Création d'un package setup ainsi que de plusieurs modifications"
 # Dans le répertoire BigDataPython
# Appel 
# DataPulse filter --file data/clients.csv --keyword clara --output resultats.txt

