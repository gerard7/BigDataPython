USE northwind;
/* select NOM, PRENOM, FONCTION,SALAIRE from employes where SALAIRE >2500 and SALAIRE <3500; */
 select NOM, PRENOM, FONCTION,SALAIRE from employes where SALAIRE between 2500 and 3500;