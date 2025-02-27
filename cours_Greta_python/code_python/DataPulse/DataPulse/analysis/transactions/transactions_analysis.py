# 🎯 Objectif :
# Réaliser une analyse détaillée des transactions en traitant un gros fichier JSON contenant des milliers de transactions.
#
#
# 📂 Données fournies :
# Vous disposez d’un fichier JSON contenant les transactions, avec les informations suivantes :
# •	date : Date de la transaction.
# •	montant : Montant de la transaction.
# •	produit : Nom du produit acheté.
# •	statut_paiement : État du paiement (Payé, Annulé, En attente…).
# •	moyen_paiement : Mode de paiement utilisé (CB, Virement, PayPal…).
# •	client : Contient un dictionnaire avec l’ID du client.
import os
from pathlib import PurePath
from statistics import stdev

from collections import Counter
# 🚀 Mission :
# Écrire une fonction analyze_transactions(json_path, chunk_size=1000) qui analyse
# ce fichier et retourne un dictionnaire contenant des statistiques essentielles sur les transactions.
#

# 📜 Contraintes et attendus
# - Le fichier peut être très volumineux (plusieurs Go) → Vous devez traiter les transactions par morceaux (chunksize).
# - Utilisation de Pandas et NumPy pour optimiser les calculs.
# - Nettoyer et filtrer les données pour éviter les erreurs (NaN, formats incorrects).
# - Agrégation des données pour obtenir des statistiques exploitables.

# Travail demandé
# Lire et traiter les transactions par chunks (chunksize=1000).
# Nettoyer et convertir les données (dates, montants).
# Calculer les indicateurs suivants :
# •	Nombre total de transactions (total_transactions).
# •	Montant total des transactions (total_amount).
# •	Statistiques sur les montants (mean, median, std_dev).
# •	Répartition des statuts de paiement (status_counts).
# •	Répartition des moyens de paiement (payment_methods).
# •	Classement des produits les plus vendus (top_products).
# •	Évolution du Chiffre d’Affaires (CA) par mois (ca_per_month).
# •	Détection des transactions anormales (95e percentile).
# •	Nombre de transactions par client (transactions_per_client).


# 🔎 Conseils et Indications
# - Charger le fichier JSON progressivement (ne pas tout charger en mémoire).
# - Utiliser pd.to_numeric() et pd.to_datetime() pour convertir les montants et dates.
# - Éliminer les lignes avec NaN dans montant ou date avant d’effectuer les calculs.
# - Utiliser Counter() pour les statistiques sur les produits et paiements.
# - Utiliser NumPy pour accélérer les calculs (np.mean(), np.percentile()).
# - Grouper par mois (dt.to_period("M")) pour l’évolution du CA.

import numpy as np
import pandas as pa
from collections import Counter
from DataPulse.processing import file_loaders
from bottleneck import median


