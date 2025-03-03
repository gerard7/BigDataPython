from cours_Greta_python.code_python.cours_prog_oriente_objet.projet_vehicule.models.Camion import Camion
from cours_Greta_python.code_python.cours_prog_oriente_objet.projet_vehicule.models.Deux_roues import Deux_roues
from cours_Greta_python.code_python.cours_prog_oriente_objet.projet_vehicule.models.Quatre_roues import Quatre_roues
from cours_Greta_python.code_python.cours_prog_oriente_objet.projet_vehicule.models.Vehicule import Vehicule
from cours_Greta_python.code_python.cours_prog_oriente_objet.projet_vehicule.models.Voiture import Voiture

print("\n-------------- EXERCICE 2 ----------------\n")
vehic =Vehicule("noir","1500")
print(vehic.rouler())
poids_pers = 70
print(f"Ajout d'une personne de {poids_pers} kg")
vehic.ajouter_personne(poids_pers)
vehic.afficher_poids_vehicule()


print("\n************ EXERCICE 3 **************\n")
# nouv_vehic =Vehicule("vert",1400)
# poids_double = 65*2
# nouv_vehic.ajouter_personne(poids_double)
# nouv_vehic.afficher_couleur_vehicule()
# nouv_vehic.afficher_poids_vehicule()
# nouv_vehic.repeindre("rouge")
# nouv_vehic.ajouter_pneu_neige(2)
# nouv_vehic.afficher_couleur_vehicule()
# nouv_vehic.afficher_nombre_pneus_neige()
# print("********* DEUX ROUES *********")
# moto = Deux_roues(24,"noir",120)
# print("Poids moto avant :\n")
# moto.afficher_poids_deux_roues()
# moto.ajouter_personne(80)
# moto.mettre_essence_deux_roues(20)
# moto.afficher_couleur_vehicule()
# print("Poids moto après :\n")
# moto.afficher_poids_deux_roues()

camion = Camion("bleu",10000,2,10)
# camion.ajouter_remorque(5)
# camion.ajouter_personne(80)
# camion.afficher_couleur_vehicule()
# camion.afficher_poids_vehicule()
# camion.afficher_longueur_camion()
# camion.afficher_nombre_porte()

# print("\n---------- EXERCICE 4 -------------------\n")
# quatre_rou  = Qautre_roues(2,"bleu",1000)
# quatre_rou.ajouter_personne(80)
# quatre_rou.afficher_poids_vehicule()

