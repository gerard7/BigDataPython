from cours_Greta_python.code_python.TosaPratique import Vehicule
from cours_Greta_python.code_python.cours_prog_oriente_objet.projet_vehicule.models.Quatre_roues import Quatre_roues, \
    Quatre_roues


class Voiture(Quatre_roues):
    def __init__(self,couleur,poids,nombre_porte,nombre_pneu_neige):
        super(Vehicule).__init__(couleur, poids)
        super(Quatre_roues).__init__(nombre_porte)
        self.__nombre_pneu_neige = nombre_pneu_neige


    @property
    def ajouter_pneu_neige(self):
        return f"Le nombre de pneus de neigne = {self.__nombre_pneu_neige}"

    @ajouter_pneu_neige.setter
    def ajouter_pneu_neige(self,nombre):
        self.__nombre_pneu_neige+=nombre

    @property
    def afficher_nombre_pneus_neige(self):
        return f"La voiture possède {self.__nombre_pneu_neige} pneux neige"

    @property
    def enlever_pneu_neige(self):
        return f"La voiture possède maintenant {self.__nombre_pneu_neige} pneus neige"

    @enlever_pneu_neige.setter
    def enlever_pneu_neige(self,nombre):
        self.__nombre_pneu_neige-=nombre

    @property
    def ajouter_personne(self):
        return f"Le poids actuel du véhicule (après ajout de personne) = {super(Vehicule).__poids}"


    @ajouter_personne.setter
    def ajouter_personne(self,poids_personnes):
        super(Vehicule).__poids+=poids_personnes