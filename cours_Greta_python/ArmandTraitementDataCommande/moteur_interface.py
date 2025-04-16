# Setup
import os.path

from logging_config import logger
from TraitementDataBase import ConnexionDataBase
import streamlit as st
from streamlit_pdf_viewer import pdf_viewer
import pandas as pa
import datetime
import re
import visualisation

def validateur_mot_pass(passe_wor):
    """
    Cette méthode permet de valider le mot de passe entré dans l'interface.
    Ce mot de passe doit avoir au moins 8 caractères et contenir des caractères spéciaux.
    :param: Le mot de passe à vérifier
    :return : True si le passe vérifie tous les critètes. Et False sinon.
    """
    caracteres_speciaux =["(","[","|",")","]","#","@","}","{","*","~","+","&","?","=",":","!","/"]
    regexp = r"([a-zA-Z0-9])"
    valide = re.match(regexp,passe_wor)
    aucun_caractere_speciaux  = True
    for j in passe_wor:
        if j not in caracteres_speciaux:
            pass
        else:
            aucun_caractere_speciaux = False
    if valide is None:
        return True
    elif len(passe_wor)<8:
        return True
    elif aucun_caractere_speciaux:
        return True

def login(nom,email,passe):
    st.session_state["valable"] = True
    st.session_state["nom"] = nom
    st.session_state["email"]=email
    st.session_state["mot_passe"]= passe

def logout():
    del st.session_state.mot_passe
    st.session_state["valable"] = False
    del st.session_state.nom
    del st.session_state.email
    st.write("Déconnexion avec succès")

def data_jeu_de_donnees(liste_de_jeux):
    """
    Cette fonction renvoie un format de dictionnaire avec comme clés: "Date-Realisation" et "Nom-Etude"
    et comme valeur respectives : les dates de réalisation des études et les noms des Etudes.
    Ce dictionnaire sera utilisé par Pandas.
    :param:liste_de_jeux : c'est uen liste contenant tous les jeux de données
    :return: La fonction retourne un dictionnaire
    """
    dic_date_jeu ={"Date-Realisation":[],"Nom-Etude":[]}
    for i in liste_de_jeux: # i est un dictionnaire.
        dic_date_jeu["Date-Realisation"].append(i["date_creation"])
        dic_date_jeu["Nom-Etude"].append(i["nom_jeu"])
    return dic_date_jeu

