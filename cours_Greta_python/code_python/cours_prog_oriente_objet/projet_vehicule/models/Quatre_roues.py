from cours_Greta_python.code_python.cours_prog_oriente_objet.projet_vehicule.models.Vehicule import Vehicule

class Quatre_roues(Vehicule):
    def __init__(self,couleur,poids,nombre_porte):
        super().__init__(couleur, poids)
        self.__nombre_porte = nombre_porte

    @property
    def repeindre(self):
        return super().__couleur

    @repeindre.setter
    def repeindre(self,couleur):
        super().__couleur = couleur

    @property
    def afficher_nombre_porte(self):
        return f"Le nombre de portes est : {self.__nombre_porte}"

    @property
    def ajouter_personne(self,):
        return super().__poids

    @ajouter_personne.setter
    def ajouter_personne(self,poids_personnes):
        super().__poids +=poids_personnes