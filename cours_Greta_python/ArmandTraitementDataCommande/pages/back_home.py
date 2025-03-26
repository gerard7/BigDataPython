import streamlit as st
import pandas as pa
import datetime
import re

def home():
    # """Login page"""
    st.title("PROJET DE GESTION DE TRAITEMENT DE DONNÉES DE COMMANDES EN LIGNE.")
    st.markdown(
        "<h8 style='text-align: left; color: #blue;'> Veuillez créer un compte ou vous connecter... </h8>",
        unsafe_allow_html=True
    )
    bouton = st.checkbox("Univers")

    if bouton:
        st.switch_page("/home/ratel/BigDataPython/cours_Greta_python/ArmandTraitementDataCommande/moteur_interface.py")


if __name__=="__main__":
    home()