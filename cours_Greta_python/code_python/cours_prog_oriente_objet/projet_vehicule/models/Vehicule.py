class Vehicule:
    def __init__(self,couleur,poids):
        self.__couleur =couleur
        self.__poids = float(poids)
        self.__pneus_neige =0

    def rouler(self):
        print(f"Le véhicule roule")

    def ajouter_pneu_neige(self,nombre_pneu):
        self.__pneus_neige+=nombre_pneu
    def repeindre(self,couleur):
        self.__couleur = couleur

    def afficher_nombre_pneus_neige(self):
        print(f"Le véhicule possède {self.__pneus_neige} pneus neige")

    def ajouter_personne(self,poids_personnes):
        self.__poids+=float(poids_personnes)

    def afficher_poids_vehicule(self):
        print(f"Le poids du véhicule est {self.__poids} kg")

    def afficher_couleur_vehicule(self):
        print(f"Le véhicule a une couleur {self.__couleur}")