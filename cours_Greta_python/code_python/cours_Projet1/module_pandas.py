import numpy as np
import pandas as pa
import pandas as pd

"""
Pandas est un package assez puissante pour manipuler les données qu'on appelle: Tabulaire
(fichiers , CSV,BDD, API)
Secteurs d'utilisation: Finances, marketing,analyse de données , Machine Learning (ML)...

Qu'est-ce qu'on faire avec ?
- Charger rapidement des millions de lignes depuis des fichiers CSV,excel,BDD, txt,...
- Analyse et filter des grandes Bases clients
- Produire des statistiques 
- Manipuler et transformer des données issues d'API, de logs serveur
- Préparer des données pour le Machine Learning (ML) & IA
- Visualisation

Pourquoi Pandas est Optimisé ? 
- Pandas est principalement écrit en python ; ses fonctions critiques sont écrites en C
- Pandas utilise les tableaux numpy
- Certaines parties sont compilées en Cython (C et Python ) pour augmenter le gain de vitesse énorme

"""

# Création d'un DataFrame à partir d'un dictionnaire.
print("Création d'un DataFrame Pandas")

data ={
    "Nom":["Sam","Alice","Charlie","Aurélien","Claude"],
    "Age":[25,36,35,40,42],
    "Ville":["Paris","Lyon","Marseille","Bordeaux","Lyon"]
}
df = pa.DataFrame(data)
print("Voici comment se présente la DataFrame:\n",df)

# Charger des données depuis un fichier csv par exemple
# df = pa.read_csv("/home/ratel/BigDataPython/cours_Greta_python/code_python/DataPulse/data/clients.csv")
# print(df)

# Exploration rapide des données

print("Exploration d'un dataframe")
print("Les 2 premières lignes du dataframe= \n",df.head(2))

print("Statistiques sur les données numériques")
print(df.describe())

print("Statistiques sur les données numériques OU NON")
print(df.describe(include="all"))
print("Statistiques sur les données numériques EN VOULANT SEULEMENT LA MOYENNE")
print(df.describe().loc[["mean","std","25%","max"]])

# Sélection de Colonne et de lignes"
print("DataFrame de départ",df)
print("Sélection de Données dans DF de Pandas")
print("Colonne Nom:=\n", df["Nom"])
print("Deuxième Ligne:\n")
print(df.iloc[1])

# Ajout de modification de colonnes

df["Salaire"]=[3000,3500,4000,4500,5520]
print("Nouveau DataFrame =\n",df)

# Filtrage de données :
print("Filtrage des personnes de plus de 30 ans :\n",df["Age"]>30) # ça, c'est un masque booléan
print(df[df["Age"]>30])
print("Filtrage des personnes gagnant plus de 3500 :\n",df["Salaire"]>3500) # ça, c'est un masque booléan
print(df[df["Salaire"]>3500])

# Trie de Données
print("Trie des Données par salaire Décroissants")
df_sorted = df.sort_values(by="Salaire",ascending=False)
print(df_sorted)

# Regroupement des données avec grouby
print("Regroupement des  Données par Ville\n") # groupby retourne un Objet spécial" groupby nécessite une fonction d'agrégation
print(df.groupby("Ville").size())
print("Regroupement des  Données, par Ville, Age ")
print(df.groupby("Ville")["Age"].mean())
df_grouped =df.groupby("Ville").agg(Age_Moyen =("Age","mean"),Salaire_total=("Salaire","sum"),Nb_Personnes =("Nom","count"))
print(df_grouped)


# Jointure entre DataFrames
df_poste =pa.DataFrame({
    "Nom":["Alice","Charlie","Aurelien"],
    "Poste": ["Développeur","Manager","Analyse"]
})

df_merged = pa.merge(df,df_poste,on="Nom",how="left")
print("Merge par la gauche. On garde tous les employés,"
      " même ceux sans Poste connu qui auront la mention Nan \n",df_merged)



print("*********************************************************\n")
df_merged_sup= df_merged.dropna()
print("Après suppression des Nan",df_merged_sup)

print("*********************************************************\n")

