import numpy as np
import pandas as pa
from collections import Counter
from datetime import date
from datetime import datetime

def analyse_cli(filepath,chunk_size):
    """
    :param: filepath, c'est le chemin du fichier csv à analyser
    :param: chunk_size : Pour ne pas tout enregistrer en mémoire, c'est le nombre de lignes à lire pas à pas
    :return: retourne un dictionnaire contenant les éléments suivants :
    {
    "total_clients":545556
     "top_clients":{12345:50,67890:45,11223:40}
    "inactive_clients_count": 25000
    "oldest_inactive_dates":[("2017-05-10",20),("2018-09-15",18)]
    "client_categories":{
                "petits_acheteurs":40000
                "moyens_acheteurs":30000
                "gros_acheteurs":15000
                }
        }
    Règle : - si le dernier achat du client s'est fait avant le 2024/01/01, il est inactif
            - Si un achat du client dépasse 50.000 , c'est un gros Acheteur, inférieur à 50000, petit acheteur, sinon, moyen acheteur

    """
    dico_global = {}
    dico_global["total_clients"] =0
    oldest_date =[]
    nom_prenom_total_montant ={}
    nom_prenom_data_achat ={}
    for i, chunk in enumerate(pa.read_csv(filepath, chunksize=chunk_size)):
        df = pa.DataFrame(chunk)
        nom_prenom_montant_activite = df[["nom","prenom","montant","derniere_activite"]].to_numpy()
        for k in nom_prenom_montant_activite:
            try:
                nom_prenom_total_montant[(k[0],k[1])]+=k[2]
                nom_prenom_data_achat[(k[0],k[1])].append(k[3])
            except KeyError:
                nom_prenom_total_montant[(k[0],k[1])]=k[2]
                nom_prenom_data_achat[(k[0], k[1])] = [k[3]]

    dico_global["total_clients"]=len(nom_prenom_total_montant.keys())
    reference_pourcentage = 5/100
    reference_limite_moy_achat = np.array(list(nom_prenom_total_montant.values())).mean()
    reference_limite_inf_achat = reference_limite_moy_achat - reference_limite_moy_achat*reference_pourcentage
    petits_acheteurs =0
    moyens_acheteurs = 0
    gros_acheteurs = 0
    for montant in nom_prenom_total_montant.values():
        if montant > reference_limite_moy_achat:
            gros_acheteurs+=1
        elif reference_limite_inf_achat < montant < reference_limite_moy_achat:
            moyens_acheteurs+=1
        else:
            petits_acheteurs+=1
    dico_global["client_categories"] = {"gros_acheteurs":gros_acheteurs,
                                        "moyens_acheteurs":moyens_acheteurs,"petits_acheteurs":petits_acheteurs}

    # Pour trouver les non_actifs, on va parcourir nom_prenom_data_achat et trier les dates de la plus
    # petite à la plus grande. Ensuite, si la plus grande est avant 2024/01/01, c'est inactif
    # --- TRI ---

    for clef,date_achat in nom_prenom_data_achat.items():
        date_achat.sort()
    # -- Comptage des Inactifs
    count_inactif = 0
    date_reference = datetime.strptime("2024-01-01", '%Y-%m-%d').date()
    for _,date_achat in nom_prenom_data_achat.items():
        oldest_date.append(date_achat[0])
        if datetime.strptime(date_achat.pop(),'%Y-%m-%d').date() < date_reference:
            count_inactif+=1
        else:pass
    # print("dates",nom_prenom_data_achat)
    # print("Les plus anciennes dates = ",oldest_date)
    dico_global["inactive_clients_count"] = count_inactif
    dico_global["oldest_inactive_dates"] = Counter(oldest_date).most_common()
    dico_global["top_clients"]= nom_prenom_total_montant
    # print("dico_global",dico_global)
    return dico_global




# Conversion de colonne date au format correct
# df["derniere_activite"] =pa.to_datetime(df["derniere_activite"],errors="corerce")
# Pour les montants, au cas où il y aurait des manquants, si on souhaite les remplacer par 0 , on fait ceci :
#df["montant"] =pa.to_numeric(df["montant"],errors="coerce").fillna(0)

#Pour filtrer afin de ne pas avoir des répétitions:
# df["client_id"].unique() Mais avec ça, en utilisant chunk, on va devoir créer un container pour
# ajouter les morceaux de nouveaux client_id de chaque morceau. Et appliquer le unique sur chaque
# résultat

# Pour convertir des date par exemple en chaine de caractères: on utilise astype(str) suir l'élément
# comme ceci : element.update(df_date["date_format_date"].astype(str)

# Autre filtre au moment du rapatriement des données :
# val=df.loc[df["derniere_activite"].notna() & (df["derniere_activite"] < pa.timestamp("2024-01-01") ),["client_id","derniere_activite"]]


if __name__ == "__main__":
    chemin_fichier = "/home/ratel/BigDataPython/cours_Greta_python/code_python/DataPulse/data/clients.csv"
    analyse_cli(chemin_fichier, chunk_size=500)

