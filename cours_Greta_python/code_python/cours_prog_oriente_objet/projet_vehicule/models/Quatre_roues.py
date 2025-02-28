from cours_Greta_python.code_python.cours_prog_oriente_objet.projet_vehicule.models.Vehicule import Vehicule

class Qautre_roues(Vehicule):
    def __init__(self,nombre_porte,couleur,poids):
        super().__init__(couleur,poids)
        self.__nombre_porte = nombre_porte

    def repeindrre(self,couleur):
        super().__couleur = couleur

    def afficher_nombre_porte(self):
        print(f"Le nombre de portes est : {self.__nombre_porte}")