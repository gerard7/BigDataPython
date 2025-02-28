from cours_Greta_python.code_python.cours_prog_oriente_objet.projet_vehicule.models.Quatre_roues import Qautre_roues


class Voiture(Qautre_roues):
    def __init__(self,nombre_pneu_neige,nombre_porte,couleur,poids):
        super().__init__(nombre_porte,couleur,poids)
        self.__nombre_pneu_neige = nombre_pneu_neige

    def ajouter_pneu_neige(self,nombre):
        self.__nombre_pneu_neige+=nombre

    def afficher_nombre_pneus_neige(self):
        print(f"La voiture possède {self.__nombre_pneu_neige} pneux neige")

    def enlever_pneu_neige(self,nombre):
        self.__nombre_pneu_neige-=nombre

