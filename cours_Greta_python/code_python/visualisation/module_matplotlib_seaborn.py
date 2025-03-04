"""
MODULE MATPLOTLIB

Module hustorique (2003) développé en Python avec du backend en C++
pour optimiser les performances

C'est la Base de nombreuses bibliothèques de visualisation: comme Seaborn,
Plot de Pandas, Plotly, SciPy

Il nécessite plus de configuration comparé à Seaborn.

MathplotLib est optimisé pour fonctionner avec Pandas ,numpy . Ce qui le rend
 efficace pour traiter de grandes quantités de données/

 Seaborn est une surcouche de MatPlotLib:
 - Avec un style moderne
 - Graphique avancé surtout en statistiques avacées
 - Simplifie la manipulation des DataFrames dans Pandas

  CHOIX :
  - Une visualisation ultra flexible et pécises : --> MatPlotLib
  - Une visualisation jolie et rapide : --> Seaborn

"""
from matplotlib.backends.backend_pgf import PdfPages

"""
INTRODUCTION SEABORN

Seanborn est construit sur Matplotlib et intégré à Pandas
Date de création :2011
Utilisé massivement en DataScience et Machine Learning
Intégration avec Numpy et Scipy
Nécessite de l'installation : pip install seaborn

"""

import seaborn as sns
import pandas as pa
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.backends.backend_pdf import PdfPages

# matplotlib.animation pour faire des animations
# C'est un sous module qui forunit une interface similaire à celle de MatLab pour tracer des graphiques


def create_basic_plot():
    fig,ax =plt.subplots() # Crée une figure et un axe
    axe_x = [1,2,3,4]
    axe_y= [10,20,25,30]
    ax.plot(axe_x,axe_y,label="ligne 1")
    ax.set_title("Graphique simple")
    ax.set_xlabel("Axe Des Abscisses")
    ax.set_ylabel("Axe Des Ordonnées")
    # Pour activer la légende, je dois écrire :
    ax.legend()
    plt.show()

# create_basic_plot()



def customize_plot():
    x = np.linspace(0,10,100) # Génère 100 nombres de 0 à 100 par pas de 10
    y1= np.sin(x)
    y2 = np.cos(x)
    fig,ax = plt.subplots()
    ax.plot(x,y1,label="Sin(x)",linestyle="--",color="g") # -- Style de la courbe
    ax.plot(x, y2, label="Cos(x)", linestyle="-", color="m")  # + Style de la courbe
    ax.set_title("Graphique de Sinus et Cosinus")
    ax.set_xlabel("Temps")
    ax.set_ylabel("Amplitude")
    # Pour activer la légende, je dois écrire :
    ax.grid(True)
    ax.legend()
    plt.show()

# customize_plot()

# On va configurer Seaborn
sns.set_theme(style="darkgrid") # Permet de controler la police, les axes, les couleurs
# A la place de style, on peut meyttre context, palette ...il y en a beaucoup

# Générons des données

np.random.seed(42) # 42 est arbitraire
months =["Jan","Fev","Mars","Avril","Mai","Juin"]
sales =np.random.randint(5000,150000,size=len(months))
categories =["Electronique","Vetements","Maison","Beaute","Alimentation"]
category_sales = np.random.randint(1000,8000,size=len(categories))
df_sales = pa.DataFrame({"Mois":months,"Ventes":sales})
df_category = pa.DataFrame({"Categories":categories,"Ventes":category_sales})

def plot_sales_seaborn(): # figsize permet d'associer à un élément , plusieurs figures
    plt.figure(figsize=(9,5))  # Ici 8 correspond à 8 pouces en abscisses et  5 pouces en ordonnées
    # c'est la ligne suivante qui définit notre graphique
    sns.barplot(x="Mois",y="Ventes",data=df_sales,hue="Mois",palette="coolwarm",legend=False)
    # hue va colorer chaque barre différemment
    # Ces 2 paramètres sont utilisés en même temps. Pas l'un sans l'autre
    plt.title("Ventes par mois ( via Seaborn )")
    plt.xlabel("Mois")
    plt.ylabel("Montant")
    plt.show()

# plot_sales_seaborn()



def plot_boxplot_sales():
    df_expanded = pa.DataFrame({
        "Mois": np.repeat(months, repeats=5),
        "Ventes": np.random.randint(5000, 15000, size=len(months) * 5)
    })
    plt.figure(figsize=(8,5))
    sns.boxplot(x="Mois",y="Ventes",hue="Mois",palette="Blues",data=df_expanded)
    plt.title("BoxPlot des ventes mensuelles")
    plt.show()

# plot_boxplot_sales()

def plot_pie_chart():
    plt.figure(figsize=(8,5))
    explode = (0.1,0.2,0.1,0,0.3) # 0(maison),0.1(décalle un peu les vetements à cause de 0.1) 0,0,0 )
    plt.pie(df_category["Ventes"],labels=df_category["Categories"],autopct="%1.1f%%",colors=sns.color_palette("pastel"),explode=explode)
    # Dans colors, nous allons mettre des palette de seaborn . Car, ces dernières sont riches
    plt.title("Répartition des Ventes par catégories")
    plt.xlabel("Mois")
    plt.ylabel("Ventes")
    plt.show()

# plot_pie_chart()

def export_pdf():
    with PdfPages("mon_rapportSeaborn.pdf") as pdf :
        fig1, ax1 = plt.subplots(figsize=(8,5))
        sns.barplot(x="Mois", y="Ventes", data=df_sales, hue="Mois",
                    palette="coolwarm", legend=False, ax=ax1)
        ax1.set_title("Ventes")
        pdf.savefig(fig1)
        plt.close(fig1)

        fig2, ax2 = plt.subplots(figsize=(8,5))
        sns.barplot(x="Mois", y="Ventes", data=df_sales, hue="Mois",
                    palette="magma", legend=False, ax=ax2)
        ax2.set_title("Ventes")
        pdf.savefig(fig2)
        plt.close(fig2)

        
export_pdf()