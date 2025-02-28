from cours_Greta_python.code_python.cours_prog_oriente_objet.projet_vehicule.models.Vehicule import Vehicule

class Deux_roues(Vehicule):
    def __init__(self,cylindre,couleur,poids):
        super().__init__(couleur,poids)
        self.__cylindre = cylindre
        self.__poids = poids
        self.__couleur =couleur


    def mettre_essence(self,nombre_litre):
        self.__poids+=nombre_litre


    def afficher_cylindre(self):
        print(f"La moto a une puissance de {self.__cylindre} cylindres")

