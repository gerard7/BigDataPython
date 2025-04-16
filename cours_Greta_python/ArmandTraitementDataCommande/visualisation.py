import sys

from matplotlib.backends.backend_pgf import PdfPages
import sys
import os
import seaborn as sns
import pandas as pa
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.backends.backend_pdf import PdfPages
import datetime
import transactions_analysis as ta
import random
from logging_config import logger
import matplotlib.dates as mdates
from collections import defaultdict

MOIS={1:"Janvier",2:"Février",3:"Mars",4:"Avril",5:"Mai",6:"Juin",7:"Juillet",8:"Août",9:"Septembre",10:"Octobre",11:"Novembre",12:"Décembre"}
LES_ETUDES = [
"Produits-Vendus",
"Statut-Paiement",
"Moyen-Paiement",
"Nombre-Clients",
"Chiffre-Affaire-Mois",
"Montant-Achat"
]


class Visuel:
    def __init__(self,date_debut,date_fin,nom_etude,nom_graphique):
        # self.type_etude = type_etude
        self.date_debut = date_debut
        self.date_fin = date_fin
        self.nom_etude =nom_etude
        self.lieu_depot_resultat = os.getcwd() + "/resultats"
        self.nom_graphique = nom_graphique
        if self.date_debut > self.date_fin or self.nom_etude not in LES_ETUDES:
            print(f"Date debut:{self.date_debut}, date fin:{self.date_fin},non etude:{self.nom_etude}")
            logger.error(f"Veuillez vérifier soit la cohérence entre la date de debut {self.date_debut} et la date de fin {self.date_fin} pour les etudes")
            logger.error(f"Veuillez vérifier si le nom de l'étude spécifiée se "
                         f"trouve bien dans la liste des études actuellement prise en compte :"
                         f" Produits-Vendus # Statut-Paiement # Moyen-Paiement # Nombre-Clients # Chiffre-Affaire-Mois # Montant-Achat")
            sys.exit()
        else:
            # Préparation des X et Y
            pass

    def couleur_aleatoire(self):
        return "#{:06x}".format(random.randint(0, 0xFFFFFF))

    def plot_type_bar(self,axe_x,categories,tab_tab_valeurs,xlabel,ylabel,titre):
        valeurs = np.array(tab_tab_valeurs)

        # Paramètres
        x = np.arange(len(axe_x))  # Index des Mois (axe_x)
        bar_width = 0.1  # Largeur des barres

        # Création des barres
        for i, categorie in enumerate(categories):
            plt.bar(x + i * bar_width, valeurs[:, i], width=bar_width, label=categorie)

        # Mise en forme
        plt.xticks(x + bar_width, axe_x)  # Ajustement des labels des jours
        plt.xlabel(xlabel)
        plt.ylabel(ylabel)
        plt.title(titre)
        plt.legend()
        plt.savefig(os.path.join(self.lieu_depot_resultat,self.nom_graphique))
        plt.show()

    def plot_type_courbe(self,axe_x,categories,tab_tab_valeurs,xlabel,ylabel,titre):
        # jours = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi"]
        valeurs = np.array(tab_tab_valeurs)
        for i, categorie in enumerate(categories):
            plt.plot(axe_x, valeurs[:, i], linestyle="--", marker="o", label=categorie)

        plt.xlabel(xlabel)
        plt.ylabel(ylabel)
        plt.title(titre)
        plt.legend()
        plt.savefig(os.path.join(self.lieu_depot_resultat,self.nom_graphique))
        plt.show()

    def plot_type_global_bar(self,axe_x,categories,tab_tab_valeurs,x_label,y_label,titre):  # figsize permet d'associer à un élément , plusieurs figures
        valeurs = np.array(tab_tab_valeurs)
        plt.figure(figsize=(7, 5))
        sns.heatmap(valeurs, annot=True, cmap="coolwarm", xticklabels=categories, yticklabels=axe_x)
        plt.title(titre)
        plt.xlabel(x_label)
        plt.ylabel(y_label)
        plt.savefig(os.path.join(self.lieu_depot_resultat,self.nom_graphique))
        plt.show()


    def plot_type_disque(self,titre,xlabel,categories,tab_tab_valeurs):
        valeurs = np.array(tab_tab_valeurs)
        cols = 3
        rows = (len(xlabel) + cols - 1) // cols  # Nombre de lignes nécessaires

        # Couleurs pour les catégories : Il faut qu'on en crée autant qu'il y a de catégorie
        couleurs = [self.couleur_aleatoire() for _ in range(len(categories))]

        # Nombre de jours
        nb_jours = len(xlabel)

        # Création des pie charts
        #fig, axes = plt.subplots(cols,rows, nb_jours, figsize=(120, 3))  # 1 ligne, plusieurs colonnes
        fig, axes = plt.subplots(rows, cols, figsize=(50, 8))  # Ajuster la taille selon le besoin
        axes = axes.flatten()
        for i, jour in enumerate(xlabel):
            # Met en valeur la plus grande et petite valeur
            tab_python=valeurs[i].tolist()
            index_min_partiel = tab_python.index(min(tab_python))
            index_max_partiel= tab_python.index(max(tab_python))
            explo = [0]*len(tab_python)
            explo[index_min_partiel]=0.1
            explo[index_max_partiel] = 0.2
            explode = tuple(explo)
            axes[i].pie(valeurs[i], labels=categories, autopct="%1.1f%%", colors=couleurs, explode=explode,startangle=90)
            axes[i].set_title(jour)

        # Affichage
        plt.title(titre)
        plt.tight_layout()
        plt.savefig(os.path.join(self.lieu_depot_resultat,self.nom_graphique))
        plt.show()

    def plot_type_disque_global(self,categories,categorie_valeur,titre,xlabel,ylabel):
        df_category = pa.DataFrame({"Categories": categories, "Ventes": categorie_valeur})
        plt.figure(figsize=(30, 5))
        # Formation de explode afin qu'il resorte les article max et min
        explo = [0] * len(categorie_valeur)
        index_min_partiel = categorie_valeur.index(min(categorie_valeur))
        index_max_partiel = categorie_valeur.index(max(categorie_valeur))
        explo[index_min_partiel] = 0.1
        explo[index_max_partiel] = 0.2
        explode = tuple(explo)
        plt.pie(df_category["Ventes"], labels=df_category["Categories"], autopct="%1.1f%%",
                colors=sns.color_palette("pastel"), explode=explode)
        # Dans colors, nous allons mettre des palettes de seaborn . Car, ces dernières sont riches
        plt.title(titre)
        plt.xlabel(xlabel)
        plt.ylabel(ylabel)
        plt.savefig(os.path.join(self.lieu_depot_resultat,self.nom_graphique))
        plt.show()

    def plot_type_mois_jours(self,data,xlabel,ylabel,titre):
        values = [item[0] for item in data]
        dates = [datetime.date(year, month, day) for _, (year, month, day) in data]

        # Création du graphique
        plt.figure(figsize=(12, 6))
        plt.plot(dates, values, linestyle='-', color='g', label="Valeurs")

        # Mise en forme du graphique
        plt.xlabel(xlabel)
        plt.ylabel(ylabel)
        plt.title(titre)
        plt.xticks(rotation=45)
        plt.legend()
        plt.grid()
        plt.savefig(os.path.join(self.lieu_depot_resultat,self.nom_graphique))
        # Affichage
        plt.show()

    def plot_type_ca_mois_simple(self,data,xlabel,ylabel,titre):
        values = [point[0] for point in data]
        months = [f"{point[1][0]}-{point[1][1]:02d}" for point in data]  # Format AAAA-MM

        # Création du graphique
        plt.figure(figsize=(10, 5))
        plt.plot(months, values, marker='o', linestyle='-', color='b')

        # Personnalisation du graphique
        plt.xlabel(xlabel)
        plt.ylabel(ylabel)
        plt.title(titre)
        plt.xticks(rotation=45)
        plt.grid(True)
        plt.savefig(os.path.join(self.lieu_depot_resultat,self.nom_graphique))
        # Affichage du graphique
        plt.show()

    def plot_type_ca_barre(self,data,xlabel,ylabel,titre):
        values = [val[0] for val in data]
        labels = [f"{month}/{year}" for _, (year, month) in data]

        # Création du graphique en barres
        plt.figure(figsize=(12, 6))
        plt.bar(labels, values, color='skyblue')
        plt.xlabel(xlabel)
        plt.ylabel(ylabel)
        plt.title(titre)
        plt.xticks(rotation=45, ha="right")
        plt.grid(axis='y', linestyle='--', alpha=0.7)
        plt.savefig(os.path.join(self.lieu_depot_resultat,self.nom_graphique))
        plt.show()

    def plot_type_ca_disque(self,data,titre):
        data = [d for d in data if d[0] > 0]

        # Extraire les valeurs et les étiquettes
        values = [d[0] for d in data]
        labels = [f"{d[1][1]}/{d[1][0]}" for d in data]  # Format mois/année

        # Création du camembert
        plt.figure(figsize=(8, 8))
        explo = [0] * len(values)
        index_min_partiel = values.index(min(values))
        index_max_partiel = values.index(max(values))
        explo = [0] * len(values)
        explo[index_min_partiel] = 0.1
        explo[index_max_partiel] = 0.2
        explode = tuple(explo)
        plt.pie(values, labels=labels, autopct='%1.1f%%', startangle=140,
                colors=plt.cm.Paired.colors,explode=explode, wedgeprops={'edgecolor': 'black'})

        # Titre
        plt.title(titre)
        # Affichage
        plt.savefig(os.path.join(self.lieu_depot_resultat,self.nom_graphique))
        plt.show()

    def plot_type_ca_arraignee(self,data,titre):
        data = [d for d in data if d[0] > 0]

        # Extraire les valeurs et les étiquettes
        values = [d[0] for d in data]
        labels = [f"{d[1][1]}/{d[1][0]}" for d in data]  # Format mois/année

        # Normaliser les valeurs pour éviter des écarts trop grands
        max_value = max(values)
        values = [v / max_value for v in values]  # Mise à l'échelle entre 0 et 1

        # Ajouter la première valeur à la fin pour fermer le graphique
        values += values[:1]

        # Création des angles pour chaque axe
        angles = np.linspace(0, 2 * np.pi, len(values), endpoint=True)

        # Création du graphique en radar
        fig, ax = plt.subplots(figsize=(8, 8), subplot_kw={'projection': 'polar'})
        ax.plot(angles, values, marker='o', linestyle='solid', linewidth=2, label="Données")
        ax.fill(angles, values, alpha=0.3)

        # Ajouter les étiquettes sur les axes
        ax.set_xticks(angles[:-1])
        ax.set_xticklabels(labels, fontsize=10)

        # Ajouter un titre
        plt.title(titre)
        plt.savefig(os.path.join(self.lieu_depot_resultat,self.nom_graphique))
        # Affichage
        plt.show()

    def plot_type_ca_bulles(self,data,titre):
        data = [d for d in data if d[0] > 0]

        # Extraction des valeurs
        x = [f"{d[1][1]}/{d[1][0]}" for d in data]  # Mois/Année en labels
        y = [1] * len(data)  # Une seule ligne pour l'alignement des bulles
        sizes = [v[0] / max(d[0] for d in data) * 1000 for v in data]  # Échelle pour la taille des bulles

        # Création du graphique en bulles
        plt.figure(figsize=(10, 5))
        plt.scatter(x, y, s=sizes, alpha=0.6, c=range(len(data)), cmap='coolwarm', edgecolors='black')

        # Ajout des étiquettes
        plt.xticks(rotation=45, fontsize=10)
        plt.yticks([])  # Cacher l'axe Y car il n'est pas utile
        plt.title(titre)
        plt.savefig(os.path.join(self.lieu_depot_resultat,self.nom_graphique))
        # Affichage
        plt.show()

    def plot_type_ca_jour_simple(self,data,xlabel,ylabel,titre):
        dates = [datetime.date(year, month, day) for _, (year, month, day) in data]
        values = [value for value, _ in data]

        # Création du graphique
        plt.figure(figsize=(10, 6))
        plt.plot(dates, values, marker='o', linestyle='-', color='b')

        # Formatage de la date sur l'axe x
        plt.gca().xaxis.set_major_formatter(mdates.DateFormatter('%Y-%m-%d'))
        plt.gca().xaxis.set_major_locator(mdates.WeekdayLocator(interval=2))  # Affichage des dates tous les 2 jours
        plt.gcf().autofmt_xdate()  # Rotation des dates

        # Ajout des titres et labels
        plt.title(titre)
        plt.xlabel(xlabel)
        plt.ylabel(ylabel)
        # Affichage du graphique
        plt.tight_layout()
        plt.savefig(os.path.join(self.lieu_depot_resultat,self.nom_graphique))
        plt.show()

    def plot_type_ca_jour_arraignee(self,data,titre):
        monthly_data = defaultdict(list)
        for value, (year, month, day) in data:
            monthly_data[(year, month)].append(value)

        # 2. Calculer la moyenne par mois
        averages = {}
        for (year, month), values in monthly_data.items():
            averages[f"{year}-{month:02d}"] = np.mean(values)

        ordered_months = sorted(set(f"{year}-{month:02d}" for _, (year, month, _) in data))
        months =[]
        for i in ordered_months:
            months.append(MOIS[int(i.split("-")[1])])

        values = [averages.get(month, 0) for month in ordered_months]
        # Paramètres du radar
        angles = np.linspace(0, 2 * np.pi, len(months), endpoint=False).tolist()
        values += values[:1]  # Fermer le cercle
        angles += angles[:1]

        fig, ax = plt.subplots(figsize=(8, 8), subplot_kw=dict(polar=True))
        ax.plot(angles, values, color='blue', linewidth=2)
        ax.fill(angles, values, color='blue', alpha=0.25)
        ax.set_xticks(angles[:-1])
        ax.set_xticklabels(months)
        ax.set_title(titre, pad=20)
        plt.savefig(os.path.join(self.lieu_depot_resultat,self.nom_graphique))
        plt.show()

    def get_date_debut(self):
        return self.date_debut

    def get_date_fin(self):
        return self.date_fin

    def get_filepath_data_en_entree(self):
        return self.self.nom_graphique

    def get_nom_etude(self):
        return self.nom_etude

    def exec(self):
        # date_debut = datetime.date(2023, 5, 13)
        # date_fin = datetime.date(2024, 7, 22)
        # etude = "Montant-Achat"  # "Produits-Vendus" "Statut-Paiement"  "Moyen-Paiement" "Nombre-Clients" "Chiffre-Affaire-Mois" "Montant-Achat"
        # visu = Visuel(etude,date_debut, date_fin,"Moyen-Paiement","25-03-2025_20h-38m-41s_KyTovLIsX2.pdf")
        file_path = os.getcwd() + "/conversion_json_en_csv.csv"
        data_init = ta.Traitement_Donnees(self.date_debut, self.date_fin,file_path, chunk_size=1000)
        # Chosissons un nombre aléatoire entre 1 et 4 . En fonction de la sortie , on prendre une méthode de représentation
        # Si c'est 1 -> simple_plot  2 -> customize_plot  3 -> plot_sales_seaborn  4 -> plot_pie_chart
        d = datetime.datetime.today()
        random.seed(d.microsecond)
        choix_alea = random.randint(1, 5)
        etude = self.nom_etude
        if etude == "Produits-Vendus":
            data_pv = data_init.differents_produits_achetes()
            # Preparons les abscisses : axe_x et les ordonnées : tab_tab_valeurs
            axe_x = []
            categories = []
            ensemble_produits_et_valeur = {}
            for tout_prod in data_pv:
                dico_partiel = tout_prod[0]
                for cle, val in dico_partiel.items():
                    if cle not in ensemble_produits_et_valeur:
                        ensemble_produits_et_valeur[cle] = val
                    else:
                        ensemble_produits_et_valeur[cle] += val
            for tup in data_pv:
                dico_produit = tup[0]
                dt = tup[1]
                axe_x.append(MOIS[dt[1]])
                for cle, quant in dico_produit.items():
                    if cle not in categories:
                        categories.append(cle)
                    else:
                        pass

            # La position fixée de chaque catégorie est sa position dans : le tableau catégorie
            quantite_differents_produits_par_mois = []  # [[0]*len(categories)]*len(axe_x)
            # Obligé de reparcourir le tuple data_pv
            for j in range(len(data_pv)):
                dico_produit = data_pv[j][0]
                sous_tableau = [0] * len(categories)
                for cle, valeur in dico_produit.items():
                    sous_tableau[categories.index(cle)] = valeur
                quantite_differents_produits_par_mois.append(sous_tableau)

            titre = "Graphe des Produits vendus par mois"
            xinfo = "Axe des quantités vendues de tous produits confondus"
            yinfo = "Axe des Mois"
            if choix_alea == 1:
                self.plot_type_bar(axe_x, categories, quantite_differents_produits_par_mois, titre, xinfo, yinfo)
            elif choix_alea == 2:
                self.plot_type_courbe(axe_x, categories, quantite_differents_produits_par_mois, yinfo, xinfo, titre)
            elif choix_alea == 3:
                self.plot_type_global_bar(axe_x, categories, quantite_differents_produits_par_mois, xinfo, yinfo, titre)
            elif choix_alea == 4:
                self.plot_type_disque(titre, axe_x, categories, quantite_differents_produits_par_mois)
            elif choix_alea == 5:
                categorie_valeur = []
                for clef, values in ensemble_produits_et_valeur.items():
                    categorie_valeur.append(values)
                titre = ""
                yinfo = f"Période :{self.date_debut} à {self.date_fin}"
                self.plot_type_disque_global(categories, categorie_valeur, titre, yinfo, xinfo)

            else:
                logger.error(f"Choix inconnu d'etude . Impossible de fournir le grafique.")
                sys.exit()

        elif etude == "Statut-Paiement":
            data_sp = data_init.statut_paiement()
            axe_x = []
            categories = []
            ensemble_statuts_et_valeur = {}
            for tout_statut in data_sp:
                dico_partiel = tout_statut[0]
                for cle, val in dico_partiel.items():
                    if cle not in ensemble_statuts_et_valeur:
                        ensemble_statuts_et_valeur[cle] = val
                    else:
                        ensemble_statuts_et_valeur[cle] += val
            for tup in data_sp:
                dico_produit = tup[0]
                dt = tup[1]
                axe_x.append(MOIS[dt[1]])
                for cle, quant in dico_produit.items():
                    if cle not in categories:
                        categories.append(cle)
                    else:
                        pass

            # La position fixée de chaque catégorie est sa position dans : le tableau catégorie
            quantite_differents_statut_par_mois = []
            # Obligé de reparcourir le tuple data_pv
            for j in range(len(data_sp)):
                dico_produit = data_sp[j][0]
                sous_tableau = [0] * len(categories)
                for cle, valeur in dico_produit.items():
                    sous_tableau[categories.index(cle)] = valeur
                quantite_differents_statut_par_mois.append(sous_tableau)

            titre = "Graphe des Statuts de Paiement par mois"
            xinfo = "Axe des Statuts de Paiement"
            yinfo = "Axe des Mois"
            if choix_alea == 1:
                self.plot_type_bar(axe_x, categories, quantite_differents_statut_par_mois, yinfo, xinfo, titre)
            elif choix_alea == 2:
                self.plot_type_courbe(axe_x, categories, quantite_differents_statut_par_mois, yinfo, xinfo, titre)
            elif choix_alea == 3:
                self.plot_type_global_bar(axe_x, categories, quantite_differents_statut_par_mois, xinfo, yinfo, titre)
            elif choix_alea == 4:
                self.plot_type_disque(titre, axe_x, categories, quantite_differents_statut_par_mois)
            elif choix_alea == 5:
                categorie_valeur = []
                for clef, values in ensemble_statuts_et_valeur.items():
                    categorie_valeur.append(values)
                titre = ""
                yinfo = f"Période :{self.date_debut} à {self.date_fin}"
                self.plot_type_disque_global(categories, categorie_valeur, titre, yinfo, xinfo)
            else:
                logger.error(f"Choix inconnu d'etude . Impossible de fournir le grafique.")
                sys.exit()
        elif etude == "Moyen-Paiement":
            data_mp = data_init.moyen_paiement()
            axe_x = []
            categories = []
            ensemble_moyen_et_valeur = {}
            for tout_statut in data_mp:
                dico_partiel = tout_statut[0]
                for cle, val in dico_partiel.items():
                    if cle not in ensemble_moyen_et_valeur:
                        ensemble_moyen_et_valeur[cle] = val
                    else:
                        ensemble_moyen_et_valeur[cle] += val
            for tup in data_mp:
                dico_produit = tup[0]
                dt = tup[1]
                axe_x.append(MOIS[dt[1]])
                for cle, quant in dico_produit.items():
                    if cle not in categories:
                        categories.append(cle)
                    else:
                        pass

            # La position fixée de chaque catégorie est sa position dans : le tableau catégorie
            quantite_differents_moyen_par_mois = []
            # Obligé de reparcourir le tuple data_pv
            for j in range(len(data_mp)):
                dico_produit = data_mp[j][0]
                sous_tableau = [0] * len(categories)
                for cle, valeur in dico_produit.items():
                    sous_tableau[categories.index(cle)] = valeur
                quantite_differents_moyen_par_mois.append(sous_tableau)

            titre = "Graphe des Moyens de Paiement par mois"
            xinfo = "Axe des quantite_differents_moyen_par_mois de Paiement"
            yinfo = "Axe des Mois"
            if choix_alea == 1:
                self.plot_type_bar(axe_x, categories, quantite_differents_moyen_par_mois, yinfo, xinfo, titre)
            elif choix_alea == 2:
                self.plot_type_courbe(axe_x, categories, quantite_differents_moyen_par_mois, yinfo, xinfo, titre)
            elif choix_alea == 3:
                self.plot_type_global_bar(axe_x, categories, quantite_differents_moyen_par_mois, xinfo, yinfo, titre)
            elif choix_alea == 4:
                self.plot_type_disque(titre, axe_x, categories, quantite_differents_moyen_par_mois)
            elif choix_alea == 5:
                categorie_valeur = []
                for clef, values in ensemble_moyen_et_valeur.items():
                    categorie_valeur.append(values)
                titre = ""
                yinfo = f"Période :{self.date_debut} à {self.date_fin}"
                self.plot_type_disque_global(categories, categorie_valeur, titre, yinfo, xinfo)


        elif etude == "Nombre-Clients":
            data_nc = data_init.nombre_clients()
            titre = "Graphe des Fréquentations des clients par jour"
            xinfo = "Jours..."
            yinfo = "Axe du nombre de Clients"
            self.plot_type_mois_jours(data_nc, xinfo, yinfo, titre)
        elif etude == "Chiffre-Affaire-Mois":
            data_ca = data_init.chiffre_affaire_par_mois()
            titre = "Chiffre d'affaire par mois"
            xinfo = "Jours..."
            yinfo = "Axe du nombre de Clients"
            if choix_alea == 1:
                self.plot_type_ca_mois_simple(data_ca, xinfo, yinfo, titre)
            elif choix_alea == 2:
                self.plot_type_ca_barre(data_ca, xinfo, yinfo, titre)
            elif choix_alea == 3:
                self.plot_type_ca_disque(data_ca, titre)
            elif choix_alea == 4:
                self.plot_type_ca_arraignee(data_ca, titre)
            elif choix_alea == 5:
                self.plot_type_ca_bulles(data_ca, titre)
        elif etude == "Montant-Achat":
            data_ma = data_init.montant_achat()
            titre = "Chiffre d'affaire par jour: activité moyenne"
            # xinfo = "Jours..."
            # yinfo = "Axe des montants"
            self.plot_type_ca_jour_arraignee(data_ma, titre)
        else:
            logger.warning(f"Impossible de réaliser un graphe sur une étude non encore prise en charge.")
            logger.error(f"Aucune étude à ce nom n'est encore intégrée. Veuillez adapter votre choix à l'existant.")
            sys.exit()

# LES_ETUDES = [
# "Produits-Vendus",
# "Statut-Paiement",
# "Moyen-Paiement",
# "Nombre-Clients",
# "Chiffre-Affaire-Mois",
# "Montant-Achat"
# ]
