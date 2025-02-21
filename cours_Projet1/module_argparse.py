# ----------------- MODULE ArgParse -----------

# Module puissant de Python pour gérer et analyser les arguments en ligne de commande
# Avec argparse, on peut  :
# - Définir des arguments obligatoires et optionnels
# - Spécifier les type des arguments (int, float, str....
# - Gérer automatiquement l'affichage (--help)
# - Fournir des valeurs par défaut

# argparse garde le type de donnée entrée.

# Différence avec sys.argv (basique) qui ne garde pas le type des données entrées et renvoie un tableau
# sys.argv renvoie une liste qui contient tous les arguments passés en ligne de commande

# Exemple de ligne de commande : python script.py arg1 arg2

# Pour récupérer le arg1 : sys.argv[0]
# Avec sys.argv, pas de validation de type, pas de gestion des erreurs , pas d'affichage --help,
# pas d'arguments optionnels

# Or, avec argparse, on n'a plus que ce que propose sys.argv. Son installation: pip install argparse

import argparse


def basic_parser():
    # Création du Parser
    parser = argparse.ArgumentParser(description="Script de argparse, simulation de l'aide en ligne.")
    parser.add_argument("arg1",type=int,help="Un entier est requis")
    parser.add_argument("arg2",type=float,help="Un flottant (nombre relatif) est requis")
    # pour récupérer les arguments renseignés en ligne de commande
    try:
        args = parser.parse_args()
        print("L'appel est correcte ! ")
        print(f"Arg1=,{args.arg1} et Arg2={args.arg2}")
    except SystemExit:
        print("Argument incorrect")
        parser.print_help()

# basic_parser()

# Gestion des Arguments Optionnels
def optionnal_arguments():
    parser = argparse.ArgumentParser(description="Sript argparse option")
    parser.add_argument("-n","--name",type=str,help="Non user")
    parser.add_argument("-a","--age",type=int,help="Age user")
    args = parser.parse_args()
    if args.name:
        print(f"Nom : {args.name}")
    if args.age:
        print(f"Age : {args.age}")

# optionnal_arguments()

# Option VERBOSE
def booleab_flags():
    parser = argparse.ArgumentParser(description="Script argparse en option ")
    parser.add_argument("-v","--verbose",action="store_true",help="Mode Verbeux")
    args = parser.parse_args()
    if args.verbose:
        print("Avec verbose renseigné :",args.verbose)
    else:
        print("Pas de verbose",args.verbose)

# booleab_flags()

# def default_values():
#     parser= argparse.ArgumentParser(description="Script argparse Option")
#     parser.add_argument("--level",type=int,help="Niveau",default=1)
#     args = parser.parse_args()
#     print(f"Niveau sélectionné {args.level}")
#
# default_values()  # Appel en ligne de commande : python module_argparse --level 8


def choice_arguments():
    parser= argparse.ArgumentParser(description="Script argparse Option")
    parser.add_argument("--mode",help="Mode",choices=["easy","medium","hard"])
    args = parser.parse_args()
    print(f"Mode sélectionné: {args.mode}")

# choice_arguments()  # Appel en ligne de commande : python module_argparse --mode easy


def exclusive_arguments():
    parser = argparse.ArgumentParser(description="Script argparse Option")
    group = parser.add_mutually_exclusive_group()
    group.add_argument("--light",action="store_true",help="Mode clair")
    parser.add_argument("--dark",action="store_true",help="Mode sombre")
    # Le rôle de action= est de pouvoir définir les arguments (lorsque c'est à True) ou non.
    args = parser.parse_args()
    if args.light:
        print("Mode Clair")
    elif args.dark:
        print("Mode sombre")
    else:
       print("Aucun mode")

# exclusive_arguments()  # Exemple d'appel : python module_argparse.py --light


def subcommands_example():
    parser = argparse.ArgumentParser(description="Script avec sous commande")
    " Ajoute un gestionnaire de sous commande à notre parser"
    subparsers = parser.add_subparsers(dest="command", required=True)
    # Commande add
    parser_add = subparsers.add_parser(name="add", help="Ajoute deux nombres")
    parser_add.add_argument("x", type = int, help = "Premier nombre à ajouter")
    parser_add.add_argument("y", type = int, help = "Deuxième nombre à ajouter")

    # Command Multiply
    parser_add = subparsers.add_parser(name="multiply", help="Multiplie deux nombres ")
    parser_add.add_argument("x", type = int, help = "Premier nombre à ajouter")
    parser_add.add_argument("y", type = int, help = "Deuxième nombre à ajouter")

    args = parser.parse_args()
    if args.command == "add":
        print(f"Résultat :{args.x + args.y}")
    elif args.command == "multiply":
        print(f"Résultat : {args.x * args.y}")
        # Commande multiply


# subcommands_example()
# test : python module_argparse.py add 10 5
# Test : python module_argparse.py multiply 10 5

def valid_percentage(value):
    val = float(value)
    if not 0<= val <=100:
        raise argparse.ArgumentTypeError(f"Le % doit être entre 0 et 100")
    return val

def validation_example():
    parser = argparse.ArgumentParser(description="Validation personnalisée")
    parser.add_argument("--val", type=float, help="Valeur de Base")
    parser.add_argument("--discount",type=valid_percentage,help="Pourcentage")
    args = parser.parse_args()
    print(f"Valeur de départ = {args.val}€, Réduction appliquée :{args.discount}%")
    print(f"Valeur finale ={args.val - (args.val * args.discount)/100}€")

# validation_example()

# Notion de set_defaults()
def say_hello(args):
    print("Bonjour")


def say_goodbye(args):
    print("Bye !")

def parser_set_default():
    parser = argparse.ArgumentParser(description="Exemple set defaults")
    subparsers = parser.add_subparsers(dest="command", required=True)

    # command "hello"
    parser_hello = subparsers.add_parser("hello",help="Affiche Bonjour")
    parser_hello.set_defaults(func=say_hello)
    parser_goobye = subparsers.add_parser("goodbye",help="Affiche GoodBye")
    parser_goobye.set_defaults(func=say_goodbye)
    args = parser.parse_args()
    args.func(args)

# Pour tester : décommenter la ligne : parser_set_default() # python module_argparse.py hello

parser_set_default()