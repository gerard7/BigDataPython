USE northwind;
/* select NOM_PRODUIT,SOCIETE , c.CODE_CATEGORIE AS 'Code Categorie' from produits p left join fournisseurs f on p.NO_FOURNISSEUR = f.NO_FOURNISSEUR*/
/* left join categories c on c.CODE_CATEGORIE in ('1','4','7'); */
SELECT nom_produit, societe ,code_categorie
from produits prod , fournisseurs four, categories cat
where cat.code_categorie in (1,4,7);