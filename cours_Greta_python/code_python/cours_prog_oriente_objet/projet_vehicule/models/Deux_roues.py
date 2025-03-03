from cours_Greta_python.code_python.cours_prog_oriente_objet.projet_vehicule.models.Vehicule import Vehicule

class Deux_roues(Vehicule):
    def __init__(self,couleur,poids,cylindre):
        super().__init__(couleur,poids)
        self.__cylindre = cylindre

    @property
    def mettre_essence_deux_roues(self,nombre_litre):
        return super().__poids

    @mettre_essence_deux_roues.setter
    def mettre_essence_deux_roues(self,nombre_litre):
        self.__poids+=nombre_litre

    @property
    def ajouter_personne(self):
        return super().__poids

    @ajouter_personne.setter
    def ajouter_personne(self,poids_personne):
        super().__poids+=poids_personne + 2 #  +2 représente le poids du casque

    @property
    def afficher_poids_deux_roues(self):
        super().afficher_poids_vehicule()

    @property
    def afficher_cylindre(self):
        print(f"La moto a une puissance de {self.__cylindre} cylindres")



