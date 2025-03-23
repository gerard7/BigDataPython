from collections import namedtuple

Param_Data_Base  = namedtuple("Param_Data_Base",["host","user",
                                                 "database","mot_passe","table1","table2"])

param = Param_Data_Base("127.0.0.1","armand","anaconda","varmSo7G_","Clients","Jeu_de_donnees")

