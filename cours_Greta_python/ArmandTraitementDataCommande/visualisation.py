import sys

from matplotlib.backends.backend_pgf import PdfPages
import sys
import seaborn as sns
import pandas as pa
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.backends.backend_pdf import PdfPages
import datetime
import transactions_analysis as ta
import random
from logging_config import logger

MOIS={1:"Janvier",2:"Février",3:"Mars",4:"Avril",5:"Mai",6:"Juin",7:"Juillet",8:"Août",9:"Septembre",10:"Octobre",11:"Novembre",12:"Décemnre"}
LES_ETUDES = [
"Produits-Vendus",
"Statut-Paiement",
"Moyen-Paiement",
"Nombre-Clients",
"Chiffre-Affaire-Mois",
"Montant-Achat"
]


class Visuel:
    def __init__(self,type_etude,date_debut,date_fin,nom_graphique):
        self.type_etude = type_etude
        self.date_debut = date_debut
        self.date_fin = date_fin
        self.nom_graphique = nom_graphique
        if self.date_debut > self.date_fin or type_etude not in LES_ETUDES:
            logger.error(f"Veuillez vérifier soit la cohérence entre la date de debut {self.date_debut} et la date de fin {self.date_fin} pour les etudes")
            logger.error(f"Veuillez vérifier si le nom de l'étude spécifiée se "
                         f"trouve bien dans la liste des études actuellement prise en compte :"
                         f" Produits-Vendus # Statut-Paiement # Moyen-Paiement # Nombre-Clients # Chiffre-Affaire-Mois # Montant-Achat")
            sys.exit()
        else:
            # Préparation des X et Y
            pass


    def simple_plot(self,axe_x,axe_y,titre,xinfo,yinfo):
        fig, ax = plt.subplots()  # Crée une figure et un axe
        ax.plot(axe_x, axe_y, label="ligne 1")
        ax.set_title(titre)
        ax.set_xlabel(xinfo)
        ax.set_ylabel(yinfo)
        # Pour activer la légende, je dois écrire :
        ax.legend()
        plt.savefig(self.nom_graphique)
        plt.show()


    # def customize_plot(self):
    #     x = np.linspace(0, 10, 100)  # Génère 100 nombres de 0 à 100 par pas de 10
    #     y1 = np.sin(x)
    #     y2 = np.cos(x)
    #     fig, ax = plt.subplots()
    #     ax.plot(x, y1, label="Sin(x)", linestyle="--", color="g")  # -- Style de la courbe
    #     ax.plot(x, y2, label="Cos(x)", linestyle="-", color="m")  # + Style de la courbe
    #     ax.set_title("Graphique de Sinus et Cosinus")
    #     ax.set_xlabel("Temps")
    #     ax.set_ylabel("Amplitude")
    #     # Pour activer la légende, je dois écrire :
    #     ax.grid(True)
    #     ax.legend()
    #     plt.show()



    # def plot_sales_seaborn(self):  # figsize permet d'associer à un élément , plusieurs figures
    #
    #     np.random.seed(42)  # 42 est arbitraire
    #     months = ["Jan", "Fev", "Mars", "Avril", "Mai", "Juin"]
    #     sales = np.random.randint(5000, 150000, size=len(months))
    #     categories = ["Electronique", "Vetements", "Maison", "Beaute", "Alimentation"]
    #     category_sales = np.random.randint(1000, 8000, size=len(categories))
    #     df_sales = pa.DataFrame({"Mois": months, "Ventes": sales})
    #     df_category = pa.DataFrame({"Categories": categories, "Ventes": category_sales})
    #
    #
    #     plt.figure(figsize=(9, 5))  # Ici 8 correspond à 8 pouces en abscisses et  5 pouces en ordonnées
    #     # c'est la ligne suivante qui définit notre graphique
    #     sns.barplot(x="Mois", y="Ventes", data=df_sales, hue="Mois", palette="coolwarm", legend=False)
    #     # hue va colorer chaque barre différemment
    #     # Ces 2 paramètres sont utilisés en même temps. Pas l'un sans l'autre
    #     plt.title("Ventes par mois ( via Seaborn )")
    #     plt.xlabel("Mois")
    #     plt.ylabel("Montant")
    #     plt.show()

    # def plot_pie_chart(self):
    #     plt.figure(figsize=(8, 5))
    #     explode = (0.1, 0.2, 0.1, 0, 0.3)  # 0(maison),0.1(décalle un peu les vetements à cause de 0.1) 0,0,0 )
    #     plt.pie(df_category["Ventes"], labels=df_category["Categories"], autopct="%1.1f%%",
    #             colors=sns.color_palette("pastel"), explode=explode)
    #     # Dans colors, nous allons mettre des palette de seaborn . Car, ces dernières sont riches
    #     plt.title("Répartition des Ventes par catégories")
    #     plt.xlabel("Mois")
    #     plt.ylabel("Ventes")
    #     plt.show()


# LES_ETUDES = [
# "Produits-Vendus",
# "Statut-Paiement",
# "Moyen-Paiement",
# "Nombre-Clients",
# "Chiffre-Affaire-Mois",
# "Montant-Achat"
# ]


def main():
    date_debut = datetime.date(2023, 5, 13)
    date_fin = datetime.date(2024, 7, 22)
    etude = "Produits-Vendus"  # "Statut-Paiement"  "Moyen-Paiement" "Nombre-Clients" "Chiffre-Affaire-Mois" "Montant-Achat"
    visu = Visuel(etude,date_debut, date_fin,"26-03-2025_17h-52m-24s_Olw3PBkRiJ")
    file_path ="/home/ratel/BigDataPython/cours_Greta_python/ArmandTraitementDataCommande/conversion_json_en_csv.csv"
    data_init  = ta.Traitement_Donnees(date_debut,date_fin,file_path, chunk_size=1000)
    # Chosissons un nombre aléatoire entre 1 et 4 . En fonction de la sortie , on prendre une méthode de représentation
    # Si c'est 1 -> simple_plot  2 -> customize_plot  3 -> plot_sales_seaborn  4 -> plot_pie_chart
    d = datetime.datetime.today()
    random.seed(d.minute)
    choix_alea = random.randint(1, 4)
    if etude=="Produits-Vendus":
        data = data_init.differents_produits_achetes()
        # Preparons les abscisses : axe_x et les ordonnées :axe_y
        axe_x =[]
        axe_y =[]
        for tup in data:
            dico_produit = tup[0]
            dt = tup[1]
            axe_x.append(MOIS[dt[1]])
            somme_quant = 0
            for quant in dico_produit.values():
                somme_quant+=quant
            axe_y.append(somme_quant)
        titre = "Graphe des Produits vendus par mois"
        xinfo = "Axe des Mois"
        yinfo = "Axe des quantités vendues de tous produits confondus"
        # axe_x,axe_y,titre,xinfo,yinfo
        visu.simple_plot(axe_x,axe_y,titre,xinfo,yinfo)
        if choix_alea==1:
            pass
        elif choix_alea==2:
            pass
        elif choix_alea==3:
            pass
        elif choix_alea==4:
            pass
        else:
            logger.error(f"Choix inconnu d'etude . Impossible de fournir le grafique.")
            sys.exit()

if __name__=="__main__":
    main()
