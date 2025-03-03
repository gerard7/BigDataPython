class Adresse:
    def __init__(self,rue,ville,code_postal, pays="France"):
        self.rue= rue
        self.ville = ville
        self.code_postal = code_postal
        self.pays = pays

    def afficher_adresse(self):
        return f"{self.rue},{self.code_postal},{self.ville},{self.pays}"

class Employe:
    def __int__(self,nom:str,poste:str,salaire:float,adresse: Adresse):
        self.nom = nom # Ce type d'écriture est surtout pour l'auto complétion. Cela ne renforce pas le type
        self.poste = poste
        self.salaire = salaire
        self.adresse = adresse # Composition: adresse est un objet Adresse

    def afficher_info(self):
        return f"{self.nom} est à l'adresse : {self.adresse.afficher_adresse()}"

# Pour tester
adr1 = Adresse(10,"Paris","75014","Belgique")

emp1 = Employe("Armand","Responsable Energie",43700.5,adr1)

print(emp1.afficher_info())
# Composition forte. Car, si un employé disparaît, alors, son adresse disparaît aussi.

# AGRÉGATION : C'est une relation faible.
class Entreprise:
    def __int__(self,nom):
        self.nom = nom
        self.employes = []

    def ajouter_employe(self,employe:Employe):
        self.employes.append(employe)

    def afficher_employes(self):
        print(f"{self.nom}\n")
        for emp in self.employes:
            print(emp.afficher_infos())


entreprise = Entreprise("Tech")
entreprise.ajouter_employe(emp1)

