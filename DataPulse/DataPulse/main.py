import argparse
from DataPulse.DataPulse.commands import load_subcommands


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

#  python -m DataPulse.DataPulse.main 10 preview --file DataPulse/data/clients.csv 10 --verbose

#  python -m DataPulse.DataPulse.main filter --file DataPulse/data/clients.csv --keyword Michel

# python -m DataPulse.DataPulse.main preview --file DataPulse/data/clients.csv --read 5

# Git : First commit/
# After modification : Push : 


