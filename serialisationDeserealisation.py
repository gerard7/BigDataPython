# -------------- SERIALISATION ET DÉSÉRIALISATION

# Sérialisation = C'est convertir un objet python en un format de stockage ou transmissible
# Par exemple : JSON, xml, fichier, binaire ( via pickle) <<<<<<

# Désérialisation = Reconvertir ces données en un objet python utilisable

# Commençons par JSON
import json
# dict vers json : sérialisation
my_dict={'name':'Sam', 'city':'Paris','age':18}
json_data = json.dumps(my_dict)
print('Valeur Json de my_dict =',my_dict)
# json vers dict : désérialisation
restored_data = json.loads(json_data)
print('Valeur désérialisée de json_data =',restored_data)

json_str='''{'name':'Sam', 'city':'Paris','age':18}'''
# !!! Attention : loads (avec s) c'est pour une chaine Json
# load est utilisé pour json dans un fichier


