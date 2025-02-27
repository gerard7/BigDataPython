USE northwind;
select NOM, VILLE, PAYS , FAX from clients where FAX in ("","Null");