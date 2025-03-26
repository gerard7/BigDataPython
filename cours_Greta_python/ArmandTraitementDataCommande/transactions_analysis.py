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
import sys
from pathlib import PurePath
from collections import Counter
import numpy as np
import pandas as pa
import ast
import datetime


# from pyspark.sql import SparkSession
# import pyspark.sql.functions as F
# from pyspark.sql.functions import col
#
# from pyspark.sql.types import NumericType
# my_spark = SparkSession.builder.getOrCreate()

from logging_config import logger

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


class Traitement_Donnees:
    """
    Cette classe va implémenter des méthodes pour répondre aux diverses demandes du client depuis l'interface streamlit
    """
    def __init__(self,date_debut_etude:datetime.date,date_fin_etude:datetime.date,json_path, chunk_size=1000):
        self.json_path = json_path
        self.chunk_size =chunk_size
        self.date_debut_etude=date_debut_etude
        self.date_fin_etude = date_fin_etude
        # self.my_spark = SparkSession.builder.getOrCreate()
        self.articles = pa.read_csv(self.json_path)



    def decoupage_periode_en_mois(self,debut,fin):
        """
        Cette fonction découpe une période délimitée par une date de début et une date de fin en portions de mois
        :param: debut : c'est la date du début de la période
        :param:fin  : c'est la date de fin de la période
        :return : Elle renvoie une liste de tuple de type datetime.date
        """
        # Définir les dates de début et de fin
        start_date = str(debut.year)+"-"+str(debut.month)+"-"+str(debut.day)
        end_date = str(fin.year)+"-"+str(fin.month)+"-"+str(fin.day)

        # Générer une liste de fins de mois dans cette période
        date_range = pa.date_range(start=start_date, end=end_date, freq='ME')

        # Ajouter le début et la fin si nécessaire
        date_list = [pa.Timestamp(start_date)] + date_range.tolist() + [pa.Timestamp(end_date)]

        # Créer les intervalles entre chaque mois
        periode = [(date_list[i], date_list[i + 1]) for i in range(len(date_list) - 1)]
        periode_retour=[(periode[0][0].to_pydatetime().date(),periode[0][1].to_pydatetime().date())]
        # Ajoutons 1 jour au début de la période suivante pour être bien dans le mois.


        for i in range(1,len(periode)):
            t0 = periode[i][0] + pa.Timedelta(days=1)
            t1 = periode[i][1]
            # conversion t0 et t1 en datetime.date
            t0 =  t0.to_pydatetime().date()
            t1 = t1.to_pydatetime().date()
            periode_retour.append((t0,t1))

        # print(periode_retour)
        # for i in periode_retour:
        #     print(f"De {i[0]} à {i[1]}")
        return periode_retour


    def analyze_transactions(self):
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
        chemin = PurePath(self.json_path)
        df_ = pa.read_json(self.json_path)
        nouv_fichier = os.path.join(chemin.parent,"conversion_json_en_csv.csv")
        df_.to_csv(nouv_fichier)
        dico_global ={}
        montants_lus =[]
        paiement_lus =[]
        moyen_paiement_lus = []
        noms_prenoms_lus = []
        produits_lus =[]
        toutes_dates_lues =[]
        for i , chunk in enumerate(pa.read_csv(nouv_fichier,chunksize=self.chunk_size)):
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

    def differents_produits_achetes(self):
        """
        Cette fonction renvoie les différents produits achetés entre la date_debut_etude et la date_fin_etude
        Exemple: Si date_debut_etude=12/04/25 et la date_fin_etude=7/05/25
        du 12/04/25 au 31/04/25: 48 produits achetés (pas forcément les mêmes) , du 01/05/25 au 7/05/25: 18 produits achetés
        elle Renvoie une liste de tuple:  [({},(annee,mois)),({},(annee,mois))...] les dictionnaires
        contiennent les produits vendus par quantités
        """
        # fiche_lue = my_spark.read.csv(self.json_path, header=True)
        # prod = fiche_lue.select(fiche_lue.produit,fiche_lue.date)
        # prod = prod.withColumn("date",F.to_date(prod["date"],"yyyy-MM-dd"))
        # print(prod.count())
        # prod.show()
        # self.articles["date"] = pa.to_datetime(self.articles["date"])
        # # print(self.articles.dtypes)
        # df_filter = self.articles[(self.articles["date"]>= pa.to_datetime(self.date_fin_etude)) & (self.articles["date"]<=pa.to_datetime(self.date_fin_etude))]

        produits_lus =[]
        date_lues =[]
        stat_total_retour =[]
        produit_total =[]
        date_totale =[]
        periode_mensuelle = self.decoupage_periode_en_mois(self.date_debut_etude,self.date_fin_etude)
        #datetime.date(int(s[0:4]),int(s[5:7]),int(s[8:10]))
        for i , chunk in enumerate(pa.read_csv(self.json_path,chunksize=self.chunk_size)):
            df = pa.DataFrame(chunk)
            produit_ = df["produit"].to_numpy()
            toutes_date_ = df["date"].to_numpy()
            produits_lus.append(produit_.tolist())
            date_lues.append(toutes_date_.tolist())

        # ----------------  Produits --------------------
        for j in produits_lus:
            for i in j:
                produit_total.append(i)

        # -------------- Les Date -----------------------
        for j in date_lues:
            for i in j:
                date_totale.append(i[:10])  # Enrregistrement des dates sous forme de : yyyy-m-d
        # transformons toutes les dates au format : yyyy-mm-dd au format datetime.date
        liste_dates_obj = [datetime.datetime.strptime(date_str, "%Y-%m-%d").date() for date_str in date_totale]

        for p in periode_mensuelle:
            dico = {}
            for i in range(len(produit_total)):
                if p[0] <= liste_dates_obj[i] <= p[1]:
                    if produit_total[i] not in dico.keys():
                        # On le crée et on porte sa quantité à 1
                        dico[produit_total[i]] =1
                    else:
                        # On l'incrémente
                        dico[produit_total[i]]+=1
                else:
                    pass
            if dico:
                stat_total_retour.append((dico,(p[0].year,p[0].month))) # On peut aussi écrire p[1].month. C'est le même mois de toutes les façons
            else:
                # Aucun produit vendu dans un mois donné
                pass
        # print(periode_mensuelle)
        # print(stat_total_retour)

        return stat_total_retour


    def statut_paiement(self):
        """
        Cette fonction renvoie les statuts de paiement entre la date_debut_etude et la date_fin_etude.
        Exemple : Si date_debut_etude=12/04/25 et la date_fin_etude=7/05/25
        du 12/04/25 au 30/04/25: 17 Payés, 30 Annulé, 52 En attente, puis, du 01/05/25 au 7/05/25 des chiffres du même genre
        """
        statut_paiement_lus = []
        date_lues = []
        stat_total_retour = []
        statut_total = []
        date_totale = []
        periode_mensuelle = self.decoupage_periode_en_mois(self.date_debut_etude, self.date_fin_etude)
        for i, chunk in enumerate(pa.read_csv(self.json_path, chunksize=self.chunk_size)):
            df = pa.DataFrame(chunk)
            statut_ = df["statut_paiement"].to_numpy()
            toutes_date_ = df["date"].to_numpy()
            statut_paiement_lus.append(statut_.tolist())
            date_lues.append(toutes_date_.tolist())

        # ----------------  Statut --------------------
        for j in statut_paiement_lus:
            for i in j:
                statut_total.append(i)

        # -------------- Les Date -----------------------
        for j in date_lues:
            for i in j:
                date_totale.append(i[:10])  # Enrregistrement des dates sous forme de : yyyy-m-d
        # transformons toutes les dates au format : yyyy-mm-dd au format datetime.date
        liste_dates_obj = [datetime.datetime.strptime(date_str, "%Y-%m-%d").date() for date_str in date_totale]

        for p in periode_mensuelle:
            dico = {}
            for i in range(len(statut_total)):
                if p[0] <= liste_dates_obj[i] <= p[1]:
                    if statut_total[i] not in dico.keys():
                        # On le crée et on porte sa quantité à 1
                        dico[statut_total[i]] = 1
                    else:
                        # On l'incrémente
                        dico[statut_total[i]] += 1
                else:
                    pass
            if dico:
                stat_total_retour.append((dico, (
                p[0].year, p[0].month)))  # On peut aussi écrire p[1].month. C'est le même mois de toutes les façons
            else:
                # Aucun produit vendu dans un mois donné
                pass
        # print(stat_total_retour)
        return stat_total_retour


    def moyen_paiement(self):
        """
        Cette fonction renvoie les différents moyens de paiement par mois entre la date_debut_etude et la date_fin_etude.
        Si date_debut_etude=12/04/25 et la date_fin_etude=7/05/25, on aura :
        Du genre:10 fois Carte Bancaire, 15 fois PayPal, 35 fois Espèces Du 12/04/25 au 30/04:25
          et 17 fois Carte Bancaire , 18 fois PayPal , 52 fois espèces du 01/05/25 au 07/05/25
          ....entre la date_debut_etude et la date_fin_etude
        """
        moyen_paiement_lus = []
        date_lues = []
        stat_total_retour = []
        moyen_total = []
        date_totale = []
        periode_mensuelle = self.decoupage_periode_en_mois(self.date_debut_etude, self.date_fin_etude)
        for i, chunk in enumerate(pa.read_csv(self.json_path, chunksize=self.chunk_size)):
            df = pa.DataFrame(chunk)
            statut_ = df["moyen_paiement"].to_numpy()
            toutes_date_ = df["date"].to_numpy()
            moyen_paiement_lus.append(statut_.tolist())
            date_lues.append(toutes_date_.tolist())

        # ----------------  Moyen Paiement --------------------
        for j in moyen_paiement_lus:
            for i in j:
                moyen_total.append(i)

        # -------------- Les Date -----------------------
        for j in date_lues:
            for i in j:
                date_totale.append(i[:10])  # Enrregistrement des dates sous forme de : yyyy-m-d
        # transformons toutes les dates au format : yyyy-mm-dd au format datetime.date
        liste_dates_obj = [datetime.datetime.strptime(date_str, "%Y-%m-%d").date() for date_str in date_totale]

        for p in periode_mensuelle:
            dico = {}
            for i in range(len(moyen_total)):
                if p[0] <= liste_dates_obj[i] <= p[1]:
                    if moyen_total[i] not in dico.keys():
                        # On le crée et on porte sa quantité à 1
                        dico[moyen_total[i]] = 1
                    else:
                        # On l'incrémente
                        dico[moyen_total[i]] += 1
                else:
                    pass
            if dico:
                stat_total_retour.append((dico, (
                    p[0].year, p[0].month)))  # On peut aussi écrire p[1].month. C'est le même mois de toutes les façons
            else:
                # Aucun produit vendu dans un mois donné
                pass
        # print(stat_total_retour)
        return stat_total_retour

    def tous_les_jours_entre_deux_dates(self,debut,fin):
        """
        Cette fonction renvoie tous les jours sous forme de datetime.date se trouvant entre deux dates: debut et fin
        :param:debut: c'est le début de la période
        :param:fin : c'est la fin de la période
        :return Elle retourne une liste de dates au format datetime.date
        """

        # Dates de début et de fin
        # Liste pour stocker les dates
        tous_les_jours = []

        # Boucle pour ajouter chaque jour entre les deux dates
        current_date = debut
        while current_date <= fin:
            tous_les_jours.append(current_date)
            current_date += datetime.timedelta(days=1)

        # Affichage des dates
        # print(tous_les_jours)
        return tous_les_jours

    def nombre_clients(self):
        """"
        Cette fonction renvoie le nombre de clients entre la date_debut_etude et la date_fin_etude.
        Si : date_debut_etude=12/04/25 et la date_fin_etude=7/05/25
        Du genre : 20 clients le 12 Avril, 17 le 13 Avril, 0 le 14 Avril.....jusqu'à 3 clients le 7/05/25
        """
        client_paiement_lus = []
        date_lues = []
        stat_total_retour = []
        client_total = []
        date_totale = []
        tous_les_jours = self.tous_les_jours_entre_deux_dates(self.date_debut_etude, self.date_fin_etude)
        for i, chunk in enumerate(pa.read_csv(self.json_path, chunksize=self.chunk_size)):
            df = pa.DataFrame(chunk)
            statut_ = df["statut_paiement"].to_numpy()
            toutes_date_ = df["date"].to_numpy()
            client_paiement_lus.append(statut_.tolist())
            date_lues.append(toutes_date_.tolist())

        # ----------------  Chiffre d'affaire mensuel --------------------
        for j in client_paiement_lus:
            for i in j:
                client_total.append(i)

        # -------------- Les Date -----------------------
        for j in date_lues:
            for i in j:
                date_totale.append(i[:10])  # Enrregistrement des dates sous forme de : yyyy-m-d
        # transformons toutes les dates au format : yyyy-mm-dd au format datetime.date
        liste_dates_obj = [datetime.datetime.strptime(date_str, "%Y-%m-%d").date() for date_str in date_totale]

        for p in tous_les_jours:
            som = 0
            for i in range(len(client_total)):
                if liste_dates_obj[i] == p and client_total[i]=="Payé": # Nous avons choisi de considérer dans le comptage , seuls les clients ayant payé
                    som += 1
                else:
                    pass
            stat_total_retour.append((som, (
                p.year, p.month, p.day)))  # On peut aussi écrire p[1].month. C'est le même mois de toutes les façons

        # print(stat_total_retour)
        return stat_total_retour

    def chiffre_affaire_par_mois(self):
        """
        Cette fonction renvoie le chiffre d'affaire par mois entre la date_debut_etude et la date_fin_etude
        sous forme de dictionnaire : dont les clefs sont les mois et les valeurs le chiffre d'affaire
        Exemple : {"3":23000,"04":57000...}
        """
        montant_paiement_lus = []
        date_lues = []
        stat_total_retour = []
        montant_total = []
        date_totale = []
        periode_mensuelle = self.decoupage_periode_en_mois(self.date_debut_etude, self.date_fin_etude)
        for i, chunk in enumerate(pa.read_csv(self.json_path, chunksize=self.chunk_size)):
            df = pa.DataFrame(chunk)
            statut_ = df["montant"].to_numpy()
            toutes_date_ = df["date"].to_numpy()
            montant_paiement_lus.append(statut_.tolist())
            date_lues.append(toutes_date_.tolist())

        # ----------------  Chiffre d'affaire mensuel --------------------
        for j in montant_paiement_lus:
            for i in j:
                montant_total.append(i)

        # -------------- Les Date -----------------------
        for j in date_lues:
            for i in j:
                date_totale.append(i[:10])  # Enrregistrement des dates sous forme de : yyyy-m-d
        # transformons toutes les dates au format : yyyy-mm-dd au format datetime.date
        liste_dates_obj = [datetime.datetime.strptime(date_str, "%Y-%m-%d").date() for date_str in date_totale]

        for p in periode_mensuelle:
            dico = {}
            som =0
            for i in range(len(montant_total)):
                if p[0] <= liste_dates_obj[i] <= p[1]:
                    som+=montant_total[i]
                else:
                    pass
            stat_total_retour.append((som, (
                    p[0].year, p[0].month)))  # On peut aussi écrire p[1].month. C'est le même mois de toutes les façons

        # print(stat_total_retour)
        return stat_total_retour

    def montant_achat(self):
        """
        Cette fonction renvoie le montant total des achats effectués par les clients par jour se trouvant
        entre la date_debut_etude et la date_fin_etude.
        Exemple:Si date_debut_etude=12/04/25 et la date_fin_etude=7/05/25
        On aura par exemple: 574 le 12/04/25, 230 le 13/04/25....jusqu'à 780 le 7/05/25
        """
        montant_paiement_lus = []
        date_lues = []
        stat_total_retour = []
        montant_total = []
        date_totale = []
        tous_les_jours = self.tous_les_jours_entre_deux_dates(self.date_debut_etude, self.date_fin_etude)
        for i, chunk in enumerate(pa.read_csv(self.json_path, chunksize=self.chunk_size)):
            df = pa.DataFrame(chunk)
            statut_ = df["montant"].to_numpy()
            toutes_date_ = df["date"].to_numpy()
            montant_paiement_lus.append(statut_.tolist())
            date_lues.append(toutes_date_.tolist())

        # ----------------  Chiffre d'affaire mensuel --------------------
        for j in montant_paiement_lus:
            for i in j:
                montant_total.append(i)

        # -------------- Les Date -----------------------
        for j in date_lues:
            for i in j:
                date_totale.append(i[:10])  # Enrregistrement des dates sous forme de : yyyy-m-d
        # transformons toutes les dates au format : yyyy-mm-dd au format datetime.date
        liste_dates_obj = [datetime.datetime.strptime(date_str, "%Y-%m-%d").date() for date_str in date_totale]

        for p in tous_les_jours:
            som = 0
            for i in range(len(montant_total)):
                if liste_dates_obj[i]== p:
                    som += montant_total[i]
                else:
                    pass
            stat_total_retour.append((som, (
                p.year, p.month,p.day)))  # On peut aussi écrire p[1].month. C'est le même mois de toutes les façons

        # print(stat_total_retour)
        return stat_total_retour


