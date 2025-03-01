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
from collections import Counter
import numpy as np
import pandas as pa
import ast
from datetime import date
from datetime import datetime


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
        "outlier_transactions_count":2500, : Considérons les transactions en attente comme abérrante
        "top_products":{"Smartphone":40000,"Laptop":35000,"Casque":30000},
        "payment_methods":{"CB":80000,"Virement":20000,"PayPal":14587},
        "ca_per_month":{
            "2023-01":750000,
            "2023-02":800000,
            "2023-03":720000
            },
        "total_clients":85000,
        "top_clients":{12345:50,67890:45,11223:40},
        "inactive_clients_count":25000, : Règle : Si dernière transaction avant 01/01/2024
        "oldest_inactive_dates":[("2017-05-10",20),("2018-09-15",18),("2016-12-01",17)],
        "client_categories":{
            "petits_acheteurs":40000,
            "moyens_acheteurs":30000,
            "gros_acheteurs":15000
            }
        }
    """
    chemin = PurePath(json_path)
    df_ = pa.read_json(json_path)
    nouv_fichier = os.path.join(chemin.parent,"consersion_json_en_csv.csv")
    df_.to_csv(nouv_fichier)
    dico_global ={}
    montants_lus =[]
    paiement_lus =[]
    moyen_paiement_lus = []
    noms_prenoms_lus = []
    produits_lus =[]
    toutes_dates_lues =[]
    for i , chunk in enumerate(pa.read_csv(nouv_fichier,chunksize=chunk_size)):
        df = pa.DataFrame(chunk)
        # "statut_paiement"
        montant_ = df["montant"].to_numpy() # remplaçons les Nan trouvés dans les montants par 0
        paiement_ = df["statut_paiement"].to_numpy()
        moyen_paie_ = df["moyen_paiement"].to_numpy()
        nom_prenom_dict_ = df["client"].to_numpy()
        produit_ = df["produit"].to_numpy()
        toutes_date_  =df["date"].to_numpy()
        montants_lus.append(montant_.tolist())
        paiement_lus.append(paiement_.tolist())
        moyen_paiement_lus.append(moyen_paie_.tolist())
        noms_prenoms_lus.append(nom_prenom_dict_.tolist())
        produits_lus.append(produit_.tolist())
        toutes_dates_lues.append(toutes_date_.tolist())

    montant_total= []
    paiement_total=[]
    moyen_paiement_total =[]
    nom_prenom_total =[]
    produit_total =[]
    date_totale =[]
    date_totale_ = []
    top_clients = {}
    nom_prenom_date ={}
    # -------------- Les Montants --------------
    for j in montants_lus:
        for i in j:
            montant_total.append(i)
    # -------------- Les Status de Paiements --------------
    for j in paiement_lus:
        for i in j:
            paiement_total.append(i)
    # -------------- Les Moyens de Paiement --------------
    for j in moyen_paiement_lus:
        for i in j:
            moyen_paiement_total.append(i)

    # ---------------- Nom Prénom -----------------
    for j in noms_prenoms_lus:
        for i in j:
            nom_prenom_total.append(ast.literal_eval(i)["nom"])

    # ----------------  Produits --------------------
    for j in produits_lus:
        for i in j:
            produit_total.append(i)

    # -------------- Les Date -----------------------
    for j in toutes_dates_lues:
        for i in j:
            date_totale_.append(i)
            date_totale.append(i[:7]) # Enrregistrement des dates sous forme de : yyyy-MM

    dico_global["total_transactions"] = len(montant_total)
    pur_montant_paye =[]
    pur_transaction_paye =[]
    produit_total_paye =[]
    moyen_paiement_paye =[]
    pures_dates_payees =[]
    for i in range(len(montant_total)) :
        if paiement_total[i] == "Payé":
            pur_montant_paye.append(montant_total[i])
            pur_transaction_paye.append(nom_prenom_total[i])
            produit_total_paye.append(produit_total[i])
            moyen_paiement_paye.append(moyen_paiement_total[i])
            pures_dates_payees.append(date_totale[i])
            if nom_prenom_total[i] in top_clients.keys():
                top_clients[nom_prenom_total[i]] +=montant_total[i]
            else:
                top_clients[nom_prenom_total[i]] = montant_total[i]
                # Répétion de ce corps de code pour ne pas devoir parcourir plusieurs fois : montant_total
            if nom_prenom_total[i] in nom_prenom_date.keys():
                nom_prenom_date[nom_prenom_total[i]].append(date_totale_[i])
            else:
                nom_prenom_date[nom_prenom_total[i]] = [date_totale_[i]]
        else:
            # Répétion de ce corps de code pour ne pas devoir parcourir plusieurs fois : montant_total
            if nom_prenom_total[i] in nom_prenom_date.keys():
                nom_prenom_date[nom_prenom_total[i]].append(date_totale_[i])
            else:
                nom_prenom_date[nom_prenom_total[i]] = [date_totale_[i]]

    # En parcourant pures_dates_payees, je vais former un dictionnaire en calculant le chiffre d'affaire par mois
    chiffre_affaire_par_mois = {}
    for i in range(len(pures_dates_payees)):
        if pures_dates_payees[i] not in chiffre_affaire_par_mois.keys():
            chiffre_affaire_par_mois[pures_dates_payees[i]]= pur_montant_paye[i]
        else:
            chiffre_affaire_par_mois[pures_dates_payees[i]]+=pur_montant_paye[i]

    # Arrondissons le Montant du chiffre d'affaire = 2 chiffres après la virgule
    for cle in chiffre_affaire_par_mois.keys():
        chiffre_affaire_par_mois[cle] = "{:.2f}".format(chiffre_affaire_par_mois[cle])

    # Arrondissons le Montant des top client à 2 chiffres après la virgule
    for cle in top_clients.keys():
        top_clients[cle] = "{:.2f}".format(top_clients[cle])

    # Parcourons : nom_prenom_date et rangeons les dates par ordre croissant.
    inactif_count = 0
    date_reference = datetime.strptime("2024-01-01", '%Y-%m-%d').date()
    for value in nom_prenom_date.values():
        value.sort()
        if datetime.strptime(value[0],'%Y-%m-%d').date() < date_reference:
            inactif_count+=1
        else:pass
    # Rangeons les clients par catégories:


    dico_global["total_amount"] = sum(pur_montant_paye)
    dico_global["mean_amount"] = "{:.2f}".format(float(np.mean(pur_montant_paye)))
    dico_global["median_amount"] = "{:.2f}".format(float(np.median(pur_montant_paye)))
    dico_global["std_dev"] = "{:.2f}".format(float(np.std(pur_montant_paye)))
    dico_global["status_counts"] = dict(Counter(paiement_total).most_common())
    dico_global["transaction_per_client"] = dict(Counter(nom_prenom_total).most_common())
    dico_global["transaction_per_client_paye"] = dict(Counter(pur_transaction_paye).most_common())
    dico_global["top_products"] = dict(Counter(produit_total_paye).most_common())
    dico_global["payment_methods"] = dict(Counter(moyen_paiement_paye).most_common())
    dico_global["ca_per_month"] = chiffre_affaire_par_mois
    dico_global["total_clients"] = len(set(nom_prenom_total))
    dico_global["top_clients"] = top_clients
    dico_global["inactif_count"] =inactif_count
    dico_global["oldest_inactive_dates"] = dict(Counter(date_totale_).most_common())
    sup_client = 0
    moyen_client = 0
    inf_client = 0
    pourcentage = 5/100
    val_moyen_inf = float(dico_global["mean_amount"]) - float(dico_global["mean_amount"])*pourcentage
    for val in top_clients.values():
        if val > dico_global["mean_amount"]:
            sup_client+=1
        elif val_moyen_inf < val < dico_global["mean_amount"]:
            moyen_client+=1
        else:
            inf_client+=1
    dico_global["client_categories"] = {"petits_acheteurs":inf_client,"moyens_acheteurs":moyen_client ,"gros_acheteurs":sup_client}
    print("dico_global = ",dico_global)
    return dico_global


if __name__=="__main__":
    chemin_fichier="/home/ratel/BigDataPython/cours_Greta_python/code_python/DataPulse/data/transactions_nouvelles.json"
    analyze_transactions(chemin_fichier,chunk_size=1000)
    # transactions_nouvelles.json































