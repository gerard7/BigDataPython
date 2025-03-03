from PIL.Image import Quantize

from cours_Greta_python.code_python.TosaPratique import Vehicule
from cours_Greta_python.code_python.cours_prog_oriente_objet.projet_vehicule.models.Quatre_roues import Quatre_roues, \
    Quatre_roues


class Camion(Quatre_roues):
    def __init__(self,couleur,poids,nombre_porte,longueur):
        super(Vehicule).__init__(couleur, poids)
        super(Quatre_roues).__init__(nombre_porte)
        self.__longueur = longueur

    @property
    def ajouter_remorque(self):
        return f"La longueur de la remorque : {self.__longueur}"

    @ajouter_remorque.setter
    def ajouter_remorque(self,longueur_remorque):
        self.__longueur+=longueur_remorque

    @property
    def afficher_nombre_portes(self):
        return super(Quatre_roues).afficher_nombre_porte()

    @property
    def afficher_longueur_camion(self):
        return f"Le camion a une longueur de : {self.__longueur} mètres"

    @property
    def ajouter_personne(self):
        return super(Vehicule).__poids

    @ajouter_personne.setter
    def ajouter_personne(self,poids_personnes):
        super(Vehicule).__poids+=poids_personnes  # super(Vehicule) pour spécifier le type de parent concerné. Car, ici, il y a deux Parents: Le 1er est Quatre_roues et le 2ème : Vehicule