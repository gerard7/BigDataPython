USE northwind;
select NOM, PRENOM, FONCTION,REND_COMPTE AS "Dirigé par" from employes where REND_COMPTE="2";