print("Afficher les Nan (True à ces endroits) avec isnull = \n",df_merged.isnull())
# Spécifier une mention lors de la définition"
df_merged["Poste"]= df_merged["Poste"].fillna("Sans Poste")

print("Avec une mention spécifiée :\n")
print(df_merged)

# Supprimer les lignes contenant un Nan ==> df.dropna()

df_merged["Poste"]= df_merged["Poste"].dropna()
print(df_merged)

# Création de DF avec une colonne date sous la forme de texte

df["Date_Embauche"] = ["2021-06-15","2010-09-30","2019-11-15","2022-01-10","2023-07-14"]
print("Affichage de DataFrame après ajout de Date :\n",df)
print(df.dtypes)
df["Date_Embauche"]=pa.to_datetime(df["Date_Embauche"])
print(df.dtypes)
# Ajouter une colonne date d'Embauche
df["Annee_Embauche"] = df["Date_Embauche"].dt.year
print(df)
df["Anciennete"] = pa.Timestamp.today().year - df["Date_Embauche"].dt.year
print(df)

# Relation entre Numpy , Pandas
print(type(df["Salaire"].values))

# On peut convertir une colonne en colonne Numpy
# Retour automatique de Pandas en Numpy

# Conversion en numpy

array_age = df["Age"].to_numpy()
print("Type de retour ",type(array_age))
print(array_age)
# On peut convertir l'ensemble de df en objet Numpy
df_numpy = df.to_numpy()
print(df_numpy)
un_element  =df_numpy[0]
print("Un élment:",un_element)
date = un_element[4]
print("Année = ",date.month)

array_age =df[["Age","Salaire"]].to_numpy(dtype=float)
print("Type de retour",type(array_age))
print(array_age)


# ***************** CAS DE LECTURE D'UN GROS FICHIER ***********************
# Lorsque le fichier est très gros, Pandas charge tout en RAM : Ce qui sature la mémoire
# Comme solution, on va lire les données par morceaux (chunks) avec chunksize
file_path = "big_data.csv"
chunk_size = 10 # Lire des morceaux de 10.000 lignes

df = pa.DataFrame({"ID":np.arange(1,26),"valeur": np.random.randint(100,500,size=25)})
# arange est équivalent à list(range(1,26)) : Taille de 1 à 25 inclus
# size=25 est le nombre de valeurs à générer . Ici, générer 25 valeurs entre 100 et 500 (les extrémités exclues)
df.to_csv("test_data.csv",index=False)
for i , chunk in enumerate(pa.read_csv("test_data.csv",chunksize=chunk_size)): # On ne charge surtout pas tout le fichier , mais un gérénateur qui valire chunk_size lignes à la fois
    # for va boucler sur chaque morceau (chunk) de 10.000 lignes
    # i est l'indice et chunk la valeur
    # On peut savoir la taille de chunk : ici c'est 10.000 à chaque fois.
    # On peut voir print(chunk.head(3)) # Pour voir les 3 première ligne de chaque chunk
    # on peut faire : aussi
    print(f"Chunk ligne {i+1}: chunk taille : {chunk.shape}")
    print("Trois premières valeurs =\n",chunk.head(3))
    print("Chunk=\n",chunk)


# df.dropna(subset=["montant","date",inplace=True)
# SUBSET : Seules les lignes ou ces colonnes sont Nan/NaT doivent être supprimées. N
# Nan: Not a number ; NaT : Non a Time

# inplace = pas besoin de recréer un nouveau df


# faire la somme des montant par client:
# cas du traitement du fichier transaction.json

# Voir la fonction Apply
# if "client" in df.columns:
#     df["client_id"] =df["client"].apply(lambda x: x.get("id",None) if isinstance(x,dict) else None)
#     transactions_per_month.update(df["client_id"].dropna())
#
# if montant_list:
#     montant_array = np.array(montant_list)
#     mean_amount =np.mean(montant_array)
#     threshold_value =np.percentile(montant_array,95)
#     high_value_transactions  =montant_array[montant_array > threshold_value ]
#





































































































































































































































































































































































