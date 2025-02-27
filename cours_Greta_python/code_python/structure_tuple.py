# Le tuple est imuable. On ne peut pas le modifier.
# Premier intéret : immuabilité :
# Les tuples sont plus rapides et plus légers que les listes
# Ils consomment moins de mémoire
# Création : Complexite : O(N). Car , les elements sont copiés
# un par un.
# si on ecrit t=(0), python va considérer que c'est un entier.
# En revanche, un tuple avec un seul élement peut plutot s'écrire:
# t=(10,)

my_tuple = (10,20,30,50)
# accès aux elements du tuple : O(1)
print(my_tuple[2])

#Slicing sur les tuples/ Cela a une complexité de O(k)
# cela dépend de la taille du slicing.
print(my_tuple[1:4]) # le découpage va de l'élément à la position 1 jusqu'à l'élément à la position 4-1=2

#Unpacking (deballage) cela marche avec les listes , les dictionaires , bref, tous les objets itérables.
x,y,z,w = my_tuple
print('y =',y)
for val in my_tuple:
    print(f"valeur = {val}")
    print(f"Taille du tuple = {len(my_tuple)}" )

# Les tests d'appartenance d'un élement dans le tuple est en O(N)

# On peut réaliser des conversions de tuple en liste

my_liste_from_tuple = list(my_tuple)
print(type(my_liste_from_tuple))
# convertir une liste en tuple:

new_tuple =tuple(my_liste_from_tuple)
print(type(new_tuple))

# Tuple imbriqué
imbrique_tuple =((2,45,23),(87,-96,-2,16),(63,85,74,9658))
print(imbrique_tuple[2][3]) # Donne 9658 . imbrique_tuple[1] = (87,-96,-2,16) et imbrique_tuple[1][2]=-96
t1 =(1,3)
t2=( -1,-2,-5)
t3 = t1+t2
print(f"t3 ={t3}")
t4 = t1*4
print(f"t1 x 4 = {t4}")

def get_user_info(user_id):
    name ='Alice'
    age =28
    is_active = True
    return name, age, is_active,user_id

print(get_user_info(125))

mettre_au_carre = tuple(x ** 2 for x in my_tuple if 22 < x < 60)
print(f"my_tuple = {my_tuple}")
print(mettre_au_carre)

autre_tuple = tuple((index,value) for index, value in enumerate(my_tuple))
print(autre_tuple)