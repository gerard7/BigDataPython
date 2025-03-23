from cours_Greta_python.ArmandTraitementDonneesCommande.ArmandTraitementDonneesCommande.logging_config import logger

from parametres import param

import random
import string
import datetime

import pymysql.cursors

from hashlib import blake2b
from hmac import compare_digest
AUTH_SIZE = 16
SECRET_KEY = b'generateur de clef de serveur pseudo aleatoire' # Ne pas changer tant que le contenu de la Base n'est pas supprimé à l'avance

def generer_date_alea_carac(taille=10):
    """
    Cette fonction génère une chaine aléatoire dont le préfixe est la date actuelle.
    :param: c'est la taille de la chaine aléatoire utilisée comme sufixe. Par défaut, ce sufixe a pour taille 10
    :return : Retoure une chaine aléatoire
    """
    length = taille
    pool = string.ascii_letters + string.digits
    random_string = ''.join(random.choice(pool) for _ in range(length))
    d = datetime.datetime.today().strftime("%d-%m-%Y_%Hh-%Mm-%Ss")
    return str(d)+"_" + random_string

def crypter_data(value):
    """
    Cette fonction crypte une donnée fournie en paramètre.
    :param: c'est la donnée à crypter
    :return : elle retourne la donnée cryptée
    """
    val =value.encode('utf-8')
    hash_mot = blake2b(digest_size=AUTH_SIZE, key=SECRET_KEY)
    hash_mot.update(val)
    return hash_mot.hexdigest()


def verifie_decrypte(mot_fourni, mot_stock):
    """
    Cette fonction vérifie si le mot_fourni et le mot_stocke en Base sont les mêmes . Sachant qu'elle va
    crypter le mot_fourni et le comparer au mot_stocke en Base.
    :return : return True (si mot_founi et mot_stock sont les mêmes  Ou False, sinon
    """
    bonne_signature = crypter_data(mot_fourni)
    return compare_digest(bonne_signature, mot_stock)

class ConnexionDataBase:
    def __int__(self):
        pass

    def get_data_base_connexion(self):
        """
        Cette fonction renvoie le connecteur de la Base de de Données
        :return : retourne le connecteur de la Base de Données
        """
        try:
            connection = pymysql.connect(host=param.host,
                                     user=param.user,
                                     password=param.mot_passe,
                                     database=param.database,
                                     cursorclass=pymysql.cursors.DictCursor)
            logger.info("Connexion Réussie à la Base de Données")
            # print("Connexion Réussie à la Base de Données")
            return connection
        except Exception as e:
            # print("Erreur Connexion en Base")
            logger.error(f"Impossible de se connecter à la Base de Données à cause de l'erreur : {e}")
            return None



    def insert_data(self,dico):
        """
        Cette fonction prend un dictionnaire contenant des clefs et des valeurs nécessaires pour insérer les
        valeur en Base de Données
        :param: dico : c'est le dico contenant les clés et valeurs en entrée
        :return: Pas de valeur retiournée. Cette fonction insère dans la Base un Client et le nom
        du jeu de données s'il a été effectué
        """
        conn_1= self.get_data_base_connexion()
        last_insert_client_id=""
        try:
            with conn_1:
                with conn_1.cursor() as cursor:
                    # Create a new record
                    sql_1 = "INSERT INTO " + param.table1 +" " + "(nom, email,mot_passe) VALUES (%s, %s, %s)"
                    val_1 = (dico["nom"], dico["email"], crypter_data(dico["mot_passe"])) # Crypter le Passe avant insertion
                    cursor.execute(sql_1, val_1)
                    last_insert_client_id = conn_1.insert_id()
                    conn_1.commit()
                    logger.info("Insertion réussie du client dans la Base de Données")
                    # print("Insertion du client réussie !")
        except Exception as e:
            # print(f"Erreur Insertion du client :{e}")
            logger.error(f"Une erreur s'est produite lors de l'insertion du client dans la Base de Données. L'erreur est : {e}")
        conn_2 = self.get_data_base_connexion()
        try:
            with conn_2:
                with conn_2.cursor() as cursor:
                    # Create a new record
                    sql_2 = "INSERT INTO " + param.table2 +" " + "(nom_jeu, date_creation,id_client) VALUES (%s, %s, %s)"
                    val_2 = (dico["nom_jeu"], dico["date_creation"],str(last_insert_client_id))
                    cursor.execute(sql_2, val_2)
                    conn_2.commit()
                    # print("Insertion du jeu de Données réussie !")
                    logger.info("Insertion réussie du jeu de donnée du client dans la Base de Données")
        except Exception as e:
            # print(f"Erreur Insertion du jeu de Données :{e}")
            logger.error(f"Une erreur s'est produite lors de l'insertion du Jeu de Données dans la Base de Données. L'erreur est : {e}")

    def get_user_and_jeux_donnees(self,passe,email):
        """
        Cette fonction renvoie le client s'il existe dans la Base de Données un client répondant aux paramètres
        entrés : le mot de passe et le mail.
        :param : passe : c'est le mot de passe entré en paramètre
        :param: email : il est sensé être unique . Le coupe (passe,email) est utilisé pour interroger la Base de Données
        :return : Cette fonction renvoie un dictionnaire vite si aucun client ne répond à ce critère. En revenche, si un client
        répond au critère (passe, email), alors , un dictionnaire est retourné avec le nom, email, et les noms de tous
        les jeux de données déjà joués par ce client s'ils existent
        """
        conn_1= self.get_data_base_connexion()
        result= {}
        jeu_donnees =[]
        try:
            with conn_1.cursor() as cursor:
                # Read a single record
                sql1 = "SELECT `id_client`,`email` FROM `Clients` WHERE `email`=%s and `mot_passe`=%s"
                cursor.execute(sql1, (email,crypter_data(passe))) # crypter le passe avant de lancer la recherche
                result = cursor.fetchone()
                logger.info("Recherche du client en Base de Données , réussie!")
                conn_2 = self.get_data_base_connexion()
                try:
                    with conn_2.cursor() as cursor:
                        # Read a several record
                        sql2 = "SELECT * FROM `Jeu_de_donnees` WHERE `id_client`=%s"
                        cursor.execute(sql2, (result["id_client"]))
                        jeu_donnees = cursor.fetchall()
                        # print("jeu de donnée =",jeu_donnees)
                        result["jeu_donnees"] = jeu_donnees
                        return result
                        logger.info("Récupération de(s) jeu(x) de données du client réussie!")
                except Exception as e:
                    # print("Erreur lors de la récupération des jeux de données du Client.")
                    logger.eeror(f"Erreur lors de la récupération des jeux de données du Client. Erreur : {e}")
        except Exception as e:
            # print("Erreur lors de la recherche du client en Base")
            logger.error(f"Une erreur est survenue lors de la recherche du client en Base. Erreur: {e} ")
        finally:
            return result

if __name__ == "__main__":
    conn = ConnexionDataBase()
    # dic = {"nom":"treizeAlbert",
    #        "email":"treizearmand@armand.com",
    #        "mot_passe":"12345678",
    #        "nom_jeu": generer_date_alea_carac(),
    #        "date_creation":datetime.datetime.today()}
    # conn.insert_data(dic)
    # conn.get_data_base_connexion()
    print(conn.get_user_and_jeux_donnees("12345678","treizearmand@armand.com"))

# Si aucun jeu de données : le dictionnaire résultat renvoie si le client est dans la Base un résultat semblable à:
#  {'id_client': 1, 'email': 'paul@paul.com', 'jeu_donnees': ()}

