"""
Module STREAMLIT (necessite : pip install streamlit) : C'est un framework Python conçu pour créer des application
web interactives de manière simple et rapide.
- Idéal pour Data science, Ingénieur IA, Analyste de Données (Data Analyst)

- En terme de performance, c'est très intéressant. Mais, ce n'est pas adapté pour des choses très compliquées

Les fonctionnalités de ce module ne gèrent pas des URL

Exécution : streamlit run streamlit_app.py
"""
import streamlit as st
# import python-wayland


# Configuration de la Page
st.set_page_config(page_title="Datapulse Dashboard",layout="wide")
st.title("Datapulse - Visualisation des Données")
# Affiche un titre principal en haut de l'application

# Création de Menu de navigation dans la barre lattérale
st.sidebar.subheader("Navigation")
selected_page = st.radio("Choisissez une page",["Accueil","Transactions","Clients"])
if selected_page=="Accueil":
    st.header("Bienvenue sur Datapulse")
    st.write("""
    Cette application permet de visualiser des données analytiques sur les transactions et clients
    - Transactions: .....
    - Clients : .....
    
    Selectionnez une page dans le menu latéral pour commencer !
    """)
    st.stop

# Execution : streamlit run streamlit_app.py