# Main function
def main():
    # """Login page"""
    st.title("PROJET DE GESTION DE TRAITEMENT DE DONNÉES DE COMMANDES EN LIGNE.")
    correspondance_etude = {"Différents produits Achetés": "Produits-Vendus",
                            "Statut-Paiement": "Statut-Paiement",
                            "Moyen de Paiement": "Moyen-Paiement",
                            "Nombre de Clients": "Nombre-Clients",
                            "Chiffre d'Affaire par Mois": "Chiffre-Affaire-Mois",
                            "Montant Achat": "Montant-Achat"
                            }
    menu = ["Connexion", "S'inscrire"]
    choice = st.selectbox("Sélectionnez Connexion ou S'inscrire dans le choix du Menu ▾", menu, )
    st.markdown(
        "<h8 style='text-align: left; color: #ffgffgf;'> Si vous n'avez pas encore de compte, veuillez créer un compte en sélectionnant l'option : S'inscrire dans le choix ci-dessus </h8>",
        unsafe_allow_html=True
    )
    if choice == "":
        st.subheader("Connexion")
    elif choice == 'Connexion':
        st.write('-------')
        st.subheader("Connexion à l'application ")

        email = st.text_input("Email Client", placeholder='email')

        password = st.text_input("Password", type='password')
        bouton_connexion = st.checkbox("Connexion")
        if bouton_connexion:
            conn_connect = ConnexionDataBase()
            result = conn_connect.get_user_and_jeux_donnees(password,email)
            if result:
                login(result["user"]["nom"], email, password) # Ouverture de session
                st.success(f"Vous êtes connecté en tant que : {result["user"]["nom"]}- {result["user"]["email"]}")
                if st.success:
                    menu_client =["Réaliser une nouvelle Étude", "Se déconnecter"]
                    st.subheader("Analyse Statistiques")
                    menu_etude = ["Différents produits Achetés", "Statut-Paiement",
                                  "Moyen de Paiement", "Nombre de Clients",
                                  "Chiffre d'Affaire par Mois", "Montant Achat"]
                    if len(result["jeu_de_donnees"])==0:
                        st.sidebar.subheader("Analyse de Données...")
                        choice_action = st.selectbox("Sélectionnez une action: ", menu_client, )
                        valider_choix = st.checkbox("Valider Choix")
                        if valider_choix:
                            if choice_action == "Se déconnecter":
                                valide_decon = st.checkbox("valider-déconnexion")
                                if valide_decon:
                                    st.subheader("Déconnecté de l'application")
                                    st.switch_page("pages/back_home.py")
                                    logout()
                            elif choice_action == "Réaliser une nouvelle Étude":
                                st.subheader("Études Statistiques")
                                # Proposer la liste d'étude : Différents Produits Achetés - Statut-Paiement - Moyen de Paiement
                                # Nombre de Clients - Chiffre d'Affaire par Mois - Montant Achat

                                # Insérer Calendrier pour le choix des dates de début et de fin de la période sur laquelle se réalisera l'étude

                                date_debut_etude = st.date_input("Date Début Étude", value="today", min_value=None, max_value=None, key=None, help=None,
                                              on_change=None, args=None, kwargs=None,format="DD/MM/YYYY",
                                              disabled=False, label_visibility="visible")

                                date_fin_etude = st.date_input("Date Fin Étude", value="today", min_value=None,
                                                                 max_value=None, key=None, help=None,
                                                                 on_change=None, args=None, kwargs=None,
                                                                 format="DD/MM/YYYY",
                                                                 disabled=False, label_visibility="visible")
                                choice_etude = st.selectbox("Sélectionnez une étude: ", menu_etude, )
                                conn_etude =  ConnexionDataBase() # Insérer en Base cette étude
                                nom_jeu_de_donnee = conn_etude.get_nom_alea(choice_etude)
                                conn_etude.insert_jeu_donnees({"nom_jeu":nom_jeu_de_donnee,"email":email,"mot_passe":password,"date_creation":str(datetime.datetime.today())})
                                client_etude_commande ={"date_debut_etude":date_debut_etude,
                                                        "date_fin_etude":date_fin_etude,
                                                        "etude":correspondance_etude[choice_etude],
                                                        "jeu_de_donnees":nom_jeu_de_donnee
                                                        }
                                lancer_etude = st.checkbox("Lancer-Etude")
                                if lancer_etude:
                                    # Attente du retour des résultats de l'équipe de Visualisation.
                                    ordre_graphe = visualisation.Visuel(date_debut_etude, date_fin_etude, correspondance_etude[choice_etude],
                                                                        nom_jeu_de_donnee)
                                    # Lancement de Graphique :
                                    ordre_graphe.exec()
                                    # On regarde dans le répertoire des résultats , s'ils y sont.

                                    # On affiche le PDF:
                                    st.title(f"Visualisation des Graphes: Étude Statistique de :{choice_etude} . Entre les Dates :{date_debut_etude} et {date_fin_etude}")

                                    # Charger le fichier PDF
                                    lieu_etude_pdf = os.getcwd() + "/resultats"
                                    pdf_path = os.path.join(lieu_etude_pdf,nom_jeu_de_donnee)

                                    pdf_viewer(pdf_path)

                    else:
                        menu_client.append("Rejouer une ancienne Étude")
                        choice_action = st.selectbox("Sélectionnez une action: ", menu_client, )
                        if choice_action == "Se déconnecter":
                            valide_decon_ = st.checkbox("valider-déconnexion")
                            if valide_decon_:
                                st.write('-------')
                                st.subheader("Déconnecté de l'application")
                                st.switch_page("pages/back_home.py")
                                logout()
                        elif choice_action == "Rejouer une ancienne Étude":
                            #
                            data = data_jeu_de_donnees(result["jeu_de_donnees"])
                            df = pa.DataFrame(data)
                            st.dataframe(df)
                            select_etude = st.selectbox("Choix étude :",data["Nom-Etude"])
                            choix_rejoue = st.checkbox("Lancer Étude")
                            if choix_rejoue:
                                lieu_etude_pdf = os.getcwd() + "/resultats"
                                pdf_path = os.path.join(lieu_etude_pdf, select_etude)
                                pdf_viewer(pdf_path)
                                # fake_file=os.path.join(lieu_etude_pdf,"mon_fichier.pdf")
                                # pdf_viewer(fake_file)
                                # Proposer une déconnexion ici :
                                deconn_visu = st.checkbox("Se déconnecter")
                                if deconn_visu:
                                    st.subheader("Déconnecté de l'application")
                                    st.switch_page("pages/back_home.py")
                                    logout()
                        elif choice_action == "Réaliser une nouvelle Étude":
                            st.subheader("Études Statistiques")
                            # Proposer la liste d'étude : Différents produits Achetés - Statut-Paiement - Moyen de Paiement
                            # Nombre de Clients - Chiffre d'Affaire par Mois - Montant Achat

                            # Insérer Calendrier pour le choix des dates de début et de fin de la période sur laquelle se réalisera l'étude

                            date_debut_etude = st.date_input("Date Début Étude", value="today", min_value=None,
                                                             max_value=None, key=None, help=None,
                                                             on_change=None, args=None, kwargs=None,
                                                             format="DD/MM/YYYY",
                                                             disabled=False, label_visibility="visible")

                            date_fin_etude = st.date_input("Date Fin Étude", value="today", min_value=None,
                                                           max_value=None, key=None, help=None,
                                                           on_change=None, args=None, kwargs=None,
                                                           format="DD/MM/YYYY",
                                                           disabled=False, label_visibility="visible")
                            choice_etude = st.selectbox("Sélectionnez une étude: ", menu_etude, )
                            conn_etude2 = ConnexionDataBase() # Insérer en Base cette étude
                            nom_jeu_de_donnee = conn_etude2.get_nom_alea(choice_etude)
                            conn_etude2.insert_jeu_donnees({"nom_jeu":nom_jeu_de_donnee,"email":email,"mot_passe":password,"date_creation":str(datetime.datetime.today())})
                            client_etude_commande = {"date_debut_etude": date_debut_etude,
                                                     "date_fin_etude": date_fin_etude,
                                                     "etude": correspondance_etude[choice_etude],
                                                     "jeu_de_donnees":nom_jeu_de_donnee
                                                     }
                            lancer_etude_ = st.checkbox("Lancer-Etude")
                            try:
                                if lancer_etude_:
                                    # Envoie des paramètres du client : client_etude_commande à l'équipe d'analyse
                                    ordre_graphe = visualisation.Visuel(date_debut_etude,date_fin_etude,correspondance_etude[choice_etude],nom_jeu_de_donnee)
                                    # Lancement de Graphique :
                                    ordre_graphe.exec()
                                    # Attente du retour des résultats de l'équipe de Visualisation.
                                    # On regarde dans le répertoire des résultats , s'ils y sont.


                                    st.title(
                                        f"Visualisation des Graphes: Étude Statistique de :{choice_etude} . Entre les Dates :{date_debut_etude} et {date_fin_etude}")
                                    # On affiche le PDF:
                                    lieu_etude_pdf = os.getcwd() + "/resultats"
                                    pdf_path = os.path.join(lieu_etude_pdf, nom_jeu_de_donnee)

                                    pdf_viewer(pdf_path)
                                    # Proposer une déconnexion ici :
                                    deconn_visu_ = st.checkbox("Se déconnecter")
                                    if deconn_visu_:
                                        st.subheader("Déconnecté de l'application")
                                        st.switch_page("pages/back_home.py")
                                        logout()
                            except Exception as e:
                                st.error(f"Une erreur s'est produite à propos du fichier résultat :{e}")
            else:
                st.warning("Incorrect NOM/Password")
    elif choice == "S'inscrire":
        st.write('-----')
        st.subheader("Créez un nouveau compte")
        nom = st.text_input("NOM :", placeholder='nom')
        email = st.text_input('Email :', placeholder='email')
        mot_passe = st.text_input("Password", type='password',placeholder='mot de passe : >=8 caract. avec caract. spéciaux /,(,#,!,_,@,...')

        if st.button("Créer"):
            if nom == '' or not nom.isalpha():  # if user name empty then show the warnings
                st.warning('Invalide  nom')
                logger.warning("Invalide valeur du Nom entré")
                return
            elif email == '' or "@" not in email or "." not in email:  # if email empty then show the warnings
                st.warning('Invalide email')
                logger.warning("Invalide Email entré")
                return
            elif validateur_mot_pass(mot_passe):  # if password empty or len(passe)<8 or without caractere speciaux then show the warnings
                st.warning('Invalide mot de passe')
                logger.warning("Invalide mot de passe entré")
                return
            else:
                dico={"nom":nom,"email":email,"mot_passe":mot_passe} # En attendant que le client crée un jeu de données, ce dico sera completé
                conn = ConnexionDataBase()
                conn.insert_single_client(dico)
                st.success("Vous avez créé votre compte avec succès ")
                logger.info("Un client vient d'être bien enregistré dans la Base de Données")
                st.info("Allez au dessus pour vous connecter.")



if __name__ == '__main__':
    main()

# streamlit run moteur_interface.py

# [
# "Différents produits Achetés",
# "Statut-Paiement",
# "Moyen de Paiement",
# "Nombre de Clients",
# "Chiffre d'Affaire par Mois",
# "Montant Achat"]



#client_etude_commande= {
# 'date_debut_etude': datetime.date(2025, 3, 25),
# 'date_fin_etude': datetime.date(2025, 3, 25),
# 'etude': 'Différents produits Achetés',
# 'jeu_de_donnees': '25-03-2025_20h-16m-58s_Vm4sMKCzwn'}