if __name__=="__main__":
    chunk_size = 1000
    chemin_fichier = "/home/ratel/BigDataPython/cours_Greta_python/ArmandTraitementDataCommande/transactions_nouvelles.json"
    fichier_csv ="/home/ratel/BigDataPython/cours_Greta_python/ArmandTraitementDataCommande/conversion_json_en_csv.csv"
    date_debut = datetime.date(2023,5,13)
    date_fin = datetime.date(2024,7,22)
    if date_debut > date_fin :
        logger.warning(f"La Date de début Doit être inférieure à la Date de fin de Période. veuillez changer.")
        logger.error(f"La Date de début Doit être inférieure à la Date de fin de Période. veuillez changer.")
        sys.exit()
    else:
        print("Traitement des données en cours...")
        transac =Traitement_Donnees(date_debut,date_fin,fichier_csv,chunk_size=1000)
        # print(transac.decoupage_periode_en_mois(date_debut,date_fin))
        print(transac.differents_produits_achetes())
        # print(transac.statut_paiement())
        # transac.moyen_paiement()
        # transac.chiffre_affaire_par_mois()
        # transac.tous_les_jours_entre_deux_dates(date_debut,date_fin)
        # print(transac.montant_achat())
        # print("Seuls les clients ayant payé:")
        # print(transac.nombre_clients())






# [
# "Différents produits Achetés",
# "Statut-Paiement",
# "Moyen de Paiement",
# "Nombre de Clients",
# "Chiffre d'Affaire par Mois",
# "Montant Achat"]




























