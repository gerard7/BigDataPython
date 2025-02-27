USE northwind;
select NOM, PRENOM, FONCTION , REND_COMPTE from employes where REND_COMPTE is NULL;