from cours_Greta_python.code_python.cours_prog_oriente_objet.projet_vehicule.models.Quatre_roues import Qautre_roues

class Camion(Qautre_roues):
    def __init__(self,longueur,nombre_porte,couleur,poids):
        super().__init__(nombre_porte, couleur, poids)
        self.__longueur = longueur

    def ajouter_remorque(self,longueur_remorque):
        self.__longueur+=longueur_remorque

    # def afficher_nombre_portes(self):
    #     super().afficher_nombre_porte()

    def afficher_longueur_camion(self):
        print(f"Le camion a une longueur de : {self.__longueur} mètres")
