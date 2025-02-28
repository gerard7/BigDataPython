from DataPulse.processing.utils import detect_and_load_file
from DataPulse.processing.utils import display_data
from DataPulse.processing.utils import filter_data
from DataPulse.processing.utils import save_output
from DataPulse.logging_config import logger
from DataPulse.analysis.clients import analyse_clients


def analyse_data_command(args):
    """
    Fonction executée pour la commande filter
    :param args: arguments associés à la commande filter
    """
    try:
        print(f"Analyse en cours... dans le fichier: {args.file}")
        # Charger les données
        # Appel de analyse_cli(args.file, chunk_size=500)
        resultat = analyse_clients.analyse_cli(args.file, args.chunk)
        if args.output:
            try:
                # save_output(resultat, args.output)
                with open(args.output, "w") as file:
                    for value in resultat:
                        file.write(value+"\n")
                print(f"💾 Résultats enregistrés dans {args.output}")
                return
            except TypeError as e:
                logger.error(f"Erreur dans analyse: En écrivant dans le fichier -  {e}")

        # # Afficher les résultats
        # try:
        #     limit = len(resultat)
        #     display_data(resultat, limit)
        # except TypeError as e:
        #     logger.error(f"Erreur dans analyse: {e}")

    except (FileNotFoundError, PermissionError, ValueError, RuntimeError) as e:
        logger.error(f"Erreur dans analyse ; Lors du chargement du Fichier : {e}")
        print(f"Erreur: {e}")

def register_subcommand(subparsers):
    """
    Enregistre la sous commande analyse_data_command
    :param subparsers: La sous commande de parser
    """
    parser=subparsers.add_parser("analyse", help="Recherche et affiche les lignes analysées")
    parser.add_argument("--file", type=str, required=True, help="Fichier à analyser")
    parser.add_argument("--chunk", type=int, required=True, help="Taille du bloc de lecture du fichier")
    parser.add_argument("--verbose", action="store_true", help="Mode verbeux (DEBUG) ")
    parser.add_argument("--output", type=str, help="Nom du fichier de sortie (optionnel)")
    parser.set_defaults(func=analyse_data_command)