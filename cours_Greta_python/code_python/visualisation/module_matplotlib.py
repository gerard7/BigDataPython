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
import matplotlib.pyplot as plt
import numpy as np


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

import numpy

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

customize_plot()
