# LES META CLASSE

class Voiture:
    pass

print(type(Voiture))

"""
Une métaclasse est une classe qui définit comment les classes sont crées
En Python,
- Un objet est uine instance d'une classe
- Une classe est une instance d'une métaclasse (par défaut , c'esst "type")
Objet --> Classe --> Métaclasse

Les Métaclasses permettent de modifier le comportement des classes au moment de leur création
Cas concret :
-  Ajout automatique de méthodes,
-  Valider les attributs
-  Appliquer des règles métier spécifiques
"""

class MetaValidation(type):
    # Elle est automatiquement appelée avant la création de la classe
    # name : c'est le nom de la classe
    # bases : ( ce sont les classes parentes )
    # dct ( dictionnaire contenant les attributs et méthodes
    def __new__(cls, name,bases,dct):
        if "champs_obligatoires" not in dct:
            raise TypeError(f"La classe {name} doit définir :  champs_obligatoires")
        print("nom = ",name,".bases =",bases,".dct =",dct)

        return super().__new__(cls, name, bases,dct) # Par défaut, les paramètres sont *args et **kwargs qui prennent tous les arguments
        # super() , fait bien sûr référence à type. Puisque MetaValidation hérite de type

class Produit(metaclass=MetaValidation): # Exactement cette écriture: metaclass=
    # Notez que si Produit doit hériter d'une ou plusieurs classes, elles doivent être définies avant la définition de metaclass=MetaValidation
    # Notez que dct (MetaValidation) collecte toutes les informations ici
    # champs_obligatoires = ["nom","prix"] peut être ici ou ailleurs dans Produit. Mais, cela doit y être
    # Sans :champs_obligatoires = ["nom","prix"], cela génère une erreur
    champs_obligatoires = ["nom","prix"]
    def __int__(self,nom,prix):
        self.nom =nom
        self.prix = prix

    def afficher_infos(self):
        return f"Produits : {self.nom}, Prix : {self.prix}"