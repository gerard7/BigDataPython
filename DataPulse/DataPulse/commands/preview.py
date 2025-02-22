from DataPulse.processing.utils import validate_file
from DataPulse.processing.utils import detect_and_load_file
from DataPulse.processing.utils import display_data
from DataPulse.processing import file_loaders
from DataPulse import logging_config
import os

def preview_file(args):
    """
    Affiche un apercu du fichier et ses informations
    :param args: arguments contenant le chemin du fichier et les options
    """
    try:

        # Validation du fichier via validate_file() (qui se trouve dans utils)
        validate_file(args.file)

        # Obtenir des infos sur le fichier avec os
        if args.info:
            file_size = os.path.getsize(args.file)
            print(f"Taille du fichier : {file_size/1024:.2f} KB")

        # Charger les données
        data = detect_and_load_file(args.file, args.verbose)

        # Afficher un apercu des données
        display_data(data, args.read)

    except (FileNotFoundError, PermissionError, ValueError, RuntimeError) as e:
        logging_config.logger.error(f"Erreur dans preview_file: {e}")
        print(f"Erreur: {e}")

def register_subcommand(subparsers):
    '''
    Enregistre la sous commande preview
    :param subparsers: l'enregistrement de la sous-commande
    '''
    parser = subparsers.add_parser("preview", help="Affiche un apercu du fichier")
    parser.add_argument("--file", type=str, required=True, help="Chemin du ficher à prévisualiser")
    parser.add_argument("--read", type=int, default=5, help="Nombre de lignes à afficher")
    parser.add_argument("--info", action="store_true", help="Afficher les infos")
    parser.add_argument("--verbose", action="store_true", help="Mode verbeux")
    parser.set_defaults(func=preview_file)