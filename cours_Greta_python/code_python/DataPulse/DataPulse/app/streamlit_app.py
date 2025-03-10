"""
Module STREAMLIT (necessite : pip install streamlit) : C'est un framework Python conçu pour créer des application
web interactives de manière simple et rapide.
- Idéal pour Data science, Ingénieur IA, Analyste de Données (Data Analyst)

- En terme de performance, c'est très intéressant. Mais, ce n'est pas adapté pour des choses très compliquées

Les fonctionnalités de ce module ne gèrent pas des URL

Exécution : streamlit run streamlit_app.py
"""
import os.path

import streamlit as st
import pandas as pa

from cours_Greta_python.code_python.DataPulse.DataPulse.logging_config import logger
from cours_Greta_python.code_python.DataPulse.DataPulse.visualization.visualizer_factory import VisualizerFactory

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
    fake_data = {
        "transactions": {
            "ca_per_month": {"Jan": 5000, "Fév": 7000, "Mars": 8000},
            "top_products": {"Produit A": 120, "Produit B": 95},
            "payment_methods": {"Carte": 70, "Paypal": 20, "Virement": 10}
        },
        "clients": {
            "client_categories": {"petits_acheteurs": 50, "moyens_acheteurs": 30, "gros_acheteurs": 20},
            "oldest_inactive_clients": {"2023-01-15": 10, "2023-02-10": 5}
        }
    }

# Gérer les pages transactions et clients
if selected_page=="Transactions":
    analysis_type = "transactions"
    st.header("Analyse des Transactions")
elif selected_page == "Clients":
    analysis_type = "clients"
    st.header("Analyse des Clients")

try:
    visualizer = VisualizerFactory.get_visualizer(fake_data(analysis_type),analysis_type)
except Exception as e:
    st.error(f"Erreur lors de la création du Visualizer :{e}")
    logger.error(f"Erreur lors de la création du Visualizer :{e}")

# Afficher les statistiques sous forme de tableau

# Créons un sous-titre
st.subheader("Données utilisées pour l'analyse")
df_data = pa.DataFrame.from_dict(fake_data[analysis_type],orient="index") # orient contrôle comment les dictionnaires sont créés
st.dataframe(df_data)


st.sidebar.subheader("Sélection du graphique à afficher")
graph_option = visualizer.get_plots()
graph_labels = [func.__name__.replace("_"," ").title() for func in graph_option]

selected_graph = st.sidebar.radio["Sélectionnez un graphique",graph_labels]
st.subheader(f"{selected_graph}")
plot_func=dict(zip(graph_labels,graph_option))[selected_graph]
fig,ax = plot_func()

if fig:
    st.pyplot(fig,use_container_width=False)

pdf_filename =f"{analysis_type}.report.pdf"
if st.sidebar.button("Générer le rapport PDF"):
    try:
        visualizer.generate_pdf(pdf_filename)
        base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        report_dir =os.path.join(base_dir,"reports")
        filepath =os.path.join(report_dir,pdf_filename)
        with open(filepath,'rb') as pdf_file:
            st.sidebar.download_button(
                label="Télécharger le rapport PDF",
                data=pdf_file,
                file_name=pdf_filename,
                mime="application/pdf"
            )
        st.sidebar.success(f"Rapport PDF généré : {pdf_filename}")
        logger.info(f"Rapport PDF généré :{pdf_filename}")
    except Exception as e:
        st.sidebar.error(f"Erreur lors de la génration du PDF :{e}")
        logger.error(f"Erreur lors de la génration du PDF :{e}")



st.stop()
# Execution : streamlit run streamlit_app.py