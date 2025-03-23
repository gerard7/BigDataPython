# Un fichier de log serveur contient des informations sur
# chaque requête HTTP envoyée au serveur, telles que :
# L’adresse IP du client qui a fait la requête.
# Le code de réponse HTTP (200, 404, 500, etc.).
# L’heure de la requête.
# L’URL demandée, le navigateur utilisé, etc.
# Exemple de ligne :
# 192.168.1.10 - - [12/Feb/2024:14:05:23 +0000] "GET /index.html HTTP/1.1" 200 512

import re
from collections import  Counter
from cours_Greta_python.code_python.DataPulse.DataPulse.logging_config import logger
from cours_Greta_python.code_python.DataPulse.DataPulse.processing.file_loaders import load_file

def analyze_server_logs(log_path, top_ips=5):
    """
    Cette fonction lit de gros fichiers et a pour particularité de ne pas stocker l'intégratlité du fichier
    dans la mémoire pour renvoyer les statistiques suivantes :
    - Le nombre total de requêtes enregistrées dans les log.
    - La distribution des codes HTTP (exemple : combien de 200, 404, 500, etc.).
    - Les top_ips les plus actives (les adresses IP qui ont fait le plus de requêtes).
    - Les pics de trafic par heure (combien de requêtes sont envoyées à chaque heure de la journée).
     Exemple d'une ligne dans le fichier :192.168.1.10 - - [12/Feb/2024:14:05:23 +0000] "GET /index.html HTTP/1.1" 200 512
    :param log_path: C'est le fichier à traiter
    :param top_ips: Ce sont les top_ips ip les plus actives (les adresses IP qui ont fait le plus de requêtes).
    :return: La fonction retourne un dictionnaire avec les cléfs suivantes :
    total_requests - http_code_distribution - most_active_ips - traffic_by_hour
    Un Exemple de Retour :
    {
        'total_requests': 10000,
        'http_code_distribution': {'192': 10000},
        'most_active_ips':
            {'192.168.1.239': 57, '192.168.1.3': 56, '192.168.1.126': 55, '192.168.1.71': 54, '192.168.1.61': 54
            },
        'traffic_by_hour':
            {'02': 410, '14': 424, '08': 407, '04': 454, '15': 414, '13': 389, '22': 429, '07': 383, '17': 376, '11': 420, '06': 407, '16': 425, '12': 441, '10': 433, '21': 393, '05': 422, '03': 431, '01': 437, '00': 424, '23': 394, '19': 397, '09': 444, '18': 441, '20': 405
            }
    }

    """
    http = re.compile(r'(\b(\d{3})\b)')
    ip = re.compile(r'\b(?:\d{1,3}\.){3}\d{1,3}\b')
    heure_requete = re.compile(r'\b(\d{2}):\d{2}:\d{2}\b')
    total_dico= {}
    try:
        fichier = load_file(log_path)
        http_count = Counter()
        ip_count = Counter()
        heure_requete_count = Counter()
        compteur = 0
        for ligne in fichier:
            compteur+=1
            match_http = re.search(http, ligne)
            match_ip = re.search(ip,ligne)
            match_horaire = re.search(heure_requete,ligne)
            if match_http:
                http_count[match_http.group(1)]+=1
            if match_ip:
                ip_count[match_ip.group(0)]+=1
            if match_horaire:
                # print(match_horaire.group(1))
                heure_requete_count[match_horaire.group(1)]+=1

        total_dico['total_requests'] = compteur
        total_dico['http_code_distribution'] = dict(http_count)
        total_dico['most_active_ips'] = dict(ip_count.most_common(top_ips))
        # Ordonnons par horaire, le nombre de connexion. Les heures par ordre croissant
        dico_horaire = dict(heure_requete_count)
        dico_horaire = sorted(dico_horaire.items(), key=lambda x: x[0]) # A ce nivezau, dico_horaire_aux est une liste de tuple
        # Fin de l'ordonnancement
        total_dico["traffic_by_hour"] = dict(dico_horaire)
        print("Dico retour =",total_dico)
        return total_dico
    except (FileNotFoundError, PermissionError, ValueError, RuntimeError) as e:
        logger.error(f"Une erreur est survenue lors de l'accès au fichier. Elle stipule que : {e}")
        return {"total_requests":0,"http_code_distribution":{},"most_active_ips":{},"traffic_by_hour":{}}


if __name__=="__main__":
    analyze_server_logs("/home/ratel/BigDataPython/cours_Greta_python/code_python/DataPulse/data/server_logs.txt",20)