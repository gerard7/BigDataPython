import logging
import os
from logging.handlers import RotatingFileHandler

# Trouver le chemin de la racine du projet (un niveau au dessus de ce fichier)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Définir le dossier log en dehors du package principal
log_dir = os.path.join(BASE_DIR, "log")
# Crée un chemin vers log/
os.makedirs(log_dir, exist_ok=True)
# Crée automatiquement le dossier s'il n'existe pas

# Configuration globale
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s "
           "- %(filename)s - %(lineno)d Lignes dans le Fichier : - %(name)s",
    handlers=[
        logging.FileHandler(os.path.join(log_dir, "error.log"), encoding="utf-8"),
        RotatingFileHandler(os.path.join(log_dir, "app.log"),
                            maxBytes=1_000_000, backupCount=5,
                            encoding="utf-8"),
        logging.StreamHandler()
    ]
)
# Création du logger principal
logger = logging.getLogger("ArmandTraitementDonneesCommande")
# Configurer un niveau spécifique pour error.log
logging.getLogger().handlers[0].setLevel(logging.ERROR)
# Définit le premier handler au niveau ERROR (minimum)
# error.log : ERROR et CRITICAL uniquement

# Ordre du plus bas au plus élevé : DEBUG - INFO - WARNING - ERROR - CRITICAL