def analyze_transactions(json_path, chunk_size=1000):
    """
    Cette fonction analyse le fichier : json_path et retourne un dictionnaire contenant des
    statistiques essentielles sur les transactions.
    : param : json_path C'est le fichier à lire
    : param : chunk_size : C'est la taille par défaut lors du parcour du fichier à lire morceau par morceau
    : return : retourne un dictionnaire contenant des statistiques essentielles sur les transactions.
    Contraintes :
    # - Le fichier : json_path peut être très volumineux (plusieurs Go) →
    Vous devez traiter les transactions par morceaux (chunksize).
    # - Utilisation de Pandas et NumPy pour optimiser les calculs.
    # - Nettoyer et filtrer les données pour éviter les erreurs (NaN, formats incorrects).
    # - Agrégation des données pour obtenir des statistiques exploitables.
    Exemple de sortie:
    {
        "total_transactions":1256800,
        "total_amount": 8500000.50,
        "mean_amount":67.5,
        "median_amount":55.0,
        "std_dev":25.3,
        "status_counts":{"Payé":110000,"Annulé":12000,"En_attente":3680},
        "transaction_per_client":{12345:50,67890:45,11223:40},
        "outlier_transactions_count":2500,
        "top_products":{"Smartphone":40000,"Laptop":35000,"Casque":30000},
        "payment_methods":{"CB":80000,"Virement":20000,"PayPal":14587},
        "ca_per_month":{
            "2023-01":750000,
            "2023-02":800000,
            "2023-03":720000
            },
        "total_clients":85000,
        "top_clients":{12345:50,67890:45,11223:40},
        "inactive_clients_count":25000,
        "oldest_inactive_dates":[("2017-05-10",20),("2018-09-15",18),("2016-12-01",17)],
        "client_categories":{
            "petits_acheteurs":40000,
            "moyens_acheteurs":30000,
            "gros_acheteurs":15000
            }
        }
    """
    # df_lecture = pa.read_json(json_path)
    # # djson= file_loaders.load_json_file(json_path)
    # # for i, chunk in enumerate(pa.read_json(json_path,lines=True,chunksize=chunk_size)):
    # #     print(chunk)
    # df = pa.DataFrame(df_lecture)
    # dico_global ={}
    # dico_global["total_transactions"]=len(df["transaction_id"])
    # df["montant"] = df["montant"].fillna(0) # remplaçons les Nan trouvés dans les montants par 0
    # dico_global["total_amount"] = "{:.3f}".format(sum(df['montant'].to_numpy()))
    # dico_global["mean_amount"] = "{:.3f}".format(float(dico_global["total_amount"])/dico_global["total_transactions"])
    # dico_global["median_amount"] = "{:.3f}".format(median(df['montant'].to_numpy()))
    # dico_global["std_dev"] = "{:.3f}".format(stdev(df['montant'].to_numpy()))
    # # "status_counts": {"Payé": 110000, "Annulé": 12000, "En_attente": 3680},
    #
    # df_status =df[["montant","statut_paiement"]].to_numpy()
    # # print("df_status =",df_status)
    # val_annule=0
    # val_en_attente =0
    # val_paye = 0
    # for item in df_status:
    #     clef = str(item[1]).replace("é","e")
    #     clef = clef.replace(" ","_")
    #     if clef =="Paye":
    #         val_paye+=float(item[0])
    #     if clef=="Annule":
    #         val_annule += float(item[0])
    #     if clef=="En_attente":
    #         val_en_attente += float(item[0])
    #
    # dico_global["status_counts"] = {"Paye":val_paye,"Annule":val_annule,
    #                                 "En_attente":val_en_attente}
    # # transaction_per_client
    # dtransac_par_client = df[["client","montant"]].to_numpy()
    # # print("dtransac_par_client = ",dtransac_par_client)
    # # print("total_dico=",dico_global)
    # dico_transact = {}
    # for transac in dtransac_par_client:
    #     clef =transac[0]["id"]
    #     try:
    #         dico_transact[clef]+= float(transac[1])
    #     except KeyError:
    #         dico_transact[clef] = float(transac[1])
    # dico_global["transaction_per_client"] = dico_transact
    # # print("dico_transact =",dico_transact)
    #
    # produit = df["produit"].to_numpy()
    # counter_produit = Counter(produit)
    # most_com_prod = counter_produit.most_common(5)
    # top_products ={val[0]:val[1] for val in most_com_prod}
    #
    # dico_global["top_products"]= top_products
    #
    # paiement = df["moyen_paiement"].to_numpy()
    # count_paiement = Counter(paiement)
    # most_com_paiement = count_paiement.most_common((5))
    # top_paiement = {paie[0]:paie[1] for paie in most_com_paiement}
    # # print("top_paiement = ",top_paiement)
    #
    # les_dates_montant = df[["date","montant"]].to_numpy()
    # date_com ={}
    # for elem in les_dates_montant:
    #     date= pa.to_datetime(elem[0])
    #     date=str(date).split(" ")[0]
    #     try:
    #         date_com[date]+=elem[1]
    #     except KeyError:
    #         date_com[date] = elem[1]
    #
    # # print("date_com = ",date_com)
    # dico_global["ca_per_month"] = date_com
    # total_clients =[]
    # les_clients= df[["client"]].to_numpy()
    # for cl in les_clients:
    #     total_clients.append(cl[0]["id"])
    #
    # dico_global["total_clients"]=len(set(total_clients))
    # print("dico_global = ",dico_global)

    dico_global = {}
    for i, chunk in enumerate(pa.read_csv(json_path, chunksize=chunk_size)):
        print(f"Chunk ligne {i+1}: chunk taille : {chunk.shape}")
        



if __name__=="__main__":
    chemin_fichier="/home/ratel/BigDataPython/cours_Greta_python/code_python/DataPulse/data/transactions_CSV_nouvelles.csv"
    analyze_transactions(chemin_fichier,chunk_size=7)
    # transactions_nouvelles.json































