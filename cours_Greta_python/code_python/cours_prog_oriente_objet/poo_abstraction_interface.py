from abc import ABC
from abc import abstractmethod
from typing import Union
import  mypy
from six import wraps


# s'utilise en CLI comme suit : mypy ma_methode.py
# Si la fonction retourne un int ou float on fait aussi lors de sa définition ma_fonction()-> int | float:
# Le module mypy : est un outil statique qui permet de vérifier le typage statique en python
# Il ne change pas le commportement du code Mais détecte les incohérences de type avant exécution


# Un décorateur est une fonction qui prend en entrée une fonction (la nôtre)
# et renvoie une nouvelle version de notre fonction .
# Créons un décorateur log_trannsaction : qui va tracer les transactions.

# Il faut la déclarer en dehors des classes

def log_transaction(func):
    """
    Décorateur qui journalise chaque transaction
    """
    # Permet de conserver le nom et docstring de la fonction d'origine (sinon,wrapper
    # remplacerait) func dans les métadonnées: comme __name__
    # Ici, notre décorateur s'appelle wrapper
    # On peut l'écrire pour une classe. Dans ce cas, func devient cls  et wrapper devient wrapperclass
    # ainsi que l'utilisation de super()
    @wraps(func)
    def wrapper(self,montant,*args,**kwargs):
        print(f"Journalisation : {func.__name__} de {montant} € par {type(self).__name__}")
        # type(self).__name__} , c'est le nom de la methode qui utilise ce décorateur
        return func(self,montant,*args,**kwargs)
    # *args et **kwargs servent en ce que si des méthodes futures définissent des paramètres
    # supplémentaires, que le décorateur ne se plante pas.
    # Un décorateur prend les paramètres de la méthode à décorer. On peut se servir ou non d'eux tous.
    # Mais, si on décide de décorer , c'est qu'on a au moins besoin d'utiliser certains paramètres de la méthode
    # pour laquelle on construit un décorateur
    return wrapper




class SystemePaiement(ABC):
    """
    Pseudo Interface : représentant un système de paiement
    """
    # On peut avoir plusieurs méthodes abstraites. Juste ne pas oublier de mettre le décorateur au dessus

    @log_transaction
    @abstractmethod
    def payer(self,montant:Union[int,float]):
        pass

    @log_transaction
    @abstractmethod
    def rembourser(self,montant: Union[int,float]):
        pass

    # @abstractmethod
    # def crier(self):
    #     print("crier expres")

    def afficher_details(self):
        """
        Méthode concrete disponible pour toutes les sous classes
        """
        print(f"Paiement effectué avec {type(self).__name__}") # Cela donne le nom de la classe d'un objet avec __name__ et type() : la classe de l'objet



class PaiementCarte(SystemePaiement):
    """
    Paiement apr carte bancaire
    """
    def __init__(self, numere_carte,titulaire):
        self.numere_carte = numere_carte
        self.titulaire = titulaire


    @log_transaction
    def payer(self,montant:Union[int,float]):
        print(f"Paiement de {montant} € effectué par la carte ({self.numere_carte})")


    @log_transaction
    def rembourser(self,montant:Union[int,float]):
        print(f"Remboursement de {montant} € sur la carte ({self.numere_carte})")


class PaiementPaypal(SystemePaiement):
    def __init__(self,email):
        self.email = email

    @log_transaction
    def payer(self, montant:Union[int,float]):
        print(f"Paiement de {montant} € éffectué par PayPal ({self.email})")

    @log_transaction
    def rembourser(self, montant:Union[int,float]):
        print(f"Remboursement de {montant} € sur PayPal ({self.email})")
        return

paiement_carte = PaiementCarte(4582,"Armand")
paiement_paypal = PaiementPaypal("armand@gmail.com")

paiement_paypal.payer(100.56)
paiement_paypal.rembourser(30.48)

paiement_carte.payer(200.98)
paiement_carte.rembourser(150.74)