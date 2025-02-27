-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema northwind
--
DROP DATABASE IF EXISTS northwind;
CREATE DATABASE IF NOT EXISTS northwind;
USE northwind;

--
-- Table structure for table `northwind`.`categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `CODE_CATEGORIE` decimal(6,0) NOT NULL,
  `NOM_CATEGORIE` varchar(25) character set latin1 NOT NULL,
  `DESCRIPTION` varchar(100) character set latin1 NOT NULL,
  PRIMARY KEY  (`CODE_CATEGORIE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin COMMENT='InnoDB free: 11264 kB';

--
-- Dumping data for table `northwind`.`categories`
--

/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`CODE_CATEGORIE`,`NOM_CATEGORIE`,`DESCRIPTION`) VALUES 
 ('1','Boissons','Boissons, cafés, thés, bières'),
 ('2','Condiments','Sauces, assaisonnements et épices'),
 ('3','Desserts','Desserts et friandises'),
 ('4','Produits laitiers','Fromages'),
 ('5','Pâtes et céréales','Pains, biscuits, pâtes et céréales'),
 ('6','Viandes','Viandes préparées'),
 ('7','Produits secs','Fruits secs, raisins, autres'),
 ('8','Poissons et fruits de mer','Poissons, fruits de mer, escargots');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


--
-- Table structure for table `northwind`.`clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients` (
  `CODE_CLIENT` char(5) NOT NULL,
  `SOCIETE` varchar(40) NOT NULL,
  `ADRESSE` varchar(60) NOT NULL,
  `VILLE` varchar(15) NOT NULL,
  `CODE_POSTAL` varchar(10) NOT NULL,
  `PAYS` varchar(15) NOT NULL,
  `TELEPHONE` varchar(24) NOT NULL,
  `FAX` varchar(24) default NULL,
  PRIMARY KEY  (`CODE_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `northwind`.`clients`
--

/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` (`CODE_CLIENT`,`SOCIETE`,`ADRESSE`,`VILLE`,`CODE_POSTAL`,`PAYS`,`TELEPHONE`,`FAX`) VALUES 
 ('ALFKI','Alfreds Futterkiste','Obere Str. 57','Berlin','12209','Allemagne','030-0074321','030-0076545'),
 ('ANATR','Ana Trujillo Emparedados y helados','Avda. de la Constitución 2222','México D.F.','05021','Mexique','(5) 555-4729','(5) 555-3745'),
 ('ANTON','Antonio Moreno Taquería','Mataderos  2312','México D.F.','05023','Mexique','(5) 555-3932',NULL),
 ('AROUT','Around the Horn','120 Hanover Sq.','London','WA1 1DP','Royaume-Uni','(71) 555-7788','(71) 555-6750'),
 ('BERGS','Berglunds snabbköp','Berguvsvägen  8','Luleå','S-958 22','Suède','0921-12 34 65','0921-12 34 67'),
 ('BLAUS','Blauer See Delikatessen','Forsterstr. 57','Mannheim','68306','Allemagne','0621-08460','0621-08924'),
 ('BLONP','Blondel père et fils','24, place Kléber','Strasbourg','67000','France','03.88.60.15.31','03.88.60.15.32'),
 ('BOLID','Bólido Comidas preparadas','C/ Araquil, 67','Madrid','28023','Espagne','(91) 555 22 82','(91) 555 91 99'),
 ('BONAP','Bon app\'','12, rue des Bouchers','Marseille','13008','France','04.91.24.45.40','04.91.24.45.41');
INSERT INTO `clients` (`CODE_CLIENT`,`SOCIETE`,`ADRESSE`,`VILLE`,`CODE_POSTAL`,`PAYS`,`TELEPHONE`,`FAX`) VALUES 
 ('BOTTM','Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','T2F 8M4','Canada','(604) 555-4729','(604) 555-3745'),
 ('BSBEV','B\'s Beverages','Fauntleroy Circus','London','EC2 5NT','Royaume-Uni','(71) 555-1212',NULL),
 ('CACTU','Cactus Comidas para llevar','Cerrito 333','Buenos Aires','1010','Argentine','(1) 135-5555','(1) 135-4892'),
 ('CENTC','Centro comercial Moctezuma','Sierras de Granada 9993','México D.F.','05022','Mexique','(5) 555-3392','(5) 555-7293'),
 ('CHOPS','Chop-suey Chinese','Hauptstr. 29','Bern','3012','Suisse','0452-076545',NULL),
 ('COMMI','Comércio Mineiro','Av. dos Lusíadas, 23','São Paulo','05432-043','Brésil','(11) 555-7647',NULL),
 ('CONSH','Consolidated Holdings','Berkeley Gardens12  Brewery ','London','WX1 6LT','Royaume-Uni','(71) 555-2282','(71) 555-9199'),
 ('DRACD','Drachenblut Delikatessen','Walserweg 21','Aachen','52066','Allemagne','0241-039123','0241-059428'),
 ('DUMON','Du monde entier','67, rue des Cinquante Otages','Nantes','44000','France','02.40.67.88.88','02.40.67.89.89');
INSERT INTO `clients` (`CODE_CLIENT`,`SOCIETE`,`ADRESSE`,`VILLE`,`CODE_POSTAL`,`PAYS`,`TELEPHONE`,`FAX`) VALUES 
 ('EASTC','Eastern Connection','35 King George','London','WX3 6FW','Royaume-Uni','(71) 555-0297','(71) 555-3373'),
 ('ERNSH','Ernst Handel','Kirchgasse 6','Graz','8010','Autriche','7675-3425','7675-3426'),
 ('FAMIA','Familia Arquibaldo','Rua Orós, 92','São Paulo','05442-030','Brésil','(11) 555-9857',NULL),
 ('FISSA','FISSA Fabrica Inter. Salchichas S.A.','C/ Moralzarzal, 86','Madrid','28034','Espagne','(91) 555 94 44','(91) 555 55 93'),
 ('FOLIG','Folies gourmandes','184, chaussée de Tournai','Lille','59000','France','03.20.16.10.16','03.20.16.10.17'),
 ('FOLKO','Folk och fä HB','Åkergatan 24','Bräcke','S-844 67','Suède','0695-34 67 21',NULL),
 ('FRANK','Frankenversand','Berliner Platz 43','München','80805','Allemagne','089-0877310','089-0877451'),
 ('FRANR','France restauration','54, rue Royale','Nantes','44000','France','02.40.32.21.21','02.40.32.21.20'),
 ('FRANS','Franchi S.p.A.','Via Monte Bianco 34','Torino','10100','Italie','011-4988260','011-4988261'),
 ('FURIB','Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa','1675','Portugal','(1) 354-2534','(1) 354-2535');
INSERT INTO `clients` (`CODE_CLIENT`,`SOCIETE`,`ADRESSE`,`VILLE`,`CODE_POSTAL`,`PAYS`,`TELEPHONE`,`FAX`) VALUES 
 ('GALED','Galería del gastrónomo','Rambla de Cataluña, 23','Barcelona','08022','Espagne','(93) 203 4560','(93) 203 4561'),
 ('GODOS','Godos Cocina Típica','C/ Romero, 33','Sevilla','41101','Espagne','(95) 555 82 82',NULL),
 ('GOURL','Gourmet Lanchonetes','Av. Brasil, 442','Campinas','04876-786','Brésil','(11) 555-9482',NULL),
 ('GREAL','Great Lakes Food Market','2732 Baker Blvd.','Eugene','97403','États-Unis','(503) 555-7555',NULL),
 ('GROSR','GROSELLA-Restaurante','5ª Ave. Los Palos Grandes','Caracas','1081','Venezuela','(2) 283-2951','(2) 283-3397'),
 ('HANAR','Hanari Carnes','Rua do Paço, 67','Rio de Janeiro','05454-876','Brésil','(21) 555-0091','(21) 555-8765'),
 ('HILAA','HILARIÓN-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristóbal','5022','Venezuela','(5) 555-1340','(5) 555-1948'),
 ('HUNGC','Hungry Coyote Import Store','City Center Plaza516 Main St.','Elgin','97827','États-Unis','(503) 555-6874','(503) 555-2376'),
 ('HUNGO','Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','2506','Irlande','2967 542','2967 3333');
INSERT INTO `clients` (`CODE_CLIENT`,`SOCIETE`,`ADRESSE`,`VILLE`,`CODE_POSTAL`,`PAYS`,`TELEPHONE`,`FAX`) VALUES 
 ('ISLAT','Island Trading','Garden HouseCrowther Way','Cowes','PO31 7PJ','Royaume-Uni','(198) 555-8888',NULL),
 ('KOENE','Königlich Essen','Maubelstr. 90','Brandenburg','14776','Allemagne','0555-09876',NULL),
 ('LACOR','La corne d\'abondance','67, avenue de l\'Europe','Versailles','78000','France','01.30.59.84.10','01.30.59.85.11'),
 ('LAMAI','La maison d\'Asie','1 rue Alsace-Lorraine','Toulouse','31000','France','05.61.77.61.10','05.61.77.61.11'),
 ('LAUGB','Laughing Bacchus Wine Cellars','1900 Oak St.','Vancouver','V3F 2K1','Canada','(604) 555-3392','(604) 555-7293'),
 ('LAZYK','Lazy K Kountry Store','12 Orchestra Terrace','Walla Walla','99362','États-Unis','(509) 555-7969','(509) 555-6221'),
 ('LEHMS','Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M. ','60528','Allemagne','069-0245984','069-0245874'),
 ('LETSS','Let\'s Stop N Shop','87 Polk St.Suite 5','San Francisco','94117','États-Unis','(415) 555-5938',NULL),
 ('LILAS','LILA-Supermercado','Carrera 52 con Ave. Bolívar #65-98 Llano Largo','Barquisimeto','3508','Venezuela','(9) 331-6954','(9) 331-7256');
INSERT INTO `clients` (`CODE_CLIENT`,`SOCIETE`,`ADRESSE`,`VILLE`,`CODE_POSTAL`,`PAYS`,`TELEPHONE`,`FAX`) VALUES 
 ('LINOD','LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','4980','Venezuela','(8) 34-56-12','(8) 34-93-93'),
 ('LONEP','Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','97219','États-Unis','(503) 555-9573','(503) 555-9646'),
 ('MAGAA','Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo','24100','Italie','035-640230','035-640231'),
 ('MAISD','Maison Dewey','Rue Joseph-Bens 532','Bruxelles','B-1180','Belgique','(02) 201 24 67','(02) 201 24 68'),
 ('MEREP','Mère Paillarde','43 rue St. Laurent','Montréal','H1J 1C3','Canada','(514) 555-8054','(514) 555-8055'),
 ('MORGK','Morgenstern Gesundkost','Heerstr. 22','Leipzig','04179','Allemagne','0342-023176',NULL),
 ('NORTS','North/South','South House300 Queensbridge','London','SW7 1RZ','Royaume-Uni','(71) 555-7733','(71) 555-2530'),
 ('OCEAN','Océano Atlántico Ltda.','Ing. Gustavo Moncada 8585Piso 20-A','Buenos Aires','1010','Argentine','(1) 135-5333','(1) 135-5535'),
 ('OLDWO','Old World Delicatessen','2743 Bering St.','Anchorage','99508','États-Unis','(907) 555-7584','(907) 555-2880');
INSERT INTO `clients` (`CODE_CLIENT`,`SOCIETE`,`ADRESSE`,`VILLE`,`CODE_POSTAL`,`PAYS`,`TELEPHONE`,`FAX`) VALUES 
 ('OTTIK','Ottilies Käseladen','Mehrheimerstr. 369','Köln','50739','Allemagne','0221-0644327','0221-0765721'),
 ('PARIS','Paris spécialités','265, boulevard Charonne','Paris','75012','France','01.42.34.22.66','01.42.34.22.77'),
 ('PERIC','Pericles Comidas clásicas','Calle Dr. Jorge Cash 321','México D.F.','05033','Mexique','(5) 552-3745','(5) 545-3745'),
 ('PICCO','Piccolo und mehr','Geislweg 14','Salzburg','5020','Autriche','6562-9722','6562-9723'),
 ('PRINI','Princesa Isabel Vinhos','Estrada da saúde n. 58','Lisboa','1756','Portugal','(1) 356-5634',NULL),
 ('QUEDE','Que Delícia','Rua da Panificadora, 12','Rio de Janeiro','02389-673','Brésil','(21) 555-4252','(21) 555-4545'),
 ('QUEEN','Queen Cozinha','Alameda dos Canàrios, 891','São Paulo','05487-020','Brésil','(11) 555-1189',NULL),
 ('QUICK','QUICK-Stop','Taucherstraße 10','Cunewalde','01307','Allemagne','0372-035188',NULL),
 ('RANCH','Rancho grande','Av. del Libertador 900','Buenos Aires','1010','Argentine','(1) 123-5555','(1) 123-5556');
INSERT INTO `clients` (`CODE_CLIENT`,`SOCIETE`,`ADRESSE`,`VILLE`,`CODE_POSTAL`,`PAYS`,`TELEPHONE`,`FAX`) VALUES 
 ('RATTC','Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','87110','États-Unis','(505) 555-5939','(505) 555-3620'),
 ('REGGC','Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia','42100','Italie','0522-556721','0522-556722'),
 ('RICAR','Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','02389-890','Brésil','(21) 555-3412',NULL),
 ('RICSU','Richter Supermarkt','Grenzacherweg 237','Genève','1203','Suisse','0897-034214',NULL),
 ('ROMEY','Romero y tomillo','Gran Vía, 1','Madrid','28001','Espagne','(91) 745 6200','(91) 745 6210'),
 ('SANTG','Santé Gourmet','Erling Skakkes gate 78','Stavern','4110','Norvège','07-98 92 35','07-98 92 47'),
 ('SAVEA','Save-a-lot Markets','187 Suffolk Ln.','Boise','83720','États-Unis','(208) 555-8097',NULL),
 ('SEVES','Seven Seas Imports','90 Wadhurst Rd.','London','OX15 4NB','Royaume-Uni','(71) 555-1717','(71) 555-5646'),
 ('SIMOB','Simons bistro','Vinbæltet 34','København','1734','Danemark','31 12 34 56','31 13 35 57');
INSERT INTO `clients` (`CODE_CLIENT`,`SOCIETE`,`ADRESSE`,`VILLE`,`CODE_POSTAL`,`PAYS`,`TELEPHONE`,`FAX`) VALUES 
 ('SPECD','Spécialités du monde','25, rue Lauriston','Paris','75016','France','01.47.55.60.10','01.47.55.60.20'),
 ('SPLIR','Split Rail Beer  Ale','P.O. Box 555','Lander','82520','États-Unis','(307) 555-4680','(307) 555-6525'),
 ('SUPRD','Suprêmes délices','Boulevard Tirou, 255','Charleroi','B-6000','Belgique','(071) 23 67 22 20','(071) 23 67 22 21'),
 ('THEBI','The Big Cheese','89 Jefferson WaySuite 2','Portland','97201','États-Unis','(503) 555-3612',NULL),
 ('THECR','The Cracker Box','55 Grizzly Peak Rd.','Butte','59801','États-Unis','(406) 555-5834','(406) 555-8083'),
 ('TOMSP','Toms Spezialitäten','Luisenstr. 48','Münster','44087','Allemagne','0251-031259','0251-035695'),
 ('TORTU','Tortuga Restaurante','Avda. Azteca 123','México D.F.','05033','Mexique','(5) 555-2933',NULL),
 ('TRADH','Tradição Hipermercados','Av. Inês de Castro, 414','São Paulo','05634-030','Brésil','(11) 555-2167','(11) 555-2168'),
 ('TRAIH','Trail\'s Head Gourmet Provisioners','722 DaVinci Blvd.','Kirkland','98034','États-Unis','(206) 555-8257','(206) 555-2174');
INSERT INTO `clients` (`CODE_CLIENT`,`SOCIETE`,`ADRESSE`,`VILLE`,`CODE_POSTAL`,`PAYS`,`TELEPHONE`,`FAX`) VALUES 
 ('VAFFE','Vaffeljernet','Smagsløget 45','Århus','8200','Danemark','86 21 32 43','86 22 33 44'),
 ('VICTE','Victuailles en stock','2, rue du Commerce','Lyon','69004','France','04.78.32.54.86','04.78.32.54.87'),
 ('VINET','Vins et alcools Chevalier','59 rue de l\'Abbaye','Reims','51100','France','03.26.47.15.10','03.26.47.15.11'),
 ('WANDK','Die Wandernde Kuh','Adenauerallee 900','Stuttgart','70563','Allemagne','0711-020361','0711-035428'),
 ('WARTH','Wartian Herkku','Torikatu 38','Oulu','90110','Finlande','981-443655','981-443655'),
 ('WELLI','Wellington Importadora','Rua do Mercado, 12','Resende','08737-363','Brésil','(14) 555-8122',NULL),
 ('WHITC','White Clover Markets','305 - 14th Ave. S.Suite 3B','Seattle','98128','États-Unis','(206) 555-4112','(206) 555-4115'),
 ('WILMK','Wilman Kala','Keskuskatu 45','Helsinki','21240','Finlande','90-224 8858','90-224 8858'),
 ('WOLZA','Wolski  Zajazd','ul. Filtrowa 68','Warszawa','01-012','Pologne','(26) 642-7012','(26) 642-7012');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;


--
-- Table structure for table `northwind`.`commandes`
--

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE `commandes` (
  `NO_COMMANDE` decimal(6,0) NOT NULL,
  `CODE_CLIENT` char(5) NOT NULL,
  `NO_EMPLOYE` decimal(6,0) NOT NULL,
  `DATE_COMMANDE` date NOT NULL,
  `DATE_ENVOI` date default NULL,
  `PORT` decimal(8,2) default NULL,
  PRIMARY KEY  (`NO_COMMANDE`),
  KEY `CLIENTS_COMMANDES_FK` (`CODE_CLIENT`),
  KEY `EMPLOYES_COMMANDES_FK` (`NO_EMPLOYE`),
  CONSTRAINT `FK_COMMANDE_CLIENTS` FOREIGN KEY (`CODE_CLIENT`) REFERENCES `clients` (`CODE_CLIENT`),
  CONSTRAINT `FK_COMMANDE_EMPLOYES` FOREIGN KEY (`NO_EMPLOYE`) REFERENCES `employes` (`NO_EMPLOYE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `northwind`.`commandes`
--

/*!40000 ALTER TABLE `commandes` DISABLE KEYS */;
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10248','VINET','5','0000-00-00',NULL,'161.90'),
 ('10249','TOMSP','6','0000-00-00',NULL,'58.05'),
 ('10250','HANAR','4','0000-00-00',NULL,'329.15'),
 ('10251','VICTE','3','0000-00-00',NULL,'206.70'),
 ('10252','SUPRD','4','0000-00-00',NULL,'256.50'),
 ('10253','HANAR','3','0000-00-00',NULL,'290.85'),
 ('10254','CHOPS','5','0000-00-00',NULL,'114.90'),
 ('10255','RICSU','9','0000-00-00',NULL,'741.65'),
 ('10256','WELLI','3','0000-00-00',NULL,'69.85'),
 ('10257','HILAA','4','0000-00-00',NULL,'409.55'),
 ('10258','ERNSH','1','0000-00-00',NULL,'702.55'),
 ('10259','CENTC','4','0000-00-00',NULL,'16.25'),
 ('10260','OTTIK','4','0000-00-00',NULL,'275.45'),
 ('10261','QUEDE','4','0000-00-00',NULL,'15.25'),
 ('10262','RATTC','8','0000-00-00',NULL,'241.45'),
 ('10263','ERNSH','9','0000-00-00',NULL,'730.30'),
 ('10264','FOLKO','6','0000-00-00',NULL,'18.35'),
 ('10265','BLONP','2','0000-00-00',NULL,'276.40'),
 ('10266','WARTH','3','0000-00-00',NULL,'128.65');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10267','FRANK','4','0000-00-00',NULL,'1042.90'),
 ('10268','GROSR','8','0000-00-00',NULL,'331.45'),
 ('10269','WHITC','5','0000-00-00',NULL,'22.80'),
 ('10270','WARTH','1','0000-00-00',NULL,'682.70'),
 ('10271','SPLIR','6','0000-00-00',NULL,'22.70'),
 ('10272','RATTC','6','0000-00-00',NULL,'490.15'),
 ('10273','QUICK','3','0000-00-00',NULL,'380.35'),
 ('10274','VINET','6','0000-00-00',NULL,'30.05'),
 ('10275','MAGAA','1','0000-00-00',NULL,'134.65'),
 ('10276','TORTU','8','0000-00-00',NULL,'69.20'),
 ('10277','MORGK','2','0000-00-00',NULL,'628.85'),
 ('10278','BERGS','8','0000-00-00',NULL,'463.45'),
 ('10279','LEHMS','8','0000-00-00',NULL,'129.15'),
 ('10280','BERGS','2','0000-00-00',NULL,'44.90'),
 ('10281','ROMEY','4','0000-00-00',NULL,'14.70'),
 ('10282','ROMEY','4','0000-00-00',NULL,'63.45'),
 ('10283','LILAS','3','0000-00-00',NULL,'424.05'),
 ('10284','LEHMS','4','0000-00-00',NULL,'382.80'),
 ('10285','QUICK','1','0000-00-00',NULL,'384.15');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10286','QUICK','8','0000-00-00',NULL,'1146.20'),
 ('10287','RICAR','8','0000-00-00',NULL,'63.80'),
 ('10288','REGGC','4','0000-00-00',NULL,'37.25'),
 ('10289','BSBEV','7','0000-00-00',NULL,'113.85'),
 ('10290','COMMI','8','0000-00-00',NULL,'398.50'),
 ('10291','QUEDE','6','0000-00-00',NULL,'0.32'),
 ('10292','TRADH','1','0000-00-00',NULL,'6.75'),
 ('10293','TORTU','1','0000-00-00',NULL,'105.90'),
 ('10294','RATTC','4','0000-00-00',NULL,'736.30'),
 ('10295','VINET','2','0000-00-00',NULL,'5.75'),
 ('10296','LILAS','6','0000-00-00',NULL,'0.60'),
 ('10297','BLONP','5','0000-00-00',NULL,'28.70'),
 ('10298','HUNGO','6','0000-00-00',NULL,'841.10'),
 ('10299','RICAR','4','0000-00-00',NULL,'148.80'),
 ('10300','MAGAA','2','0000-00-00',NULL,'88.40'),
 ('10301','WANDK','8','0000-00-00',NULL,'225.40'),
 ('10302','SUPRD','4','0000-00-00',NULL,'31.35'),
 ('10303','GODOS','7','0000-00-00',NULL,'539.15'),
 ('10304','TORTU','1','0000-00-00',NULL,'318.95');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10305','OLDWO','8','0000-00-00',NULL,'1288.10'),
 ('10306','ROMEY','1','0000-00-00',NULL,'37.80'),
 ('10307','LONEP','2','0000-00-00',NULL,'2.80'),
 ('10308','ANATR','7','0000-00-00',NULL,'8.05'),
 ('10309','HUNGO','3','0000-00-00',NULL,'236.50'),
 ('10310','THEBI','8','0000-00-00',NULL,'87.60'),
 ('10311','DUMON','1','0000-00-00',NULL,'123.45'),
 ('10312','WANDK','2','0000-00-00',NULL,'201.30'),
 ('10313','QUICK','2','0000-00-00',NULL,'9.80'),
 ('10314','RATTC','1','0000-00-00',NULL,'370.80'),
 ('10315','ISLAT','4','0000-00-00',NULL,'208.80'),
 ('10316','RATTC','1','0000-00-00',NULL,'750.75'),
 ('10317','LONEP','6','0000-00-00',NULL,'63.45'),
 ('10318','ISLAT','8','0000-00-00',NULL,'23.65'),
 ('10319','TORTU','7','0000-00-00',NULL,'322.50'),
 ('10320','WARTH','5','0000-00-00',NULL,'172.85'),
 ('10321','ISLAT','3','0000-00-00',NULL,'17.15'),
 ('10322','PERIC','7','0000-00-00',NULL,'0.02'),
 ('10323','KOENE','4','0000-00-00',NULL,'24.40');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10324','SAVEA','9','0000-00-00',NULL,'1071.35'),
 ('10325','KOENE','1','0000-00-00',NULL,'324.30'),
 ('10326','BOLID','4','0000-00-00',NULL,'389.60'),
 ('10327','FOLKO','2','0000-00-00',NULL,'316.80'),
 ('10328','FURIB','4','0000-00-00',NULL,'435.15'),
 ('10329','SPLIR','4','0000-00-00',NULL,'958.35'),
 ('10330','LILAS','3','0000-00-00',NULL,'63.75'),
 ('10331','BONAP','9','0000-00-00',NULL,'50.95'),
 ('10332','MEREP','3','0000-00-00',NULL,'264.20'),
 ('10333','WARTH','5','0000-00-00',NULL,'2.95'),
 ('10334','VICTE','8','0000-00-00',NULL,'42.80'),
 ('10335','HUNGO','7','0000-00-00',NULL,'210.55'),
 ('10336','PRINI','7','0000-00-00',NULL,'77.55'),
 ('10337','FRANK','4','0000-00-00',NULL,'541.30'),
 ('10338','OLDWO','4','0000-00-00',NULL,'421.05'),
 ('10339','MEREP','2','0000-00-00',NULL,'78.30'),
 ('10340','BONAP','1','0000-00-00',NULL,'831.55'),
 ('10341','SIMOB','7','0000-00-00',NULL,'133.90'),
 ('10342','FRANK','4','0000-00-00',NULL,'274.15');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10343','LEHMS','4','0000-00-00',NULL,'551.85'),
 ('10344','WHITC','4','0000-00-00',NULL,'116.45'),
 ('10345','QUICK','2','0000-00-00',NULL,'1245.30'),
 ('10346','RATTC','3','0000-00-00',NULL,'710.40'),
 ('10347','FAMIA','4','0000-00-00',NULL,'15.50'),
 ('10348','WANDK','4','0000-00-00',NULL,'3.90'),
 ('10349','SPLIR','7','0000-00-00',NULL,'43.15'),
 ('10350','LAMAI','6','0000-00-00',NULL,'320.95'),
 ('10351','ERNSH','1','0000-00-00',NULL,'811.65'),
 ('10352','FURIB','3','0000-00-00',NULL,'6.50'),
 ('10353','PICCO','7','0000-00-00',NULL,'1803.15'),
 ('10354','PERIC','8','0000-00-00',NULL,'2.69'),
 ('10355','AROUT','6','0000-00-00',NULL,'209.75'),
 ('10356','WANDK','6','0000-00-00',NULL,'183.55'),
 ('10357','LILAS','1','0000-00-00',NULL,'174.40'),
 ('10358','LAMAI','5','0000-00-00',NULL,'98.20'),
 ('10359','SEVES','5','0000-00-00',NULL,'1442.15'),
 ('10360','BLONP','4','0000-00-00',NULL,'658.50'),
 ('10361','QUICK','1','0000-00-00',NULL,'915.85');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10362','BONAP','3','0000-00-00',NULL,'480.20'),
 ('10363','DRACD','4','0000-00-00',NULL,'152.70'),
 ('10364','EASTC','1','0000-00-00',NULL,'359.85'),
 ('10365','ANTON','3','0000-00-00',NULL,'1.10'),
 ('10366','GALED','8','0000-00-00',NULL,'50.70'),
 ('10367','VAFFE','7','0000-00-00',NULL,'67.75'),
 ('10368','ERNSH','2','0000-00-00',NULL,'509.75'),
 ('10369','SPLIR','8','0000-00-00',NULL,'978.40'),
 ('10370','CHOPS','6','0000-00-00',NULL,'5.85'),
 ('10371','LAMAI','1','0000-00-00',NULL,'2.25'),
 ('10372','QUEEN','5','0000-00-00',NULL,'4453.90'),
 ('10373','HUNGO','4','0000-00-00',NULL,'620.60'),
 ('10374','WOLZA','1','0000-00-00',NULL,'19.70'),
 ('10375','HUNGC','3','0000-00-00',NULL,'100.60'),
 ('10376','MEREP','1','0000-00-00',NULL,'101.95'),
 ('10377','SEVES','1','0000-00-00',NULL,'111.05'),
 ('10378','FOLKO','5','0000-00-00',NULL,'27.20'),
 ('10379','QUEDE','2','0000-00-00',NULL,'225.15'),
 ('10380','HUNGO','8','0000-00-00',NULL,'175.15');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10381','LILAS','3','0000-00-00',NULL,'39.95'),
 ('10382','ERNSH','4','0000-00-00',NULL,'473.85'),
 ('10383','AROUT','8','0000-00-00',NULL,'171.20'),
 ('10384','BERGS','3','0000-00-00',NULL,'843.20'),
 ('10385','SPLIR','1','0000-00-00',NULL,'154.80'),
 ('10386','FAMIA','9','0000-00-00',NULL,'69.95'),
 ('10387','SANTG','1','0000-00-00',NULL,'468.15'),
 ('10388','SEVES','2','0000-00-00',NULL,'174.30'),
 ('10389','BOTTM','4','0000-00-00',NULL,'237.10'),
 ('10390','ERNSH','6','0000-00-00',NULL,'631.90'),
 ('10391','DRACD','3','0000-00-00',NULL,'27.25'),
 ('10392','PICCO','2','0000-00-00',NULL,'612.30'),
 ('10393','SAVEA','1','0000-00-00',NULL,'632.80'),
 ('10394','HUNGC','1','0000-00-00',NULL,'151.70'),
 ('10395','HILAA','6','0000-00-00',NULL,'922.05'),
 ('10396','FRANK','1','0000-00-00',NULL,'676.75'),
 ('10397','PRINI','5','0000-00-00',NULL,'301.30'),
 ('10398','SAVEA','2','0000-00-00',NULL,'445.80'),
 ('10399','VAFFE','8','0000-00-00',NULL,'136.80');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10400','EASTC','1','0000-00-00',NULL,'419.65'),
 ('10401','RATTC','1','0000-00-00',NULL,'62.55'),
 ('10402','ERNSH','8','0000-00-00',NULL,'339.40'),
 ('10403','ERNSH','4','0000-00-00',NULL,'368.95'),
 ('10404','MAGAA','2','0000-00-00',NULL,'779.85'),
 ('10405','LINOD','1','0000-00-00',NULL,'174.10'),
 ('10406','QUEEN','7','0000-00-00',NULL,'540.20'),
 ('10407','OTTIK','2','0000-00-00',NULL,'457.40'),
 ('10408','FOLIG','8','0000-00-00',NULL,'56.30'),
 ('10409','OCEAN','3','0000-00-00',NULL,'149.15'),
 ('10410','BOTTM','3','0000-00-00',NULL,'0.12'),
 ('10411','BOTTM','9','0000-00-00',NULL,'118.25'),
 ('10412','WARTH','8','0000-00-00',NULL,'18.85'),
 ('10413','LAMAI','3','0000-00-00',NULL,'478.30'),
 ('10414','FAMIA','2','0000-00-00',NULL,'107.40'),
 ('10415','HUNGC','3','0000-00-00',NULL,'0.01'),
 ('10416','WARTH','8','0000-00-00',NULL,'113.60'),
 ('10417','SIMOB','4','0000-00-00',NULL,'351.45'),
 ('10418','QUICK','4','0000-00-00',NULL,'87.75');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10419','RICSU','4','0000-00-00',NULL,'686.75'),
 ('10420','WELLI','3','0000-00-00',NULL,'220.60'),
 ('10421','QUEDE','8','0000-00-00',NULL,'496.15'),
 ('10422','FRANS','2','0000-00-00',NULL,'15.10'),
 ('10423','GOURL','6','0000-00-00',NULL,'122.50'),
 ('10424','MEREP','7','0000-00-00',NULL,'1853.05'),
 ('10425','LAMAI','6','0000-00-00',NULL,'39.65'),
 ('10426','GALED','4','0000-00-00',NULL,'93.45'),
 ('10427','PICCO','4','0000-00-00',NULL,'156.45'),
 ('10428','REGGC','7','0000-00-00',NULL,'55.45'),
 ('10429','HUNGO','3','0000-00-00',NULL,'283.15'),
 ('10430','ERNSH','4','0000-00-00',NULL,'2293.90'),
 ('10431','BOTTM','4','0000-00-00',NULL,'220.85'),
 ('10432','SPLIR','3','0000-00-00',NULL,'21.70'),
 ('10433','PRINI','3','0000-00-00',NULL,'369.15'),
 ('10434','FOLKO','3','0000-00-00',NULL,'89.60'),
 ('10435','CONSH','8','0000-00-00',NULL,'46.05'),
 ('10436','BLONP','3','0000-00-00',NULL,'783.30'),
 ('10437','WARTH','8','0000-00-00',NULL,'99.85');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10438','TOMSP','3','0000-00-00',NULL,'41.20'),
 ('10439','MEREP','6','0000-00-00',NULL,'20.35'),
 ('10440','SAVEA','4','0000-00-00',NULL,'432.65'),
 ('10441','OLDWO','3','0000-00-00',NULL,'365.10'),
 ('10442','ERNSH','3','0000-00-00',NULL,'239.70'),
 ('10443','REGGC','8','0000-00-00',NULL,'69.75'),
 ('10444','BERGS','3','0000-00-00',NULL,'17.50'),
 ('10445','BERGS','3','0000-00-00',NULL,'46.50'),
 ('10446','TOMSP','6','0000-00-00',NULL,'73.40'),
 ('10447','RICAR','4','0000-00-00',NULL,'343.30'),
 ('10448','RANCH','4','0000-00-00',NULL,'194.10'),
 ('10449','BLONP','3','0000-00-00',NULL,'266.50'),
 ('10450','VICTE','8','0000-00-00',NULL,'36.15'),
 ('10451','QUICK','4','0000-00-00',NULL,'945.45'),
 ('10452','SAVEA','8','0000-00-00',NULL,'701.30'),
 ('10453','AROUT','1','0000-00-00',NULL,'126.80'),
 ('10454','LAMAI','4','0000-00-00',NULL,'13.70'),
 ('10455','WARTH','8','0000-00-00',NULL,'902.25'),
 ('10456','KOENE','8','0000-00-00',NULL,'40.60');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10457','KOENE','2','0000-00-00',NULL,'57.85'),
 ('10458','SUPRD','7','0000-00-00',NULL,'735.30'),
 ('10459','VICTE','4','0000-00-00',NULL,'125.45'),
 ('10460','FOLKO','8','0000-00-00',NULL,'81.35'),
 ('10461','LILAS','1','0000-00-00',NULL,'743.05'),
 ('10462','CONSH','2','0000-00-00',NULL,'30.85'),
 ('10463','SUPRD','5','0000-00-00',NULL,'73.90'),
 ('10464','FURIB','4','0000-00-00',NULL,'4.45'),
 ('10465','VAFFE','1','0000-00-00',NULL,'725.20'),
 ('10466','COMMI','4','0000-00-00',NULL,'59.65'),
 ('10467','MAGAA','8','0000-00-00',NULL,'24.65'),
 ('10468','KOENE','3','0000-00-00',NULL,'220.60'),
 ('10469','WHITC','1','0000-00-00',NULL,'300.90'),
 ('10470','BONAP','4','0000-00-00',NULL,'322.80'),
 ('10471','BSBEV','2','0000-00-00',NULL,'227.95'),
 ('10472','SEVES','8','0000-00-00',NULL,'0.21'),
 ('10473','ISLAT','1','0000-00-00',NULL,'81.85'),
 ('10474','PERIC','5','0000-00-00',NULL,'417.45'),
 ('10475','SUPRD','9','0000-00-00',NULL,'342.60');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10476','HILAA','8','0000-00-00',NULL,'22.05'),
 ('10477','PRINI','5','0000-00-00',NULL,'65.10'),
 ('10478','VICTE','2','0000-00-00',NULL,'24.05'),
 ('10479','RATTC','3','0000-00-00',NULL,'3544.75'),
 ('10480','FOLIG','6','0000-00-00',NULL,'6.75'),
 ('10481','RICAR','8','0000-00-00',NULL,'321.65'),
 ('10482','LAZYK','1','0000-00-00',NULL,'37.40'),
 ('10483','WHITC','7','0000-00-00',NULL,'76.40'),
 ('10484','BSBEV','3','0000-00-00',NULL,'34.40'),
 ('10485','LINOD','4','0000-00-00',NULL,'322.25'),
 ('10486','HILAA','1','0000-00-00',NULL,'152.65'),
 ('10487','QUEEN','2','0000-00-00',NULL,'355.35'),
 ('10488','FRANK','8','0000-00-00',NULL,'24.65'),
 ('10489','PICCO','6','0000-00-00',NULL,'26.45'),
 ('10490','HILAA','7','0000-00-00',NULL,'1050.95'),
 ('10491','FURIB','8','0000-00-00',NULL,'84.80'),
 ('10492','BOTTM','3','0000-00-00',NULL,'314.45'),
 ('10493','LAMAI','4','0000-00-00',NULL,'53.20'),
 ('10494','COMMI','4','0000-00-00',NULL,'329.95');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10495','LAUGB','3','0000-00-00',NULL,'23.25'),
 ('10496','TRADH','7','0000-00-00',NULL,'233.85'),
 ('10497','LEHMS','7','0000-00-00',NULL,'181.05'),
 ('10498','HILAA','8','0000-00-00',NULL,'148.75'),
 ('10499','LILAS','4','0000-00-00',NULL,'510.10'),
 ('10500','LAMAI','6','0000-00-00',NULL,'213.40'),
 ('10501','BLAUS','9','0000-00-00',NULL,'44.25'),
 ('10502','PERIC','2','0000-00-00',NULL,'346.60'),
 ('10503','HUNGO','6','0000-00-00',NULL,'83.70'),
 ('10504','WHITC','4','0000-00-00',NULL,'295.65'),
 ('10505','MEREP','3','0000-00-00',NULL,'35.65'),
 ('10506','KOENE','9','0000-00-00',NULL,'105.95'),
 ('10507','ANTON','7','0000-00-00',NULL,'237.25'),
 ('10508','OTTIK','1','0000-00-00',NULL,'24.95'),
 ('10509','BLAUS','4','0000-00-00',NULL,'0.75'),
 ('10510','SAVEA','6','0000-00-00',NULL,'1838.15'),
 ('10511','BONAP','4','0000-00-00',NULL,'1753.20'),
 ('10512','FAMIA','7','0000-00-00',NULL,'17.65'),
 ('10513','WANDK','7','0000-00-00',NULL,'528.25');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10514','ERNSH','3','0000-00-00',NULL,'3949.75'),
 ('10515','QUICK','2','0000-00-00',NULL,'1022.35'),
 ('10516','HUNGO','2','0000-00-00',NULL,'313.90'),
 ('10517','NORTS','3','0000-00-00',NULL,'160.35'),
 ('10518','TORTU','4','0000-00-00',NULL,'1090.75'),
 ('10519','CHOPS','6','0000-00-00',NULL,'458.80'),
 ('10520','SANTG','7','0000-00-00',NULL,'66.85'),
 ('10521','CACTU','8','0000-00-00',NULL,'86.10'),
 ('10522','LEHMS','4','0000-00-00',NULL,'226.65'),
 ('10523','SEVES','7','0000-00-00',NULL,'388.15'),
 ('10524','BERGS','1','0000-00-00',NULL,'1223.95'),
 ('10525','BONAP','1','0000-00-00',NULL,'55.30'),
 ('10526','WARTH','4','0000-00-00',NULL,'292.95'),
 ('10527','QUICK','7','0000-00-00',NULL,'209.50'),
 ('10528','GREAL','6','0000-00-00',NULL,'16.75'),
 ('10529','MAISD','5','0000-00-00',NULL,'333.45'),
 ('10530','PICCO','3','0000-00-00',NULL,'1696.10'),
 ('10531','OCEAN','7','0000-00-00',NULL,'40.60'),
 ('10532','EASTC','7','0000-00-00',NULL,'372.30');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10533','FOLKO','8','0000-00-00',NULL,'940.20'),
 ('10534','LEHMS','8','0000-00-00',NULL,'139.70'),
 ('10535','ANTON','4','0000-00-00',NULL,'78.20'),
 ('10536','LEHMS','3','0000-00-00',NULL,'294.40'),
 ('10537','RICSU','1','0000-00-00',NULL,'394.25'),
 ('10538','BSBEV','9','0000-00-00',NULL,'24.35'),
 ('10539','BSBEV','6','0000-00-00',NULL,'61.80'),
 ('10540','QUICK','3','0000-00-00',NULL,'5038.20'),
 ('10541','HANAR','2','0000-00-00',NULL,'343.25'),
 ('10542','KOENE','1','0000-00-00',NULL,'54.75'),
 ('10543','LILAS','8','0000-00-00',NULL,'240.85'),
 ('10544','LONEP','4','0000-00-00',NULL,'124.55'),
 ('10545','LAZYK','8','0000-00-00',NULL,'59.60'),
 ('10546','VICTE','1','0000-00-00',NULL,'973.60'),
 ('10547','SEVES','3','0000-00-00',NULL,'892.15'),
 ('10548','TOMSP','3','0000-00-00',NULL,'7.15'),
 ('10549','QUICK','5','0000-00-00',NULL,'856.20'),
 ('10550','GODOS','7','0000-00-00',NULL,'21.60'),
 ('10551','FURIB','4','0000-00-00',NULL,'364.75');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10552','HILAA','2','0000-00-00',NULL,'416.10'),
 ('10553','WARTH','2','0000-00-00',NULL,'747.45'),
 ('10554','OTTIK','4','0000-00-00',NULL,'604.85'),
 ('10555','SAVEA','6','0000-00-00',NULL,'1262.45'),
 ('10556','SIMOB','2','0000-00-00',NULL,'0.49'),
 ('10557','LEHMS','9','0000-00-00',NULL,'483.60'),
 ('10558','AROUT','1','0000-00-00',NULL,'364.85'),
 ('10559','BLONP','6','0000-00-00',NULL,'40.25'),
 ('10560','FRANK','8','0000-00-00',NULL,'183.25'),
 ('10561','FOLKO','2','0000-00-00',NULL,'1211.05'),
 ('10562','REGGC','1','0000-00-00',NULL,'114.75'),
 ('10563','RICAR','2','0000-00-00',NULL,'302.15'),
 ('10564','RATTC','4','0000-00-00',NULL,'68.75'),
 ('10565','MEREP','8','0000-00-00',NULL,'35.75'),
 ('10566','BLONP','9','0000-00-00',NULL,'4.42'),
 ('10567','HUNGO','1','0000-00-00',NULL,'169.85'),
 ('10568','GALED','3','0000-00-00',NULL,'32.70'),
 ('10569','RATTC','5','0000-00-00',NULL,'294.90'),
 ('10570','MEREP','3','0000-00-00',NULL,'944.95');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10571','ERNSH','8','0000-00-00',NULL,'130.30'),
 ('10572','BERGS','3','0000-00-00',NULL,'582.15'),
 ('10573','ANTON','7','0000-00-00',NULL,'424.20'),
 ('10574','TRAIH','4','0000-00-00',NULL,'1.88'),
 ('10575','MORGK','5','0000-00-00',NULL,'636.70'),
 ('10576','TORTU','3','0000-00-00',NULL,'92.80'),
 ('10577','TRAIH','9','0000-00-00',NULL,'127.05'),
 ('10578','BSBEV','4','0000-00-00',NULL,'1.48'),
 ('10579','LETSS','1','0000-00-00',NULL,'68.65'),
 ('10580','OTTIK','4','0000-00-00',NULL,'379.45'),
 ('10581','FAMIA','3','0000-00-00',NULL,'15.05'),
 ('10582','BLAUS','3','0000-00-00',NULL,'138.55'),
 ('10583','WARTH','2','0000-00-00',NULL,'36.40'),
 ('10584','BLONP','4','0000-00-00',NULL,'295.70'),
 ('10585','WELLI','7','0000-00-00',NULL,'67.05'),
 ('10586','REGGC','9','0000-00-00',NULL,'2.40'),
 ('10587','QUEDE','1','0000-00-00',NULL,'312.60'),
 ('10588','QUICK','2','0000-00-00',NULL,'973.35'),
 ('10589','GREAL','8','0000-00-00',NULL,'22.10');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10590','MEREP','4','0000-00-00',NULL,'223.85'),
 ('10591','VAFFE','1','0000-00-00',NULL,'279.60'),
 ('10592','LEHMS','3','0000-00-00',NULL,'160.50'),
 ('10593','LEHMS','7','0000-00-00',NULL,'8.71'),
 ('10594','OLDWO','3','0000-00-00',NULL,'26.20'),
 ('10595','ERNSH','2','0000-00-00',NULL,'483.90'),
 ('10596','WHITC','8','0000-00-00',NULL,'81.70'),
 ('10597','PICCO','7','0000-00-00',NULL,'175.60'),
 ('10598','RATTC','1','0000-00-00',NULL,'222.10'),
 ('10599','BSBEV','6','0000-00-00',NULL,'149.90'),
 ('10600','HUNGC','4','0000-00-00',NULL,'225.65'),
 ('10601','HILAA','7','0000-00-00',NULL,'291.50'),
 ('10602','VAFFE','8','0000-00-00',NULL,'14.60'),
 ('10603','SAVEA','8','0000-00-00',NULL,'243.85'),
 ('10604','FURIB','1','0000-00-00',NULL,'37.30'),
 ('10605','MEREP','1','0000-00-00',NULL,'1895.65'),
 ('10606','TRADH','4','0000-00-00',NULL,'3.97'),
 ('10607','SAVEA','5','0000-00-00',NULL,'1001.20'),
 ('10608','TOMSP','4','0000-00-00',NULL,'138.95');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10609','DUMON','7','0000-00-00',NULL,'9.25'),
 ('10610','LAMAI','8','0000-00-00',NULL,'133.90'),
 ('10611','WOLZA','6','0000-00-00',NULL,'403.25'),
 ('10612','SAVEA','1','0000-00-00',NULL,'2720.40'),
 ('10613','HILAA','4','0000-00-00',NULL,'40.55'),
 ('10614','BLAUS','8','0000-00-00',NULL,'9.65'),
 ('10615','WILMK','2','0000-00-00',NULL,'3.75'),
 ('10616','GREAL','1','0000-00-00',NULL,'582.65'),
 ('10617','GREAL','4','0000-00-00',NULL,'92.65'),
 ('10618','MEREP','1','0000-00-00',NULL,'773.40'),
 ('10619','MEREP','3','0000-00-00',NULL,'455.25'),
 ('10620','LAUGB','2','0000-00-00',NULL,'4.70'),
 ('10621','ISLAT','4','0000-00-00',NULL,'118.65'),
 ('10622','RICAR','4','0000-00-00',NULL,'254.85'),
 ('10623','FRANK','8','0000-00-00',NULL,'485.90'),
 ('10624','THECR','4','0000-00-00',NULL,'4.74'),
 ('10625','ANATR','3','0000-00-00',NULL,'219.50'),
 ('10626','BERGS','1','0000-00-00',NULL,'693.45'),
 ('10627','SAVEA','8','0000-00-00',NULL,'537.30');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10628','BLONP','4','0000-00-00',NULL,'151.80'),
 ('10629','GODOS','4','0000-00-00',NULL,'427.30'),
 ('10630','KOENE','1','0000-00-00',NULL,'161.75'),
 ('10631','LAMAI','8','0000-00-00',NULL,'4.35'),
 ('10632','WANDK','8','0000-00-00',NULL,'206.90'),
 ('10633','ERNSH','7','0000-00-00',NULL,'2389.50'),
 ('10634','FOLIG','4','0000-00-00',NULL,'2436.90'),
 ('10635','MAGAA','8','0000-00-00',NULL,'237.30'),
 ('10636','WARTH','4','0000-00-00',NULL,'5.75'),
 ('10637','QUEEN','6','0000-00-00',NULL,'1006.45'),
 ('10638','LINOD','3','0000-00-00',NULL,'792.20'),
 ('10639','SANTG','7','0000-00-00',NULL,'193.20'),
 ('10640','WANDK','4','0000-00-00',NULL,'117.75'),
 ('10641','HILAA','4','0000-00-00',NULL,'898.05'),
 ('10642','SIMOB','7','0000-00-00',NULL,'209.45'),
 ('10643','AROUT','6','0000-00-00',NULL,'147.30'),
 ('10644','WELLI','3','0000-00-00',NULL,'0.70'),
 ('10645','HANAR','4','0000-00-00',NULL,'62.05'),
 ('10646','HUNGO','9','0000-00-00',NULL,'711.65');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10647','QUEDE','4','0000-00-00',NULL,'227.70'),
 ('10648','RICAR','5','0000-00-00',NULL,'71.25'),
 ('10649','MAISD','5','0000-00-00',NULL,'0.31'),
 ('10650','FAMIA','5','0000-00-00',NULL,'884.05'),
 ('10651','WANDK','8','0000-00-00',NULL,'1.03'),
 ('10652','GOURL','4','0000-00-00',NULL,'35.70'),
 ('10653','FRANK','1','0000-00-00',NULL,'466.25'),
 ('10654','BERGS','5','0000-00-00',NULL,'276.30'),
 ('10655','REGGC','1','0000-00-00',NULL,'22.05'),
 ('10656','GREAL','6','0000-00-00',NULL,'285.75'),
 ('10657','SAVEA','2','0000-00-00',NULL,'1763.45'),
 ('10658','QUICK','4','0000-00-00',NULL,'1820.75'),
 ('10659','QUEEN','7','0000-00-00',NULL,'529.05'),
 ('10660','HUNGC','8','0000-00-00',NULL,'556.45'),
 ('10661','HUNGO','7','0000-00-00',NULL,'87.75'),
 ('10662','LONEP','3','0000-00-00',NULL,'6.40'),
 ('10663','BONAP','2','0000-00-00',NULL,'565.75'),
 ('10664','FURIB','1','0000-00-00',NULL,'6.35'),
 ('10665','LONEP','1','0000-00-00',NULL,'131.55');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10666','RICSU','7','0000-00-00',NULL,'1162.10'),
 ('10667','ERNSH','7','0000-00-00',NULL,'390.45'),
 ('10668','WANDK','1','0000-00-00',NULL,'236.10'),
 ('10669','SIMOB','2','0000-00-00',NULL,'121.95'),
 ('10670','FRANK','4','0000-00-00',NULL,'1017.40'),
 ('10671','FRANR','1','0000-00-00',NULL,'151.70'),
 ('10672','BERGS','9','0000-00-00',NULL,'478.75'),
 ('10673','WILMK','2','0000-00-00',NULL,'113.80'),
 ('10674','ISLAT','4','0000-00-00',NULL,'4.50'),
 ('10675','FRANK','5','0000-00-00',NULL,'159.25'),
 ('10676','TORTU','2','0000-00-00',NULL,'10.05'),
 ('10677','ANTON','1','0000-00-00',NULL,'20.15'),
 ('10678','SAVEA','7','0000-00-00',NULL,'1944.90'),
 ('10679','BLONP','8','0000-00-00',NULL,'139.70'),
 ('10680','OLDWO','1','0000-00-00',NULL,'133.05'),
 ('10681','GREAL','3','0000-00-00',NULL,'380.65'),
 ('10682','ANTON','3','0000-00-00',NULL,'180.65'),
 ('10683','DUMON','2','0000-00-00',NULL,'0.22'),
 ('10684','OTTIK','3','0000-00-00',NULL,'728.15');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10685','GOURL','4','0000-00-00',NULL,'168.75'),
 ('10686','PICCO','2','0000-00-00',NULL,'482.50'),
 ('10687','HUNGO','9','0000-00-00',NULL,'1482.15'),
 ('10688','VAFFE','4','0000-00-00',NULL,'1495.45'),
 ('10689','BERGS','1','0000-00-00',NULL,'67.10'),
 ('10690','HANAR','1','0000-00-00',NULL,'0.79'),
 ('10691','QUICK','2','0000-00-00',NULL,'4050.25'),
 ('10692','BSBEV','4','0000-00-00',NULL,'305.10'),
 ('10693','WHITC','3','0000-00-00',NULL,'696.70'),
 ('10694','QUICK','8','0000-00-00',NULL,'1991.80'),
 ('10695','WILMK','7','0000-00-00',NULL,'83.60'),
 ('10696','WHITC','8','0000-00-00',NULL,'512.75'),
 ('10697','LINOD','3','0000-00-00',NULL,'227.60'),
 ('10698','ERNSH','4','0000-00-00',NULL,'1362.35'),
 ('10699','MORGK','3','0000-00-00',NULL,'2.90'),
 ('10700','SAVEA','3','0000-00-00',NULL,'325.50'),
 ('10701','HUNGO','6','0000-00-00',NULL,'1101.55'),
 ('10702','ALFKI','4','0000-00-00',NULL,'119.70'),
 ('10703','FOLKO','6','0000-00-00',NULL,'761.50');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10704','QUEEN','6','0000-00-00',NULL,'23.90'),
 ('10705','HILAA','9','0000-00-00',NULL,'17.60'),
 ('10706','OLDWO','8','0000-00-00',NULL,'678.15'),
 ('10707','AROUT','4','0000-00-00',NULL,'108.70'),
 ('10708','THEBI','6','0000-00-00',NULL,'14.80'),
 ('10709','GOURL','1','0000-00-00',NULL,'10.54'),
 ('10710','FRANS','1','0000-00-00',NULL,'24.90'),
 ('10711','SAVEA','5','0000-00-00',NULL,'262.05'),
 ('10712','HUNGO','3','0000-00-00',NULL,'449.65'),
 ('10713','SAVEA','1','0000-00-00',NULL,'835.25'),
 ('10714','SAVEA','5','0000-00-00',NULL,'122.45'),
 ('10715','BONAP','3','0000-00-00',NULL,'3.16'),
 ('10716','RANCH','4','0000-00-00',NULL,'112.85'),
 ('10717','FRANK','1','0000-00-00',NULL,'296.25'),
 ('10718','KOENE','1','0000-00-00',NULL,'854.40'),
 ('10719','LETSS','8','0000-00-00',NULL,'257.20'),
 ('10720','QUEDE','8','0000-00-00',NULL,'47.65'),
 ('10721','QUICK','5','0000-00-00',NULL,'244.60'),
 ('10722','SAVEA','8','0000-00-00',NULL,'372.90');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10723','WHITC','3','0000-00-00',NULL,'108.60'),
 ('10724','MEREP','8','0000-00-00',NULL,'288.75'),
 ('10725','FAMIA','4','0000-00-00',NULL,'54.15'),
 ('10726','EASTC','4','0000-00-00',NULL,'82.80'),
 ('10727','REGGC','2','0000-00-00',NULL,'449.50'),
 ('10728','QUEEN','4','0000-00-00',NULL,'291.65'),
 ('10729','LINOD','8','0000-00-00',NULL,'705.30'),
 ('10730','BONAP','5','0000-00-00',NULL,'100.60'),
 ('10731','CHOPS','7','0000-00-00',NULL,'483.25'),
 ('10732','BONAP','3','0000-00-00',NULL,'84.85'),
 ('10733','BERGS','1','0000-00-00',NULL,'550.55'),
 ('10734','GOURL','2','0000-00-00',NULL,'8.15'),
 ('10735','LETSS','6','0000-00-00',NULL,'229.85'),
 ('10736','HUNGO','9','0000-00-00',NULL,'220.50'),
 ('10737','VINET','2','0000-00-00',NULL,'38.95'),
 ('10738','SPECD','2','0000-00-00',NULL,'14.55'),
 ('10739','VINET','3','0000-00-00',NULL,'55.40'),
 ('10740','WHITC','4','0000-00-00',NULL,'409.40'),
 ('10741','AROUT','4','0000-00-00',NULL,'54.80');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10742','BOTTM','3','0000-00-00',NULL,'1218.65'),
 ('10743','AROUT','1','0000-00-00',NULL,'118.60'),
 ('10744','VAFFE','6','0000-00-00',NULL,'345.95'),
 ('10745','QUICK','9','0000-00-00',NULL,'17.60'),
 ('10746','CHOPS','1','0000-00-00',NULL,'157.15'),
 ('10747','PICCO','6','0000-00-00',NULL,'586.65'),
 ('10748','SAVEA','3','0000-00-00',NULL,'1162.75'),
 ('10749','ISLAT','4','0000-00-00',NULL,'307.65'),
 ('10750','WARTH','9','0000-00-00',NULL,'396.50'),
 ('10751','RICSU','3','0000-00-00',NULL,'653.95'),
 ('10752','NORTS','2','0000-00-00',NULL,'6.95'),
 ('10753','FRANS','3','0000-00-00',NULL,'38.50'),
 ('10754','MAGAA','6','0000-00-00',NULL,'11.90'),
 ('10755','BONAP','4','0000-00-00',NULL,'83.55'),
 ('10756','SPLIR','8','0000-00-00',NULL,'366.05'),
 ('10757','SAVEA','6','0000-00-00',NULL,'40.95'),
 ('10758','RICSU','3','0000-00-00',NULL,'690.85'),
 ('10759','ANATR','3','0000-00-00',NULL,'59.95'),
 ('10760','MAISD','4','0000-00-00',NULL,'778.20');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10761','RATTC','5','0000-00-00',NULL,'93.30'),
 ('10762','FOLKO','3','0000-00-00',NULL,'1643.70'),
 ('10763','FOLIG','3','0000-00-00',NULL,'186.75'),
 ('10764','ERNSH','6','0000-00-00',NULL,'727.25'),
 ('10765','QUICK','3','0000-00-00',NULL,'213.70'),
 ('10766','OTTIK','4','0000-00-00',NULL,'787.75'),
 ('10767','SUPRD','4','0000-00-00',NULL,'7.95'),
 ('10768','AROUT','3','0000-00-00',NULL,'731.60'),
 ('10769','VAFFE','3','0000-00-00',NULL,'325.30'),
 ('10770','HANAR','8','0000-00-00',NULL,'26.60'),
 ('10771','ERNSH','9','0000-00-00',NULL,'55.95'),
 ('10772','LEHMS','3','0000-00-00',NULL,'456.40'),
 ('10773','ERNSH','1','0000-00-00',NULL,'482.15'),
 ('10774','FOLKO','4','0000-00-00',NULL,'2.41'),
 ('10775','THECR','7','0000-00-00',NULL,'101.25'),
 ('10776','ERNSH','1','0000-00-00',NULL,'1757.65'),
 ('10777','GOURL','7','0000-00-00',NULL,'15.05'),
 ('10778','BERGS','3','0000-00-00',NULL,'33.95'),
 ('10779','MORGK','3','0000-00-00',NULL,'290.65');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10780','LILAS','2','0000-00-00',NULL,'210.65'),
 ('10781','WARTH','2','0000-00-00',NULL,'365.80'),
 ('10782','CACTU','9','0000-00-00',NULL,'5.50'),
 ('10783','HANAR','4','0000-00-00',NULL,'624.90'),
 ('10784','MAGAA','4','0000-00-00',NULL,'350.45'),
 ('10785','GROSR','1','0000-00-00',NULL,'7.55'),
 ('10786','QUEEN','8','0000-00-00',NULL,'554.35'),
 ('10787','LAMAI','2','0000-00-00',NULL,'1249.65'),
 ('10788','QUICK','1','0000-00-00',NULL,'213.50'),
 ('10789','FOLIG','1','0000-00-00',NULL,'5.03'),
 ('10790','GOURL','6','0000-00-00',NULL,'141.15'),
 ('10791','FRANK','6','0000-00-00',NULL,'84.25'),
 ('10792','WOLZA','1','0000-00-00',NULL,'118.95'),
 ('10793','AROUT','3','0000-00-00',NULL,'22.60'),
 ('10794','QUEDE','6','0000-00-00',NULL,'107.45'),
 ('10795','ERNSH','8','0000-00-00',NULL,'633.30'),
 ('10796','HILAA','3','0000-00-00',NULL,'132.60'),
 ('10797','DRACD','7','0000-00-00',NULL,'166.75'),
 ('10798','ISLAT','2','0000-00-00',NULL,'11.65');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10799','KOENE','9','0000-00-00',NULL,'153.80'),
 ('10800','SEVES','1','0000-00-00',NULL,'687.20'),
 ('10801','BOLID','4','0000-00-00',NULL,'485.45'),
 ('10802','SIMOB','4','0000-00-00',NULL,'1286.30'),
 ('10803','WELLI','4','0000-00-00',NULL,'276.15'),
 ('10804','SEVES','6','0000-00-00',NULL,'136.65'),
 ('10805','THEBI','2','0000-00-00',NULL,'1186.70'),
 ('10806','VICTE','3','0000-00-00',NULL,'110.55'),
 ('10807','FRANS','4','0000-00-00',NULL,'6.80'),
 ('10808','OLDWO','2','0000-00-00',NULL,'227.65'),
 ('10809','WELLI','7','0000-00-00',NULL,'24.35'),
 ('10810','LAUGB','2','0000-00-00',NULL,'21.65'),
 ('10811','LINOD','8','0000-00-00',NULL,'156.10'),
 ('10812','REGGC','5','0000-00-00',NULL,'298.90'),
 ('10813','RICAR','1','0000-00-00',NULL,'236.90'),
 ('10814','VICTE','3','0000-00-00',NULL,'654.70'),
 ('10815','SAVEA','2','0000-00-00',NULL,'73.10'),
 ('10816','GREAL','4','0000-00-00',NULL,'3598.90'),
 ('10817','KOENE','3','0000-00-00',NULL,'1530.35');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10818','MAGAA','7','0000-00-00',NULL,'327.40'),
 ('10819','CACTU','2','0000-00-00',NULL,'98.80'),
 ('10820','RATTC','3','0000-00-00',NULL,'187.60'),
 ('10821','SPLIR','1','0000-00-00',NULL,'183.40'),
 ('10822','TRAIH','6','0000-00-00',NULL,'0.35'),
 ('10823','LILAS','5','0000-00-00',NULL,'819.85'),
 ('10824','FOLKO','8','0000-00-00',NULL,'6.15'),
 ('10825','DRACD','1','0000-00-00',NULL,'396.25'),
 ('10826','BLONP','6','0000-00-00',NULL,'35.45'),
 ('10827','BONAP','1','0000-00-00',NULL,'317.70'),
 ('10828','RANCH','9','0000-00-00',NULL,'454.25'),
 ('10829','ISLAT','9','0000-00-00',NULL,'773.60'),
 ('10830','TRADH','4','0000-00-00',NULL,'409.15'),
 ('10831','SANTG','3','0000-00-00',NULL,'360.95'),
 ('10832','LAMAI','2','0000-00-00',NULL,'216.30'),
 ('10833','OTTIK','6','0000-00-00',NULL,'357.45'),
 ('10834','TRADH','1','0000-00-00',NULL,'148.90'),
 ('10835','ALFKI','1','0000-00-00',NULL,'347.65'),
 ('10836','ERNSH','7','0000-00-00',NULL,'2059.40');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10837','BERGS','9','0000-00-00',NULL,'66.60'),
 ('10838','LINOD','3','0000-00-00',NULL,'296.40'),
 ('10839','TRADH','3','0000-00-00',NULL,'177.15'),
 ('10840','LINOD','4','0000-00-00',NULL,'13.55'),
 ('10841','SUPRD','5','0000-00-00',NULL,'2121.50'),
 ('10842','TORTU','1','0000-00-00',NULL,'272.10'),
 ('10843','VICTE','4','0000-00-00',NULL,'46.30'),
 ('10844','PICCO','8','0000-00-00',NULL,'126.10'),
 ('10845','QUICK','8','0000-00-00',NULL,'1064.90'),
 ('10846','SUPRD','2','0000-00-00',NULL,'282.30'),
 ('10847','SAVEA','4','0000-00-00',NULL,'2437.85'),
 ('10848','CONSH','7','0000-00-00',NULL,'191.20'),
 ('10849','KOENE','9','0000-00-00',NULL,'2.80'),
 ('10850','VICTE','1','0000-00-00',NULL,'245.95'),
 ('10851','RICAR','5','0000-00-00',NULL,'802.75'),
 ('10852','RATTC','8','0000-00-00',NULL,'870.25'),
 ('10853','BLAUS','9','0000-00-00',NULL,'269.15'),
 ('10854','ERNSH','3','0000-00-00',NULL,'501.10'),
 ('10855','OLDWO','3','0000-00-00',NULL,'854.85');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10856','ANTON','3','0000-00-00',NULL,'292.15'),
 ('10857','BERGS','8','0000-00-00',NULL,'944.25'),
 ('10858','LACOR','2','0000-00-00',NULL,'262.55'),
 ('10859','FRANK','1','0000-00-00',NULL,'380.50'),
 ('10860','FRANR','3','0000-00-00',NULL,'96.30'),
 ('10861','WHITC','4','0000-00-00',NULL,'74.65'),
 ('10862','LEHMS','8','0000-00-00',NULL,'266.15'),
 ('10863','HILAA','4','0000-00-00',NULL,'151.30'),
 ('10864','AROUT','4','0000-00-00',NULL,'15.20'),
 ('10865','QUICK','2','0000-00-00',NULL,'1740.70'),
 ('10866','BERGS','5','0000-00-00',NULL,'545.55'),
 ('10867','LONEP','6','0000-00-00',NULL,'9.65'),
 ('10868','QUEEN','7','0000-00-00',NULL,'956.35'),
 ('10869','SEVES','5','0000-00-00',NULL,'716.40'),
 ('10870','WOLZA','5','0000-00-00',NULL,'60.20'),
 ('10871','BONAP','9','0000-00-00',NULL,'561.35'),
 ('10872','GODOS','5','0000-00-00',NULL,'876.60'),
 ('10873','WILMK','4','0000-00-00',NULL,'4.10'),
 ('10874','GODOS','5','0000-00-00',NULL,'97.90');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10875','BERGS','4','0000-00-00',NULL,'161.85'),
 ('10876','BONAP','7','0000-00-00',NULL,'302.10'),
 ('10877','RICAR','1','0000-00-00',NULL,'190.30'),
 ('10878','QUICK','4','0000-00-00',NULL,'233.45'),
 ('10879','WILMK','3','0000-00-00',NULL,'42.50'),
 ('10880','FOLKO','7','0000-00-00',NULL,'440.05'),
 ('10881','CACTU','4','0000-00-00',NULL,'14.20'),
 ('10882','SAVEA','4','0000-00-00',NULL,'115.50'),
 ('10883','LONEP','8','0000-00-00',NULL,'2.65'),
 ('10884','LETSS','4','0000-00-00',NULL,'454.85'),
 ('10885','SUPRD','6','0000-00-00',NULL,'28.20'),
 ('10886','HANAR','1','0000-00-00',NULL,'24.95'),
 ('10887','GALED','8','0000-00-00',NULL,'6.25'),
 ('10888','GODOS','1','0000-00-00',NULL,'259.35'),
 ('10889','RATTC','9','0000-00-00',NULL,'1403.05'),
 ('10890','DUMON','7','0000-00-00',NULL,'163.80'),
 ('10891','LEHMS','7','0000-00-00',NULL,'101.85'),
 ('10892','MAISD','4','0000-00-00',NULL,'601.35'),
 ('10893','KOENE','9','0000-00-00',NULL,'388.90');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10894','SAVEA','1','0000-00-00',NULL,'580.65'),
 ('10895','ERNSH','3','0000-00-00',NULL,'813.75'),
 ('10896','MAISD','7','0000-00-00',NULL,'162.25'),
 ('10897','HUNGO','3','0000-00-00',NULL,'3017.70'),
 ('10898','OCEAN','4','0000-00-00',NULL,'6.35'),
 ('10899','LILAS','5','0000-00-00',NULL,'6.05'),
 ('10900','WELLI','1','0000-00-00',NULL,'8.30'),
 ('10901','HILAA','4','0000-00-00',NULL,'310.45'),
 ('10902','FOLKO','1','0000-00-00',NULL,'220.75'),
 ('10903','HANAR','3','0000-00-00',NULL,'183.55'),
 ('10904','WHITC','3','0000-00-00',NULL,'814.75'),
 ('10905','WELLI','9','0000-00-00',NULL,'68.60'),
 ('10906','WOLZA','4','0000-00-00',NULL,'131.45'),
 ('10907','SPECD','6','0000-00-00',NULL,'45.95'),
 ('10908','REGGC','4','0000-00-00',NULL,'164.80'),
 ('10909','SANTG','1','0000-00-00',NULL,'265.25'),
 ('10910','WILMK','1','0000-00-00',NULL,'190.55'),
 ('10911','GODOS','3','0000-00-00',NULL,'190.95'),
 ('10912','HUNGO','2','0000-00-00',NULL,'2904.55');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10913','QUEEN','4','0000-00-00',NULL,'165.25'),
 ('10914','QUEEN','6','0000-00-00',NULL,'105.95'),
 ('10915','TORTU','2','0000-00-00',NULL,'17.55'),
 ('10916','RANCH','1','0000-00-00',NULL,'318.85'),
 ('10917','ROMEY','4','0000-00-00',NULL,'41.45'),
 ('10918','BOTTM','3','0000-00-00',NULL,'244.15'),
 ('10919','LINOD','2','0000-00-00',NULL,'0.99'),
 ('10920','AROUT','4','0000-00-00',NULL,'148.05'),
 ('10921','VAFFE','1','0000-00-00',NULL,'882.40'),
 ('10922','HANAR','5','0000-00-00',NULL,'313.70'),
 ('10923','LAMAI','7','0000-00-00',NULL,'341.30'),
 ('10924','BERGS','3','0000-00-00',NULL,'757.60'),
 ('10925','HANAR','3','0000-00-00',NULL,'11.35'),
 ('10926','ANATR','4','0000-00-00',NULL,'199.60'),
 ('10927','LACOR','4','0000-00-00',NULL,'98.95'),
 ('10928','GALED','1','0000-00-00',NULL,'6.80'),
 ('10929','FRANK','6','0000-00-00',NULL,'169.65'),
 ('10930','SUPRD','4','0000-00-00',NULL,'77.75'),
 ('10931','RICSU','4','0000-00-00',NULL,'0.68');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10932','BONAP','8','0000-00-00',NULL,'673.20'),
 ('10933','ISLAT','6','0000-00-00',NULL,'270.75'),
 ('10934','LEHMS','3','0000-00-00',NULL,'160.05'),
 ('10935','WELLI','4','0000-00-00',NULL,'237.95'),
 ('10936','GREAL','3','0000-00-00',NULL,'168.40'),
 ('10937','CACTU','7','0000-00-00',NULL,'157.55'),
 ('10938','QUICK','3','0000-00-00',NULL,'159.45'),
 ('10939','MAGAA','2','0000-00-00',NULL,'381.65'),
 ('10940','BONAP','8','0000-00-00',NULL,'98.85'),
 ('10941','SAVEA','7','0000-00-00',NULL,'2004.05'),
 ('10942','REGGC','9','0000-00-00',NULL,'89.75'),
 ('10943','BSBEV','4','0000-00-00',NULL,'10.85'),
 ('10944','BOTTM','6','0000-00-00',NULL,'264.60'),
 ('10945','MORGK','4','0000-00-00',NULL,'51.10'),
 ('10946','VAFFE','1','0000-00-00',NULL,'1.36'),
 ('10947','BSBEV','3','0000-00-00',NULL,'16.30'),
 ('10948','GODOS','3','0000-00-00',NULL,'116.95'),
 ('10949','BOTTM','2','0000-00-00',NULL,'372.20'),
 ('10950','MAGAA','1','0000-00-00',NULL,'12.50');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10951','RICSU','9','0000-00-00',NULL,'154.25'),
 ('10952','ALFKI','1','0000-00-00',NULL,'202.10'),
 ('10953','AROUT','9','0000-00-00',NULL,'118.60'),
 ('10954','LINOD','5','0000-00-00',NULL,'139.55'),
 ('10955','FOLKO','8','0000-00-00',NULL,'16.30'),
 ('10956','BLAUS','6','0000-00-00',NULL,'223.25'),
 ('10957','HILAA','8','0000-00-00',NULL,'526.80'),
 ('10958','OCEAN','7','0000-00-00',NULL,'247.80'),
 ('10959','GOURL','6','0000-00-00',NULL,'24.90'),
 ('10960','HILAA','3','0000-00-00',NULL,'10.40'),
 ('10961','QUEEN','8','0000-00-00',NULL,'522.35'),
 ('10962','QUICK','8','0000-00-00',NULL,'1378.95'),
 ('10963','FURIB','9','0000-00-00',NULL,'13.50'),
 ('10964','SPECD','3','0000-00-00',NULL,'436.90'),
 ('10965','OLDWO','6','0000-00-00',NULL,'721.90'),
 ('10966','CHOPS','4','0000-00-00',NULL,'135.95'),
 ('10967','TOMSP','2','0000-00-00',NULL,'311.10'),
 ('10968','ERNSH','1','0000-00-00',NULL,'3.73'),
 ('10969','COMMI','1','0000-00-00',NULL,'1.05');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10970','BOLID','9','0000-00-00',NULL,'80.80'),
 ('10971','FRANR','2','0000-00-00',NULL,'609.10'),
 ('10972','LACOR','4','0000-00-00',NULL,'0.10'),
 ('10973','LACOR','6','0000-00-00',NULL,'75.85'),
 ('10974','SPLIR','3','0000-00-00',NULL,'64.80'),
 ('10975','BOTTM','1','0000-00-00',NULL,'161.35'),
 ('10976','HILAA','1','0000-00-00',NULL,'189.85'),
 ('10977','FOLKO','8','0000-00-00',NULL,'1042.50'),
 ('10978','MAISD','9','0000-00-00',NULL,'164.10'),
 ('10979','ERNSH','8','0000-00-00',NULL,'1765.35'),
 ('10980','FOLKO','4','0000-00-00',NULL,'6.30'),
 ('10981','HANAR','1','0000-00-00',NULL,'966.85'),
 ('10982','BOTTM','2','0000-00-00',NULL,'70.05'),
 ('10983','SAVEA','2','0000-00-00',NULL,'3287.70'),
 ('10984','SAVEA','1','0000-00-00',NULL,'1056.10'),
 ('10985','HUNGO','2','0000-00-00',NULL,'457.55'),
 ('10986','OCEAN','8','0000-00-00',NULL,'1089.30'),
 ('10987','EASTC','8','0000-00-00',NULL,'927.40'),
 ('10988','RATTC','3','0000-00-00',NULL,'305.70');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('10989','QUEDE','2','0000-00-00',NULL,'173.80'),
 ('10990','ERNSH','2','0000-00-00',NULL,'588.05'),
 ('10991','QUICK','1','0000-00-00',NULL,'192.55'),
 ('10992','THEBI','1','0000-00-00',NULL,'21.35'),
 ('10993','FOLKO','7','0000-00-00',NULL,'44.05'),
 ('10994','VAFFE','2','0000-00-00',NULL,'327.65'),
 ('10995','PERIC','1','0000-00-00',NULL,'2.30'),
 ('10996','QUICK','4','0000-00-00',NULL,'5.60'),
 ('10997','LILAS','8','0000-00-00',NULL,'369.55'),
 ('10998','WOLZA','8','0000-00-00',NULL,'101.55'),
 ('10999','OTTIK','6','0000-00-00',NULL,'481.75'),
 ('11000','RATTC','2','0000-00-00',NULL,'275.60'),
 ('11001','FOLKO','2','0000-00-00',NULL,'986.50'),
 ('11002','SAVEA','4','0000-00-00',NULL,'705.80'),
 ('11003','THECR','3','0000-00-00',NULL,'74.55'),
 ('11004','MAISD','3','0000-00-00',NULL,'224.20'),
 ('11005','WILMK','2','0000-00-00',NULL,'3.75'),
 ('11006','GREAL','3','0000-00-00',NULL,'125.95'),
 ('11007','PRINI','8','0000-00-00',NULL,'1011.20');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('11008','ERNSH','7','0000-00-00','2001-01-00','397.30'),
 ('11009','GODOS','2','0000-00-00',NULL,'295.55'),
 ('11010','REGGC','2','0000-00-00',NULL,'143.55'),
 ('11011','ALFKI','3','0000-00-00',NULL,'6.05'),
 ('11012','FRANK','1','0000-00-00',NULL,'1214.75'),
 ('11013','ROMEY','2','0000-00-00',NULL,'164.95'),
 ('11014','LINOD','2','0000-00-00',NULL,'1.18'),
 ('11015','SANTG','2','0000-00-00',NULL,'23.10'),
 ('11016','AROUT','9','0000-00-00',NULL,'1.69'),
 ('11017','ERNSH','9','0000-00-00',NULL,'3771.30'),
 ('11018','LONEP','4','0000-00-00',NULL,'58.25'),
 ('11019','RANCH','6','0000-00-00','2001-01-00','15.85'),
 ('11020','OTTIK','2','0000-00-00',NULL,'216.50'),
 ('11021','QUICK','3','0000-00-00',NULL,'1485.90'),
 ('11022','HANAR','9','0000-00-00',NULL,'31.35'),
 ('11023','BSBEV','1','0000-00-00',NULL,'619.15'),
 ('11024','EASTC','4','0000-00-00',NULL,'371.80'),
 ('11025','WARTH','6','0000-00-00',NULL,'145.85'),
 ('11026','FRANS','4','0000-00-00',NULL,'235.45');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('11027','BOTTM','1','0000-00-00',NULL,'262.60'),
 ('11028','KOENE','2','0000-00-00',NULL,'147.95'),
 ('11029','CHOPS','4','0000-00-00',NULL,'239.20'),
 ('11030','SAVEA','7','0000-00-00',NULL,'4153.75'),
 ('11031','SAVEA','6','0000-00-00',NULL,'1136.10'),
 ('11032','WHITC','2','0000-00-00',NULL,'3030.95'),
 ('11033','RICSU','7','0000-00-00',NULL,'423.70'),
 ('11034','OLDWO','8','0000-00-00',NULL,'201.60'),
 ('11035','SUPRD','2','0000-00-00',NULL,'0.85'),
 ('11036','DRACD','8','0000-00-00',NULL,'747.35'),
 ('11037','GODOS','7','0000-00-00',NULL,'0.16'),
 ('11038','SUPRD','1','0000-00-00',NULL,'147.95'),
 ('11039','LINOD','1','0000-00-00','2001-01-00','3.25'),
 ('11040','GREAL','4','0000-00-00','2001-01-00','94.20'),
 ('11041','CHOPS','3','0000-00-00',NULL,'241.10'),
 ('11042','COMMI','2','0000-00-00',NULL,'149.95'),
 ('11043','SPECD','5','0000-00-00',NULL,'0.44'),
 ('11044','WOLZA','4','0000-00-00',NULL,'43.60'),
 ('11045','BOTTM','6','0000-00-00','2001-01-00','352.90');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('11046','WANDK','8','0000-00-00',NULL,'358.20'),
 ('11047','EASTC','7','0000-00-00',NULL,'233.10'),
 ('11048','BOTTM','7','0000-00-00',NULL,'120.60'),
 ('11049','GOURL','3','0000-00-00',NULL,'41.70'),
 ('11050','FOLKO','8','0000-00-00',NULL,'297.05'),
 ('11051','LAMAI','7','0000-00-00','2001-01-00','13.95'),
 ('11052','HANAR','3','0000-00-00',NULL,'336.30'),
 ('11053','PICCO','2','0000-00-00',NULL,'265.25'),
 ('11054','CACTU','8','0000-00-00','2001-01-00','1.65'),
 ('11055','HILAA','7','0000-00-00',NULL,'604.60'),
 ('11056','EASTC','8','0000-00-00',NULL,'1394.80'),
 ('11057','NORTS','3','0000-00-00',NULL,'20.65'),
 ('11058','BLAUS','9','0000-00-00','2001-01-00','155.70'),
 ('11059','RICAR','2','0000-00-00','2001-01-00','4.29'),
 ('11060','FRANS','2','0000-00-00',NULL,'54.90'),
 ('11061','GREAL','4','0000-00-00','2001-01-00','70.05'),
 ('11062','REGGC','4','0000-00-00','2001-01-00','149.65'),
 ('11063','HUNGO','3','0000-00-00',NULL,'408.65');
INSERT INTO `commandes` (`NO_COMMANDE`,`CODE_CLIENT`,`NO_EMPLOYE`,`DATE_COMMANDE`,`DATE_ENVOI`,`PORT`) VALUES 
 ('11064','SAVEA','1','0000-00-00',NULL,'150.45'),
 ('11065','LILAS','8','0000-00-00','2001-01-00','64.55'),
 ('11066','WHITC','7','0000-00-00',NULL,'223.60'),
 ('11067','DRACD','1','0000-00-00',NULL,'39.90'),
 ('11068','QUEEN','8','0000-00-00','2001-01-00','408.75'),
 ('11069','TORTU','1','0000-00-00',NULL,'78.35'),
 ('11070','LEHMS','2','0000-00-00','2001-01-00','6.80'),
 ('11071','LILAS','1','0000-00-00','2001-01-00','4.65'),
 ('11072','ERNSH','4','0000-00-00','2001-01-00','1293.20'),
 ('11073','PERIC','2','0000-00-00','2001-01-00','124.75'),
 ('11074','SIMOB','7','0000-00-00','2001-01-00','92.20'),
 ('11075','RICSU','8','0000-00-00','2001-01-00','30.95'),
 ('11076','BONAP','4','0000-00-00','2001-01-00','191.40'),
 ('11077','RATTC','1','0000-00-00','2001-01-00','42.65');
/*!40000 ALTER TABLE `commandes` ENABLE KEYS */;

--
-- Table new structure for table `northwind`.`commandes`
--

UPDATE commandes SET DATE_COMMANDE='2013-05-04', DATE_ENVOI='2013-05-16' WHERE NO_COMMANDE=10248;
UPDATE commandes SET DATE_COMMANDE='2013-05-05', DATE_ENVOI='2013-05-10' WHERE NO_COMMANDE=10249;
UPDATE commandes SET DATE_COMMANDE='2013-05-08', DATE_ENVOI='2013-05-12' WHERE NO_COMMANDE=10250;
UPDATE commandes SET DATE_COMMANDE='2013-05-08', DATE_ENVOI='2013-05-15' WHERE NO_COMMANDE=10251;
UPDATE commandes SET DATE_COMMANDE='2013-05-09', DATE_ENVOI='2013-05-11' WHERE NO_COMMANDE=10252;
UPDATE commandes SET DATE_COMMANDE='2013-05-10', DATE_ENVOI='2013-05-16' WHERE NO_COMMANDE=10253;
UPDATE commandes SET DATE_COMMANDE='2013-05-11', DATE_ENVOI='2013-05-23' WHERE NO_COMMANDE=10254;
UPDATE commandes SET DATE_COMMANDE='2013-05-12', DATE_ENVOI='2013-05-15' WHERE NO_COMMANDE=10255;
UPDATE commandes SET DATE_COMMANDE='2013-05-15', DATE_ENVOI='2013-05-17' WHERE NO_COMMANDE=10256;
UPDATE commandes SET DATE_COMMANDE='2013-05-16', DATE_ENVOI='2013-05-22' WHERE NO_COMMANDE=10257;
UPDATE commandes SET DATE_COMMANDE='2013-05-17', DATE_ENVOI='2013-05-23' WHERE NO_COMMANDE=10258;
UPDATE commandes SET DATE_COMMANDE='2013-05-18', DATE_ENVOI='2013-05-25' WHERE NO_COMMANDE=10259;
UPDATE commandes SET DATE_COMMANDE='2013-05-19', DATE_ENVOI='2013-05-29' WHERE NO_COMMANDE=10260;
UPDATE commandes SET DATE_COMMANDE='2013-05-19', DATE_ENVOI='2013-05-30' WHERE NO_COMMANDE=10261;
UPDATE commandes SET DATE_COMMANDE='2013-05-22', DATE_ENVOI='2013-05-25' WHERE NO_COMMANDE=10262;
UPDATE commandes SET DATE_COMMANDE='2013-05-23', DATE_ENVOI='2013-05-31' WHERE NO_COMMANDE=10263;
UPDATE commandes SET DATE_COMMANDE='2013-05-24', DATE_ENVOI='2013-06-23' WHERE NO_COMMANDE=10264;
UPDATE commandes SET DATE_COMMANDE='2013-05-25', DATE_ENVOI='2013-06-12' WHERE NO_COMMANDE=10265;
UPDATE commandes SET DATE_COMMANDE='2013-05-26', DATE_ENVOI='2013-05-31' WHERE NO_COMMANDE=10266;
UPDATE commandes SET DATE_COMMANDE='2013-05-29', DATE_ENVOI='2013-06-06' WHERE NO_COMMANDE=10267;
UPDATE commandes SET DATE_COMMANDE='2013-05-30', DATE_ENVOI='2013-06-02' WHERE NO_COMMANDE=10268;
UPDATE commandes SET DATE_COMMANDE='2013-05-31', DATE_ENVOI='2013-06-09' WHERE NO_COMMANDE=10269;
UPDATE commandes SET DATE_COMMANDE='2013-06-01', DATE_ENVOI='2013-06-02' WHERE NO_COMMANDE=10270;
UPDATE commandes SET DATE_COMMANDE='2013-06-01', DATE_ENVOI='2013-06-30' WHERE NO_COMMANDE=10271;
UPDATE commandes SET DATE_COMMANDE='2013-06-02', DATE_ENVOI='2013-06-06' WHERE NO_COMMANDE=10272;
UPDATE commandes SET DATE_COMMANDE='2013-06-05', DATE_ENVOI='2013-06-12' WHERE NO_COMMANDE=10273;
UPDATE commandes SET DATE_COMMANDE='2013-06-06', DATE_ENVOI='2013-06-16' WHERE NO_COMMANDE=10274;
UPDATE commandes SET DATE_COMMANDE='2013-06-07', DATE_ENVOI='2013-06-09' WHERE NO_COMMANDE=10275;
UPDATE commandes SET DATE_COMMANDE='2013-06-08', DATE_ENVOI='2013-06-14' WHERE NO_COMMANDE=10276;
UPDATE commandes SET DATE_COMMANDE='2013-06-09', DATE_ENVOI='2013-06-13' WHERE NO_COMMANDE=10277;
UPDATE commandes SET DATE_COMMANDE='2013-06-12', DATE_ENVOI='2013-06-16' WHERE NO_COMMANDE=10278;
UPDATE commandes SET DATE_COMMANDE='2013-06-13', DATE_ENVOI='2013-06-16' WHERE NO_COMMANDE=10279;
UPDATE commandes SET DATE_COMMANDE='2013-06-14', DATE_ENVOI='2013-07-13' WHERE NO_COMMANDE=10280;
UPDATE commandes SET DATE_COMMANDE='2013-06-14', DATE_ENVOI='2013-06-21' WHERE NO_COMMANDE=10281;
UPDATE commandes SET DATE_COMMANDE='2013-06-15', DATE_ENVOI='2013-06-21' WHERE NO_COMMANDE=10282;
UPDATE commandes SET DATE_COMMANDE='2013-06-16', DATE_ENVOI='2013-06-23' WHERE NO_COMMANDE=10283;
UPDATE commandes SET DATE_COMMANDE='2013-06-19', DATE_ENVOI='2013-06-27' WHERE NO_COMMANDE=10284;
UPDATE commandes SET DATE_COMMANDE='2013-06-20', DATE_ENVOI='2013-06-26' WHERE NO_COMMANDE=10285;
UPDATE commandes SET DATE_COMMANDE='2013-06-21', DATE_ENVOI='2013-06-30' WHERE NO_COMMANDE=10286;
UPDATE commandes SET DATE_COMMANDE='2013-06-22', DATE_ENVOI='2013-06-28' WHERE NO_COMMANDE=10287;
UPDATE commandes SET DATE_COMMANDE='2013-06-23', DATE_ENVOI='2013-07-04' WHERE NO_COMMANDE=10288;
UPDATE commandes SET DATE_COMMANDE='2013-06-26', DATE_ENVOI='2013-06-28' WHERE NO_COMMANDE=10289;
UPDATE commandes SET DATE_COMMANDE='2013-06-27', DATE_ENVOI='2013-07-04' WHERE NO_COMMANDE=10290;
UPDATE commandes SET DATE_COMMANDE='2013-06-27', DATE_ENVOI='2013-07-05' WHERE NO_COMMANDE=10291;
UPDATE commandes SET DATE_COMMANDE='2013-06-28', DATE_ENVOI='2013-07-03' WHERE NO_COMMANDE=10292;
UPDATE commandes SET DATE_COMMANDE='2013-06-29', DATE_ENVOI='2013-07-12' WHERE NO_COMMANDE=10293;
UPDATE commandes SET DATE_COMMANDE='2013-06-30', DATE_ENVOI='2013-07-06' WHERE NO_COMMANDE=10294;
UPDATE commandes SET DATE_COMMANDE='2013-07-03', DATE_ENVOI='2013-07-11' WHERE NO_COMMANDE=10295;
UPDATE commandes SET DATE_COMMANDE='2013-07-04', DATE_ENVOI='2013-07-12' WHERE NO_COMMANDE=10296;
UPDATE commandes SET DATE_COMMANDE='2013-07-05', DATE_ENVOI='2013-07-11' WHERE NO_COMMANDE=10297;
UPDATE commandes SET DATE_COMMANDE='2013-07-06', DATE_ENVOI='2013-07-12' WHERE NO_COMMANDE=10298;
UPDATE commandes SET DATE_COMMANDE='2013-07-07', DATE_ENVOI='2013-07-14' WHERE NO_COMMANDE=10299;
UPDATE commandes SET DATE_COMMANDE='2013-07-10', DATE_ENVOI='2013-07-19' WHERE NO_COMMANDE=10300;
UPDATE commandes SET DATE_COMMANDE='2013-07-10', DATE_ENVOI='2013-07-18' WHERE NO_COMMANDE=10301;
UPDATE commandes SET DATE_COMMANDE='2013-07-11', DATE_ENVOI='2013-08-09' WHERE NO_COMMANDE=10302;
UPDATE commandes SET DATE_COMMANDE='2013-07-12', DATE_ENVOI='2013-07-19' WHERE NO_COMMANDE=10303;
UPDATE commandes SET DATE_COMMANDE='2013-07-13', DATE_ENVOI='2013-07-18' WHERE NO_COMMANDE=10304;
UPDATE commandes SET DATE_COMMANDE='2013-07-14', DATE_ENVOI='2013-08-09' WHERE NO_COMMANDE=10305;
UPDATE commandes SET DATE_COMMANDE='2013-07-17', DATE_ENVOI='2013-07-24' WHERE NO_COMMANDE=10306;
UPDATE commandes SET DATE_COMMANDE='2013-07-18', DATE_ENVOI='2013-07-26' WHERE NO_COMMANDE=10307;
UPDATE commandes SET DATE_COMMANDE='2013-07-19', DATE_ENVOI='2013-07-25' WHERE NO_COMMANDE=10308;
UPDATE commandes SET DATE_COMMANDE='2013-07-20', DATE_ENVOI='2013-08-23' WHERE NO_COMMANDE=10309;
UPDATE commandes SET DATE_COMMANDE='2013-07-21', DATE_ENVOI='2013-07-28' WHERE NO_COMMANDE=10310;
UPDATE commandes SET DATE_COMMANDE='2013-07-21', DATE_ENVOI='2013-07-27' WHERE NO_COMMANDE=10311;
UPDATE commandes SET DATE_COMMANDE='2013-07-24', DATE_ENVOI='2013-08-03' WHERE NO_COMMANDE=10312;
UPDATE commandes SET DATE_COMMANDE='2013-07-25', DATE_ENVOI='2013-08-04' WHERE NO_COMMANDE=10313;
UPDATE commandes SET DATE_COMMANDE='2013-07-26', DATE_ENVOI='2013-08-04' WHERE NO_COMMANDE=10314;
UPDATE commandes SET DATE_COMMANDE='2013-07-27', DATE_ENVOI='2013-08-03' WHERE NO_COMMANDE=10315;
UPDATE commandes SET DATE_COMMANDE='2013-07-28', DATE_ENVOI='2013-08-08' WHERE NO_COMMANDE=10316;
UPDATE commandes SET DATE_COMMANDE='2013-07-31', DATE_ENVOI='2013-08-10' WHERE NO_COMMANDE=10317;
UPDATE commandes SET DATE_COMMANDE='2013-08-01', DATE_ENVOI='2013-08-04' WHERE NO_COMMANDE=10318;
UPDATE commandes SET DATE_COMMANDE='2013-08-02', DATE_ENVOI='2013-08-11' WHERE NO_COMMANDE=10319;
UPDATE commandes SET DATE_COMMANDE='2013-08-03', DATE_ENVOI='2013-08-18' WHERE NO_COMMANDE=10320;
UPDATE commandes SET DATE_COMMANDE='2013-08-03', DATE_ENVOI='2013-08-11' WHERE NO_COMMANDE=10321;
UPDATE commandes SET DATE_COMMANDE='2013-08-04', DATE_ENVOI='2013-08-23' WHERE NO_COMMANDE=10322;
UPDATE commandes SET DATE_COMMANDE='2013-08-07', DATE_ENVOI='2013-08-14' WHERE NO_COMMANDE=10323;
UPDATE commandes SET DATE_COMMANDE='2013-08-08', DATE_ENVOI='2013-08-10' WHERE NO_COMMANDE=10324;
UPDATE commandes SET DATE_COMMANDE='2013-08-09', DATE_ENVOI='2013-08-14' WHERE NO_COMMANDE=10325;
UPDATE commandes SET DATE_COMMANDE='2013-08-10', DATE_ENVOI='2013-08-14' WHERE NO_COMMANDE=10326;
UPDATE commandes SET DATE_COMMANDE='2013-08-11', DATE_ENVOI='2013-08-14' WHERE NO_COMMANDE=10327;
UPDATE commandes SET DATE_COMMANDE='2013-08-14', DATE_ENVOI='2013-08-17' WHERE NO_COMMANDE=10328;
UPDATE commandes SET DATE_COMMANDE='2013-08-15', DATE_ENVOI='2013-08-23' WHERE NO_COMMANDE=10329;
UPDATE commandes SET DATE_COMMANDE='2013-08-16', DATE_ENVOI='2013-08-28' WHERE NO_COMMANDE=10330;
UPDATE commandes SET DATE_COMMANDE='2013-08-16', DATE_ENVOI='2013-08-21' WHERE NO_COMMANDE=10331;
UPDATE commandes SET DATE_COMMANDE='2013-08-17', DATE_ENVOI='2013-08-21' WHERE NO_COMMANDE=10332;
UPDATE commandes SET DATE_COMMANDE='2013-08-18', DATE_ENVOI='2013-08-25' WHERE NO_COMMANDE=10333;
UPDATE commandes SET DATE_COMMANDE='2013-08-21', DATE_ENVOI='2013-08-28' WHERE NO_COMMANDE=10334;
UPDATE commandes SET DATE_COMMANDE='2013-08-22', DATE_ENVOI='2013-08-24' WHERE NO_COMMANDE=10335;
UPDATE commandes SET DATE_COMMANDE='2013-08-23', DATE_ENVOI='2013-08-25' WHERE NO_COMMANDE=10336;
UPDATE commandes SET DATE_COMMANDE='2013-08-24', DATE_ENVOI='2013-08-29' WHERE NO_COMMANDE=10337;
UPDATE commandes SET DATE_COMMANDE='2013-08-25', DATE_ENVOI='2013-08-29' WHERE NO_COMMANDE=10338;
UPDATE commandes SET DATE_COMMANDE='2013-08-28', DATE_ENVOI='2013-09-04' WHERE NO_COMMANDE=10339;
UPDATE commandes SET DATE_COMMANDE='2013-08-29', DATE_ENVOI='2013-09-08' WHERE NO_COMMANDE=10340;
UPDATE commandes SET DATE_COMMANDE='2013-08-29', DATE_ENVOI='2013-09-05' WHERE NO_COMMANDE=10341;
UPDATE commandes SET DATE_COMMANDE='2013-08-30', DATE_ENVOI='2013-09-04' WHERE NO_COMMANDE=10342;
UPDATE commandes SET DATE_COMMANDE='2013-08-31', DATE_ENVOI='2013-09-06' WHERE NO_COMMANDE=10343;
UPDATE commandes SET DATE_COMMANDE='2013-09-01', DATE_ENVOI='2013-09-05' WHERE NO_COMMANDE=10344;
UPDATE commandes SET DATE_COMMANDE='2013-09-04', DATE_ENVOI='2013-09-11' WHERE NO_COMMANDE=10345;
UPDATE commandes SET DATE_COMMANDE='2013-09-05', DATE_ENVOI='2013-09-08' WHERE NO_COMMANDE=10346;
UPDATE commandes SET DATE_COMMANDE='2013-09-06', DATE_ENVOI='2013-09-08' WHERE NO_COMMANDE=10347;
UPDATE commandes SET DATE_COMMANDE='2013-09-07', DATE_ENVOI='2013-09-15' WHERE NO_COMMANDE=10348;
UPDATE commandes SET DATE_COMMANDE='2013-09-08', DATE_ENVOI='2013-09-15' WHERE NO_COMMANDE=10349;
UPDATE commandes SET DATE_COMMANDE='2013-09-11', DATE_ENVOI='2013-10-03' WHERE NO_COMMANDE=10350;
UPDATE commandes SET DATE_COMMANDE='2013-09-11', DATE_ENVOI='2013-09-20' WHERE NO_COMMANDE=10351;
UPDATE commandes SET DATE_COMMANDE='2013-09-12', DATE_ENVOI='2013-09-18' WHERE NO_COMMANDE=10352;
UPDATE commandes SET DATE_COMMANDE='2013-09-13', DATE_ENVOI='2013-09-25' WHERE NO_COMMANDE=10353;
UPDATE commandes SET DATE_COMMANDE='2013-09-14', DATE_ENVOI='2013-09-20' WHERE NO_COMMANDE=10354;
UPDATE commandes SET DATE_COMMANDE='2013-09-15', DATE_ENVOI='2013-09-20' WHERE NO_COMMANDE=10355;
UPDATE commandes SET DATE_COMMANDE='2013-09-18', DATE_ENVOI='2013-09-27' WHERE NO_COMMANDE=10356;
UPDATE commandes SET DATE_COMMANDE='2013-09-19', DATE_ENVOI='2013-10-02' WHERE NO_COMMANDE=10357;
UPDATE commandes SET DATE_COMMANDE='2013-09-20', DATE_ENVOI='2013-09-27' WHERE NO_COMMANDE=10358;
UPDATE commandes SET DATE_COMMANDE='2013-09-21', DATE_ENVOI='2013-09-26' WHERE NO_COMMANDE=10359;
UPDATE commandes SET DATE_COMMANDE='2013-09-22', DATE_ENVOI='2013-10-02' WHERE NO_COMMANDE=10360;
UPDATE commandes SET DATE_COMMANDE='2013-09-22', DATE_ENVOI='2013-10-03' WHERE NO_COMMANDE=10361;
UPDATE commandes SET DATE_COMMANDE='2013-09-25', DATE_ENVOI='2013-09-28' WHERE NO_COMMANDE=10362;
UPDATE commandes SET DATE_COMMANDE='2013-09-26', DATE_ENVOI='2013-10-04' WHERE NO_COMMANDE=10363;
UPDATE commandes SET DATE_COMMANDE='2013-09-26', DATE_ENVOI='2013-10-04' WHERE NO_COMMANDE=10364;
UPDATE commandes SET DATE_COMMANDE='2013-09-27', DATE_ENVOI='2013-10-02' WHERE NO_COMMANDE=10365;
UPDATE commandes SET DATE_COMMANDE='2013-09-28', DATE_ENVOI='2013-10-30' WHERE NO_COMMANDE=10366;
UPDATE commandes SET DATE_COMMANDE='2013-09-28', DATE_ENVOI='2013-10-02' WHERE NO_COMMANDE=10367;
UPDATE commandes SET DATE_COMMANDE='2013-09-29', DATE_ENVOI='2013-10-02' WHERE NO_COMMANDE=10368;
UPDATE commandes SET DATE_COMMANDE='2013-10-02', DATE_ENVOI='2013-10-09' WHERE NO_COMMANDE=10369;
UPDATE commandes SET DATE_COMMANDE='2013-10-03', DATE_ENVOI='2013-10-27' WHERE NO_COMMANDE=10370;
UPDATE commandes SET DATE_COMMANDE='2013-10-03', DATE_ENVOI='2013-10-24' WHERE NO_COMMANDE=10371;
UPDATE commandes SET DATE_COMMANDE='2013-10-04', DATE_ENVOI='2013-10-09' WHERE NO_COMMANDE=10372;
UPDATE commandes SET DATE_COMMANDE='2013-10-05', DATE_ENVOI='2013-10-11' WHERE NO_COMMANDE=10373;
UPDATE commandes SET DATE_COMMANDE='2013-10-05', DATE_ENVOI='2013-10-09' WHERE NO_COMMANDE=10374;
UPDATE commandes SET DATE_COMMANDE='2013-10-06', DATE_ENVOI='2013-10-09' WHERE NO_COMMANDE=10375;
UPDATE commandes SET DATE_COMMANDE='2013-10-09', DATE_ENVOI='2013-10-13' WHERE NO_COMMANDE=10376;
UPDATE commandes SET DATE_COMMANDE='2013-10-09', DATE_ENVOI='2013-10-13' WHERE NO_COMMANDE=10377;
UPDATE commandes SET DATE_COMMANDE='2013-10-10', DATE_ENVOI='2013-10-19' WHERE NO_COMMANDE=10378;
UPDATE commandes SET DATE_COMMANDE='2013-10-11', DATE_ENVOI='2013-10-13' WHERE NO_COMMANDE=10379;
UPDATE commandes SET DATE_COMMANDE='2013-10-12', DATE_ENVOI='2013-11-16' WHERE NO_COMMANDE=10380;
UPDATE commandes SET DATE_COMMANDE='2013-10-12', DATE_ENVOI='2013-10-13' WHERE NO_COMMANDE=10381;
UPDATE commandes SET DATE_COMMANDE='2013-10-13', DATE_ENVOI='2013-10-16' WHERE NO_COMMANDE=10382;
UPDATE commandes SET DATE_COMMANDE='2013-10-16', DATE_ENVOI='2013-10-18' WHERE NO_COMMANDE=10383;
UPDATE commandes SET DATE_COMMANDE='2013-10-16', DATE_ENVOI='2013-10-20' WHERE NO_COMMANDE=10384;
UPDATE commandes SET DATE_COMMANDE='2013-10-17', DATE_ENVOI='2013-10-23' WHERE NO_COMMANDE=10385;
UPDATE commandes SET DATE_COMMANDE='2013-10-18', DATE_ENVOI='2013-10-25' WHERE NO_COMMANDE=10386;
UPDATE commandes SET DATE_COMMANDE='2013-10-18', DATE_ENVOI='2013-10-20' WHERE NO_COMMANDE=10387;
UPDATE commandes SET DATE_COMMANDE='2013-10-19', DATE_ENVOI='2013-10-20' WHERE NO_COMMANDE=10388;
UPDATE commandes SET DATE_COMMANDE='2013-10-20', DATE_ENVOI='2013-10-24' WHERE NO_COMMANDE=10389;
UPDATE commandes SET DATE_COMMANDE='2013-10-23', DATE_ENVOI='2013-10-26' WHERE NO_COMMANDE=10390;
UPDATE commandes SET DATE_COMMANDE='2013-10-23', DATE_ENVOI='2013-10-31' WHERE NO_COMMANDE=10391;
UPDATE commandes SET DATE_COMMANDE='2013-10-24', DATE_ENVOI='2013-11-01' WHERE NO_COMMANDE=10392;
UPDATE commandes SET DATE_COMMANDE='2013-10-25', DATE_ENVOI='2013-11-03' WHERE NO_COMMANDE=10393;
UPDATE commandes SET DATE_COMMANDE='2013-10-25', DATE_ENVOI='2013-11-03' WHERE NO_COMMANDE=10394;
UPDATE commandes SET DATE_COMMANDE='2013-10-26', DATE_ENVOI='2013-11-03' WHERE NO_COMMANDE=10395;
UPDATE commandes SET DATE_COMMANDE='2013-10-27', DATE_ENVOI='2013-11-06' WHERE NO_COMMANDE=10396;
UPDATE commandes SET DATE_COMMANDE='2013-10-27', DATE_ENVOI='2013-11-02' WHERE NO_COMMANDE=10397;
UPDATE commandes SET DATE_COMMANDE='2013-10-30', DATE_ENVOI='2013-11-09' WHERE NO_COMMANDE=10398;
UPDATE commandes SET DATE_COMMANDE='2013-10-31', DATE_ENVOI='2013-11-08' WHERE NO_COMMANDE=10399;
UPDATE commandes SET DATE_COMMANDE='2013-11-01', DATE_ENVOI='2013-11-16' WHERE NO_COMMANDE=10400;
UPDATE commandes SET DATE_COMMANDE='2013-11-01', DATE_ENVOI='2013-11-10' WHERE NO_COMMANDE=10401;
UPDATE commandes SET DATE_COMMANDE='2013-11-02', DATE_ENVOI='2013-11-10' WHERE NO_COMMANDE=10402;
UPDATE commandes SET DATE_COMMANDE='2013-11-03', DATE_ENVOI='2013-11-09' WHERE NO_COMMANDE=10403;
UPDATE commandes SET DATE_COMMANDE='2013-11-03', DATE_ENVOI='2013-11-08' WHERE NO_COMMANDE=10404;
UPDATE commandes SET DATE_COMMANDE='2013-11-06', DATE_ENVOI='2013-11-22' WHERE NO_COMMANDE=10405;
UPDATE commandes SET DATE_COMMANDE='2013-11-07', DATE_ENVOI='2013-11-13' WHERE NO_COMMANDE=10406;
UPDATE commandes SET DATE_COMMANDE='2013-11-07', DATE_ENVOI='2013-11-30' WHERE NO_COMMANDE=10407;
UPDATE commandes SET DATE_COMMANDE='2013-11-08', DATE_ENVOI='2013-11-14' WHERE NO_COMMANDE=10408;
UPDATE commandes SET DATE_COMMANDE='2013-11-09', DATE_ENVOI='2013-11-14' WHERE NO_COMMANDE=10409;
UPDATE commandes SET DATE_COMMANDE='2013-11-10', DATE_ENVOI='2013-11-15' WHERE NO_COMMANDE=10410;
UPDATE commandes SET DATE_COMMANDE='2013-11-10', DATE_ENVOI='2013-11-21' WHERE NO_COMMANDE=10411;
UPDATE commandes SET DATE_COMMANDE='2013-11-13', DATE_ENVOI='2013-11-15' WHERE NO_COMMANDE=10412;
UPDATE commandes SET DATE_COMMANDE='2013-11-14', DATE_ENVOI='2013-11-16' WHERE NO_COMMANDE=10413;
UPDATE commandes SET DATE_COMMANDE='2013-11-14', DATE_ENVOI='2013-11-17' WHERE NO_COMMANDE=10414;
UPDATE commandes SET DATE_COMMANDE='2013-11-15', DATE_ENVOI='2013-11-24' WHERE NO_COMMANDE=10415;
UPDATE commandes SET DATE_COMMANDE='2013-11-16', DATE_ENVOI='2013-11-27' WHERE NO_COMMANDE=10416;
UPDATE commandes SET DATE_COMMANDE='2013-11-16', DATE_ENVOI='2013-11-28' WHERE NO_COMMANDE=10417;
UPDATE commandes SET DATE_COMMANDE='2013-11-17', DATE_ENVOI='2013-11-24' WHERE NO_COMMANDE=10418;
UPDATE commandes SET DATE_COMMANDE='2013-11-20', DATE_ENVOI='2013-11-30' WHERE NO_COMMANDE=10419;
UPDATE commandes SET DATE_COMMANDE='2013-11-21', DATE_ENVOI='2013-11-27' WHERE NO_COMMANDE=10420;
UPDATE commandes SET DATE_COMMANDE='2013-11-21', DATE_ENVOI='2013-11-27' WHERE NO_COMMANDE=10421;
UPDATE commandes SET DATE_COMMANDE='2013-11-22', DATE_ENVOI='2013-12-01' WHERE NO_COMMANDE=10422;
UPDATE commandes SET DATE_COMMANDE='2013-11-23', DATE_ENVOI='2013-12-25' WHERE NO_COMMANDE=10423;
UPDATE commandes SET DATE_COMMANDE='2013-11-23', DATE_ENVOI='2013-11-27' WHERE NO_COMMANDE=10424;
UPDATE commandes SET DATE_COMMANDE='2013-11-24', DATE_ENVOI='2013-12-15' WHERE NO_COMMANDE=10425;
UPDATE commandes SET DATE_COMMANDE='2013-11-27', DATE_ENVOI='2013-12-07' WHERE NO_COMMANDE=10426;
UPDATE commandes SET DATE_COMMANDE='2013-11-27', DATE_ENVOI='2014-01-01' WHERE NO_COMMANDE=10427;
UPDATE commandes SET DATE_COMMANDE='2013-11-28', DATE_ENVOI='2013-12-05' WHERE NO_COMMANDE=10428;
UPDATE commandes SET DATE_COMMANDE='2013-11-29', DATE_ENVOI='2013-12-08' WHERE NO_COMMANDE=10429;
UPDATE commandes SET DATE_COMMANDE='2013-11-30', DATE_ENVOI='2013-12-04' WHERE NO_COMMANDE=10430;
UPDATE commandes SET DATE_COMMANDE='2013-11-30', DATE_ENVOI='2013-12-08' WHERE NO_COMMANDE=10431;
UPDATE commandes SET DATE_COMMANDE='2013-12-01', DATE_ENVOI='2013-12-08' WHERE NO_COMMANDE=10432;
UPDATE commandes SET DATE_COMMANDE='2013-12-04', DATE_ENVOI='2014-01-02' WHERE NO_COMMANDE=10433;
UPDATE commandes SET DATE_COMMANDE='2013-12-04', DATE_ENVOI='2013-12-14' WHERE NO_COMMANDE=10434;
UPDATE commandes SET DATE_COMMANDE='2013-12-05', DATE_ENVOI='2013-12-08' WHERE NO_COMMANDE=10435;
UPDATE commandes SET DATE_COMMANDE='2013-12-06', DATE_ENVOI='2013-12-12' WHERE NO_COMMANDE=10436;
UPDATE commandes SET DATE_COMMANDE='2013-12-06', DATE_ENVOI='2013-12-13' WHERE NO_COMMANDE=10437;
UPDATE commandes SET DATE_COMMANDE='2013-12-07', DATE_ENVOI='2013-12-15' WHERE NO_COMMANDE=10438;
UPDATE commandes SET DATE_COMMANDE='2013-12-08', DATE_ENVOI='2013-12-11' WHERE NO_COMMANDE=10439;
UPDATE commandes SET DATE_COMMANDE='2013-12-11', DATE_ENVOI='2013-12-29' WHERE NO_COMMANDE=10440;
UPDATE commandes SET DATE_COMMANDE='2013-12-11', DATE_ENVOI='2014-01-12' WHERE NO_COMMANDE=10441;
UPDATE commandes SET DATE_COMMANDE='2013-12-12', DATE_ENVOI='2013-12-19' WHERE NO_COMMANDE=10442;
UPDATE commandes SET DATE_COMMANDE='2013-12-13', DATE_ENVOI='2013-12-15' WHERE NO_COMMANDE=10443;
UPDATE commandes SET DATE_COMMANDE='2013-12-13', DATE_ENVOI='2013-12-22' WHERE NO_COMMANDE=10444;
UPDATE commandes SET DATE_COMMANDE='2013-12-14', DATE_ENVOI='2013-12-21' WHERE NO_COMMANDE=10445;
UPDATE commandes SET DATE_COMMANDE='2013-12-15', DATE_ENVOI='2013-12-20' WHERE NO_COMMANDE=10446;
UPDATE commandes SET DATE_COMMANDE='2013-12-15', DATE_ENVOI='2014-01-05' WHERE NO_COMMANDE=10447;
UPDATE commandes SET DATE_COMMANDE='2013-12-18', DATE_ENVOI='2013-12-25' WHERE NO_COMMANDE=10448;
UPDATE commandes SET DATE_COMMANDE='2013-12-19', DATE_ENVOI='2013-12-28' WHERE NO_COMMANDE=10449;
UPDATE commandes SET DATE_COMMANDE='2013-12-20', DATE_ENVOI='2014-01-09' WHERE NO_COMMANDE=10450;
UPDATE commandes SET DATE_COMMANDE='2013-12-20', DATE_ENVOI='2014-01-10' WHERE NO_COMMANDE=10451;
UPDATE commandes SET DATE_COMMANDE='2013-12-21', DATE_ENVOI='2013-12-27' WHERE NO_COMMANDE=10452;
UPDATE commandes SET DATE_COMMANDE='2013-12-22', DATE_ENVOI='2013-12-27' WHERE NO_COMMANDE=10453;
UPDATE commandes SET DATE_COMMANDE='2013-12-22', DATE_ENVOI='2013-12-26' WHERE NO_COMMANDE=10454;
UPDATE commandes SET DATE_COMMANDE='2013-12-25', DATE_ENVOI='2014-01-01' WHERE NO_COMMANDE=10455;
UPDATE commandes SET DATE_COMMANDE='2013-12-26', DATE_ENVOI='2013-12-29' WHERE NO_COMMANDE=10456;
UPDATE commandes SET DATE_COMMANDE='2013-12-26', DATE_ENVOI='2014-01-01' WHERE NO_COMMANDE=10457;
UPDATE commandes SET DATE_COMMANDE='2013-12-27', DATE_ENVOI='2014-01-02' WHERE NO_COMMANDE=10458;
UPDATE commandes SET DATE_COMMANDE='2013-12-28', DATE_ENVOI='2013-12-29' WHERE NO_COMMANDE=10459;
UPDATE commandes SET DATE_COMMANDE='2013-12-29', DATE_ENVOI='2014-01-01' WHERE NO_COMMANDE=10460;
UPDATE commandes SET DATE_COMMANDE='2013-12-29', DATE_ENVOI='2014-01-03' WHERE NO_COMMANDE=10461;
UPDATE commandes SET DATE_COMMANDE='2014-01-01', DATE_ENVOI='2014-01-16' WHERE NO_COMMANDE=10462;
UPDATE commandes SET DATE_COMMANDE='2014-01-02', DATE_ENVOI='2014-01-04' WHERE NO_COMMANDE=10463;
UPDATE commandes SET DATE_COMMANDE='2014-01-02', DATE_ENVOI='2014-01-12' WHERE NO_COMMANDE=10464;
UPDATE commandes SET DATE_COMMANDE='2014-01-03', DATE_ENVOI='2014-01-12' WHERE NO_COMMANDE=10465;
UPDATE commandes SET DATE_COMMANDE='2014-01-04', DATE_ENVOI='2014-01-11' WHERE NO_COMMANDE=10466;
UPDATE commandes SET DATE_COMMANDE='2014-01-04', DATE_ENVOI='2014-01-09' WHERE NO_COMMANDE=10467;
UPDATE commandes SET DATE_COMMANDE='2014-01-05', DATE_ENVOI='2014-01-10' WHERE NO_COMMANDE=10468;
UPDATE commandes SET DATE_COMMANDE='2014-01-08', DATE_ENVOI='2014-01-12' WHERE NO_COMMANDE=10469;
UPDATE commandes SET DATE_COMMANDE='2014-01-09', DATE_ENVOI='2014-01-12' WHERE NO_COMMANDE=10470;
UPDATE commandes SET DATE_COMMANDE='2014-01-09', DATE_ENVOI='2014-01-16' WHERE NO_COMMANDE=10471;
UPDATE commandes SET DATE_COMMANDE='2014-01-10', DATE_ENVOI='2014-01-17' WHERE NO_COMMANDE=10472;
UPDATE commandes SET DATE_COMMANDE='2014-01-11', DATE_ENVOI='2014-01-19' WHERE NO_COMMANDE=10473;
UPDATE commandes SET DATE_COMMANDE='2014-01-11', DATE_ENVOI='2014-01-19' WHERE NO_COMMANDE=10474;
UPDATE commandes SET DATE_COMMANDE='2014-01-12', DATE_ENVOI='2014-02-02' WHERE NO_COMMANDE=10475;
UPDATE commandes SET DATE_COMMANDE='2014-01-15', DATE_ENVOI='2014-01-22' WHERE NO_COMMANDE=10476;
UPDATE commandes SET DATE_COMMANDE='2014-01-15', DATE_ENVOI='2014-01-23' WHERE NO_COMMANDE=10477;
UPDATE commandes SET DATE_COMMANDE='2014-01-16', DATE_ENVOI='2014-01-24' WHERE NO_COMMANDE=10478;
UPDATE commandes SET DATE_COMMANDE='2014-01-17', DATE_ENVOI='2014-01-19' WHERE NO_COMMANDE=10479;
UPDATE commandes SET DATE_COMMANDE='2014-01-18', DATE_ENVOI='2014-01-22' WHERE NO_COMMANDE=10480;
UPDATE commandes SET DATE_COMMANDE='2014-01-18', DATE_ENVOI='2014-01-23' WHERE NO_COMMANDE=10481;
UPDATE commandes SET DATE_COMMANDE='2014-01-19', DATE_ENVOI='2014-02-08' WHERE NO_COMMANDE=10482;
UPDATE commandes SET DATE_COMMANDE='2014-01-22', DATE_ENVOI='2014-02-23' WHERE NO_COMMANDE=10483;
UPDATE commandes SET DATE_COMMANDE='2014-01-22', DATE_ENVOI='2014-01-30' WHERE NO_COMMANDE=10484;
UPDATE commandes SET DATE_COMMANDE='2014-01-23', DATE_ENVOI='2014-01-29' WHERE NO_COMMANDE=10485;
UPDATE commandes SET DATE_COMMANDE='2014-01-24', DATE_ENVOI='2014-01-31' WHERE NO_COMMANDE=10486;
UPDATE commandes SET DATE_COMMANDE='2014-01-24', DATE_ENVOI='2014-01-26' WHERE NO_COMMANDE=10487;
UPDATE commandes SET DATE_COMMANDE='2014-01-25', DATE_ENVOI='2014-01-31' WHERE NO_COMMANDE=10488;
UPDATE commandes SET DATE_COMMANDE='2014-01-26', DATE_ENVOI='2014-02-07' WHERE NO_COMMANDE=10489;
UPDATE commandes SET DATE_COMMANDE='2014-01-29', DATE_ENVOI='2014-02-01' WHERE NO_COMMANDE=10490;
UPDATE commandes SET DATE_COMMANDE='2014-01-29', DATE_ENVOI='2014-02-06' WHERE NO_COMMANDE=10491;
UPDATE commandes SET DATE_COMMANDE='2014-01-30', DATE_ENVOI='2014-02-09' WHERE NO_COMMANDE=10492;
UPDATE commandes SET DATE_COMMANDE='2014-01-31', DATE_ENVOI='2014-02-08' WHERE NO_COMMANDE=10493;
UPDATE commandes SET DATE_COMMANDE='2014-01-31', DATE_ENVOI='2014-02-07' WHERE NO_COMMANDE=10494;
UPDATE commandes SET DATE_COMMANDE='2014-02-01', DATE_ENVOI='2014-02-09' WHERE NO_COMMANDE=10495;
UPDATE commandes SET DATE_COMMANDE='2014-02-02', DATE_ENVOI='2014-02-05' WHERE NO_COMMANDE=10496;
UPDATE commandes SET DATE_COMMANDE='2014-02-02', DATE_ENVOI='2014-02-05' WHERE NO_COMMANDE=10497;
UPDATE commandes SET DATE_COMMANDE='2014-02-05', DATE_ENVOI='2014-02-09' WHERE NO_COMMANDE=10498;
UPDATE commandes SET DATE_COMMANDE='2014-02-06', DATE_ENVOI='2014-02-14' WHERE NO_COMMANDE=10499;
UPDATE commandes SET DATE_COMMANDE='2014-02-07', DATE_ENVOI='2014-02-15' WHERE NO_COMMANDE=10500;
UPDATE commandes SET DATE_COMMANDE='2014-02-07', DATE_ENVOI='2014-02-14' WHERE NO_COMMANDE=10501;
UPDATE commandes SET DATE_COMMANDE='2014-02-08', DATE_ENVOI='2014-02-27' WHERE NO_COMMANDE=10502;
UPDATE commandes SET DATE_COMMANDE='2014-02-09', DATE_ENVOI='2014-02-14' WHERE NO_COMMANDE=10503;
UPDATE commandes SET DATE_COMMANDE='2014-02-09', DATE_ENVOI='2014-02-16' WHERE NO_COMMANDE=10504;
UPDATE commandes SET DATE_COMMANDE='2014-02-12', DATE_ENVOI='2014-02-19' WHERE NO_COMMANDE=10505;
UPDATE commandes SET DATE_COMMANDE='2014-02-13', DATE_ENVOI='2014-03-02' WHERE NO_COMMANDE=10506;
UPDATE commandes SET DATE_COMMANDE='2014-02-13', DATE_ENVOI='2014-02-20' WHERE NO_COMMANDE=10507;
UPDATE commandes SET DATE_COMMANDE='2014-02-14', DATE_ENVOI='2014-03-13' WHERE NO_COMMANDE=10508;
UPDATE commandes SET DATE_COMMANDE='2014-02-15', DATE_ENVOI='2014-02-27' WHERE NO_COMMANDE=10509;
UPDATE commandes SET DATE_COMMANDE='2014-02-16', DATE_ENVOI='2014-02-26' WHERE NO_COMMANDE=10510;
UPDATE commandes SET DATE_COMMANDE='2014-02-16', DATE_ENVOI='2014-02-19' WHERE NO_COMMANDE=10511;
UPDATE commandes SET DATE_COMMANDE='2014-02-19', DATE_ENVOI='2014-02-22' WHERE NO_COMMANDE=10512;
UPDATE commandes SET DATE_COMMANDE='2014-02-20', DATE_ENVOI='2014-02-26' WHERE NO_COMMANDE=10513;
UPDATE commandes SET DATE_COMMANDE='2014-02-20', DATE_ENVOI='2014-03-16' WHERE NO_COMMANDE=10514;
UPDATE commandes SET DATE_COMMANDE='2014-02-21', DATE_ENVOI='2014-03-23' WHERE NO_COMMANDE=10515;
UPDATE commandes SET DATE_COMMANDE='2014-02-22', DATE_ENVOI='2014-03-01' WHERE NO_COMMANDE=10516;
UPDATE commandes SET DATE_COMMANDE='2014-02-22', DATE_ENVOI='2014-02-27' WHERE NO_COMMANDE=10517;
UPDATE commandes SET DATE_COMMANDE='2014-02-23', DATE_ENVOI='2014-03-05' WHERE NO_COMMANDE=10518;
UPDATE commandes SET DATE_COMMANDE='2014-02-26', DATE_ENVOI='2014-03-01' WHERE NO_COMMANDE=10519;
UPDATE commandes SET DATE_COMMANDE='2014-02-27', DATE_ENVOI='2014-03-01' WHERE NO_COMMANDE=10520;
UPDATE commandes SET DATE_COMMANDE='2014-02-27', DATE_ENVOI='2014-03-02' WHERE NO_COMMANDE=10521;
UPDATE commandes SET DATE_COMMANDE='2014-02-28', DATE_ENVOI='2014-03-06' WHERE NO_COMMANDE=10522;
UPDATE commandes SET DATE_COMMANDE='2014-03-01', DATE_ENVOI='2014-03-30' WHERE NO_COMMANDE=10523;
UPDATE commandes SET DATE_COMMANDE='2014-03-01', DATE_ENVOI='2014-03-07' WHERE NO_COMMANDE=10524;
UPDATE commandes SET DATE_COMMANDE='2014-03-02', DATE_ENVOI='2014-03-23' WHERE NO_COMMANDE=10525;
UPDATE commandes SET DATE_COMMANDE='2014-03-05', DATE_ENVOI='2014-03-15' WHERE NO_COMMANDE=10526;
UPDATE commandes SET DATE_COMMANDE='2014-03-05', DATE_ENVOI='2014-03-07' WHERE NO_COMMANDE=10527;
UPDATE commandes SET DATE_COMMANDE='2014-03-06', DATE_ENVOI='2014-03-09' WHERE NO_COMMANDE=10528;
UPDATE commandes SET DATE_COMMANDE='2014-03-07', DATE_ENVOI='2014-03-09' WHERE NO_COMMANDE=10529;
UPDATE commandes SET DATE_COMMANDE='2014-03-08', DATE_ENVOI='2014-03-12' WHERE NO_COMMANDE=10530;
UPDATE commandes SET DATE_COMMANDE='2014-03-08', DATE_ENVOI='2014-03-19' WHERE NO_COMMANDE=10531;
UPDATE commandes SET DATE_COMMANDE='2014-03-09', DATE_ENVOI='2014-03-12' WHERE NO_COMMANDE=10532;
UPDATE commandes SET DATE_COMMANDE='2014-03-12', DATE_ENVOI='2014-03-22' WHERE NO_COMMANDE=10533;
UPDATE commandes SET DATE_COMMANDE='2014-03-12', DATE_ENVOI='2014-03-14' WHERE NO_COMMANDE=10534;
UPDATE commandes SET DATE_COMMANDE='2014-03-13', DATE_ENVOI='2014-03-21' WHERE NO_COMMANDE=10535;
UPDATE commandes SET DATE_COMMANDE='2014-03-14', DATE_ENVOI='2014-04-06' WHERE NO_COMMANDE=10536;
UPDATE commandes SET DATE_COMMANDE='2014-03-14', DATE_ENVOI='2014-03-19' WHERE NO_COMMANDE=10537;
UPDATE commandes SET DATE_COMMANDE='2014-03-15', DATE_ENVOI='2014-03-16' WHERE NO_COMMANDE=10538;
UPDATE commandes SET DATE_COMMANDE='2014-03-16', DATE_ENVOI='2014-03-23' WHERE NO_COMMANDE=10539;
UPDATE commandes SET DATE_COMMANDE='2014-03-19', DATE_ENVOI='2014-04-13' WHERE NO_COMMANDE=10540;
UPDATE commandes SET DATE_COMMANDE='2014-03-19', DATE_ENVOI='2014-03-29' WHERE NO_COMMANDE=10541;
UPDATE commandes SET DATE_COMMANDE='2014-03-20', DATE_ENVOI='2014-03-26' WHERE NO_COMMANDE=10542;
UPDATE commandes SET DATE_COMMANDE='2014-03-21', DATE_ENVOI='2014-03-23' WHERE NO_COMMANDE=10543;
UPDATE commandes SET DATE_COMMANDE='2014-03-21', DATE_ENVOI='2014-03-30' WHERE NO_COMMANDE=10544;
UPDATE commandes SET DATE_COMMANDE='2014-03-22', DATE_ENVOI='2014-04-26' WHERE NO_COMMANDE=10545;
UPDATE commandes SET DATE_COMMANDE='2014-03-23', DATE_ENVOI='2014-03-27' WHERE NO_COMMANDE=10546;
UPDATE commandes SET DATE_COMMANDE='2014-03-23', DATE_ENVOI='2014-04-02' WHERE NO_COMMANDE=10547;
UPDATE commandes SET DATE_COMMANDE='2014-03-26', DATE_ENVOI='2014-04-02' WHERE NO_COMMANDE=10548;
UPDATE commandes SET DATE_COMMANDE='2014-03-27', DATE_ENVOI='2014-03-30' WHERE NO_COMMANDE=10549;
UPDATE commandes SET DATE_COMMANDE='2014-03-28', DATE_ENVOI='2014-04-06' WHERE NO_COMMANDE=10550;
UPDATE commandes SET DATE_COMMANDE='2014-03-28', DATE_ENVOI='2014-04-06' WHERE NO_COMMANDE=10551;
UPDATE commandes SET DATE_COMMANDE='2014-03-29', DATE_ENVOI='2014-04-05' WHERE NO_COMMANDE=10552;
UPDATE commandes SET DATE_COMMANDE='2014-03-30', DATE_ENVOI='2014-04-03' WHERE NO_COMMANDE=10553;
UPDATE commandes SET DATE_COMMANDE='2014-03-30', DATE_ENVOI='2014-04-05' WHERE NO_COMMANDE=10554;
UPDATE commandes SET DATE_COMMANDE='2014-04-02', DATE_ENVOI='2014-04-04' WHERE NO_COMMANDE=10555;
UPDATE commandes SET DATE_COMMANDE='2014-04-03', DATE_ENVOI='2014-04-13' WHERE NO_COMMANDE=10556;
UPDATE commandes SET DATE_COMMANDE='2014-04-03', DATE_ENVOI='2014-04-06' WHERE NO_COMMANDE=10557;
UPDATE commandes SET DATE_COMMANDE='2014-04-04', DATE_ENVOI='2014-04-10' WHERE NO_COMMANDE=10558;
UPDATE commandes SET DATE_COMMANDE='2014-04-05', DATE_ENVOI='2014-04-13' WHERE NO_COMMANDE=10559;
UPDATE commandes SET DATE_COMMANDE='2014-04-06', DATE_ENVOI='2014-04-09' WHERE NO_COMMANDE=10560;
UPDATE commandes SET DATE_COMMANDE='2014-04-06', DATE_ENVOI='2014-04-09' WHERE NO_COMMANDE=10561;
UPDATE commandes SET DATE_COMMANDE='2014-04-09', DATE_ENVOI='2014-04-12' WHERE NO_COMMANDE=10562;
UPDATE commandes SET DATE_COMMANDE='2014-04-10', DATE_ENVOI='2014-04-24' WHERE NO_COMMANDE=10563;
UPDATE commandes SET DATE_COMMANDE='2014-04-10', DATE_ENVOI='2014-04-16' WHERE NO_COMMANDE=10564;
UPDATE commandes SET DATE_COMMANDE='2014-04-11', DATE_ENVOI='2014-04-18' WHERE NO_COMMANDE=10565;
UPDATE commandes SET DATE_COMMANDE='2014-04-12', DATE_ENVOI='2014-04-18' WHERE NO_COMMANDE=10566;
UPDATE commandes SET DATE_COMMANDE='2014-04-12', DATE_ENVOI='2014-04-17' WHERE NO_COMMANDE=10567;
UPDATE commandes SET DATE_COMMANDE='2014-04-13', DATE_ENVOI='2014-05-09' WHERE NO_COMMANDE=10568;
UPDATE commandes SET DATE_COMMANDE='2014-04-16', DATE_ENVOI='2014-05-11' WHERE NO_COMMANDE=10569;
UPDATE commandes SET DATE_COMMANDE='2014-04-17', DATE_ENVOI='2014-04-19' WHERE NO_COMMANDE=10570;
UPDATE commandes SET DATE_COMMANDE='2014-04-17', DATE_ENVOI='2014-05-04' WHERE NO_COMMANDE=10571;
UPDATE commandes SET DATE_COMMANDE='2014-04-18', DATE_ENVOI='2014-04-25' WHERE NO_COMMANDE=10572;
UPDATE commandes SET DATE_COMMANDE='2014-04-19', DATE_ENVOI='2014-04-20' WHERE NO_COMMANDE=10573;
UPDATE commandes SET DATE_COMMANDE='2014-04-19', DATE_ENVOI='2014-04-30' WHERE NO_COMMANDE=10574;
UPDATE commandes SET DATE_COMMANDE='2014-04-20', DATE_ENVOI='2014-04-30' WHERE NO_COMMANDE=10575;
UPDATE commandes SET DATE_COMMANDE='2014-04-23', DATE_ENVOI='2014-04-30' WHERE NO_COMMANDE=10576;
UPDATE commandes SET DATE_COMMANDE='2014-04-23', DATE_ENVOI='2014-04-30' WHERE NO_COMMANDE=10577;
UPDATE commandes SET DATE_COMMANDE='2014-04-24', DATE_ENVOI='2014-05-25' WHERE NO_COMMANDE=10578;
UPDATE commandes SET DATE_COMMANDE='2014-04-25', DATE_ENVOI='2014-05-04' WHERE NO_COMMANDE=10579;
UPDATE commandes SET DATE_COMMANDE='2014-04-26', DATE_ENVOI='2014-05-01' WHERE NO_COMMANDE=10580;
UPDATE commandes SET DATE_COMMANDE='2014-04-26', DATE_ENVOI='2014-05-02' WHERE NO_COMMANDE=10581;
UPDATE commandes SET DATE_COMMANDE='2014-04-27', DATE_ENVOI='2014-05-14' WHERE NO_COMMANDE=10582;
UPDATE commandes SET DATE_COMMANDE='2014-04-30', DATE_ENVOI='2014-05-04' WHERE NO_COMMANDE=10583;
UPDATE commandes SET DATE_COMMANDE='2014-04-30', DATE_ENVOI='2014-05-04' WHERE NO_COMMANDE=10584;
UPDATE commandes SET DATE_COMMANDE='2014-05-01', DATE_ENVOI='2014-05-10' WHERE NO_COMMANDE=10585;
UPDATE commandes SET DATE_COMMANDE='2014-05-02', DATE_ENVOI='2014-05-09' WHERE NO_COMMANDE=10586;
UPDATE commandes SET DATE_COMMANDE='2014-05-02', DATE_ENVOI='2014-05-09' WHERE NO_COMMANDE=10587;
UPDATE commandes SET DATE_COMMANDE='2014-05-03', DATE_ENVOI='2014-05-10' WHERE NO_COMMANDE=10588;
UPDATE commandes SET DATE_COMMANDE='2014-05-04', DATE_ENVOI='2014-05-14' WHERE NO_COMMANDE=10589;
UPDATE commandes SET DATE_COMMANDE='2014-05-07', DATE_ENVOI='2014-05-14' WHERE NO_COMMANDE=10590;
UPDATE commandes SET DATE_COMMANDE='2014-05-07', DATE_ENVOI='2014-05-16' WHERE NO_COMMANDE=10591;
UPDATE commandes SET DATE_COMMANDE='2014-05-08', DATE_ENVOI='2014-05-16' WHERE NO_COMMANDE=10592;
UPDATE commandes SET DATE_COMMANDE='2014-05-09', DATE_ENVOI='2014-06-13' WHERE NO_COMMANDE=10593;
UPDATE commandes SET DATE_COMMANDE='2014-05-09', DATE_ENVOI='2014-05-16' WHERE NO_COMMANDE=10594;
UPDATE commandes SET DATE_COMMANDE='2014-05-10', DATE_ENVOI='2014-05-14' WHERE NO_COMMANDE=10595;
UPDATE commandes SET DATE_COMMANDE='2014-05-11', DATE_ENVOI='2014-06-12' WHERE NO_COMMANDE=10596;
UPDATE commandes SET DATE_COMMANDE='2014-05-11', DATE_ENVOI='2014-05-18' WHERE NO_COMMANDE=10597;
UPDATE commandes SET DATE_COMMANDE='2014-05-14', DATE_ENVOI='2014-05-18' WHERE NO_COMMANDE=10598;
UPDATE commandes SET DATE_COMMANDE='2014-05-15', DATE_ENVOI='2014-05-21' WHERE NO_COMMANDE=10599;
UPDATE commandes SET DATE_COMMANDE='2014-05-16', DATE_ENVOI='2014-05-21' WHERE NO_COMMANDE=10600;
UPDATE commandes SET DATE_COMMANDE='2014-05-16', DATE_ENVOI='2014-05-22' WHERE NO_COMMANDE=10601;
UPDATE commandes SET DATE_COMMANDE='2014-05-17', DATE_ENVOI='2014-05-22' WHERE NO_COMMANDE=10602;
UPDATE commandes SET DATE_COMMANDE='2014-05-18', DATE_ENVOI='2014-06-08' WHERE NO_COMMANDE=10603;
UPDATE commandes SET DATE_COMMANDE='2014-05-18', DATE_ENVOI='2014-05-29' WHERE NO_COMMANDE=10604;
UPDATE commandes SET DATE_COMMANDE='2014-05-21', DATE_ENVOI='2014-05-29' WHERE NO_COMMANDE=10605;
UPDATE commandes SET DATE_COMMANDE='2014-05-22', DATE_ENVOI='2014-05-31' WHERE NO_COMMANDE=10606;
UPDATE commandes SET DATE_COMMANDE='2014-05-22', DATE_ENVOI='2014-05-25' WHERE NO_COMMANDE=10607;
UPDATE commandes SET DATE_COMMANDE='2014-05-23', DATE_ENVOI='2014-06-01' WHERE NO_COMMANDE=10608;
UPDATE commandes SET DATE_COMMANDE='2014-05-24', DATE_ENVOI='2014-05-30' WHERE NO_COMMANDE=10609;
UPDATE commandes SET DATE_COMMANDE='2014-05-25', DATE_ENVOI='2014-06-06' WHERE NO_COMMANDE=10610;
UPDATE commandes SET DATE_COMMANDE='2014-05-25', DATE_ENVOI='2014-06-01' WHERE NO_COMMANDE=10611;
UPDATE commandes SET DATE_COMMANDE='2014-05-28', DATE_ENVOI='2014-06-01' WHERE NO_COMMANDE=10612;
UPDATE commandes SET DATE_COMMANDE='2014-05-29', DATE_ENVOI='2014-06-01' WHERE NO_COMMANDE=10613;
UPDATE commandes SET DATE_COMMANDE='2014-05-29', DATE_ENVOI='2014-06-01' WHERE NO_COMMANDE=10614;
UPDATE commandes SET DATE_COMMANDE='2014-05-30', DATE_ENVOI='2014-06-06' WHERE NO_COMMANDE=10615;
UPDATE commandes SET DATE_COMMANDE='2014-05-31', DATE_ENVOI='2014-06-05' WHERE NO_COMMANDE=10616;
UPDATE commandes SET DATE_COMMANDE='2014-05-31', DATE_ENVOI='2014-06-04' WHERE NO_COMMANDE=10617;
UPDATE commandes SET DATE_COMMANDE='2014-06-01', DATE_ENVOI='2014-06-08' WHERE NO_COMMANDE=10618;
UPDATE commandes SET DATE_COMMANDE='2014-06-04', DATE_ENVOI='2014-06-07' WHERE NO_COMMANDE=10619;
UPDATE commandes SET DATE_COMMANDE='2014-06-05', DATE_ENVOI='2014-06-14' WHERE NO_COMMANDE=10620;
UPDATE commandes SET DATE_COMMANDE='2014-06-05', DATE_ENVOI='2014-06-11' WHERE NO_COMMANDE=10621;
UPDATE commandes SET DATE_COMMANDE='2014-06-06', DATE_ENVOI='2014-06-11' WHERE NO_COMMANDE=10622;
UPDATE commandes SET DATE_COMMANDE='2014-06-07', DATE_ENVOI='2014-06-12' WHERE NO_COMMANDE=10623;
UPDATE commandes SET DATE_COMMANDE='2014-06-07', DATE_ENVOI='2014-06-19' WHERE NO_COMMANDE=10624;
UPDATE commandes SET DATE_COMMANDE='2014-06-08', DATE_ENVOI='2014-06-14' WHERE NO_COMMANDE=10625;
UPDATE commandes SET DATE_COMMANDE='2014-06-11', DATE_ENVOI='2014-06-20' WHERE NO_COMMANDE=10626;
UPDATE commandes SET DATE_COMMANDE='2014-06-11', DATE_ENVOI='2014-06-21' WHERE NO_COMMANDE=10627;
UPDATE commandes SET DATE_COMMANDE='2014-06-12', DATE_ENVOI='2014-06-20' WHERE NO_COMMANDE=10628;
UPDATE commandes SET DATE_COMMANDE='2014-06-12', DATE_ENVOI='2014-06-20' WHERE NO_COMMANDE=10629;
UPDATE commandes SET DATE_COMMANDE='2014-06-13', DATE_ENVOI='2014-06-19' WHERE NO_COMMANDE=10630;
UPDATE commandes SET DATE_COMMANDE='2014-06-14', DATE_ENVOI='2014-06-15' WHERE NO_COMMANDE=10631;
UPDATE commandes SET DATE_COMMANDE='2014-06-14', DATE_ENVOI='2014-06-19' WHERE NO_COMMANDE=10632;
UPDATE commandes SET DATE_COMMANDE='2014-06-15', DATE_ENVOI='2014-06-18' WHERE NO_COMMANDE=10633;
UPDATE commandes SET DATE_COMMANDE='2014-06-15', DATE_ENVOI='2014-06-21' WHERE NO_COMMANDE=10634;
UPDATE commandes SET DATE_COMMANDE='2014-06-18', DATE_ENVOI='2014-06-21' WHERE NO_COMMANDE=10635;
UPDATE commandes SET DATE_COMMANDE='2014-06-19', DATE_ENVOI='2014-06-26' WHERE NO_COMMANDE=10636;
UPDATE commandes SET DATE_COMMANDE='2014-06-19', DATE_ENVOI='2014-06-26' WHERE NO_COMMANDE=10637;
UPDATE commandes SET DATE_COMMANDE='2014-06-20', DATE_ENVOI='2014-07-02' WHERE NO_COMMANDE=10638;
UPDATE commandes SET DATE_COMMANDE='2014-06-20', DATE_ENVOI='2014-06-27' WHERE NO_COMMANDE=10639;
UPDATE commandes SET DATE_COMMANDE='2014-06-21', DATE_ENVOI='2014-06-28' WHERE NO_COMMANDE=10640;
UPDATE commandes SET DATE_COMMANDE='2014-06-22', DATE_ENVOI='2014-06-26' WHERE NO_COMMANDE=10641;
UPDATE commandes SET DATE_COMMANDE='2014-06-22', DATE_ENVOI='2014-07-06' WHERE NO_COMMANDE=10642;
UPDATE commandes SET DATE_COMMANDE='2014-06-25', DATE_ENVOI='2014-07-03' WHERE NO_COMMANDE=10643;
UPDATE commandes SET DATE_COMMANDE='2014-06-25', DATE_ENVOI='2014-07-02' WHERE NO_COMMANDE=10644;
UPDATE commandes SET DATE_COMMANDE='2014-06-26', DATE_ENVOI='2014-07-03' WHERE NO_COMMANDE=10645;
UPDATE commandes SET DATE_COMMANDE='2014-06-27', DATE_ENVOI='2014-07-04' WHERE NO_COMMANDE=10646;
UPDATE commandes SET DATE_COMMANDE='2014-06-27', DATE_ENVOI='2014-07-04' WHERE NO_COMMANDE=10647;
UPDATE commandes SET DATE_COMMANDE='2014-06-28', DATE_ENVOI='2014-07-10' WHERE NO_COMMANDE=10648;
UPDATE commandes SET DATE_COMMANDE='2014-06-28', DATE_ENVOI='2014-06-29' WHERE NO_COMMANDE=10649;
UPDATE commandes SET DATE_COMMANDE='2014-06-29', DATE_ENVOI='2014-07-04' WHERE NO_COMMANDE=10650;
UPDATE commandes SET DATE_COMMANDE='2014-07-02', DATE_ENVOI='2014-07-12' WHERE NO_COMMANDE=10651;
UPDATE commandes SET DATE_COMMANDE='2014-07-02', DATE_ENVOI='2014-07-09' WHERE NO_COMMANDE=10652;
UPDATE commandes SET DATE_COMMANDE='2014-07-03', DATE_ENVOI='2014-07-20' WHERE NO_COMMANDE=10653;
UPDATE commandes SET DATE_COMMANDE='2014-07-03', DATE_ENVOI='2014-07-12' WHERE NO_COMMANDE=10654;
UPDATE commandes SET DATE_COMMANDE='2014-07-04', DATE_ENVOI='2014-07-12' WHERE NO_COMMANDE=10655;
UPDATE commandes SET DATE_COMMANDE='2014-07-05', DATE_ENVOI='2014-07-11' WHERE NO_COMMANDE=10656;
UPDATE commandes SET DATE_COMMANDE='2014-07-05', DATE_ENVOI='2014-07-16' WHERE NO_COMMANDE=10657;
UPDATE commandes SET DATE_COMMANDE='2014-07-06', DATE_ENVOI='2014-07-09' WHERE NO_COMMANDE=10658;
UPDATE commandes SET DATE_COMMANDE='2014-07-06', DATE_ENVOI='2014-07-11' WHERE NO_COMMANDE=10659;
UPDATE commandes SET DATE_COMMANDE='2014-07-09', DATE_ENVOI='2014-08-15' WHERE NO_COMMANDE=10660;
UPDATE commandes SET DATE_COMMANDE='2014-07-10', DATE_ENVOI='2014-07-16' WHERE NO_COMMANDE=10661;
UPDATE commandes SET DATE_COMMANDE='2014-07-10', DATE_ENVOI='2014-07-19' WHERE NO_COMMANDE=10662;
UPDATE commandes SET DATE_COMMANDE='2014-07-11', DATE_ENVOI='2014-08-03' WHERE NO_COMMANDE=10663;
UPDATE commandes SET DATE_COMMANDE='2014-07-11', DATE_ENVOI='2014-07-20' WHERE NO_COMMANDE=10664;
UPDATE commandes SET DATE_COMMANDE='2014-07-12', DATE_ENVOI='2014-07-18' WHERE NO_COMMANDE=10665;
UPDATE commandes SET DATE_COMMANDE='2014-07-13', DATE_ENVOI='2014-07-23' WHERE NO_COMMANDE=10666;
UPDATE commandes SET DATE_COMMANDE='2014-07-13', DATE_ENVOI='2014-07-20' WHERE NO_COMMANDE=10667;
UPDATE commandes SET DATE_COMMANDE='2014-07-16', DATE_ENVOI='2014-07-24' WHERE NO_COMMANDE=10668;
UPDATE commandes SET DATE_COMMANDE='2014-07-16', DATE_ENVOI='2014-07-23' WHERE NO_COMMANDE=10669;
UPDATE commandes SET DATE_COMMANDE='2014-07-17', DATE_ENVOI='2014-07-19' WHERE NO_COMMANDE=10670;
UPDATE commandes SET DATE_COMMANDE='2014-07-18', DATE_ENVOI='2014-07-25' WHERE NO_COMMANDE=10671;
UPDATE commandes SET DATE_COMMANDE='2014-07-18', DATE_ENVOI='2014-07-27' WHERE NO_COMMANDE=10672;
UPDATE commandes SET DATE_COMMANDE='2014-07-19', DATE_ENVOI='2014-07-20' WHERE NO_COMMANDE=10673;
UPDATE commandes SET DATE_COMMANDE='2014-07-19', DATE_ENVOI='2014-07-31' WHERE NO_COMMANDE=10674;
UPDATE commandes SET DATE_COMMANDE='2014-07-20', DATE_ENVOI='2014-07-24' WHERE NO_COMMANDE=10675;
UPDATE commandes SET DATE_COMMANDE='2014-07-23', DATE_ENVOI='2014-07-30' WHERE NO_COMMANDE=10676;
UPDATE commandes SET DATE_COMMANDE='2014-07-23', DATE_ENVOI='2014-07-27' WHERE NO_COMMANDE=10677;
UPDATE commandes SET DATE_COMMANDE='2014-07-24', DATE_ENVOI='2014-08-16' WHERE NO_COMMANDE=10678;
UPDATE commandes SET DATE_COMMANDE='2014-07-24', DATE_ENVOI='2014-07-31' WHERE NO_COMMANDE=10679;
UPDATE commandes SET DATE_COMMANDE='2014-07-25', DATE_ENVOI='2014-07-27' WHERE NO_COMMANDE=10680;
UPDATE commandes SET DATE_COMMANDE='2014-07-26', DATE_ENVOI='2014-07-31' WHERE NO_COMMANDE=10681;
UPDATE commandes SET DATE_COMMANDE='2014-07-26', DATE_ENVOI='2014-08-01' WHERE NO_COMMANDE=10682;
UPDATE commandes SET DATE_COMMANDE='2014-07-27', DATE_ENVOI='2014-08-01' WHERE NO_COMMANDE=10683;
UPDATE commandes SET DATE_COMMANDE='2014-07-27', DATE_ENVOI='2014-07-31' WHERE NO_COMMANDE=10684;
UPDATE commandes SET DATE_COMMANDE='2014-07-30', DATE_ENVOI='2014-08-03' WHERE NO_COMMANDE=10685;
UPDATE commandes SET DATE_COMMANDE='2014-07-31', DATE_ENVOI='2014-08-08' WHERE NO_COMMANDE=10686;
UPDATE commandes SET DATE_COMMANDE='2014-07-31', DATE_ENVOI='2014-08-30' WHERE NO_COMMANDE=10687;
UPDATE commandes SET DATE_COMMANDE='2014-08-01', DATE_ENVOI='2014-08-07' WHERE NO_COMMANDE=10688;
UPDATE commandes SET DATE_COMMANDE='2014-08-01', DATE_ENVOI='2014-08-07' WHERE NO_COMMANDE=10689;
UPDATE commandes SET DATE_COMMANDE='2014-08-02', DATE_ENVOI='2014-08-03' WHERE NO_COMMANDE=10690;
UPDATE commandes SET DATE_COMMANDE='2014-08-03', DATE_ENVOI='2014-08-22' WHERE NO_COMMANDE=10691;
UPDATE commandes SET DATE_COMMANDE='2014-08-03', DATE_ENVOI='2014-08-13' WHERE NO_COMMANDE=10692;
UPDATE commandes SET DATE_COMMANDE='2014-08-06', DATE_ENVOI='2014-08-10' WHERE NO_COMMANDE=10693;
UPDATE commandes SET DATE_COMMANDE='2014-08-06', DATE_ENVOI='2014-08-09' WHERE NO_COMMANDE=10694;
UPDATE commandes SET DATE_COMMANDE='2014-08-07', DATE_ENVOI='2014-08-14' WHERE NO_COMMANDE=10695;
UPDATE commandes SET DATE_COMMANDE='2014-08-08', DATE_ENVOI='2014-08-14' WHERE NO_COMMANDE=10696;
UPDATE commandes SET DATE_COMMANDE='2014-08-08', DATE_ENVOI='2014-08-14' WHERE NO_COMMANDE=10697;
UPDATE commandes SET DATE_COMMANDE='2014-08-09', DATE_ENVOI='2014-08-17' WHERE NO_COMMANDE=10698;
UPDATE commandes SET DATE_COMMANDE='2014-08-09', DATE_ENVOI='2014-08-13' WHERE NO_COMMANDE=10699;
UPDATE commandes SET DATE_COMMANDE='2014-08-10', DATE_ENVOI='2014-08-16' WHERE NO_COMMANDE=10700;
UPDATE commandes SET DATE_COMMANDE='2014-08-13', DATE_ENVOI='2014-08-15' WHERE NO_COMMANDE=10701;
UPDATE commandes SET DATE_COMMANDE='2014-08-13', DATE_ENVOI='2014-08-21' WHERE NO_COMMANDE=10702;
UPDATE commandes SET DATE_COMMANDE='2014-08-14', DATE_ENVOI='2014-08-20' WHERE NO_COMMANDE=10703;
UPDATE commandes SET DATE_COMMANDE='2014-08-14', DATE_ENVOI='2014-09-07' WHERE NO_COMMANDE=10704;
UPDATE commandes SET DATE_COMMANDE='2014-08-15', DATE_ENVOI='2014-09-18' WHERE NO_COMMANDE=10705;
UPDATE commandes SET DATE_COMMANDE='2014-08-16', DATE_ENVOI='2014-08-21' WHERE NO_COMMANDE=10706;
UPDATE commandes SET DATE_COMMANDE='2014-08-16', DATE_ENVOI='2014-08-23' WHERE NO_COMMANDE=10707;
UPDATE commandes SET DATE_COMMANDE='2014-08-17', DATE_ENVOI='2014-09-05' WHERE NO_COMMANDE=10708;
UPDATE commandes SET DATE_COMMANDE='2014-08-17', DATE_ENVOI='2014-09-20' WHERE NO_COMMANDE=10709;
UPDATE commandes SET DATE_COMMANDE='2014-08-20', DATE_ENVOI='2014-08-23' WHERE NO_COMMANDE=10710;
UPDATE commandes SET DATE_COMMANDE='2014-08-21', DATE_ENVOI='2014-08-29' WHERE NO_COMMANDE=10711;
UPDATE commandes SET DATE_COMMANDE='2014-08-21', DATE_ENVOI='2014-08-31' WHERE NO_COMMANDE=10712;
UPDATE commandes SET DATE_COMMANDE='2014-08-22', DATE_ENVOI='2014-08-24' WHERE NO_COMMANDE=10713;
UPDATE commandes SET DATE_COMMANDE='2014-08-22', DATE_ENVOI='2014-08-27' WHERE NO_COMMANDE=10714;
UPDATE commandes SET DATE_COMMANDE='2014-08-23', DATE_ENVOI='2014-08-29' WHERE NO_COMMANDE=10715;
UPDATE commandes SET DATE_COMMANDE='2014-08-24', DATE_ENVOI='2014-08-27' WHERE NO_COMMANDE=10716;
UPDATE commandes SET DATE_COMMANDE='2014-08-24', DATE_ENVOI='2014-08-29' WHERE NO_COMMANDE=10717;
UPDATE commandes SET DATE_COMMANDE='2014-08-27', DATE_ENVOI='2014-08-29' WHERE NO_COMMANDE=10718;
UPDATE commandes SET DATE_COMMANDE='2014-08-27', DATE_ENVOI='2014-09-05' WHERE NO_COMMANDE=10719;
UPDATE commandes SET DATE_COMMANDE='2014-08-28', DATE_ENVOI='2014-09-05' WHERE NO_COMMANDE=10720;
UPDATE commandes SET DATE_COMMANDE='2014-08-29', DATE_ENVOI='2014-08-31' WHERE NO_COMMANDE=10721;
UPDATE commandes SET DATE_COMMANDE='2014-08-29', DATE_ENVOI='2014-09-04' WHERE NO_COMMANDE=10722;
UPDATE commandes SET DATE_COMMANDE='2014-08-30', DATE_ENVOI='2014-09-25' WHERE NO_COMMANDE=10723;
UPDATE commandes SET DATE_COMMANDE='2014-08-30', DATE_ENVOI='2014-09-05' WHERE NO_COMMANDE=10724;
UPDATE commandes SET DATE_COMMANDE='2014-08-31', DATE_ENVOI='2014-09-05' WHERE NO_COMMANDE=10725;
UPDATE commandes SET DATE_COMMANDE='2014-09-03', DATE_ENVOI='2014-10-05' WHERE NO_COMMANDE=10726;
UPDATE commandes SET DATE_COMMANDE='2014-09-03', DATE_ENVOI='2014-10-05' WHERE NO_COMMANDE=10727;
UPDATE commandes SET DATE_COMMANDE='2014-09-04', DATE_ENVOI='2014-09-11' WHERE NO_COMMANDE=10728;
UPDATE commandes SET DATE_COMMANDE='2014-09-04', DATE_ENVOI='2014-09-14' WHERE NO_COMMANDE=10729;
UPDATE commandes SET DATE_COMMANDE='2014-09-05', DATE_ENVOI='2014-09-14' WHERE NO_COMMANDE=10730;
UPDATE commandes SET DATE_COMMANDE='2014-09-06', DATE_ENVOI='2014-09-14' WHERE NO_COMMANDE=10731;
UPDATE commandes SET DATE_COMMANDE='2014-09-06', DATE_ENVOI='2014-09-07' WHERE NO_COMMANDE=10732;
UPDATE commandes SET DATE_COMMANDE='2014-09-07', DATE_ENVOI='2014-09-10' WHERE NO_COMMANDE=10733;
UPDATE commandes SET DATE_COMMANDE='2014-09-07', DATE_ENVOI='2014-09-12' WHERE NO_COMMANDE=10734;
UPDATE commandes SET DATE_COMMANDE='2014-09-10', DATE_ENVOI='2014-09-21' WHERE NO_COMMANDE=10735;
UPDATE commandes SET DATE_COMMANDE='2014-09-11', DATE_ENVOI='2014-09-21' WHERE NO_COMMANDE=10736;
UPDATE commandes SET DATE_COMMANDE='2014-09-11', DATE_ENVOI='2014-09-18' WHERE NO_COMMANDE=10737;
UPDATE commandes SET DATE_COMMANDE='2014-09-12', DATE_ENVOI='2014-09-18' WHERE NO_COMMANDE=10738;
UPDATE commandes SET DATE_COMMANDE='2014-09-12', DATE_ENVOI='2014-09-17' WHERE NO_COMMANDE=10739;
UPDATE commandes SET DATE_COMMANDE='2014-09-13', DATE_ENVOI='2014-09-25' WHERE NO_COMMANDE=10740;
UPDATE commandes SET DATE_COMMANDE='2014-09-14', DATE_ENVOI='2014-09-18' WHERE NO_COMMANDE=10741;
UPDATE commandes SET DATE_COMMANDE='2014-09-14', DATE_ENVOI='2014-09-18' WHERE NO_COMMANDE=10742;
UPDATE commandes SET DATE_COMMANDE='2014-09-17', DATE_ENVOI='2014-09-21' WHERE NO_COMMANDE=10743;
UPDATE commandes SET DATE_COMMANDE='2014-09-17', DATE_ENVOI='2014-09-24' WHERE NO_COMMANDE=10744;
UPDATE commandes SET DATE_COMMANDE='2014-09-18', DATE_ENVOI='2014-09-27' WHERE NO_COMMANDE=10745;
UPDATE commandes SET DATE_COMMANDE='2014-09-19', DATE_ENVOI='2014-09-21' WHERE NO_COMMANDE=10746;
UPDATE commandes SET DATE_COMMANDE='2014-09-19', DATE_ENVOI='2014-09-26' WHERE NO_COMMANDE=10747;
UPDATE commandes SET DATE_COMMANDE='2014-09-20', DATE_ENVOI='2014-09-28' WHERE NO_COMMANDE=10748;
UPDATE commandes SET DATE_COMMANDE='2014-09-20', DATE_ENVOI='2014-10-19' WHERE NO_COMMANDE=10749;
UPDATE commandes SET DATE_COMMANDE='2014-09-21', DATE_ENVOI='2014-09-24' WHERE NO_COMMANDE=10750;
UPDATE commandes SET DATE_COMMANDE='2014-09-24', DATE_ENVOI='2014-10-03' WHERE NO_COMMANDE=10751;
UPDATE commandes SET DATE_COMMANDE='2014-09-24', DATE_ENVOI='2014-09-28' WHERE NO_COMMANDE=10752;
UPDATE commandes SET DATE_COMMANDE='2014-09-25', DATE_ENVOI='2014-09-27' WHERE NO_COMMANDE=10753;
UPDATE commandes SET DATE_COMMANDE='2014-09-25', DATE_ENVOI='2014-09-27' WHERE NO_COMMANDE=10754;
UPDATE commandes SET DATE_COMMANDE='2014-09-26', DATE_ENVOI='2014-09-28' WHERE NO_COMMANDE=10755;
UPDATE commandes SET DATE_COMMANDE='2014-09-27', DATE_ENVOI='2014-10-02' WHERE NO_COMMANDE=10756;
UPDATE commandes SET DATE_COMMANDE='2014-09-27', DATE_ENVOI='2014-10-15' WHERE NO_COMMANDE=10757;
UPDATE commandes SET DATE_COMMANDE='2014-09-28', DATE_ENVOI='2014-10-04' WHERE NO_COMMANDE=10758;
UPDATE commandes SET DATE_COMMANDE='2014-09-28', DATE_ENVOI='2014-10-12' WHERE NO_COMMANDE=10759;
UPDATE commandes SET DATE_COMMANDE='2014-10-01', DATE_ENVOI='2014-10-10' WHERE NO_COMMANDE=10760;
UPDATE commandes SET DATE_COMMANDE='2014-10-02', DATE_ENVOI='2014-10-08' WHERE NO_COMMANDE=10761;
UPDATE commandes SET DATE_COMMANDE='2014-10-02', DATE_ENVOI='2014-10-09' WHERE NO_COMMANDE=10762;
UPDATE commandes SET DATE_COMMANDE='2014-10-03', DATE_ENVOI='2014-10-08' WHERE NO_COMMANDE=10763;
UPDATE commandes SET DATE_COMMANDE='2014-10-03', DATE_ENVOI='2014-10-08' WHERE NO_COMMANDE=10764;
UPDATE commandes SET DATE_COMMANDE='2014-10-04', DATE_ENVOI='2014-10-09' WHERE NO_COMMANDE=10765;
UPDATE commandes SET DATE_COMMANDE='2014-10-05', DATE_ENVOI='2014-10-09' WHERE NO_COMMANDE=10766;
UPDATE commandes SET DATE_COMMANDE='2014-10-05', DATE_ENVOI='2014-10-15' WHERE NO_COMMANDE=10767;
UPDATE commandes SET DATE_COMMANDE='2014-10-08', DATE_ENVOI='2014-10-15' WHERE NO_COMMANDE=10768;
UPDATE commandes SET DATE_COMMANDE='2014-10-08', DATE_ENVOI='2014-10-12' WHERE NO_COMMANDE=10769;
UPDATE commandes SET DATE_COMMANDE='2014-10-09', DATE_ENVOI='2014-10-17' WHERE NO_COMMANDE=10770;
UPDATE commandes SET DATE_COMMANDE='2014-10-10', DATE_ENVOI='2014-11-02' WHERE NO_COMMANDE=10771;
UPDATE commandes SET DATE_COMMANDE='2014-10-10', DATE_ENVOI='2014-10-19' WHERE NO_COMMANDE=10772;
UPDATE commandes SET DATE_COMMANDE='2014-10-11', DATE_ENVOI='2014-10-16' WHERE NO_COMMANDE=10773;
UPDATE commandes SET DATE_COMMANDE='2014-10-11', DATE_ENVOI='2014-10-12' WHERE NO_COMMANDE=10774;
UPDATE commandes SET DATE_COMMANDE='2014-10-12', DATE_ENVOI='2014-10-26' WHERE NO_COMMANDE=10775;
UPDATE commandes SET DATE_COMMANDE='2014-10-15', DATE_ENVOI='2014-10-18' WHERE NO_COMMANDE=10776;
UPDATE commandes SET DATE_COMMANDE='2014-10-15', DATE_ENVOI='2014-11-21' WHERE NO_COMMANDE=10777;
UPDATE commandes SET DATE_COMMANDE='2014-10-16', DATE_ENVOI='2014-10-24' WHERE NO_COMMANDE=10778;
UPDATE commandes SET DATE_COMMANDE='2014-10-16', DATE_ENVOI='2014-11-14' WHERE NO_COMMANDE=10779;
UPDATE commandes SET DATE_COMMANDE='2014-10-16', DATE_ENVOI='2014-10-25' WHERE NO_COMMANDE=10780;
UPDATE commandes SET DATE_COMMANDE='2014-10-17', DATE_ENVOI='2014-10-19' WHERE NO_COMMANDE=10781;
UPDATE commandes SET DATE_COMMANDE='2014-10-17', DATE_ENVOI='2014-10-22' WHERE NO_COMMANDE=10782;
UPDATE commandes SET DATE_COMMANDE='2014-10-18', DATE_ENVOI='2014-10-19' WHERE NO_COMMANDE=10783;
UPDATE commandes SET DATE_COMMANDE='2014-10-18', DATE_ENVOI='2014-10-22' WHERE NO_COMMANDE=10784;
UPDATE commandes SET DATE_COMMANDE='2014-10-18', DATE_ENVOI='2014-10-24' WHERE NO_COMMANDE=10785;
UPDATE commandes SET DATE_COMMANDE='2014-10-19', DATE_ENVOI='2014-10-23' WHERE NO_COMMANDE=10786;
UPDATE commandes SET DATE_COMMANDE='2014-10-19', DATE_ENVOI='2014-10-26' WHERE NO_COMMANDE=10787;
UPDATE commandes SET DATE_COMMANDE='2014-10-22', DATE_ENVOI='2014-11-19' WHERE NO_COMMANDE=10788;
UPDATE commandes SET DATE_COMMANDE='2014-10-22', DATE_ENVOI='2014-10-31' WHERE NO_COMMANDE=10789;
UPDATE commandes SET DATE_COMMANDE='2014-10-22', DATE_ENVOI='2014-10-26' WHERE NO_COMMANDE=10790;
UPDATE commandes SET DATE_COMMANDE='2014-10-23', DATE_ENVOI='2014-11-01' WHERE NO_COMMANDE=10791;
UPDATE commandes SET DATE_COMMANDE='2014-10-23', DATE_ENVOI='2014-10-31' WHERE NO_COMMANDE=10792;
UPDATE commandes SET DATE_COMMANDE='2014-10-24', DATE_ENVOI='2014-11-08' WHERE NO_COMMANDE=10793;
UPDATE commandes SET DATE_COMMANDE='2014-10-24', DATE_ENVOI='2014-11-02' WHERE NO_COMMANDE=10794;
UPDATE commandes SET DATE_COMMANDE='2014-10-24', DATE_ENVOI='2014-11-20' WHERE NO_COMMANDE=10795;
UPDATE commandes SET DATE_COMMANDE='2014-10-25', DATE_ENVOI='2014-11-14' WHERE NO_COMMANDE=10796;
UPDATE commandes SET DATE_COMMANDE='2014-10-25', DATE_ENVOI='2014-11-05' WHERE NO_COMMANDE=10797;
UPDATE commandes SET DATE_COMMANDE='2014-10-26', DATE_ENVOI='2014-11-05' WHERE NO_COMMANDE=10798;
UPDATE commandes SET DATE_COMMANDE='2014-10-26', DATE_ENVOI='2014-11-05' WHERE NO_COMMANDE=10799;
UPDATE commandes SET DATE_COMMANDE='2014-10-26', DATE_ENVOI='2014-11-05' WHERE NO_COMMANDE=10800;
UPDATE commandes SET DATE_COMMANDE='2014-10-29', DATE_ENVOI='2014-10-31' WHERE NO_COMMANDE=10801;
UPDATE commandes SET DATE_COMMANDE='2014-10-29', DATE_ENVOI='2014-11-02' WHERE NO_COMMANDE=10802;
UPDATE commandes SET DATE_COMMANDE='2014-10-30', DATE_ENVOI='2014-11-06' WHERE NO_COMMANDE=10803;
UPDATE commandes SET DATE_COMMANDE='2014-10-30', DATE_ENVOI='2014-11-07' WHERE NO_COMMANDE=10804;
UPDATE commandes SET DATE_COMMANDE='2014-10-30', DATE_ENVOI='2014-11-09' WHERE NO_COMMANDE=10805;
UPDATE commandes SET DATE_COMMANDE='2014-10-31', DATE_ENVOI='2014-11-05' WHERE NO_COMMANDE=10806;
UPDATE commandes SET DATE_COMMANDE='2014-10-31', DATE_ENVOI='2014-11-30' WHERE NO_COMMANDE=10807;
UPDATE commandes SET DATE_COMMANDE='2014-11-01', DATE_ENVOI='2014-11-09' WHERE NO_COMMANDE=10808;
UPDATE commandes SET DATE_COMMANDE='2014-11-01', DATE_ENVOI='2014-11-07' WHERE NO_COMMANDE=10809;
UPDATE commandes SET DATE_COMMANDE='2014-11-01', DATE_ENVOI='2014-11-07' WHERE NO_COMMANDE=10810;
UPDATE commandes SET DATE_COMMANDE='2014-11-02', DATE_ENVOI='2014-11-08' WHERE NO_COMMANDE=10811;
UPDATE commandes SET DATE_COMMANDE='2014-11-02', DATE_ENVOI='2014-11-12' WHERE NO_COMMANDE=10812;
UPDATE commandes SET DATE_COMMANDE='2014-11-05', DATE_ENVOI='2014-11-09' WHERE NO_COMMANDE=10813;
UPDATE commandes SET DATE_COMMANDE='2014-11-05', DATE_ENVOI='2014-11-14' WHERE NO_COMMANDE=10814;
UPDATE commandes SET DATE_COMMANDE='2014-11-05', DATE_ENVOI='2014-11-14' WHERE NO_COMMANDE=10815;
UPDATE commandes SET DATE_COMMANDE='2014-11-06', DATE_ENVOI='2014-12-05' WHERE NO_COMMANDE=10816;
UPDATE commandes SET DATE_COMMANDE='2014-11-06', DATE_ENVOI='2014-11-13' WHERE NO_COMMANDE=10817;
UPDATE commandes SET DATE_COMMANDE='2014-11-07', DATE_ENVOI='2014-11-12' WHERE NO_COMMANDE=10818;
UPDATE commandes SET DATE_COMMANDE='2014-11-07', DATE_ENVOI='2014-11-16' WHERE NO_COMMANDE=10819;
UPDATE commandes SET DATE_COMMANDE='2014-11-07', DATE_ENVOI='2014-11-13' WHERE NO_COMMANDE=10820;
UPDATE commandes SET DATE_COMMANDE='2014-11-08', DATE_ENVOI='2014-11-15' WHERE NO_COMMANDE=10821;
UPDATE commandes SET DATE_COMMANDE='2014-11-08', DATE_ENVOI='2014-11-16' WHERE NO_COMMANDE=10822;
UPDATE commandes SET DATE_COMMANDE='2014-11-09', DATE_ENVOI='2014-11-13' WHERE NO_COMMANDE=10823;
UPDATE commandes SET DATE_COMMANDE='2014-11-09', DATE_ENVOI='2014-11-30' WHERE NO_COMMANDE=10824;
UPDATE commandes SET DATE_COMMANDE='2014-11-09', DATE_ENVOI='2014-11-14' WHERE NO_COMMANDE=10825;
UPDATE commandes SET DATE_COMMANDE='2014-11-12', DATE_ENVOI='2014-12-07' WHERE NO_COMMANDE=10826;
UPDATE commandes SET DATE_COMMANDE='2014-11-12', DATE_ENVOI='2014-12-07' WHERE NO_COMMANDE=10827;
UPDATE commandes SET DATE_COMMANDE='2014-11-13', DATE_ENVOI='2014-12-05' WHERE NO_COMMANDE=10828;
UPDATE commandes SET DATE_COMMANDE='2014-11-13', DATE_ENVOI='2014-11-23' WHERE NO_COMMANDE=10829;
UPDATE commandes SET DATE_COMMANDE='2014-11-13', DATE_ENVOI='2014-11-21' WHERE NO_COMMANDE=10830;
UPDATE commandes SET DATE_COMMANDE='2014-11-14', DATE_ENVOI='2014-11-23' WHERE NO_COMMANDE=10831;
UPDATE commandes SET DATE_COMMANDE='2014-11-14', DATE_ENVOI='2014-11-19' WHERE NO_COMMANDE=10832;
UPDATE commandes SET DATE_COMMANDE='2014-11-15', DATE_ENVOI='2014-11-23' WHERE NO_COMMANDE=10833;
UPDATE commandes SET DATE_COMMANDE='2014-11-15', DATE_ENVOI='2014-11-19' WHERE NO_COMMANDE=10834;
UPDATE commandes SET DATE_COMMANDE='2014-11-15', DATE_ENVOI='2014-11-21' WHERE NO_COMMANDE=10835;
UPDATE commandes SET DATE_COMMANDE='2014-11-16', DATE_ENVOI='2014-11-21' WHERE NO_COMMANDE=10836;
UPDATE commandes SET DATE_COMMANDE='2014-11-16', DATE_ENVOI='2014-11-23' WHERE NO_COMMANDE=10837;
UPDATE commandes SET DATE_COMMANDE='2014-11-19', DATE_ENVOI='2014-11-23' WHERE NO_COMMANDE=10838;
UPDATE commandes SET DATE_COMMANDE='2014-11-19', DATE_ENVOI='2014-11-22' WHERE NO_COMMANDE=10839;
UPDATE commandes SET DATE_COMMANDE='2014-11-19', DATE_ENVOI='2014-12-17' WHERE NO_COMMANDE=10840;
UPDATE commandes SET DATE_COMMANDE='2014-11-20', DATE_ENVOI='2014-11-29' WHERE NO_COMMANDE=10841;
UPDATE commandes SET DATE_COMMANDE='2014-11-20', DATE_ENVOI='2014-11-29' WHERE NO_COMMANDE=10842;
UPDATE commandes SET DATE_COMMANDE='2014-11-21', DATE_ENVOI='2014-11-26' WHERE NO_COMMANDE=10843;
UPDATE commandes SET DATE_COMMANDE='2014-11-21', DATE_ENVOI='2014-11-26' WHERE NO_COMMANDE=10844;
UPDATE commandes SET DATE_COMMANDE='2014-11-21', DATE_ENVOI='2014-11-30' WHERE NO_COMMANDE=10845;
UPDATE commandes SET DATE_COMMANDE='2014-11-22', DATE_ENVOI='2014-11-23' WHERE NO_COMMANDE=10846;
UPDATE commandes SET DATE_COMMANDE='2014-11-22', DATE_ENVOI='2014-12-11' WHERE NO_COMMANDE=10847;
UPDATE commandes SET DATE_COMMANDE='2014-11-23', DATE_ENVOI='2014-11-29' WHERE NO_COMMANDE=10848;
UPDATE commandes SET DATE_COMMANDE='2014-11-23', DATE_ENVOI='2014-11-30' WHERE NO_COMMANDE=10849;
UPDATE commandes SET DATE_COMMANDE='2014-11-23', DATE_ENVOI='2014-11-30' WHERE NO_COMMANDE=10850;
UPDATE commandes SET DATE_COMMANDE='2014-11-26', DATE_ENVOI='2014-12-03' WHERE NO_COMMANDE=10851;
UPDATE commandes SET DATE_COMMANDE='2014-11-26', DATE_ENVOI='2014-11-30' WHERE NO_COMMANDE=10852;
UPDATE commandes SET DATE_COMMANDE='2014-11-27', DATE_ENVOI='2014-12-04' WHERE NO_COMMANDE=10853;
UPDATE commandes SET DATE_COMMANDE='2014-11-27', DATE_ENVOI='2014-12-06' WHERE NO_COMMANDE=10854;
UPDATE commandes SET DATE_COMMANDE='2014-11-27', DATE_ENVOI='2014-12-05' WHERE NO_COMMANDE=10855;
UPDATE commandes SET DATE_COMMANDE='2014-11-28', DATE_ENVOI='2014-12-11' WHERE NO_COMMANDE=10856;
UPDATE commandes SET DATE_COMMANDE='2014-11-28', DATE_ENVOI='2014-12-07' WHERE NO_COMMANDE=10857;
UPDATE commandes SET DATE_COMMANDE='2014-11-29', DATE_ENVOI='2014-12-04' WHERE NO_COMMANDE=10858;
UPDATE commandes SET DATE_COMMANDE='2014-11-29', DATE_ENVOI='2014-12-03' WHERE NO_COMMANDE=10859;
UPDATE commandes SET DATE_COMMANDE='2014-11-29', DATE_ENVOI='2014-12-05' WHERE NO_COMMANDE=10860;
UPDATE commandes SET DATE_COMMANDE='2014-11-30', DATE_ENVOI='2014-12-18' WHERE NO_COMMANDE=10861;
UPDATE commandes SET DATE_COMMANDE='2014-11-30', DATE_ENVOI='2014-12-03' WHERE NO_COMMANDE=10862;
UPDATE commandes SET DATE_COMMANDE='2014-12-03', DATE_ENVOI='2014-12-18' WHERE NO_COMMANDE=10863;
UPDATE commandes SET DATE_COMMANDE='2014-12-03', DATE_ENVOI='2014-12-10' WHERE NO_COMMANDE=10864;
UPDATE commandes SET DATE_COMMANDE='2014-12-03', DATE_ENVOI='2014-12-13' WHERE NO_COMMANDE=10865;
UPDATE commandes SET DATE_COMMANDE='2014-12-04', DATE_ENVOI='2014-12-13' WHERE NO_COMMANDE=10866;
UPDATE commandes SET DATE_COMMANDE='2014-12-04', DATE_ENVOI='2014-12-12' WHERE NO_COMMANDE=10867;
UPDATE commandes SET DATE_COMMANDE='2014-12-05', DATE_ENVOI='2014-12-24' WHERE NO_COMMANDE=10868;
UPDATE commandes SET DATE_COMMANDE='2014-12-05', DATE_ENVOI='2014-12-10' WHERE NO_COMMANDE=10869;
UPDATE commandes SET DATE_COMMANDE='2014-12-05', DATE_ENVOI='2014-12-14' WHERE NO_COMMANDE=10870;
UPDATE commandes SET DATE_COMMANDE='2014-12-06', DATE_ENVOI='2014-12-11' WHERE NO_COMMANDE=10871;
UPDATE commandes SET DATE_COMMANDE='2014-12-06', DATE_ENVOI='2014-12-10' WHERE NO_COMMANDE=10872;
UPDATE commandes SET DATE_COMMANDE='2014-12-07', DATE_ENVOI='2014-12-10' WHERE NO_COMMANDE=10873;
UPDATE commandes SET DATE_COMMANDE='2014-12-07', DATE_ENVOI='2014-12-12' WHERE NO_COMMANDE=10874;
UPDATE commandes SET DATE_COMMANDE='2014-12-07', DATE_ENVOI='2015-01-01' WHERE NO_COMMANDE=10875;
UPDATE commandes SET DATE_COMMANDE='2014-12-10', DATE_ENVOI='2014-12-13' WHERE NO_COMMANDE=10876;
UPDATE commandes SET DATE_COMMANDE='2014-12-10', DATE_ENVOI='2014-12-20' WHERE NO_COMMANDE=10877;
UPDATE commandes SET DATE_COMMANDE='2014-12-11', DATE_ENVOI='2014-12-13' WHERE NO_COMMANDE=10878;
UPDATE commandes SET DATE_COMMANDE='2014-12-11', DATE_ENVOI='2014-12-13' WHERE NO_COMMANDE=10879;
UPDATE commandes SET DATE_COMMANDE='2014-12-11', DATE_ENVOI='2014-12-19' WHERE NO_COMMANDE=10880;
UPDATE commandes SET DATE_COMMANDE='2014-12-12', DATE_ENVOI='2014-12-19' WHERE NO_COMMANDE=10881;
UPDATE commandes SET DATE_COMMANDE='2014-12-12', DATE_ENVOI='2014-12-21' WHERE NO_COMMANDE=10882;
UPDATE commandes SET DATE_COMMANDE='2014-12-13', DATE_ENVOI='2014-12-21' WHERE NO_COMMANDE=10883;
UPDATE commandes SET DATE_COMMANDE='2014-12-13', DATE_ENVOI='2014-12-14' WHERE NO_COMMANDE=10884;
UPDATE commandes SET DATE_COMMANDE='2014-12-13', DATE_ENVOI='2014-12-19' WHERE NO_COMMANDE=10885;
UPDATE commandes SET DATE_COMMANDE='2014-12-14', DATE_ENVOI='2014-12-31' WHERE NO_COMMANDE=10886;
UPDATE commandes SET DATE_COMMANDE='2014-12-14', DATE_ENVOI='2014-12-17' WHERE NO_COMMANDE=10887;
UPDATE commandes SET DATE_COMMANDE='2014-12-17', DATE_ENVOI='2014-12-24' WHERE NO_COMMANDE=10888;
UPDATE commandes SET DATE_COMMANDE='2014-12-17', DATE_ENVOI='2014-12-24' WHERE NO_COMMANDE=10889;
UPDATE commandes SET DATE_COMMANDE='2014-12-17', DATE_ENVOI='2014-12-19' WHERE NO_COMMANDE=10890;
UPDATE commandes SET DATE_COMMANDE='2014-12-18', DATE_ENVOI='2014-12-20' WHERE NO_COMMANDE=10891;
UPDATE commandes SET DATE_COMMANDE='2014-12-18', DATE_ENVOI='2014-12-20' WHERE NO_COMMANDE=10892;
UPDATE commandes SET DATE_COMMANDE='2014-12-19', DATE_ENVOI='2014-12-21' WHERE NO_COMMANDE=10893;
UPDATE commandes SET DATE_COMMANDE='2014-12-19', DATE_ENVOI='2014-12-21' WHERE NO_COMMANDE=10894;
UPDATE commandes SET DATE_COMMANDE='2014-12-19', DATE_ENVOI='2014-12-24' WHERE NO_COMMANDE=10895;
UPDATE commandes SET DATE_COMMANDE='2014-12-20', DATE_ENVOI='2014-12-28' WHERE NO_COMMANDE=10896;
UPDATE commandes SET DATE_COMMANDE='2014-12-20', DATE_ENVOI='2014-12-26' WHERE NO_COMMANDE=10897;
UPDATE commandes SET DATE_COMMANDE='2014-12-21', DATE_ENVOI='2015-01-04' WHERE NO_COMMANDE=10898;
UPDATE commandes SET DATE_COMMANDE='2014-12-21', DATE_ENVOI='2014-12-27' WHERE NO_COMMANDE=10899;
UPDATE commandes SET DATE_COMMANDE='2014-12-21', DATE_ENVOI='2015-01-02' WHERE NO_COMMANDE=10900;
UPDATE commandes SET DATE_COMMANDE='2014-12-24', DATE_ENVOI='2014-12-27' WHERE NO_COMMANDE=10901;
UPDATE commandes SET DATE_COMMANDE='2014-12-24', DATE_ENVOI='2015-01-01' WHERE NO_COMMANDE=10902;
UPDATE commandes SET DATE_COMMANDE='2014-12-25', DATE_ENVOI='2015-01-02' WHERE NO_COMMANDE=10903;
UPDATE commandes SET DATE_COMMANDE='2014-12-25', DATE_ENVOI='2014-12-28' WHERE NO_COMMANDE=10904;
UPDATE commandes SET DATE_COMMANDE='2014-12-25', DATE_ENVOI='2015-01-04' WHERE NO_COMMANDE=10905;
UPDATE commandes SET DATE_COMMANDE='2014-12-26', DATE_ENVOI='2015-01-01' WHERE NO_COMMANDE=10906;
UPDATE commandes SET DATE_COMMANDE='2014-12-26', DATE_ENVOI='2014-12-28' WHERE NO_COMMANDE=10907;
UPDATE commandes SET DATE_COMMANDE='2014-12-27', DATE_ENVOI='2015-01-04' WHERE NO_COMMANDE=10908;
UPDATE commandes SET DATE_COMMANDE='2014-12-27', DATE_ENVOI='2015-01-08' WHERE NO_COMMANDE=10909;
UPDATE commandes SET DATE_COMMANDE='2014-12-27', DATE_ENVOI='2015-01-02' WHERE NO_COMMANDE=10910;
UPDATE commandes SET DATE_COMMANDE='2014-12-27', DATE_ENVOI='2015-01-03' WHERE NO_COMMANDE=10911;
UPDATE commandes SET DATE_COMMANDE='2014-12-27', DATE_ENVOI='2015-01-16' WHERE NO_COMMANDE=10912;
UPDATE commandes SET DATE_COMMANDE='2014-12-27', DATE_ENVOI='2015-01-02' WHERE NO_COMMANDE=10913;
UPDATE commandes SET DATE_COMMANDE='2014-12-28', DATE_ENVOI='2014-12-31' WHERE NO_COMMANDE=10914;
UPDATE commandes SET DATE_COMMANDE='2014-12-28', DATE_ENVOI='2014-12-31' WHERE NO_COMMANDE=10915;
UPDATE commandes SET DATE_COMMANDE='2014-12-28', DATE_ENVOI='2015-01-07' WHERE NO_COMMANDE=10916;
UPDATE commandes SET DATE_COMMANDE='2014-12-31', DATE_ENVOI='2015-01-09' WHERE NO_COMMANDE=10917;
UPDATE commandes SET DATE_COMMANDE='2014-12-31', DATE_ENVOI='2015-01-09' WHERE NO_COMMANDE=10918;
UPDATE commandes SET DATE_COMMANDE='2014-12-31', DATE_ENVOI='2015-01-02' WHERE NO_COMMANDE=10919;
UPDATE commandes SET DATE_COMMANDE='2015-01-01', DATE_ENVOI='2015-01-07' WHERE NO_COMMANDE=10920;
UPDATE commandes SET DATE_COMMANDE='2015-01-01', DATE_ENVOI='2015-01-07' WHERE NO_COMMANDE=10921;
UPDATE commandes SET DATE_COMMANDE='2015-01-01', DATE_ENVOI='2015-01-03' WHERE NO_COMMANDE=10922;
UPDATE commandes SET DATE_COMMANDE='2015-01-01', DATE_ENVOI='2015-01-11' WHERE NO_COMMANDE=10923;
UPDATE commandes SET DATE_COMMANDE='2015-01-02', DATE_ENVOI='2015-02-06' WHERE NO_COMMANDE=10924;
UPDATE commandes SET DATE_COMMANDE='2015-01-02', DATE_ENVOI='2015-01-11' WHERE NO_COMMANDE=10925;
UPDATE commandes SET DATE_COMMANDE='2015-01-02', DATE_ENVOI='2015-01-09' WHERE NO_COMMANDE=10926;
UPDATE commandes SET DATE_COMMANDE='2015-01-03', DATE_ENVOI='2015-02-06' WHERE NO_COMMANDE=10927;
UPDATE commandes SET DATE_COMMANDE='2015-01-03', DATE_ENVOI='2015-01-16' WHERE NO_COMMANDE=10928;
UPDATE commandes SET DATE_COMMANDE='2015-01-03', DATE_ENVOI='2015-01-10' WHERE NO_COMMANDE=10929;
UPDATE commandes SET DATE_COMMANDE='2015-01-04', DATE_ENVOI='2015-01-16' WHERE NO_COMMANDE=10930;
UPDATE commandes SET DATE_COMMANDE='2015-01-04', DATE_ENVOI='2015-01-17' WHERE NO_COMMANDE=10931;
UPDATE commandes SET DATE_COMMANDE='2015-01-04', DATE_ENVOI='2015-01-22' WHERE NO_COMMANDE=10932;
UPDATE commandes SET DATE_COMMANDE='2015-01-04', DATE_ENVOI='2015-01-14' WHERE NO_COMMANDE=10933;
UPDATE commandes SET DATE_COMMANDE='2015-01-07', DATE_ENVOI='2015-01-10' WHERE NO_COMMANDE=10934;
UPDATE commandes SET DATE_COMMANDE='2015-01-07', DATE_ENVOI='2015-01-16' WHERE NO_COMMANDE=10935;
UPDATE commandes SET DATE_COMMANDE='2015-01-07', DATE_ENVOI='2015-01-16' WHERE NO_COMMANDE=10936;
UPDATE commandes SET DATE_COMMANDE='2015-01-08', DATE_ENVOI='2015-01-11' WHERE NO_COMMANDE=10937;
UPDATE commandes SET DATE_COMMANDE='2015-01-08', DATE_ENVOI='2015-01-14' WHERE NO_COMMANDE=10938;
UPDATE commandes SET DATE_COMMANDE='2015-01-08', DATE_ENVOI='2015-01-11' WHERE NO_COMMANDE=10939;
UPDATE commandes SET DATE_COMMANDE='2015-01-09', DATE_ENVOI='2015-01-21' WHERE NO_COMMANDE=10940;
UPDATE commandes SET DATE_COMMANDE='2015-01-09', DATE_ENVOI='2015-01-18' WHERE NO_COMMANDE=10941;
UPDATE commandes SET DATE_COMMANDE='2015-01-09', DATE_ENVOI='2015-01-16' WHERE NO_COMMANDE=10942;
UPDATE commandes SET DATE_COMMANDE='2015-01-09', DATE_ENVOI='2015-01-17' WHERE NO_COMMANDE=10943;
UPDATE commandes SET DATE_COMMANDE='2015-01-10', DATE_ENVOI='2015-01-11' WHERE NO_COMMANDE=10944;
UPDATE commandes SET DATE_COMMANDE='2015-01-10', DATE_ENVOI='2015-01-16' WHERE NO_COMMANDE=10945;
UPDATE commandes SET DATE_COMMANDE='2015-01-10', DATE_ENVOI='2015-01-17' WHERE NO_COMMANDE=10946;
UPDATE commandes SET DATE_COMMANDE='2015-01-11', DATE_ENVOI='2015-01-14' WHERE NO_COMMANDE=10947;
UPDATE commandes SET DATE_COMMANDE='2015-01-11', DATE_ENVOI='2015-01-17' WHERE NO_COMMANDE=10948;
UPDATE commandes SET DATE_COMMANDE='2015-01-11', DATE_ENVOI='2015-01-15' WHERE NO_COMMANDE=10949;
UPDATE commandes SET DATE_COMMANDE='2015-01-14', DATE_ENVOI='2015-01-21' WHERE NO_COMMANDE=10950;
UPDATE commandes SET DATE_COMMANDE='2015-01-14', DATE_ENVOI='2015-02-05' WHERE NO_COMMANDE=10951;
UPDATE commandes SET DATE_COMMANDE='2015-01-14', DATE_ENVOI='2015-01-22' WHERE NO_COMMANDE=10952;
UPDATE commandes SET DATE_COMMANDE='2015-01-14', DATE_ENVOI='2015-01-23' WHERE NO_COMMANDE=10953;
UPDATE commandes SET DATE_COMMANDE='2015-01-15', DATE_ENVOI='2015-01-18' WHERE NO_COMMANDE=10954;
UPDATE commandes SET DATE_COMMANDE='2015-01-15', DATE_ENVOI='2015-01-18' WHERE NO_COMMANDE=10955;
UPDATE commandes SET DATE_COMMANDE='2015-01-15', DATE_ENVOI='2015-01-18' WHERE NO_COMMANDE=10956;
UPDATE commandes SET DATE_COMMANDE='2015-01-16', DATE_ENVOI='2015-01-25' WHERE NO_COMMANDE=10957;
UPDATE commandes SET DATE_COMMANDE='2015-01-16', DATE_ENVOI='2015-01-25' WHERE NO_COMMANDE=10958;
UPDATE commandes SET DATE_COMMANDE='2015-01-16', DATE_ENVOI='2015-01-21' WHERE NO_COMMANDE=10959;
UPDATE commandes SET DATE_COMMANDE='2015-01-17', DATE_ENVOI='2015-02-06' WHERE NO_COMMANDE=10960;
UPDATE commandes SET DATE_COMMANDE='2015-01-17', DATE_ENVOI='2015-01-28' WHERE NO_COMMANDE=10961;
UPDATE commandes SET DATE_COMMANDE='2015-01-17', DATE_ENVOI='2015-01-21' WHERE NO_COMMANDE=10962;
UPDATE commandes SET DATE_COMMANDE='2015-01-17', DATE_ENVOI='2015-01-24' WHERE NO_COMMANDE=10963;
UPDATE commandes SET DATE_COMMANDE='2015-01-18', DATE_ENVOI='2015-01-22' WHERE NO_COMMANDE=10964;
UPDATE commandes SET DATE_COMMANDE='2015-01-18', DATE_ENVOI='2015-01-28' WHERE NO_COMMANDE=10965;
UPDATE commandes SET DATE_COMMANDE='2015-01-18', DATE_ENVOI='2015-02-06' WHERE NO_COMMANDE=10966;
UPDATE commandes SET DATE_COMMANDE='2015-01-21', DATE_ENVOI='2015-01-31' WHERE NO_COMMANDE=10967;
UPDATE commandes SET DATE_COMMANDE='2015-01-21', DATE_ENVOI='2015-01-30' WHERE NO_COMMANDE=10968;
UPDATE commandes SET DATE_COMMANDE='2015-01-21', DATE_ENVOI='2015-01-28' WHERE NO_COMMANDE=10969;
UPDATE commandes SET DATE_COMMANDE='2015-01-22', DATE_ENVOI='2015-02-22' WHERE NO_COMMANDE=10970;
UPDATE commandes SET DATE_COMMANDE='2015-01-22', DATE_ENVOI='2015-01-31' WHERE NO_COMMANDE=10971;
UPDATE commandes SET DATE_COMMANDE='2015-01-22', DATE_ENVOI='2015-01-24' WHERE NO_COMMANDE=10972;
UPDATE commandes SET DATE_COMMANDE='2015-01-22', DATE_ENVOI='2015-01-25' WHERE NO_COMMANDE=10973;
UPDATE commandes SET DATE_COMMANDE='2015-01-23', DATE_ENVOI='2015-02-01' WHERE NO_COMMANDE=10974;
UPDATE commandes SET DATE_COMMANDE='2015-01-23', DATE_ENVOI='2015-01-25' WHERE NO_COMMANDE=10975;
UPDATE commandes SET DATE_COMMANDE='2015-01-23', DATE_ENVOI='2015-02-01' WHERE NO_COMMANDE=10976;
UPDATE commandes SET DATE_COMMANDE='2015-01-24', DATE_ENVOI='2015-02-08' WHERE NO_COMMANDE=10977;
UPDATE commandes SET DATE_COMMANDE='2015-01-24', DATE_ENVOI='2015-02-21' WHERE NO_COMMANDE=10978;
UPDATE commandes SET DATE_COMMANDE='2015-01-24', DATE_ENVOI='2015-01-29' WHERE NO_COMMANDE=10979;
UPDATE commandes SET DATE_COMMANDE='2015-01-25', DATE_ENVOI='2015-02-15' WHERE NO_COMMANDE=10980;
UPDATE commandes SET DATE_COMMANDE='2015-01-25', DATE_ENVOI='2015-01-31' WHERE NO_COMMANDE=10981;
UPDATE commandes SET DATE_COMMANDE='2015-01-25', DATE_ENVOI='2015-02-06' WHERE NO_COMMANDE=10982;
UPDATE commandes SET DATE_COMMANDE='2015-01-25', DATE_ENVOI='2015-02-04' WHERE NO_COMMANDE=10983;
UPDATE commandes SET DATE_COMMANDE='2015-01-28', DATE_ENVOI='2015-02-01' WHERE NO_COMMANDE=10984;
UPDATE commandes SET DATE_COMMANDE='2015-01-28', DATE_ENVOI='2015-01-31' WHERE NO_COMMANDE=10985;
UPDATE commandes SET DATE_COMMANDE='2015-01-28', DATE_ENVOI='2015-02-19' WHERE NO_COMMANDE=10986;
UPDATE commandes SET DATE_COMMANDE='2015-01-29', DATE_ENVOI='2015-02-04' WHERE NO_COMMANDE=10987;
UPDATE commandes SET DATE_COMMANDE='2015-01-29', DATE_ENVOI='2015-02-08' WHERE NO_COMMANDE=10988;
UPDATE commandes SET DATE_COMMANDE='2015-01-29', DATE_ENVOI='2015-01-31' WHERE NO_COMMANDE=10989;
UPDATE commandes SET DATE_COMMANDE='2015-01-30', DATE_ENVOI='2015-02-05' WHERE NO_COMMANDE=10990;
UPDATE commandes SET DATE_COMMANDE='2015-01-30', DATE_ENVOI='2015-02-05' WHERE NO_COMMANDE=10991;
UPDATE commandes SET DATE_COMMANDE='2015-01-30', DATE_ENVOI='2015-02-01' WHERE NO_COMMANDE=10992;
UPDATE commandes SET DATE_COMMANDE='2015-01-30', DATE_ENVOI='2015-02-08' WHERE NO_COMMANDE=10993;
UPDATE commandes SET DATE_COMMANDE='2015-01-31', DATE_ENVOI='2015-02-07' WHERE NO_COMMANDE=10994;
UPDATE commandes SET DATE_COMMANDE='2015-01-31', DATE_ENVOI='2015-02-04' WHERE NO_COMMANDE=10995;
UPDATE commandes SET DATE_COMMANDE='2015-01-31', DATE_ENVOI='2015-02-08' WHERE NO_COMMANDE=10996;
UPDATE commandes SET DATE_COMMANDE='2015-02-01', DATE_ENVOI='2015-02-11' WHERE NO_COMMANDE=10997;
UPDATE commandes SET DATE_COMMANDE='2015-02-01', DATE_ENVOI='2015-02-15' WHERE NO_COMMANDE=10998;
UPDATE commandes SET DATE_COMMANDE='2015-02-01', DATE_ENVOI='2015-02-08' WHERE NO_COMMANDE=10999;
UPDATE commandes SET DATE_COMMANDE='2015-02-04', DATE_ENVOI='2015-02-12' WHERE NO_COMMANDE=11000;
UPDATE commandes SET DATE_COMMANDE='2015-02-04', DATE_ENVOI='2015-02-12' WHERE NO_COMMANDE=11001;
UPDATE commandes SET DATE_COMMANDE='2015-02-04', DATE_ENVOI='2015-02-14' WHERE NO_COMMANDE=11002;
UPDATE commandes SET DATE_COMMANDE='2015-02-04', DATE_ENVOI='2015-02-06' WHERE NO_COMMANDE=11003;
UPDATE commandes SET DATE_COMMANDE='2015-02-05', DATE_ENVOI='2015-02-18' WHERE NO_COMMANDE=11004;
UPDATE commandes SET DATE_COMMANDE='2015-02-05', DATE_ENVOI='2015-02-08' WHERE NO_COMMANDE=11005;
UPDATE commandes SET DATE_COMMANDE='2015-02-05', DATE_ENVOI='2015-02-13' WHERE NO_COMMANDE=11006;
UPDATE commandes SET DATE_COMMANDE='2015-02-06', DATE_ENVOI='2015-02-11' WHERE NO_COMMANDE=11007;
UPDATE commandes SET DATE_COMMANDE='2015-02-06', DATE_ENVOI=NULL WHERE NO_COMMANDE=11008;
UPDATE commandes SET DATE_COMMANDE='2015-02-06', DATE_ENVOI='2015-02-08' WHERE NO_COMMANDE=11009;
UPDATE commandes SET DATE_COMMANDE='2015-02-07', DATE_ENVOI='2015-02-19' WHERE NO_COMMANDE=11010;
UPDATE commandes SET DATE_COMMANDE='2015-02-07', DATE_ENVOI='2015-02-11' WHERE NO_COMMANDE=11011;
UPDATE commandes SET DATE_COMMANDE='2015-02-07', DATE_ENVOI='2015-02-15' WHERE NO_COMMANDE=11012;
UPDATE commandes SET DATE_COMMANDE='2015-02-07', DATE_ENVOI='2015-02-08' WHERE NO_COMMANDE=11013;
UPDATE commandes SET DATE_COMMANDE='2015-02-08', DATE_ENVOI='2015-02-13' WHERE NO_COMMANDE=11014;
UPDATE commandes SET DATE_COMMANDE='2015-02-08', DATE_ENVOI='2015-02-18' WHERE NO_COMMANDE=11015;
UPDATE commandes SET DATE_COMMANDE='2015-02-08', DATE_ENVOI='2015-02-11' WHERE NO_COMMANDE=11016;
UPDATE commandes SET DATE_COMMANDE='2015-02-11', DATE_ENVOI='2015-02-18' WHERE NO_COMMANDE=11017;
UPDATE commandes SET DATE_COMMANDE='2015-02-11', DATE_ENVOI='2015-02-14' WHERE NO_COMMANDE=11018;
UPDATE commandes SET DATE_COMMANDE='2015-02-11', DATE_ENVOI=NULL WHERE NO_COMMANDE=11019;
UPDATE commandes SET DATE_COMMANDE='2015-02-12', DATE_ENVOI='2015-02-14' WHERE NO_COMMANDE=11020;
UPDATE commandes SET DATE_COMMANDE='2015-02-12', DATE_ENVOI='2015-02-19' WHERE NO_COMMANDE=11021;
UPDATE commandes SET DATE_COMMANDE='2015-02-12', DATE_ENVOI='2015-03-04' WHERE NO_COMMANDE=11022;
UPDATE commandes SET DATE_COMMANDE='2015-02-12', DATE_ENVOI='2015-02-22' WHERE NO_COMMANDE=11023;
UPDATE commandes SET DATE_COMMANDE='2015-02-13', DATE_ENVOI='2015-02-18' WHERE NO_COMMANDE=11024;
UPDATE commandes SET DATE_COMMANDE='2015-02-13', DATE_ENVOI='2015-02-22' WHERE NO_COMMANDE=11025;
UPDATE commandes SET DATE_COMMANDE='2015-02-13', DATE_ENVOI='2015-02-26' WHERE NO_COMMANDE=11026;
UPDATE commandes SET DATE_COMMANDE='2015-02-14', DATE_ENVOI='2015-02-18' WHERE NO_COMMANDE=11027;
UPDATE commandes SET DATE_COMMANDE='2015-02-14', DATE_ENVOI='2015-02-20' WHERE NO_COMMANDE=11028;
UPDATE commandes SET DATE_COMMANDE='2015-02-14', DATE_ENVOI='2015-02-25' WHERE NO_COMMANDE=11029;
UPDATE commandes SET DATE_COMMANDE='2015-02-15', DATE_ENVOI='2015-02-25' WHERE NO_COMMANDE=11030;
UPDATE commandes SET DATE_COMMANDE='2015-02-15', DATE_ENVOI='2015-02-22' WHERE NO_COMMANDE=11031;
UPDATE commandes SET DATE_COMMANDE='2015-02-15', DATE_ENVOI='2015-02-21' WHERE NO_COMMANDE=11032;
UPDATE commandes SET DATE_COMMANDE='2015-02-15', DATE_ENVOI='2015-02-21' WHERE NO_COMMANDE=11033;
UPDATE commandes SET DATE_COMMANDE='2015-02-18', DATE_ENVOI='2015-02-25' WHERE NO_COMMANDE=11034;
UPDATE commandes SET DATE_COMMANDE='2015-02-18', DATE_ENVOI='2015-02-22' WHERE NO_COMMANDE=11035;
UPDATE commandes SET DATE_COMMANDE='2015-02-18', DATE_ENVOI='2015-02-20' WHERE NO_COMMANDE=11036;
UPDATE commandes SET DATE_COMMANDE='2015-02-19', DATE_ENVOI='2015-02-25' WHERE NO_COMMANDE=11037;
UPDATE commandes SET DATE_COMMANDE='2015-02-19', DATE_ENVOI='2015-02-28' WHERE NO_COMMANDE=11038;
UPDATE commandes SET DATE_COMMANDE='2015-02-19', DATE_ENVOI=NULL WHERE NO_COMMANDE=11039;
UPDATE commandes SET DATE_COMMANDE='2015-02-20', DATE_ENVOI=NULL WHERE NO_COMMANDE=11040;
UPDATE commandes SET DATE_COMMANDE='2015-02-20', DATE_ENVOI='2015-02-26' WHERE NO_COMMANDE=11041;
UPDATE commandes SET DATE_COMMANDE='2015-02-20', DATE_ENVOI='2015-03-01' WHERE NO_COMMANDE=11042;
UPDATE commandes SET DATE_COMMANDE='2015-02-20', DATE_ENVOI='2015-02-27' WHERE NO_COMMANDE=11043;
UPDATE commandes SET DATE_COMMANDE='2015-02-21', DATE_ENVOI='2015-03-01' WHERE NO_COMMANDE=11044;
UPDATE commandes SET DATE_COMMANDE='2015-02-21', DATE_ENVOI=NULL WHERE NO_COMMANDE=11045;
UPDATE commandes SET DATE_COMMANDE='2015-02-21', DATE_ENVOI='2015-02-22' WHERE NO_COMMANDE=11046;
UPDATE commandes SET DATE_COMMANDE='2015-02-22', DATE_ENVOI='2015-03-01' WHERE NO_COMMANDE=11047;
UPDATE commandes SET DATE_COMMANDE='2015-02-22', DATE_ENVOI='2015-02-28' WHERE NO_COMMANDE=11048;
UPDATE commandes SET DATE_COMMANDE='2015-02-22', DATE_ENVOI='2015-03-04' WHERE NO_COMMANDE=11049;
UPDATE commandes SET DATE_COMMANDE='2015-02-25', DATE_ENVOI='2015-03-05' WHERE NO_COMMANDE=11050;
UPDATE commandes SET DATE_COMMANDE='2015-02-25', DATE_ENVOI=NULL WHERE NO_COMMANDE=11051;
UPDATE commandes SET DATE_COMMANDE='2015-02-25', DATE_ENVOI='2015-03-01' WHERE NO_COMMANDE=11052;
UPDATE commandes SET DATE_COMMANDE='2015-02-25', DATE_ENVOI='2015-02-27' WHERE NO_COMMANDE=11053;
UPDATE commandes SET DATE_COMMANDE='2015-02-26', DATE_ENVOI=NULL WHERE NO_COMMANDE=11054;
UPDATE commandes SET DATE_COMMANDE='2015-02-26', DATE_ENVOI='2015-03-05' WHERE NO_COMMANDE=11055;
UPDATE commandes SET DATE_COMMANDE='2015-02-26', DATE_ENVOI='2015-03-01' WHERE NO_COMMANDE=11056;
UPDATE commandes SET DATE_COMMANDE='2015-02-27', DATE_ENVOI='2015-03-01' WHERE NO_COMMANDE=11057;
UPDATE commandes SET DATE_COMMANDE='2015-02-27', DATE_ENVOI=NULL WHERE NO_COMMANDE=11058;
UPDATE commandes SET DATE_COMMANDE='2015-02-27', DATE_ENVOI=NULL WHERE NO_COMMANDE=11059;
UPDATE commandes SET DATE_COMMANDE='2015-02-28', DATE_ENVOI='2015-03-04' WHERE NO_COMMANDE=11060;
UPDATE commandes SET DATE_COMMANDE='2015-02-28', DATE_ENVOI=NULL WHERE NO_COMMANDE=11061;
UPDATE commandes SET DATE_COMMANDE='2015-02-28', DATE_ENVOI=NULL WHERE NO_COMMANDE=11062;
UPDATE commandes SET DATE_COMMANDE='2015-02-28', DATE_ENVOI='2015-03-06' WHERE NO_COMMANDE=11063;
UPDATE commandes SET DATE_COMMANDE='2015-03-01', DATE_ENVOI='2015-03-04' WHERE NO_COMMANDE=11064;
UPDATE commandes SET DATE_COMMANDE='2015-03-01', DATE_ENVOI=NULL WHERE NO_COMMANDE=11065;
UPDATE commandes SET DATE_COMMANDE='2015-03-01', DATE_ENVOI='2015-03-04' WHERE NO_COMMANDE=11066;
UPDATE commandes SET DATE_COMMANDE='2015-03-04', DATE_ENVOI='2015-03-06' WHERE NO_COMMANDE=11067;
UPDATE commandes SET DATE_COMMANDE='2015-03-04', DATE_ENVOI=NULL WHERE NO_COMMANDE=11068;
UPDATE commandes SET DATE_COMMANDE='2015-03-04', DATE_ENVOI='2015-03-06' WHERE NO_COMMANDE=11069;
UPDATE commandes SET DATE_COMMANDE='2015-03-05', DATE_ENVOI=NULL WHERE NO_COMMANDE=11070;
UPDATE commandes SET DATE_COMMANDE='2015-03-05', DATE_ENVOI=NULL WHERE NO_COMMANDE=11071;
UPDATE commandes SET DATE_COMMANDE='2015-03-05', DATE_ENVOI=NULL WHERE NO_COMMANDE=11072;
UPDATE commandes SET DATE_COMMANDE='2015-03-05', DATE_ENVOI=NULL WHERE NO_COMMANDE=11073;
UPDATE commandes SET DATE_COMMANDE='2015-03-06', DATE_ENVOI=NULL WHERE NO_COMMANDE=11074;
UPDATE commandes SET DATE_COMMANDE='2015-03-06', DATE_ENVOI=NULL WHERE NO_COMMANDE=11075;
UPDATE commandes SET DATE_COMMANDE='2015-03-06', DATE_ENVOI=NULL WHERE NO_COMMANDE=11076;
UPDATE commandes SET DATE_COMMANDE='2015-03-06', DATE_ENVOI=NULL WHERE NO_COMMANDE=11077;

--
-- Table structure for table `northwind`.`details_commandes`
--

DROP TABLE IF EXISTS `details_commandes`;
CREATE TABLE `details_commandes` (
  `NO_COMMANDE` decimal(6,0) NOT NULL,
  `REF_PRODUIT` decimal(6,0) NOT NULL,
  `PRIX_UNITAIRE` decimal(8,2) NOT NULL,
  `QUANTITE` decimal(5,0) NOT NULL,
  `REMISE` float NOT NULL,
  PRIMARY KEY  (`NO_COMMANDE`,`REF_PRODUIT`),
  KEY `COMMANDES_DETAILS_COMMANDES_FK` (`NO_COMMANDE`),
  KEY `PRODUITS_DETAILS_COMMANDES_FK` (`REF_PRODUIT`),
  CONSTRAINT `FK_DETAILS_COMMANDES_COMMANDES` FOREIGN KEY (`NO_COMMANDE`) REFERENCES `commandes` (`NO_COMMANDE`),
  CONSTRAINT `FK_DETAILS_PRODUITS_PRODUITS` FOREIGN KEY (`REF_PRODUIT`) REFERENCES `produits` (`REF_PRODUIT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `northwind`.`details_commandes`
--

/*!40000 ALTER TABLE `details_commandes` DISABLE KEYS */;
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10248','11','70.00','12',0),
 ('10248','42','49.00','10',0),
 ('10248','72','174.00','5',0),
 ('10249','14','93.00','9',0),
 ('10249','51','212.00','40',0),
 ('10250','41','38.50','10',0),
 ('10250','51','212.00','35',0.15),
 ('10250','65','84.00','15',0.15),
 ('10251','22','84.00','6',0.05),
 ('10251','57','78.00','15',0.05),
 ('10251','65','84.00','20',0),
 ('10252','20','324.00','40',0.05),
 ('10252','33','10.00','25',0.05),
 ('10252','60','136.00','40',0),
 ('10253','31','50.00','20',0),
 ('10253','39','72.00','42',0),
 ('10253','49','80.00','40',0),
 ('10254','24','18.00','15',0.15),
 ('10254','55','96.00','21',0.15),
 ('10254','74','40.00','21',0),
 ('10255','2','76.00','20',0),
 ('10255','16','69.50','35',0),
 ('10255','36','76.00','25',0),
 ('10255','59','220.00','30',0),
 ('10256','53','131.00','15',0),
 ('10256','77','52.00','12',0),
 ('10257','27','175.50','25',0),
 ('10257','39','72.00','6',0),
 ('10257','77','52.00','15',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10258','2','76.00','50',0.2),
 ('10258','5','85.00','65',0.2),
 ('10258','32','128.00','6',0.2),
 ('10259','21','40.00','10',0),
 ('10259','37','104.00','1',0),
 ('10260','41','38.50','16',0.25),
 ('10260','57','78.00','50',0),
 ('10260','62','197.00','15',0.25),
 ('10260','70','60.00','21',0.25),
 ('10261','21','40.00','20',0),
 ('10261','35','72.00','20',0),
 ('10262','5','85.00','12',0.2),
 ('10262','7','120.00','15',0),
 ('10262','56','152.00','2',0),
 ('10263','16','69.50','60',0.25),
 ('10263','24','18.00','28',0),
 ('10263','30','103.50','60',0.25),
 ('10263','74','40.00','36',0.25),
 ('10264','2','76.00','35',0),
 ('10264','41','38.50','25',0.15),
 ('10265','17','156.00','30',0),
 ('10265','70','60.00','20',0),
 ('10266','12','152.00','12',0.05),
 ('10267','40','73.50','50',0),
 ('10267','59','220.00','70',0.15),
 ('10267','76','72.00','15',0.15),
 ('10268','29','495.00','10',0),
 ('10268','72','139.00','4',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10269','33','10.00','60',0.05),
 ('10269','72','139.00','20',0.05),
 ('10270','36','76.00','30',0),
 ('10270','43','184.00','25',0),
 ('10271','33','10.00','24',0),
 ('10272','20','324.00','6',0),
 ('10272','31','50.00','40',0),
 ('10272','72','139.00','24',0),
 ('10273','10','124.00','24',0.05),
 ('10273','31','50.00','15',0.05),
 ('10273','33','10.00','20',0),
 ('10273','40','73.50','60',0.05),
 ('10273','76','72.00','33',0.05),
 ('10274','71','86.00','20',0),
 ('10274','72','139.00','7',0),
 ('10275','24','18.00','12',0.05),
 ('10275','59','220.00','6',0.05),
 ('10276','10','124.00','15',0),
 ('10276','13','24.00','10',0),
 ('10277','28','182.00','20',0),
 ('10277','62','197.00','12',0),
 ('10278','44','77.50','16',0),
 ('10278','59','220.00','15',0),
 ('10278','63','175.50','8',0),
 ('10278','73','60.00','25',0),
 ('10279','17','156.00','15',0.25),
 ('10280','24','18.00','12',0),
 ('10280','55','96.00','20',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10280','75','31.00','30',0),
 ('10281','19','36.50','1',0),
 ('10281','24','18.00','6',0),
 ('10281','35','72.00','4',0),
 ('10282','30','103.50','6',0),
 ('10282','57','78.00','2',0),
 ('10283','15','62.00','20',0),
 ('10283','19','36.50','18',0),
 ('10283','60','136.00','35',0),
 ('10283','72','139.00','3',0),
 ('10284','27','175.50','15',0.25),
 ('10284','44','77.50','21',0),
 ('10284','60','136.00','20',0.25),
 ('10284','67','56.00','5',0.25),
 ('10285','1','72.00','45',0.2),
 ('10285','40','73.50','40',0.2),
 ('10285','53','131.00','36',0.2),
 ('10286','35','72.00','100',0),
 ('10286','62','197.00','40',0),
 ('10287','16','69.50','40',0.15),
 ('10287','34','56.00','20',0),
 ('10287','46','48.00','15',0.15),
 ('10288','54','29.50','10',0.1),
 ('10288','68','50.00','3',0.1),
 ('10289','3','40.00','30',0),
 ('10289','64','133.00','9',0),
 ('10290','5','85.00','20',0),
 ('10290','29','495.00','15',0),
 ('10290','49','80.00','15',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10290','77','52.00','10',0),
 ('10291','13','24.00','20',0.1),
 ('10291','44','77.50','24',0.1),
 ('10291','51','212.00','2',0.1),
 ('10292','20','324.00','20',0),
 ('10293','18','250.00','12',0),
 ('10293','24','18.00','10',0),
 ('10293','63','175.50','5',0),
 ('10293','75','31.00','6',0),
 ('10294','1','72.00','18',0),
 ('10294','17','156.00','15',0),
 ('10294','43','184.00','15',0),
 ('10294','60','136.00','21',0),
 ('10294','75','31.00','6',0),
 ('10295','56','152.00','4',0),
 ('10296','11','84.00','12',0),
 ('10296','16','69.50','30',0),
 ('10296','69','144.00','15',0),
 ('10297','39','72.00','60',0),
 ('10297','72','139.00','20',0),
 ('10298','2','76.00','40',0),
 ('10298','36','76.00','40',0.25),
 ('10298','59','220.00','30',0.25),
 ('10298','62','197.00','15',0),
 ('10299','19','36.50','15',0),
 ('10299','70','60.00','20',0),
 ('10300','66','68.00','30',0),
 ('10300','68','50.00','20',0),
 ('10301','40','73.50','10',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10301','56','152.00','20',0),
 ('10302','17','156.00','40',0),
 ('10302','28','182.00','28',0),
 ('10302','43','184.00','12',0),
 ('10303','40','73.50','40',0.1),
 ('10303','65','84.00','30',0.1),
 ('10303','68','50.00','15',0.1),
 ('10304','49','80.00','30',0),
 ('10304','59','220.00','10',0),
 ('10304','71','86.00','2',0),
 ('10305','18','250.00','25',0.1),
 ('10305','29','495.00','25',0.1),
 ('10305','39','72.00','30',0.1),
 ('10306','30','103.50','10',0),
 ('10306','53','131.00','10',0),
 ('10306','54','29.50','5',0),
 ('10307','62','197.00','10',0),
 ('10307','68','50.00','3',0),
 ('10308','69','144.00','1',0),
 ('10308','70','60.00','5',0),
 ('10309','4','88.00','20',0),
 ('10309','6','100.00','30',0),
 ('10309','42','56.00','2',0),
 ('10309','43','184.00','20',0),
 ('10309','71','86.00','3',0),
 ('10310','16','69.50','10',0),
 ('10310','62','197.00','5',0),
 ('10311','42','56.00','6',0),
 ('10311','69','144.00','7',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10312','28','182.00','4',0),
 ('10312','43','184.00','24',0),
 ('10312','53','131.00','20',0),
 ('10312','75','31.00','10',0),
 ('10313','36','76.00','12',0),
 ('10314','32','128.00','40',0.1),
 ('10314','58','53.00','30',0.1),
 ('10314','62','197.00','25',0.1),
 ('10315','34','56.00','14',0),
 ('10315','70','60.00','30',0),
 ('10316','41','38.50','10',0),
 ('10316','62','197.00','70',0),
 ('10317','1','72.00','20',0),
 ('10318','41','38.50','20',0),
 ('10318','76','72.00','6',0),
 ('10319','17','156.00','8',0),
 ('10319','28','182.00','14',0),
 ('10319','76','72.00','30',0),
 ('10320','71','86.00','30',0),
 ('10321','35','72.00','10',0),
 ('10322','52','28.00','20',0),
 ('10323','15','62.00','5',0),
 ('10323','25','56.00','4',0),
 ('10323','39','72.00','4',0),
 ('10324','16','69.50','21',0.15),
 ('10324','35','72.00','70',0.15),
 ('10324','46','48.00','30',0),
 ('10324','59','220.00','40',0.15),
 ('10324','63','175.50','80',0.15);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10325','6','100.00','6',0),
 ('10325','13','24.00','12',0),
 ('10325','14','93.00','9',0),
 ('10325','31','50.00','4',0),
 ('10325','72','139.00','40',0),
 ('10326','4','88.00','24',0),
 ('10326','57','78.00','16',0),
 ('10326','75','31.00','50',0),
 ('10327','2','76.00','25',0.2),
 ('10327','11','84.00','50',0.2),
 ('10327','30','103.50','35',0.2),
 ('10327','58','53.00','30',0.2),
 ('10328','59','220.00','9',0),
 ('10328','65','84.00','40',0),
 ('10328','68','50.00','10',0),
 ('10329','19','36.50','10',0.05),
 ('10329','30','103.50','8',0.05),
 ('10329','38','1054.00','20',0.05),
 ('10329','56','152.00','12',0.05),
 ('10330','26','124.50','50',0.15),
 ('10330','72','139.00','25',0.15),
 ('10331','54','29.50','15',0),
 ('10332','18','250.00','40',0.2),
 ('10332','42','56.00','10',0.2),
 ('10332','47','38.00','16',0.2),
 ('10333','14','93.00','10',0),
 ('10333','21','40.00','10',0.1),
 ('10333','71','86.00','40',0.1);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10334','52','28.00','8',0),
 ('10334','68','50.00','10',0),
 ('10335','2','76.00','7',0.2),
 ('10335','31','50.00','25',0.2),
 ('10335','32','128.00','6',0.2),
 ('10335','51','212.00','48',0.2),
 ('10336','4','88.00','18',0.1),
 ('10337','23','36.00','40',0),
 ('10337','26','124.50','24',0),
 ('10337','36','76.00','20',0),
 ('10337','37','104.00','28',0),
 ('10337','72','139.00','25',0),
 ('10338','17','156.00','20',0),
 ('10338','30','103.50','15',0),
 ('10339','4','88.00','10',0),
 ('10339','17','156.00','70',0.05),
 ('10339','62','197.00','28',0),
 ('10340','18','250.00','20',0.05),
 ('10340','41','38.50','12',0.05),
 ('10340','43','184.00','40',0.05),
 ('10341','33','10.00','8',0),
 ('10341','59','220.00','9',0.15),
 ('10342','2','76.00','24',0.2),
 ('10342','31','50.00','56',0.2),
 ('10342','36','76.00','40',0.2),
 ('10342','55','96.00','40',0.2),
 ('10343','64','133.00','50',0),
 ('10343','68','50.00','4',0.05);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10343','76','72.00','15',0),
 ('10344','4','88.00','35',0),
 ('10344','8','160.00','70',0.25),
 ('10345','8','160.00','70',0),
 ('10345','19','36.50','80',0),
 ('10345','42','56.00','9',0),
 ('10346','17','156.00','36',0.1),
 ('10346','56','152.00','20',0),
 ('10347','25','56.00','10',0),
 ('10347','39','72.00','50',0.15),
 ('10347','40','73.50','4',0),
 ('10347','75','31.00','6',0.15),
 ('10348','1','72.00','15',0.15),
 ('10348','23','36.00','25',0),
 ('10349','54','29.50','24',0),
 ('10350','50','65.00','15',0.1),
 ('10350','69','144.00','18',0.1),
 ('10351','38','1054.00','20',0.05),
 ('10351','41','38.50','13',0),
 ('10351','44','77.50','77',0.05),
 ('10351','65','84.00','10',0.05),
 ('10352','24','18.00','10',0),
 ('10352','54','29.50','20',0.15),
 ('10353','11','84.00','12',0.2),
 ('10353','38','1054.00','50',0.2),
 ('10354','1','72.00','12',0),
 ('10354','29','495.00','4',0),
 ('10355','24','18.00','25',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10355','57','78.00','25',0),
 ('10356','31','50.00','30',0),
 ('10356','55','96.00','12',0),
 ('10356','69','144.00','20',0),
 ('10357','10','124.00','30',0.2),
 ('10357','26','124.50','16',0),
 ('10357','60','136.00','8',0.2),
 ('10358','24','18.00','10',0.05),
 ('10358','34','56.00','10',0.05),
 ('10358','36','76.00','20',0.05),
 ('10359','16','69.50','56',0.05),
 ('10359','31','50.00','70',0.05),
 ('10359','60','136.00','80',0.05),
 ('10360','28','182.00','30',0),
 ('10360','29','495.00','35',0),
 ('10360','38','1054.00','10',0),
 ('10360','49','80.00','35',0),
 ('10360','54','29.50','28',0),
 ('10361','39','72.00','54',0.1),
 ('10361','60','136.00','55',0.1),
 ('10362','25','56.00','50',0),
 ('10362','51','212.00','20',0),
 ('10362','54','29.50','24',0),
 ('10363','31','50.00','20',0),
 ('10363','75','31.00','12',0),
 ('10363','76','72.00','12',0),
 ('10364','69','144.00','30',0),
 ('10364','71','86.00','5',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10365','11','84.00','24',0),
 ('10366','65','84.00','5',0),
 ('10366','77','52.00','5',0),
 ('10367','34','56.00','36',0),
 ('10367','54','29.50','18',0),
 ('10367','65','84.00','15',0),
 ('10367','77','52.00','7',0),
 ('10368','21','40.00','5',0.1),
 ('10368','28','182.00','13',0.1),
 ('10368','57','78.00','25',0),
 ('10368','64','133.00','35',0.1),
 ('10369','29','495.00','20',0),
 ('10369','56','152.00','18',0.25),
 ('10370','1','72.00','15',0.15),
 ('10370','64','133.00','30',0),
 ('10370','74','40.00','20',0.15),
 ('10371','36','76.00','6',0.2),
 ('10372','20','324.00','12',0.25),
 ('10372','38','1054.00','40',0.25),
 ('10372','60','136.00','70',0.25),
 ('10372','72','139.00','42',0.25),
 ('10373','58','53.00','80',0.2),
 ('10373','71','86.00','50',0.2),
 ('10374','31','50.00','30',0),
 ('10374','58','53.00','15',0),
 ('10375','14','93.00','15',0),
 ('10375','54','29.50','10',0),
 ('10376','31','50.00','42',0.05);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10377','28','182.00','20',0.15),
 ('10377','39','72.00','20',0.15),
 ('10378','71','86.00','6',0),
 ('10379','41','38.50','8',0.1),
 ('10379','63','175.50','16',0.1),
 ('10379','65','84.00','20',0.1),
 ('10380','30','103.50','18',0.1),
 ('10380','53','131.00','20',0.1),
 ('10380','60','136.00','6',0.1),
 ('10380','70','60.00','30',0),
 ('10381','74','40.00','14',0),
 ('10382','5','85.00','32',0),
 ('10382','18','250.00','9',0),
 ('10382','29','495.00','14',0),
 ('10382','33','10.00','60',0),
 ('10382','74','40.00','50',0),
 ('10383','13','24.00','20',0),
 ('10383','50','65.00','15',0),
 ('10383','56','152.00','20',0),
 ('10384','20','324.00','28',0),
 ('10384','60','136.00','15',0),
 ('10385','7','120.00','10',0.2),
 ('10385','60','136.00','20',0.2),
 ('10385','68','50.00','8',0.2),
 ('10386','24','18.00','15',0),
 ('10386','34','56.00','10',0),
 ('10387','24','18.00','15',0),
 ('10387','28','182.00','6',0),
 ('10387','59','220.00','12',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10387','71','86.00','15',0),
 ('10388','45','38.00','15',0.2),
 ('10388','52','28.00','20',0.2),
 ('10388','53','131.00','40',0),
 ('10389','10','124.00','16',0),
 ('10389','55','96.00','15',0),
 ('10389','62','197.00','20',0),
 ('10389','70','60.00','30',0),
 ('10390','31','50.00','60',0.1),
 ('10390','35','72.00','40',0.1),
 ('10390','46','48.00','45',0),
 ('10390','72','139.00','24',0.1),
 ('10391','13','24.00','18',0),
 ('10392','69','144.00','50',0),
 ('10393','2','76.00','25',0.25),
 ('10393','14','93.00','42',0.25),
 ('10393','25','56.00','7',0.25),
 ('10393','26','124.50','70',0.25),
 ('10393','31','50.00','32',0),
 ('10394','13','24.00','10',0),
 ('10394','62','197.00','10',0),
 ('10395','46','48.00','28',0.1),
 ('10395','53','131.00','70',0.1),
 ('10395','69','144.00','8',0),
 ('10396','23','36.00','40',0),
 ('10396','71','86.00','60',0),
 ('10396','72','139.00','21',0),
 ('10397','21','40.00','10',0.15);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10397','51','212.00','18',0.15),
 ('10398','35','72.00','30',0),
 ('10398','55','96.00','120',0.1),
 ('10399','68','50.00','60',0),
 ('10399','71','86.00','30',0),
 ('10399','76','72.00','35',0),
 ('10399','77','52.00','14',0),
 ('10400','29','495.00','21',0),
 ('10400','35','72.00','35',0),
 ('10400','49','80.00','30',0),
 ('10401','30','103.50','18',0),
 ('10401','56','152.00','70',0),
 ('10401','65','84.00','20',0),
 ('10401','71','86.00','60',0),
 ('10402','23','36.00','60',0),
 ('10402','63','175.50','65',0),
 ('10403','16','69.50','21',0.15),
 ('10403','48','51.00','70',0.15),
 ('10404','26','124.50','30',0.05),
 ('10404','42','56.00','40',0.05),
 ('10404','49','80.00','30',0.05),
 ('10405','3','40.00','50',0),
 ('10406','1','72.00','10',0),
 ('10406','21','40.00','30',0.1),
 ('10406','28','182.00','42',0.1),
 ('10406','36','76.00','5',0.1),
 ('10406','40','73.50','2',0.1),
 ('10407','11','84.00','30',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10407','69','144.00','15',0),
 ('10407','71','86.00','15',0),
 ('10408','37','104.00','10',0),
 ('10408','54','29.50','6',0),
 ('10408','62','197.00','35',0),
 ('10409','14','93.00','12',0),
 ('10409','21','40.00','12',0),
 ('10410','33','10.00','49',0),
 ('10410','59','220.00','16',0),
 ('10411','41','38.50','25',0.2),
 ('10411','44','77.50','40',0.2),
 ('10411','59','220.00','9',0.2),
 ('10412','14','93.00','20',0.1),
 ('10413','1','72.00','24',0),
 ('10413','62','197.00','40',0),
 ('10413','76','72.00','14',0),
 ('10414','19','36.50','18',0.05),
 ('10414','33','10.00','50',0),
 ('10415','17','156.00','2',0),
 ('10415','33','10.00','20',0),
 ('10416','19','36.50','20',0),
 ('10416','53','131.00','10',0),
 ('10416','57','78.00','20',0),
 ('10417','38','1054.00','50',0),
 ('10417','46','48.00','2',0.25),
 ('10417','68','50.00','36',0.25),
 ('10417','77','52.00','35',0),
 ('10418','2','76.00','60',0),
 ('10418','47','38.00','55',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10418','61','114.00','16',0),
 ('10418','74','40.00','15',0),
 ('10419','60','136.00','60',0.05),
 ('10419','69','144.00','20',0.05),
 ('10420','9','388.00','20',0.1),
 ('10420','13','24.00','2',0.1),
 ('10420','70','60.00','8',0.1),
 ('10420','73','60.00','20',0.1),
 ('10421','19','36.50','4',0.15),
 ('10421','26','124.50','30',0),
 ('10421','53','131.00','15',0.15),
 ('10421','77','52.00','10',0.15),
 ('10422','26','124.50','2',0),
 ('10423','31','50.00','14',0),
 ('10423','59','220.00','20',0),
 ('10424','35','72.00','60',0.2),
 ('10424','38','1054.00','49',0.2),
 ('10424','68','50.00','30',0.2),
 ('10425','55','96.00','10',0.25),
 ('10425','76','72.00','20',0.25),
 ('10426','56','152.00','5',0),
 ('10426','64','133.00','7',0),
 ('10427','14','93.00','35',0),
 ('10428','46','48.00','20',0),
 ('10429','50','65.00','40',0),
 ('10429','63','175.50','35',0.25),
 ('10430','17','156.00','45',0.2),
 ('10430','21','40.00','50',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10430','56','152.00','30',0),
 ('10430','59','220.00','70',0.2),
 ('10431','17','156.00','50',0.25),
 ('10431','40','73.50','50',0.25),
 ('10431','47','38.00','30',0.25),
 ('10432','26','124.50','10',0),
 ('10432','54','29.50','40',0),
 ('10433','56','152.00','28',0),
 ('10434','11','84.00','6',0),
 ('10434','76','72.00','18',0.15),
 ('10435','2','76.00','10',0),
 ('10435','22','84.00','12',0),
 ('10435','72','139.00','10',0),
 ('10436','46','48.00','5',0),
 ('10436','56','152.00','40',0.1),
 ('10436','64','133.00','30',0.1),
 ('10436','75','31.00','24',0.1),
 ('10437','53','131.00','15',0),
 ('10438','19','36.50','15',0.2),
 ('10438','34','56.00','20',0.2),
 ('10438','57','78.00','15',0.2),
 ('10439','12','152.00','15',0),
 ('10439','16','69.50','16',0),
 ('10439','64','133.00','6',0),
 ('10439','74','40.00','30',0),
 ('10440','2','76.00','45',0.15),
 ('10440','16','69.50','49',0.15),
 ('10440','29','495.00','24',0.15);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10440','61','114.00','90',0.15),
 ('10441','27','175.50','50',0),
 ('10442','11','84.00','30',0),
 ('10442','54','29.50','80',0),
 ('10442','66','68.00','60',0),
 ('10443','11','84.00','6',0.2),
 ('10443','28','182.00','12',0),
 ('10444','17','156.00','10',0),
 ('10444','26','124.50','15',0),
 ('10444','35','72.00','8',0),
 ('10444','41','38.50','30',0),
 ('10445','39','72.00','6',0),
 ('10445','54','29.50','15',0),
 ('10446','19','36.50','12',0.1),
 ('10446','24','18.00','20',0.1),
 ('10446','31','50.00','3',0.1),
 ('10446','52','28.00','15',0.1),
 ('10447','19','36.50','40',0),
 ('10447','65','84.00','35',0),
 ('10447','71','86.00','2',0),
 ('10448','26','124.50','6',0),
 ('10448','40','73.50','20',0),
 ('10449','10','124.00','14',0),
 ('10449','52','28.00','20',0),
 ('10449','62','197.00','35',0),
 ('10450','10','124.00','20',0.2),
 ('10450','54','29.50','6',0.2),
 ('10451','55','96.00','120',0.1),
 ('10451','64','133.00','35',0.1);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10451','65','84.00','28',0.1),
 ('10451','77','52.00','55',0.1),
 ('10452','28','182.00','15',0),
 ('10452','44','77.50','100',0.05),
 ('10453','48','51.00','15',0.1),
 ('10453','70','60.00','25',0.1),
 ('10454','16','69.50','20',0.2),
 ('10454','33','10.00','20',0.2),
 ('10454','46','48.00','10',0.2),
 ('10455','39','72.00','20',0),
 ('10455','53','131.00','50',0),
 ('10455','61','114.00','25',0),
 ('10455','71','86.00','30',0),
 ('10456','21','40.00','40',0.15),
 ('10456','49','80.00','21',0.15),
 ('10457','59','220.00','36',0),
 ('10458','26','124.50','30',0),
 ('10458','28','182.00','30',0),
 ('10458','43','184.00','20',0),
 ('10458','56','152.00','15',0),
 ('10458','71','86.00','50',0),
 ('10459','7','120.00','16',0.05),
 ('10459','46','48.00','20',0.05),
 ('10459','72','139.00','40',0),
 ('10460','68','50.00','21',0.25),
 ('10460','75','31.00','4',0.25),
 ('10461','21','40.00','40',0.25),
 ('10461','30','103.50','28',0.25);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10461','55','96.00','60',0.25),
 ('10462','13','24.00','1',0),
 ('10462','23','36.00','21',0),
 ('10463','19','36.50','21',0),
 ('10463','42','56.00','50',0),
 ('10464','4','88.00','16',0.2),
 ('10464','43','184.00','3',0),
 ('10464','56','152.00','30',0.2),
 ('10464','60','136.00','20',0),
 ('10465','24','18.00','25',0),
 ('10465','29','495.00','18',0.1),
 ('10465','40','73.50','20',0),
 ('10465','45','38.00','30',0.1),
 ('10465','50','65.00','25',0),
 ('10466','11','84.00','10',0),
 ('10466','46','48.00','5',0),
 ('10467','24','18.00','28',0),
 ('10467','25','56.00','12',0),
 ('10468','30','103.50','8',0),
 ('10468','43','184.00','15',0),
 ('10469','2','76.00','40',0.15),
 ('10469','16','69.50','35',0.15),
 ('10469','44','77.50','2',0.15),
 ('10470','18','250.00','30',0),
 ('10470','23','36.00','15',0),
 ('10470','64','133.00','8',0),
 ('10471','7','120.00','30',0),
 ('10471','56','152.00','20',0),
 ('10472','24','18.00','80',0.05);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10472','51','212.00','18',0),
 ('10473','33','10.00','12',0),
 ('10473','71','86.00','12',0),
 ('10474','14','93.00','12',0),
 ('10474','28','182.00','18',0),
 ('10474','40','73.50','21',0),
 ('10474','75','31.00','10',0),
 ('10475','31','50.00','35',0.15),
 ('10475','66','68.00','60',0.15),
 ('10475','76','72.00','42',0.15),
 ('10476','55','96.00','2',0.05),
 ('10476','70','60.00','12',0),
 ('10477','1','72.00','15',0),
 ('10477','21','40.00','21',0.25),
 ('10477','39','72.00','20',0.25),
 ('10478','10','124.00','20',0.05),
 ('10479','38','1054.00','30',0),
 ('10479','53','131.00','28',0),
 ('10479','59','220.00','60',0),
 ('10479','64','133.00','30',0),
 ('10480','47','38.00','30',0),
 ('10480','59','220.00','12',0),
 ('10481','49','80.00','24',0),
 ('10481','60','136.00','40',0),
 ('10482','40','73.50','10',0),
 ('10483','34','56.00','35',0.05),
 ('10483','77','52.00','30',0.05),
 ('10484','21','40.00','14',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10484','40','73.50','10',0),
 ('10484','51','212.00','3',0),
 ('10485','2','76.00','20',0.1),
 ('10485','3','40.00','20',0.1),
 ('10485','55','96.00','30',0.1),
 ('10485','70','60.00','60',0.1),
 ('10486','11','84.00','5',0),
 ('10486','51','212.00','25',0),
 ('10486','74','40.00','16',0),
 ('10487','19','36.50','5',0),
 ('10487','26','124.50','30',0),
 ('10487','54','29.50','24',0.25),
 ('10488','59','220.00','30',0),
 ('10488','73','60.00','20',0.2),
 ('10489','11','84.00','15',0.25),
 ('10489','16','69.50','18',0),
 ('10490','59','220.00','60',0),
 ('10490','68','50.00','30',0),
 ('10490','75','31.00','36',0),
 ('10491','44','77.50','15',0.15),
 ('10491','77','52.00','7',0.15),
 ('10492','25','56.00','60',0.05),
 ('10492','42','56.00','20',0.05),
 ('10493','65','84.00','15',0.1),
 ('10493','66','68.00','10',0.1),
 ('10493','69','144.00','10',0.1),
 ('10494','56','152.00','30',0),
 ('10495','23','36.00','10',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10495','41','38.50','20',0),
 ('10495','77','52.00','5',0),
 ('10496','31','50.00','20',0.05),
 ('10497','56','152.00','14',0),
 ('10497','72','139.00','25',0),
 ('10497','77','52.00','25',0),
 ('10498','24','22.50','14',0),
 ('10498','40','92.00','5',0),
 ('10498','42','70.00','30',0),
 ('10499','28','228.00','20',0),
 ('10499','49','100.00','25',0),
 ('10500','15','77.50','12',0.05),
 ('10500','28','228.00','8',0.05),
 ('10501','54','37.25','20',0),
 ('10502','45','47.50','21',0),
 ('10502','53','164.00','6',0),
 ('10502','67','70.00','30',0),
 ('10503','14','116.25','70',0),
 ('10503','65','105.25','20',0),
 ('10504','2','95.00','12',0),
 ('10504','21','50.00','12',0),
 ('10504','53','164.00','10',0),
 ('10504','61','142.50','25',0),
 ('10505','62','246.50','3',0),
 ('10506','25','70.00','18',0.1),
 ('10506','70','75.00','14',0.1),
 ('10507','43','230.00','15',0.15),
 ('10507','48','63.75','15',0.15),
 ('10508','13','30.00','10',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10508','39','90.00','10',0),
 ('10509','28','228.00','3',0),
 ('10510','29','618.95','36',0),
 ('10510','75','38.75','36',0.1),
 ('10511','4','110.00','50',0.15),
 ('10511','7','150.00','50',0.15),
 ('10511','8','200.00','10',0.15),
 ('10512','24','22.50','10',0.15),
 ('10512','46','60.00','9',0.15),
 ('10512','47','47.50','6',0.15),
 ('10512','60','170.00','12',0.15),
 ('10513','21','50.00','40',0.2),
 ('10513','32','160.00','50',0.2),
 ('10513','61','142.50','15',0.2),
 ('10514','20','405.00','39',0),
 ('10514','28','228.00','35',0),
 ('10514','56','190.00','70',0),
 ('10514','65','105.25','39',0),
 ('10514','75','38.75','50',0),
 ('10515','9','485.00','16',0.15),
 ('10515','16','87.25','50',0),
 ('10515','27','219.50','120',0),
 ('10515','33','12.50','16',0.15),
 ('10515','60','170.00','84',0.15),
 ('10516','18','312.50','25',0.1),
 ('10516','41','48.25','80',0.1),
 ('10516','42','70.00','20',0),
 ('10517','52','35.00','6',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10517','59','275.00','4',0),
 ('10517','70','75.00','6',0),
 ('10518','24','22.50','5',0),
 ('10518','38','1317.50','15',0),
 ('10518','44','97.25','9',0),
 ('10519','10','155.00','16',0.05),
 ('10519','56','190.00','40',0),
 ('10519','60','170.00','10',0.05),
 ('10520','24','22.50','8',0),
 ('10520','53','164.00','5',0),
 ('10521','35','90.00','3',0),
 ('10521','41','48.25','10',0),
 ('10521','68','62.50','6',0),
 ('10522','1','90.00','40',0.2),
 ('10522','8','200.00','24',0),
 ('10522','30','129.45','20',0.2),
 ('10522','40','92.00','25',0.2),
 ('10523','17','195.00','25',0.1),
 ('10523','20','405.00','15',0.1),
 ('10523','37','130.00','18',0.1),
 ('10523','41','48.25','6',0.1),
 ('10524','10','155.00','2',0),
 ('10524','30','129.45','10',0),
 ('10524','43','230.00','60',0),
 ('10524','54','37.25','15',0),
 ('10525','36','95.00','30',0),
 ('10525','40','92.00','15',0.1),
 ('10526','1','90.00','8',0.15),
 ('10526','13','30.00','10',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10526','56','190.00','30',0.15),
 ('10527','4','110.00','50',0.1),
 ('10527','36','95.00','30',0.1),
 ('10528','11','105.00','3',0),
 ('10528','33','12.50','8',0.2),
 ('10528','72','174.00','9',0),
 ('10529','55','120.00','14',0),
 ('10529','68','62.50','20',0),
 ('10529','69','180.00','10',0),
 ('10530','17','195.00','40',0),
 ('10530','43','230.00','25',0),
 ('10530','61','142.50','20',0),
 ('10530','76','90.00','50',0),
 ('10531','59','275.00','2',0),
 ('10532','30','129.45','15',0),
 ('10532','66','85.00','24',0),
 ('10533','4','110.00','50',0.05),
 ('10533','72','174.00','24',0),
 ('10533','73','75.00','24',0.05),
 ('10534','30','129.45','10',0),
 ('10534','40','92.00','10',0.2),
 ('10534','54','37.25','10',0.2),
 ('10535','11','105.00','50',0.1),
 ('10535','40','92.00','10',0.1),
 ('10535','57','97.50','5',0.1),
 ('10535','59','275.00','15',0.1),
 ('10536','12','190.00','15',0.25),
 ('10536','31','62.50','20',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10536','33','12.50','30',0),
 ('10536','60','170.00','35',0.25),
 ('10537','31','62.50','30',0),
 ('10537','51','265.00','6',0),
 ('10537','58','66.25','20',0),
 ('10537','72','174.00','21',0),
 ('10537','73','75.00','9',0),
 ('10538','70','75.00','7',0),
 ('10538','72','174.00','1',0),
 ('10539','13','30.00','8',0),
 ('10539','21','50.00','15',0),
 ('10539','33','12.50','15',0),
 ('10539','49','100.00','6',0),
 ('10540','3','50.00','60',0),
 ('10540','26','156.15','40',0),
 ('10540','38','1317.50','30',0),
 ('10540','68','62.50','35',0),
 ('10541','24','22.50','35',0.1),
 ('10541','38','1317.50','4',0.1),
 ('10541','65','105.25','36',0.1),
 ('10541','71','107.50','9',0.1),
 ('10542','11','105.00','15',0.05),
 ('10542','54','37.25','24',0.05),
 ('10543','12','190.00','30',0.15),
 ('10543','23','45.00','70',0.15),
 ('10544','28','228.00','7',0),
 ('10544','67','70.00','7',0),
 ('10545','11','105.00','10',0),
 ('10546','7','150.00','10',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10546','35','90.00','30',0),
 ('10546','62','246.50','40',0),
 ('10547','32','160.00','24',0.15),
 ('10547','36','95.00','60',0),
 ('10548','34','70.00','10',0.25),
 ('10548','41','48.25','14',0),
 ('10549','31','62.50','55',0.15),
 ('10549','45','47.50','100',0.15),
 ('10549','51','265.00','48',0.15),
 ('10550','17','195.00','8',0.1),
 ('10550','19','46.00','10',0),
 ('10550','21','50.00','6',0.1),
 ('10550','61','142.50','10',0.1),
 ('10551','16','87.25','40',0.15),
 ('10551','35','90.00','20',0.15),
 ('10551','44','97.25','40',0),
 ('10552','69','180.00','18',0),
 ('10552','75','38.75','30',0),
 ('10553','11','105.00','15',0),
 ('10553','16','87.25','14',0),
 ('10553','22','105.00','24',0),
 ('10553','31','62.50','30',0),
 ('10553','35','90.00','6',0),
 ('10554','16','87.25','30',0.05),
 ('10554','23','45.00','20',0.05),
 ('10554','62','246.50','20',0.05),
 ('10554','77','65.00','10',0.05),
 ('10555','14','116.25','30',0.2);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10555','19','46.00','35',0.2),
 ('10555','24','22.50','18',0.2),
 ('10555','51','265.00','20',0.2),
 ('10555','56','190.00','40',0.2),
 ('10556','72','174.00','24',0),
 ('10557','64','166.25','30',0),
 ('10557','75','38.75','20',0),
 ('10558','47','47.50','25',0),
 ('10558','51','265.00','20',0),
 ('10558','52','35.00','30',0),
 ('10558','53','164.00','18',0),
 ('10558','73','75.00','3',0),
 ('10559','41','48.25','12',0.05),
 ('10559','55','120.00','18',0.05),
 ('10560','30','129.45','20',0),
 ('10560','62','246.50','15',0.25),
 ('10561','44','97.25','10',0),
 ('10561','51','265.00','50',0),
 ('10562','33','12.50','20',0.1),
 ('10562','62','246.50','10',0.1),
 ('10563','36','95.00','25',0),
 ('10563','52','35.00','70',0),
 ('10564','17','195.00','16',0.05),
 ('10564','31','62.50','6',0.05),
 ('10564','55','120.00','25',0.05),
 ('10565','24','22.50','25',0.1),
 ('10565','64','166.25','18',0.1),
 ('10566','11','105.00','35',0.15);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10566','18','312.50','18',0.15),
 ('10566','76','90.00','10',0),
 ('10567','31','62.50','60',0.2),
 ('10567','51','265.00','3',0),
 ('10567','59','275.00','40',0.2),
 ('10568','10','155.00','5',0),
 ('10569','31','62.50','35',0.2),
 ('10569','76','90.00','30',0),
 ('10570','11','105.00','15',0.05),
 ('10570','56','190.00','60',0.05),
 ('10571','14','116.25','11',0.15),
 ('10571','42','70.00','28',0.15),
 ('10572','16','87.25','12',0.1),
 ('10572','32','160.00','10',0.1),
 ('10572','40','92.00','50',0),
 ('10572','75','38.75','15',0.1),
 ('10573','17','195.00','18',0),
 ('10573','34','70.00','40',0),
 ('10573','53','164.00','25',0),
 ('10574','33','12.50','14',0),
 ('10574','40','92.00','2',0),
 ('10574','62','246.50','10',0),
 ('10574','64','166.25','6',0),
 ('10575','59','275.00','12',0),
 ('10575','63','219.50','6',0),
 ('10575','72','174.00','30',0),
 ('10575','76','90.00','10',0),
 ('10576','1','90.00','10',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10576','31','62.50','20',0),
 ('10576','44','97.25','21',0),
 ('10577','39','90.00','10',0),
 ('10577','75','38.75','20',0),
 ('10577','77','65.00','18',0),
 ('10578','35','90.00','20',0),
 ('10578','57','97.50','6',0),
 ('10579','15','77.50','10',0),
 ('10579','75','38.75','21',0),
 ('10580','14','116.25','15',0.05),
 ('10580','41','48.25','9',0.05),
 ('10580','65','105.25','30',0.05),
 ('10581','75','38.75','50',0.2),
 ('10582','57','97.50','4',0),
 ('10582','76','90.00','14',0),
 ('10583','29','618.95','10',0),
 ('10583','60','170.00','24',0.15),
 ('10583','69','180.00','10',0.15),
 ('10584','31','62.50','50',0.05),
 ('10585','47','47.50','15',0),
 ('10586','52','35.00','4',0.15),
 ('10587','26','156.15','6',0),
 ('10587','35','90.00','20',0),
 ('10587','77','65.00','20',0),
 ('10588','18','312.50','40',0.2),
 ('10588','42','70.00','100',0.2),
 ('10589','35','90.00','4',0),
 ('10590','1','90.00','20',0),
 ('10590','77','65.00','60',0.05);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10591','3','50.00','14',0),
 ('10591','7','150.00','10',0),
 ('10591','54','37.25','50',0),
 ('10592','15','77.50','25',0.05),
 ('10592','26','156.15','5',0.05),
 ('10593','20','405.00','21',0.2),
 ('10593','69','180.00','20',0.2),
 ('10593','76','90.00','4',0.2),
 ('10594','52','35.00','24',0),
 ('10594','58','66.25','30',0),
 ('10595','35','90.00','30',0.25),
 ('10595','61','142.50','120',0.25),
 ('10595','69','180.00','65',0.25),
 ('10596','56','190.00','5',0.2),
 ('10596','63','219.50','24',0.2),
 ('10596','75','38.75','30',0.2),
 ('10597','24','22.50','35',0.2),
 ('10597','57','97.50','20',0),
 ('10597','65','105.25','12',0.2),
 ('10598','27','219.50','50',0),
 ('10598','71','107.50','9',0),
 ('10599','62','246.50','10',0),
 ('10600','54','37.25','4',0),
 ('10600','73','75.00','30',0),
 ('10601','13','30.00','60',0),
 ('10601','59','275.00','35',0),
 ('10602','77','65.00','5',0.25),
 ('10603','22','105.00','48',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10603','49','100.00','25',0.05),
 ('10604','48','63.75','6',0.1),
 ('10604','76','90.00','10',0.1),
 ('10605','16','87.25','30',0.05),
 ('10605','59','275.00','20',0.05),
 ('10605','60','170.00','70',0.05),
 ('10605','71','107.50','15',0.05),
 ('10606','4','110.00','20',0.2),
 ('10606','55','120.00','20',0.2),
 ('10606','62','246.50','10',0.2),
 ('10607','7','150.00','45',0),
 ('10607','17','195.00','100',0),
 ('10607','33','12.50','14',0),
 ('10607','40','92.00','42',0),
 ('10607','72','174.00','12',0),
 ('10608','56','190.00','28',0),
 ('10609','1','90.00','3',0),
 ('10609','10','155.00','10',0),
 ('10609','21','50.00','6',0),
 ('10610','36','95.00','21',0.25),
 ('10611','1','90.00','6',0),
 ('10611','2','95.00','10',0),
 ('10611','60','170.00','15',0),
 ('10612','10','155.00','70',0),
 ('10612','36','95.00','55',0),
 ('10612','49','100.00','18',0),
 ('10612','60','170.00','40',0),
 ('10612','76','90.00','80',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10613','13','30.00','8',0.1),
 ('10613','75','38.75','40',0),
 ('10614','11','105.00','14',0),
 ('10614','21','50.00','8',0),
 ('10614','39','90.00','5',0),
 ('10615','55','120.00','5',0),
 ('10616','38','1317.50','15',0.05),
 ('10616','56','190.00','14',0),
 ('10616','70','75.00','15',0.05),
 ('10616','71','107.50','15',0.05),
 ('10617','59','275.00','30',0.15),
 ('10618','6','125.00','70',0),
 ('10618','56','190.00','20',0),
 ('10618','68','62.50','15',0),
 ('10619','21','50.00','42',0),
 ('10619','22','105.00','40',0),
 ('10620','24','22.50','5',0),
 ('10620','52','35.00','5',0),
 ('10621','19','46.00','5',0),
 ('10621','23','45.00','10',0),
 ('10621','70','75.00','20',0),
 ('10621','71','107.50','15',0),
 ('10622','2','95.00','20',0),
 ('10622','68','62.50','18',0.2),
 ('10623','14','116.25','21',0),
 ('10623','19','46.00','15',0.1),
 ('10623','21','50.00','25',0.1),
 ('10623','24','22.50','3',0),
 ('10623','35','90.00','30',0.1);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10624','28','228.00','10',0),
 ('10624','29','618.95','6',0),
 ('10624','44','97.25','10',0),
 ('10625','14','116.25','3',0),
 ('10625','42','70.00','5',0),
 ('10625','60','170.00','10',0),
 ('10626','53','164.00','12',0),
 ('10626','60','170.00','20',0),
 ('10626','71','107.50','20',0),
 ('10627','62','246.50','15',0),
 ('10627','73','75.00','35',0.15),
 ('10628','1','90.00','25',0),
 ('10629','29','618.95','20',0),
 ('10629','64','166.25','9',0),
 ('10630','55','120.00','12',0.05),
 ('10630','76','90.00','35',0),
 ('10631','75','38.75','8',0.1),
 ('10632','2','95.00','30',0.05),
 ('10632','33','12.50','20',0.05),
 ('10633','12','190.00','36',0.15),
 ('10633','13','30.00','13',0.15),
 ('10633','26','156.15','35',0.15),
 ('10633','62','246.50','80',0.15),
 ('10634','7','150.00','35',0),
 ('10634','18','312.50','50',0),
 ('10634','51','265.00','15',0),
 ('10634','75','38.75','2',0),
 ('10635','4','110.00','10',0.1);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10635','5','106.75','15',0.1),
 ('10635','22','105.00','40',0),
 ('10636','4','110.00','25',0),
 ('10636','58','66.25','6',0),
 ('10637','11','105.00','10',0),
 ('10637','50','81.25','25',0.05),
 ('10637','56','190.00','60',0.05),
 ('10638','45','47.50','20',0),
 ('10638','65','105.25','21',0),
 ('10638','72','174.00','60',0),
 ('10639','18','312.50','8',0),
 ('10640','69','180.00','20',0.25),
 ('10640','70','75.00','15',0.25),
 ('10641','2','95.00','50',0),
 ('10641','40','92.00','60',0),
 ('10642','21','50.00','30',0.2),
 ('10642','61','142.50','20',0.2),
 ('10643','28','228.00','15',0.25),
 ('10643','39','90.00','21',0.25),
 ('10643','46','60.00','2',0.25),
 ('10644','18','312.50','4',0.1),
 ('10644','43','230.00','20',0),
 ('10644','46','60.00','21',0.1),
 ('10645','18','312.50','20',0),
 ('10645','36','95.00','15',0),
 ('10646','1','90.00','15',0.25),
 ('10646','10','155.00','18',0.25),
 ('10646','71','107.50','30',0.25);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10646','77','65.00','35',0.25),
 ('10647','19','46.00','30',0),
 ('10647','39','90.00','20',0),
 ('10648','22','105.00','15',0),
 ('10648','24','22.50','15',0.15),
 ('10649','28','228.00','20',0),
 ('10649','72','174.00','15',0),
 ('10650','30','129.45','30',0),
 ('10650','53','164.00','25',0.05),
 ('10650','54','37.25','30',0),
 ('10651','19','46.00','12',0.25),
 ('10651','22','105.00','20',0.25),
 ('10652','30','129.45','2',0.25),
 ('10652','42','70.00','20',0),
 ('10653','16','87.25','30',0.1),
 ('10653','60','170.00','20',0.1),
 ('10654','4','110.00','12',0.1),
 ('10654','39','90.00','20',0.1),
 ('10654','54','37.25','6',0.1),
 ('10655','41','48.25','20',0.2),
 ('10656','14','116.25','3',0.1),
 ('10656','44','97.25','28',0.1),
 ('10656','47','47.50','6',0.1),
 ('10657','15','77.50','50',0),
 ('10657','41','48.25','24',0),
 ('10657','46','60.00','45',0),
 ('10657','47','47.50','10',0),
 ('10657','56','190.00','45',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10657','60','170.00','30',0),
 ('10658','21','50.00','60',0),
 ('10658','40','92.00','70',0.05),
 ('10658','60','170.00','55',0.05),
 ('10658','77','65.00','70',0.05),
 ('10659','31','62.50','20',0.05),
 ('10659','40','92.00','24',0.05),
 ('10659','70','75.00','40',0.05),
 ('10660','20','405.00','21',0),
 ('10661','39','90.00','3',0.2),
 ('10661','58','66.25','49',0.2),
 ('10662','68','62.50','10',0),
 ('10663','40','92.00','30',0.05),
 ('10663','42','70.00','30',0.05),
 ('10663','51','265.00','20',0.05),
 ('10664','10','155.00','24',0.15),
 ('10664','56','190.00','12',0.15),
 ('10664','65','105.25','15',0.15),
 ('10665','51','265.00','20',0),
 ('10665','59','275.00','1',0),
 ('10665','76','90.00','10',0),
 ('10666','29','618.95','36',0),
 ('10666','65','105.25','10',0),
 ('10667','69','180.00','45',0.2),
 ('10667','71','107.50','14',0.2),
 ('10668','31','62.50','8',0.1),
 ('10668','55','120.00','4',0.1),
 ('10668','64','166.25','15',0.1);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10669','36','95.00','30',0),
 ('10670','23','45.00','32',0),
 ('10670','46','60.00','60',0),
 ('10670','67','70.00','25',0),
 ('10670','73','75.00','50',0),
 ('10670','75','38.75','25',0),
 ('10671','16','87.25','10',0),
 ('10671','62','246.50','10',0),
 ('10671','65','105.25','12',0),
 ('10672','38','1317.50','15',0.1),
 ('10672','71','107.50','12',0),
 ('10673','16','87.25','3',0),
 ('10673','42','70.00','6',0),
 ('10673','43','230.00','6',0),
 ('10674','23','45.00','5',0),
 ('10675','14','116.25','30',0),
 ('10675','53','164.00','10',0),
 ('10675','58','66.25','30',0),
 ('10676','10','155.00','2',0),
 ('10676','19','46.00','7',0),
 ('10676','44','97.25','21',0),
 ('10677','26','156.15','30',0.15),
 ('10677','33','12.50','8',0.15),
 ('10678','12','190.00','100',0),
 ('10678','33','12.50','30',0),
 ('10678','41','48.25','120',0),
 ('10678','54','37.25','30',0),
 ('10679','59','275.00','12',0),
 ('10680','16','87.25','50',0.25);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10680','31','62.50','20',0.25),
 ('10680','42','70.00','40',0.25),
 ('10681','19','46.00','30',0.1),
 ('10681','21','50.00','12',0.1),
 ('10681','64','166.25','28',0),
 ('10682','33','12.50','30',0),
 ('10682','66','85.00','4',0),
 ('10682','75','38.75','30',0),
 ('10683','52','35.00','9',0),
 ('10684','40','92.00','20',0),
 ('10684','47','47.50','40',0),
 ('10684','60','170.00','30',0),
 ('10685','10','155.00','20',0),
 ('10685','41','48.25','4',0),
 ('10685','47','47.50','15',0),
 ('10686','17','195.00','30',0.2),
 ('10686','26','156.15','15',0),
 ('10687','9','485.00','50',0.25),
 ('10687','29','618.95','10',0),
 ('10687','36','95.00','6',0.25),
 ('10688','10','155.00','18',0.1),
 ('10688','28','228.00','60',0.1),
 ('10688','34','70.00','14',0),
 ('10689','1','90.00','35',0.25),
 ('10690','56','190.00','20',0.25),
 ('10690','77','65.00','30',0.25),
 ('10691','1','90.00','30',0),
 ('10691','29','618.95','40',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10691','43','230.00','40',0),
 ('10691','44','97.25','24',0),
 ('10691','62','246.50','48',0),
 ('10692','63','219.50','20',0),
 ('10693','9','485.00','6',0),
 ('10693','54','37.25','60',0.15),
 ('10693','69','180.00','30',0.15),
 ('10693','73','75.00','15',0.15),
 ('10694','7','150.00','90',0),
 ('10694','59','275.00','25',0),
 ('10694','70','75.00','50',0),
 ('10695','8','200.00','10',0),
 ('10695','12','190.00','4',0),
 ('10695','24','22.50','20',0),
 ('10696','17','195.00','20',0),
 ('10696','46','60.00','18',0),
 ('10697','19','46.00','7',0.25),
 ('10697','35','90.00','9',0.25),
 ('10697','58','66.25','30',0.25),
 ('10697','70','75.00','30',0.25),
 ('10698','11','105.00','15',0),
 ('10698','17','195.00','8',0.05),
 ('10698','29','618.95','12',0.05),
 ('10698','65','105.25','65',0.05),
 ('10698','70','75.00','8',0.05),
 ('10699','47','47.50','12',0),
 ('10700','1','90.00','5',0.2),
 ('10700','34','70.00','12',0.2);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10700','68','62.50','40',0.2),
 ('10700','71','107.50','60',0.2),
 ('10701','59','275.00','42',0.15),
 ('10701','71','107.50','20',0.15),
 ('10701','76','90.00','35',0.15),
 ('10702','3','50.00','6',0),
 ('10702','76','90.00','15',0),
 ('10703','2','95.00','5',0),
 ('10703','59','275.00','35',0),
 ('10703','73','75.00','35',0),
 ('10704','4','110.00','6',0),
 ('10704','24','22.50','35',0),
 ('10704','48','63.75','24',0),
 ('10705','31','62.50','20',0),
 ('10705','32','160.00','4',0),
 ('10706','16','87.25','20',0),
 ('10706','43','230.00','24',0),
 ('10706','59','275.00','8',0),
 ('10707','55','120.00','21',0),
 ('10707','57','97.50','40',0),
 ('10707','70','75.00','28',0.15),
 ('10708','5','106.75','4',0),
 ('10708','36','95.00','5',0),
 ('10709','8','200.00','40',0),
 ('10709','51','265.00','28',0),
 ('10709','60','170.00','10',0),
 ('10710','19','46.00','5',0),
 ('10710','47','47.50','5',0),
 ('10711','19','46.00','12',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10711','41','48.25','42',0),
 ('10711','53','164.00','120',0),
 ('10712','53','164.00','3',0.05),
 ('10712','56','190.00','30',0),
 ('10713','10','155.00','18',0),
 ('10713','26','156.15','30',0),
 ('10713','45','47.50','110',0),
 ('10713','46','60.00','24',0),
 ('10714','2','95.00','30',0.25),
 ('10714','17','195.00','27',0.25),
 ('10714','47','47.50','50',0.25),
 ('10714','56','190.00','18',0.25),
 ('10714','58','66.25','12',0.25),
 ('10715','10','155.00','21',0),
 ('10715','71','107.50','30',0),
 ('10716','21','50.00','5',0),
 ('10716','51','265.00','7',0),
 ('10716','61','142.50','10',0),
 ('10717','21','50.00','32',0.05),
 ('10717','54','37.25','15',0),
 ('10717','69','180.00','25',0.05),
 ('10718','12','190.00','36',0),
 ('10718','16','87.25','20',0),
 ('10718','36','95.00','40',0),
 ('10718','62','246.50','20',0),
 ('10719','18','312.50','12',0.25),
 ('10719','30','129.45','3',0.25),
 ('10719','54','37.25','40',0.25);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10720','35','90.00','21',0),
 ('10720','71','107.50','8',0),
 ('10721','44','97.25','50',0.05),
 ('10722','2','95.00','3',0),
 ('10722','31','62.50','50',0),
 ('10722','68','62.50','45',0),
 ('10722','75','38.75','42',0),
 ('10723','26','156.15','15',0),
 ('10724','10','155.00','16',0),
 ('10724','61','142.50','5',0),
 ('10725','41','48.25','12',0),
 ('10725','52','35.00','4',0),
 ('10725','55','120.00','6',0),
 ('10726','4','110.00','25',0),
 ('10726','11','105.00','5',0),
 ('10727','17','195.00','20',0.05),
 ('10727','56','190.00','10',0.05),
 ('10727','59','275.00','10',0.05),
 ('10728','30','129.45','15',0),
 ('10728','40','92.00','6',0),
 ('10728','55','120.00','12',0),
 ('10728','60','170.00','15',0),
 ('10729','1','90.00','50',0),
 ('10729','21','50.00','30',0),
 ('10729','50','81.25','40',0),
 ('10730','16','87.25','15',0.05),
 ('10730','31','62.50','3',0.05),
 ('10730','65','105.25','10',0.05),
 ('10731','21','50.00','40',0.05);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10731','51','265.00','30',0.05),
 ('10732','76','90.00','20',0),
 ('10733','14','116.25','16',0),
 ('10733','28','228.00','20',0),
 ('10733','52','35.00','25',0),
 ('10734','6','125.00','30',0),
 ('10734','30','129.45','15',0),
 ('10734','76','90.00','20',0),
 ('10735','61','142.50','20',0.1),
 ('10735','77','65.00','2',0.1),
 ('10736','65','105.25','40',0),
 ('10736','75','38.75','20',0),
 ('10737','13','30.00','4',0),
 ('10737','41','48.25','12',0),
 ('10738','16','87.25','3',0),
 ('10739','36','95.00','6',0),
 ('10739','52','35.00','18',0),
 ('10740','28','228.00','5',0.2),
 ('10740','35','90.00','35',0.2),
 ('10740','45','47.50','40',0.2),
 ('10740','56','190.00','14',0.2),
 ('10741','2','95.00','15',0.2),
 ('10742','3','50.00','20',0),
 ('10742','60','170.00','50',0),
 ('10742','72','174.00','35',0),
 ('10743','46','60.00','28',0.05),
 ('10744','40','92.00','50',0.2),
 ('10745','18','312.50','24',0),
 ('10745','44','97.25','16',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10745','59','275.00','45',0),
 ('10745','72','174.00','7',0),
 ('10746','13','30.00','6',0),
 ('10746','42','70.00','28',0),
 ('10746','62','246.50','9',0),
 ('10746','69','180.00','40',0),
 ('10747','31','62.50','8',0),
 ('10747','41','48.25','35',0),
 ('10747','63','219.50','9',0),
 ('10747','69','180.00','30',0),
 ('10748','23','45.00','44',0),
 ('10748','40','92.00','40',0),
 ('10748','56','190.00','28',0),
 ('10749','56','190.00','15',0),
 ('10749','59','275.00','6',0),
 ('10749','76','90.00','10',0),
 ('10750','14','116.25','5',0.15),
 ('10750','45','47.50','40',0.15),
 ('10750','59','275.00','25',0.15),
 ('10751','26','156.15','12',0.1),
 ('10751','30','129.45','30',0),
 ('10751','50','81.25','20',0.1),
 ('10751','73','75.00','15',0),
 ('10752','1','90.00','8',0),
 ('10752','69','180.00','3',0),
 ('10753','45','47.50','4',0),
 ('10753','74','50.00','5',0),
 ('10754','40','92.00','3',0),
 ('10755','47','47.50','30',0.25);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10755','56','190.00','30',0.25),
 ('10755','57','97.50','14',0.25),
 ('10755','69','180.00','25',0.25),
 ('10756','18','312.50','21',0.2),
 ('10756','36','95.00','20',0.2),
 ('10756','68','62.50','6',0.2),
 ('10756','69','180.00','20',0.2),
 ('10757','34','70.00','30',0),
 ('10757','59','275.00','7',0),
 ('10757','62','246.50','30',0),
 ('10757','64','166.25','24',0),
 ('10758','26','156.15','20',0),
 ('10758','52','35.00','60',0),
 ('10758','70','75.00','40',0),
 ('10759','32','160.00','10',0),
 ('10760','25','70.00','12',0.25),
 ('10760','27','219.50','40',0),
 ('10760','43','230.00','30',0.25),
 ('10761','25','70.00','35',0.25),
 ('10761','75','38.75','18',0),
 ('10762','39','90.00','16',0),
 ('10762','47','47.50','30',0),
 ('10762','51','265.00','28',0),
 ('10762','56','190.00','60',0),
 ('10763','21','50.00','40',0),
 ('10763','22','105.00','6',0),
 ('10763','24','22.50','20',0),
 ('10764','3','50.00','20',0.1);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10764','39','90.00','130',0.1),
 ('10765','65','105.25','80',0.1),
 ('10766','2','95.00','40',0),
 ('10766','7','150.00','35',0),
 ('10766','68','62.50','40',0),
 ('10767','42','70.00','2',0),
 ('10768','22','105.00','4',0),
 ('10768','31','62.50','50',0),
 ('10768','60','170.00','15',0),
 ('10768','71','107.50','12',0),
 ('10769','41','48.25','30',0.05),
 ('10769','52','35.00','15',0.05),
 ('10769','61','142.50','20',0),
 ('10769','62','246.50','15',0),
 ('10770','11','105.00','15',0.25),
 ('10771','71','107.50','16',0),
 ('10772','29','618.95','18',0),
 ('10772','59','275.00','25',0),
 ('10773','17','195.00','33',0),
 ('10773','31','62.50','70',0.2),
 ('10773','75','38.75','7',0.2),
 ('10774','31','62.50','2',0.25),
 ('10774','66','85.00','50',0),
 ('10775','10','155.00','6',0),
 ('10775','67','70.00','3',0),
 ('10776','31','62.50','16',0.05),
 ('10776','42','70.00','12',0.05),
 ('10776','45','47.50','27',0.05);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10776','51','265.00','120',0.05),
 ('10777','42','70.00','20',0.2),
 ('10778','41','48.25','10',0),
 ('10779','16','87.25','20',0),
 ('10779','62','246.50','20',0),
 ('10780','70','75.00','35',0),
 ('10780','77','65.00','15',0),
 ('10781','54','37.25','3',0.2),
 ('10781','56','190.00','20',0.2),
 ('10781','74','50.00','35',0),
 ('10782','31','62.50','1',0),
 ('10783','31','62.50','10',0),
 ('10783','38','1317.50','5',0),
 ('10784','36','95.00','30',0),
 ('10784','39','90.00','2',0.15),
 ('10784','72','174.00','30',0.15),
 ('10785','10','155.00','10',0),
 ('10785','75','38.75','10',0),
 ('10786','8','200.00','30',0.2),
 ('10786','30','129.45','15',0.2),
 ('10786','75','38.75','42',0.2),
 ('10787','2','95.00','15',0.05),
 ('10787','29','618.95','20',0.05),
 ('10788','19','46.00','50',0.05),
 ('10788','75','38.75','40',0.05),
 ('10789','18','312.50','30',0),
 ('10789','35','90.00','15',0),
 ('10789','63','219.50','30',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10789','68','62.50','18',0),
 ('10790','7','150.00','3',0.15),
 ('10790','56','190.00','20',0.15),
 ('10791','29','618.95','14',0.05),
 ('10791','41','48.25','20',0.05),
 ('10792','2','95.00','10',0),
 ('10792','54','37.25','3',0),
 ('10792','68','62.50','15',0),
 ('10793','41','48.25','14',0),
 ('10793','52','35.00','8',0),
 ('10794','14','116.25','15',0.2),
 ('10794','54','37.25','6',0.2),
 ('10795','16','87.25','65',0),
 ('10795','17','195.00','35',0.25),
 ('10796','26','156.15','21',0.2),
 ('10796','44','97.25','10',0),
 ('10796','64','166.25','35',0.2),
 ('10796','69','180.00','24',0.2),
 ('10797','11','105.00','20',0),
 ('10798','62','246.50','2',0),
 ('10798','72','174.00','10',0),
 ('10799','13','30.00','20',0.15),
 ('10799','24','22.50','20',0.15),
 ('10799','59','275.00','25',0),
 ('10800','11','105.00','50',0.1),
 ('10800','51','265.00','10',0.1),
 ('10800','54','37.25','7',0.1),
 ('10801','17','195.00','40',0.25);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10801','29','618.95','20',0.25),
 ('10802','30','129.45','25',0.25),
 ('10802','51','265.00','30',0.25),
 ('10802','55','120.00','60',0.25),
 ('10802','62','246.50','5',0.25),
 ('10803','19','46.00','24',0.05),
 ('10803','25','70.00','15',0.05),
 ('10803','59','275.00','15',0.05),
 ('10804','10','155.00','36',0),
 ('10804','28','228.00','24',0),
 ('10804','49','100.00','4',0.15),
 ('10805','34','70.00','10',0),
 ('10805','38','1317.50','10',0),
 ('10806','2','95.00','20',0.25),
 ('10806','65','105.25','2',0),
 ('10806','74','50.00','15',0.25),
 ('10807','40','92.00','1',0),
 ('10808','56','190.00','20',0.15),
 ('10808','76','90.00','50',0.15),
 ('10809','52','35.00','20',0),
 ('10810','13','30.00','7',0),
 ('10810','25','70.00','5',0),
 ('10810','70','75.00','5',0),
 ('10811','19','46.00','15',0),
 ('10811','23','45.00','18',0),
 ('10811','40','92.00','30',0),
 ('10812','31','62.50','16',0.1),
 ('10812','72','174.00','40',0.1);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10812','77','65.00','20',0),
 ('10813','2','95.00','12',0.2),
 ('10813','46','60.00','35',0),
 ('10814','41','48.25','20',0),
 ('10814','43','230.00','20',0.15),
 ('10814','48','63.75','8',0.15),
 ('10814','61','142.50','30',0.15),
 ('10815','33','12.50','16',0),
 ('10816','38','1317.50','30',0.05),
 ('10816','62','246.50','20',0.05),
 ('10817','26','156.15','40',0.15),
 ('10817','38','1317.50','30',0),
 ('10817','40','92.00','60',0.15),
 ('10817','62','246.50','25',0.15),
 ('10818','32','160.00','20',0),
 ('10818','41','48.25','20',0),
 ('10819','43','230.00','7',0),
 ('10819','75','38.75','20',0),
 ('10820','56','190.00','30',0),
 ('10821','35','90.00','20',0),
 ('10821','51','265.00','6',0),
 ('10822','62','246.50','3',0),
 ('10822','70','75.00','6',0),
 ('10823','11','105.00','20',0.1),
 ('10823','57','97.50','15',0),
 ('10823','59','275.00','40',0.1),
 ('10823','77','65.00','15',0.1),
 ('10824','41','48.25','12',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10824','70','75.00','9',0),
 ('10825','26','156.15','12',0),
 ('10825','53','164.00','20',0),
 ('10826','31','62.50','35',0),
 ('10826','57','97.50','15',0),
 ('10827','10','155.00','15',0),
 ('10827','39','90.00','21',0),
 ('10828','20','405.00','5',0),
 ('10828','38','1317.50','2',0),
 ('10829','2','95.00','10',0),
 ('10829','8','200.00','20',0),
 ('10829','13','30.00','10',0),
 ('10829','60','170.00','21',0),
 ('10830','6','125.00','6',0),
 ('10830','39','90.00','28',0),
 ('10830','60','170.00','30',0),
 ('10830','68','62.50','24',0),
 ('10831','19','46.00','2',0),
 ('10831','35','90.00','8',0),
 ('10831','38','1317.50','8',0),
 ('10831','43','230.00','9',0),
 ('10832','13','30.00','3',0.2),
 ('10832','25','70.00','10',0.2),
 ('10832','44','97.25','16',0.2),
 ('10832','64','166.25','3',0),
 ('10833','7','150.00','20',0.1),
 ('10833','31','62.50','9',0.1),
 ('10833','53','164.00','9',0.1),
 ('10834','29','618.95','8',0.05);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10834','30','129.45','20',0.05),
 ('10835','59','275.00','15',0),
 ('10835','77','65.00','2',0.2),
 ('10836','22','105.00','52',0),
 ('10836','35','90.00','6',0),
 ('10836','57','97.50','24',0),
 ('10836','60','170.00','60',0),
 ('10836','64','166.25','30',0),
 ('10837','13','30.00','6',0),
 ('10837','40','92.00','25',0),
 ('10837','47','47.50','40',0.25),
 ('10837','76','90.00','21',0.25),
 ('10838','1','90.00','4',0.25),
 ('10838','18','312.50','25',0.25),
 ('10838','36','95.00','50',0.25),
 ('10839','58','66.25','30',0.1),
 ('10839','72','174.00','15',0.1),
 ('10840','25','70.00','6',0.2),
 ('10840','39','90.00','10',0.2),
 ('10841','10','155.00','16',0),
 ('10841','56','190.00','30',0),
 ('10841','59','275.00','50',0),
 ('10841','77','65.00','15',0),
 ('10842','11','105.00','15',0),
 ('10842','43','230.00','5',0),
 ('10842','68','62.50','20',0),
 ('10842','70','75.00','12',0),
 ('10843','51','265.00','4',0.25);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10844','22','105.00','35',0),
 ('10845','23','45.00','70',0.1),
 ('10845','35','90.00','25',0.1),
 ('10845','42','70.00','42',0.1),
 ('10845','58','66.25','60',0.1),
 ('10845','64','166.25','48',0),
 ('10846','4','110.00','21',0),
 ('10846','70','75.00','30',0),
 ('10846','74','50.00','20',0),
 ('10847','1','90.00','80',0.2),
 ('10847','19','46.00','12',0.2),
 ('10847','37','130.00','60',0.2),
 ('10847','45','47.50','36',0.2),
 ('10847','60','170.00','45',0.2),
 ('10847','71','107.50','55',0.2),
 ('10848','5','106.75','30',0),
 ('10848','9','485.00','3',0),
 ('10849','3','50.00','49',0),
 ('10849','26','156.15','18',0.15),
 ('10850','25','70.00','20',0.15),
 ('10850','33','12.50','4',0.15),
 ('10850','70','75.00','30',0.15),
 ('10851','2','95.00','5',0.05),
 ('10851','25','70.00','10',0.05),
 ('10851','57','97.50','10',0.05),
 ('10851','59','275.00','42',0.05),
 ('10852','2','95.00','15',0),
 ('10852','17','195.00','6',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10852','62','246.50','50',0),
 ('10853','18','312.50','10',0),
 ('10854','10','155.00','100',0.15),
 ('10854','13','30.00','65',0.15),
 ('10855','16','87.25','50',0),
 ('10855','31','62.50','14',0),
 ('10855','56','190.00','24',0),
 ('10855','65','105.25','15',0.15),
 ('10856','2','95.00','20',0),
 ('10856','42','70.00','20',0),
 ('10857','3','50.00','30',0),
 ('10857','26','156.15','35',0.25),
 ('10857','29','618.95','10',0.25),
 ('10858','7','150.00','5',0),
 ('10858','27','219.50','10',0),
 ('10858','70','75.00','4',0),
 ('10859','24','22.50','40',0.25),
 ('10859','54','37.25','35',0.25),
 ('10859','64','166.25','30',0.25),
 ('10860','51','265.00','3',0),
 ('10860','76','90.00','20',0),
 ('10861','17','195.00','42',0),
 ('10861','18','312.50','20',0),
 ('10861','21','50.00','40',0),
 ('10861','33','12.50','35',0),
 ('10861','62','246.50','3',0),
 ('10862','11','105.00','25',0),
 ('10862','52','35.00','8',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10863','1','90.00','20',0.15),
 ('10863','58','66.25','12',0.15),
 ('10864','35','90.00','4',0),
 ('10864','67','70.00','15',0),
 ('10865','38','1317.50','60',0.05),
 ('10865','39','90.00','80',0.05),
 ('10866','2','95.00','21',0.25),
 ('10866','24','22.50','6',0.25),
 ('10866','30','129.45','40',0.25),
 ('10867','53','164.00','3',0),
 ('10868','26','156.15','20',0),
 ('10868','35','90.00','30',0),
 ('10868','49','100.00','42',0.1),
 ('10869','1','90.00','40',0),
 ('10869','11','105.00','10',0),
 ('10869','23','45.00','50',0),
 ('10869','68','62.50','20',0),
 ('10870','35','90.00','3',0),
 ('10870','51','265.00','2',0),
 ('10871','6','125.00','50',0.05),
 ('10871','16','87.25','12',0.05),
 ('10871','17','195.00','16',0.05),
 ('10872','55','120.00','10',0.05),
 ('10872','62','246.50','20',0.05),
 ('10872','64','166.25','15',0.05),
 ('10872','65','105.25','21',0.05),
 ('10873','21','50.00','20',0),
 ('10873','28','228.00','3',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10874','10','155.00','10',0),
 ('10875','19','46.00','25',0),
 ('10875','47','47.50','21',0.1),
 ('10875','49','100.00','15',0),
 ('10876','46','60.00','21',0),
 ('10876','64','166.25','20',0),
 ('10877','16','87.25','30',0.25),
 ('10877','18','312.50','25',0),
 ('10878','20','405.00','20',0.05),
 ('10879','40','92.00','12',0),
 ('10879','65','105.25','10',0),
 ('10879','76','90.00','10',0),
 ('10880','23','45.00','30',0.2),
 ('10880','61','142.50','30',0.2),
 ('10880','70','75.00','50',0.2),
 ('10881','73','75.00','10',0),
 ('10882','42','70.00','25',0),
 ('10882','49','100.00','20',0.15),
 ('10882','54','37.25','32',0.15),
 ('10883','24','22.50','8',0),
 ('10884','21','50.00','40',0.05),
 ('10884','56','190.00','21',0.05),
 ('10884','65','105.25','12',0.05),
 ('10885','2','95.00','20',0),
 ('10885','24','22.50','12',0),
 ('10885','70','75.00','30',0),
 ('10885','77','65.00','25',0),
 ('10886','10','155.00','70',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10886','31','62.50','35',0),
 ('10886','77','65.00','40',0),
 ('10887','25','70.00','5',0),
 ('10888','2','95.00','20',0),
 ('10888','68','62.50','18',0),
 ('10889','11','105.00','40',0),
 ('10889','38','1317.50','40',0),
 ('10890','17','195.00','15',0),
 ('10890','34','70.00','10',0),
 ('10890','41','48.25','14',0),
 ('10891','30','129.45','15',0.05),
 ('10892','59','275.00','40',0.05),
 ('10893','8','200.00','30',0),
 ('10893','24','22.50','10',0),
 ('10893','29','618.95','24',0),
 ('10893','30','129.45','35',0),
 ('10893','36','95.00','20',0),
 ('10894','13','30.00','28',0.05),
 ('10894','69','180.00','50',0.05),
 ('10894','75','38.75','120',0.05),
 ('10895','24','22.50','110',0),
 ('10895','39','90.00','45',0),
 ('10895','40','92.00','91',0),
 ('10895','60','170.00','100',0),
 ('10896','45','47.50','15',0),
 ('10896','56','190.00','16',0),
 ('10897','29','618.95','80',0),
 ('10897','30','129.45','36',0),
 ('10898','13','30.00','5',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10899','39','90.00','8',0.15),
 ('10900','70','75.00','3',0.25),
 ('10901','41','48.25','30',0),
 ('10901','71','107.50','30',0),
 ('10902','55','120.00','30',0.15),
 ('10902','62','246.50','6',0.15),
 ('10903','13','30.00','40',0),
 ('10903','65','105.25','21',0),
 ('10903','68','62.50','20',0),
 ('10904','58','66.25','15',0),
 ('10904','62','246.50','35',0),
 ('10905','1','90.00','20',0.05),
 ('10906','61','142.50','15',0),
 ('10907','75','38.75','14',0),
 ('10908','7','150.00','20',0.05),
 ('10908','52','35.00','14',0.05),
 ('10909','7','150.00','12',0),
 ('10909','16','87.25','15',0),
 ('10909','41','48.25','5',0),
 ('10910','19','46.00','12',0),
 ('10910','49','100.00','10',0),
 ('10910','61','142.50','5',0),
 ('10911','1','90.00','10',0),
 ('10911','17','195.00','12',0),
 ('10911','67','70.00','15',0),
 ('10912','11','105.00','40',0.25),
 ('10912','29','618.95','60',0.25),
 ('10913','4','110.00','30',0.25);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10913','33','12.50','40',0.25),
 ('10913','58','66.25','15',0),
 ('10914','71','107.50','25',0),
 ('10915','17','195.00','10',0),
 ('10915','33','12.50','30',0),
 ('10915','54','37.25','10',0),
 ('10916','16','87.25','6',0),
 ('10916','32','160.00','6',0),
 ('10916','57','97.50','20',0),
 ('10917','30','129.45','1',0),
 ('10917','60','170.00','10',0),
 ('10918','1','90.00','60',0.25),
 ('10918','60','170.00','25',0.25),
 ('10919','16','87.25','24',0),
 ('10919','25','70.00','24',0),
 ('10919','40','92.00','20',0),
 ('10920','50','81.25','24',0),
 ('10921','35','90.00','10',0),
 ('10921','63','219.50','40',0),
 ('10922','17','195.00','15',0),
 ('10922','24','22.50','35',0),
 ('10923','42','70.00','10',0.2),
 ('10923','43','230.00','10',0.2),
 ('10923','67','70.00','24',0.2),
 ('10924','10','155.00','20',0.1),
 ('10924','28','228.00','30',0.1),
 ('10924','75','38.75','6',0),
 ('10925','36','95.00','25',0.15),
 ('10925','52','35.00','12',0.15);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10926','11','105.00','2',0),
 ('10926','13','30.00','10',0),
 ('10926','19','46.00','7',0),
 ('10926','72','174.00','10',0),
 ('10927','20','405.00','5',0),
 ('10927','52','35.00','5',0),
 ('10927','76','90.00','20',0),
 ('10928','47','47.50','5',0),
 ('10928','76','90.00','5',0),
 ('10929','21','50.00','60',0),
 ('10929','75','38.75','49',0),
 ('10929','77','65.00','15',0),
 ('10930','21','50.00','36',0),
 ('10930','27','219.50','25',0),
 ('10930','55','120.00','25',0.2),
 ('10930','58','66.25','30',0.2),
 ('10931','13','30.00','42',0.15),
 ('10931','57','97.50','30',0),
 ('10932','16','87.25','30',0.1),
 ('10932','62','246.50','14',0.1),
 ('10932','72','174.00','16',0),
 ('10932','75','38.75','20',0.1),
 ('10933','53','164.00','2',0),
 ('10933','61','142.50','30',0),
 ('10934','6','125.00','20',0),
 ('10935','1','90.00','21',0),
 ('10935','18','312.50','4',0.25),
 ('10935','23','45.00','8',0.25),
 ('10936','36','95.00','30',0.2);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10937','28','228.00','8',0),
 ('10937','34','70.00','20',0),
 ('10938','13','30.00','20',0.25),
 ('10938','43','230.00','24',0.25),
 ('10938','60','170.00','49',0.25),
 ('10938','71','107.50','35',0.25),
 ('10939','2','95.00','10',0.15),
 ('10939','67','70.00','40',0.15),
 ('10940','7','150.00','8',0),
 ('10940','13','30.00','20',0),
 ('10941','31','62.50','44',0.25),
 ('10941','62','246.50','30',0.25),
 ('10941','68','62.50','80',0.25),
 ('10941','72','174.00','50',0),
 ('10942','49','100.00','28',0),
 ('10943','13','30.00','15',0),
 ('10943','22','105.00','21',0),
 ('10943','46','60.00','15',0),
 ('10944','11','105.00','5',0.25),
 ('10944','44','97.25','18',0.25),
 ('10944','56','190.00','18',0),
 ('10945','13','30.00','20',0),
 ('10945','31','62.50','10',0),
 ('10946','10','155.00','25',0),
 ('10946','24','22.50','25',0),
 ('10946','77','65.00','40',0),
 ('10947','59','275.00','4',0),
 ('10948','50','81.25','9',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10948','51','265.00','40',0),
 ('10948','55','120.00','4',0),
 ('10949','6','125.00','12',0),
 ('10949','10','155.00','30',0),
 ('10949','17','195.00','6',0),
 ('10949','62','246.50','60',0),
 ('10950','4','110.00','5',0),
 ('10951','33','12.50','15',0.05),
 ('10951','41','48.25','6',0.05),
 ('10951','75','38.75','50',0.05),
 ('10952','6','125.00','16',0.05),
 ('10952','28','228.00','2',0),
 ('10953','20','405.00','50',0.05),
 ('10953','31','62.50','50',0.05),
 ('10954','16','87.25','28',0.15),
 ('10954','31','62.50','25',0.15),
 ('10954','45','47.50','30',0),
 ('10954','60','170.00','24',0.15),
 ('10955','75','38.75','12',0.2),
 ('10956','21','50.00','12',0),
 ('10956','47','47.50','14',0),
 ('10956','51','265.00','8',0),
 ('10957','30','129.45','30',0),
 ('10957','35','90.00','40',0),
 ('10957','64','166.25','8',0),
 ('10958','5','106.75','20',0),
 ('10958','7','150.00','6',0),
 ('10958','72','174.00','5',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10959','75','38.75','20',0.15),
 ('10960','24','22.50','10',0.25),
 ('10960','41','48.25','24',0),
 ('10961','52','35.00','6',0.05),
 ('10961','76','90.00','60',0),
 ('10962','7','150.00','45',0),
 ('10962','13','30.00','77',0),
 ('10962','53','164.00','20',0),
 ('10962','69','180.00','9',0),
 ('10962','76','90.00','44',0),
 ('10963','60','170.00','2',0.15),
 ('10964','18','312.50','6',0),
 ('10964','38','1317.50','5',0),
 ('10964','69','180.00','10',0),
 ('10965','51','265.00','16',0),
 ('10966','37','130.00','8',0),
 ('10966','56','190.00','12',0.15),
 ('10966','62','246.50','12',0.15),
 ('10967','19','46.00','12',0),
 ('10967','49','100.00','40',0),
 ('10968','12','190.00','30',0),
 ('10968','24','22.50','30',0),
 ('10968','64','166.25','4',0),
 ('10969','46','60.00','9',0),
 ('10970','52','35.00','40',0.2),
 ('10971','29','618.95','14',0),
 ('10972','17','195.00','6',0),
 ('10972','33','12.50','7',0),
 ('10973','26','156.15','5',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10973','41','48.25','6',0),
 ('10973','75','38.75','10',0),
 ('10974','63','219.50','10',0),
 ('10975','8','200.00','16',0),
 ('10975','75','38.75','10',0),
 ('10976','28','228.00','20',0),
 ('10977','39','90.00','30',0),
 ('10977','47','47.50','30',0),
 ('10977','51','265.00','10',0),
 ('10977','63','219.50','20',0),
 ('10978','8','200.00','20',0.15),
 ('10978','21','50.00','40',0.15),
 ('10978','40','92.00','10',0),
 ('10978','44','97.25','6',0.15),
 ('10979','7','150.00','18',0),
 ('10979','12','190.00','20',0),
 ('10979','24','22.50','80',0),
 ('10979','27','219.50','30',0),
 ('10979','31','62.50','24',0),
 ('10979','63','219.50','35',0),
 ('10980','75','38.75','40',0.2),
 ('10981','38','1317.50','60',0),
 ('10982','7','150.00','20',0),
 ('10982','43','230.00','9',0),
 ('10983','13','30.00','84',0.15),
 ('10983','57','97.50','15',0),
 ('10984','16','87.25','55',0),
 ('10984','24','22.50','20',0),
 ('10984','36','95.00','40',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10985','16','87.25','36',0.1),
 ('10985','18','312.50','8',0.1),
 ('10985','32','160.00','35',0.1),
 ('10986','11','105.00','30',0),
 ('10986','20','405.00','15',0),
 ('10986','76','90.00','10',0),
 ('10986','77','65.00','15',0),
 ('10987','7','150.00','60',0),
 ('10987','43','230.00','6',0),
 ('10987','72','174.00','20',0),
 ('10988','7','150.00','60',0),
 ('10988','62','246.50','40',0.1),
 ('10989','6','125.00','40',0),
 ('10989','11','105.00','15',0),
 ('10989','41','48.25','4',0),
 ('10990','21','50.00','65',0),
 ('10990','34','70.00','60',0.15),
 ('10990','55','120.00','65',0.15),
 ('10990','61','142.50','66',0.15),
 ('10991','2','95.00','50',0.2),
 ('10991','70','75.00','20',0.2),
 ('10991','76','90.00','90',0.2),
 ('10992','72','174.00','2',0),
 ('10993','29','618.95','50',0.25),
 ('10993','41','48.25','35',0.25),
 ('10994','59','275.00','18',0.05),
 ('10995','51','265.00','20',0),
 ('10995','60','170.00','4',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('10996','42','70.00','40',0),
 ('10997','32','160.00','50',0),
 ('10997','46','60.00','20',0.25),
 ('10997','52','35.00','20',0.25),
 ('10998','24','22.50','12',0),
 ('10998','61','142.50','7',0),
 ('10998','74','50.00','20',0),
 ('10998','75','38.75','30',0),
 ('10999','41','48.25','20',0.05),
 ('10999','51','265.00','15',0.05),
 ('10999','77','65.00','21',0.05),
 ('11000','4','110.00','25',0.25),
 ('11000','24','22.50','30',0.25),
 ('11000','77','65.00','30',0),
 ('11001','7','150.00','60',0),
 ('11001','22','105.00','25',0),
 ('11001','46','60.00','25',0),
 ('11001','55','120.00','6',0),
 ('11002','13','30.00','56',0),
 ('11002','35','90.00','15',0.15),
 ('11002','42','70.00','24',0.15),
 ('11002','55','120.00','40',0),
 ('11003','1','90.00','4',0),
 ('11003','40','92.00','10',0),
 ('11003','52','35.00','10',0),
 ('11004','26','156.15','6',0),
 ('11004','76','90.00','6',0),
 ('11005','1','90.00','2',0),
 ('11005','59','275.00','10',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('11006','1','90.00','8',0),
 ('11006','29','618.95','2',0.25),
 ('11007','8','200.00','30',0),
 ('11007','29','618.95','10',0),
 ('11007','42','70.00','14',0),
 ('11008','28','228.00','70',0.05),
 ('11008','34','70.00','90',0.05),
 ('11008','71','107.50','21',0),
 ('11009','24','22.50','12',0),
 ('11009','36','95.00','18',0.25),
 ('11009','60','170.00','9',0),
 ('11010','7','150.00','20',0),
 ('11010','24','22.50','10',0),
 ('11011','58','66.25','40',0.05),
 ('11011','71','107.50','20',0),
 ('11012','19','46.00','50',0.05),
 ('11012','60','170.00','36',0.05),
 ('11012','71','107.50','60',0.05),
 ('11013','23','45.00','10',0),
 ('11013','42','70.00','4',0),
 ('11013','45','47.50','20',0),
 ('11013','68','62.50','2',0),
 ('11014','41','48.25','28',0.1),
 ('11015','30','129.45','15',0),
 ('11015','77','65.00','18',0),
 ('11016','31','62.50','15',0),
 ('11016','36','95.00','16',0),
 ('11017','3','50.00','25',0),
 ('11017','59','275.00','110',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('11017','70','75.00','30',0),
 ('11018','12','190.00','20',0),
 ('11018','18','312.50','10',0),
 ('11018','56','190.00','5',0),
 ('11019','46','60.00','3',0),
 ('11019','49','100.00','2',0),
 ('11020','10','155.00','24',0.15),
 ('11021','2','95.00','11',0.25),
 ('11021','20','405.00','15',0),
 ('11021','26','156.15','63',0),
 ('11021','51','265.00','44',0.25),
 ('11021','72','174.00','35',0),
 ('11022','19','46.00','35',0),
 ('11022','69','180.00','30',0),
 ('11023','7','150.00','4',0),
 ('11023','43','230.00','30',0),
 ('11024','26','156.15','12',0),
 ('11024','33','12.50','30',0),
 ('11024','65','105.25','21',0),
 ('11024','71','107.50','50',0),
 ('11025','1','90.00','10',0.1),
 ('11025','13','30.00','20',0.1),
 ('11026','18','312.50','8',0),
 ('11026','51','265.00','10',0),
 ('11027','24','22.50','30',0.25),
 ('11027','62','246.50','21',0.25),
 ('11028','55','120.00','35',0),
 ('11028','59','275.00','24',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('11029','56','190.00','20',0),
 ('11029','63','219.50','12',0),
 ('11030','2','95.00','100',0.25),
 ('11030','5','106.75','70',0),
 ('11030','29','618.95','60',0.25),
 ('11030','59','275.00','100',0.25),
 ('11031','1','90.00','45',0),
 ('11031','13','30.00','80',0),
 ('11031','24','22.50','21',0),
 ('11031','64','166.25','20',0),
 ('11031','71','107.50','16',0),
 ('11032','36','95.00','35',0),
 ('11032','38','1317.50','25',0),
 ('11032','59','275.00','30',0),
 ('11033','53','164.00','70',0.1),
 ('11033','69','180.00','36',0.1),
 ('11034','21','50.00','15',0.1),
 ('11034','44','97.25','12',0),
 ('11034','61','142.50','6',0),
 ('11035','1','90.00','10',0),
 ('11035','35','90.00','60',0),
 ('11035','42','70.00','30',0),
 ('11035','54','37.25','10',0),
 ('11036','13','30.00','7',0),
 ('11036','59','275.00','30',0),
 ('11037','70','75.00','4',0),
 ('11038','40','92.00','5',0.2),
 ('11038','52','35.00','2',0),
 ('11038','71','107.50','30',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('11039','28','228.00','20',0),
 ('11039','35','90.00','24',0),
 ('11039','49','100.00','60',0),
 ('11039','57','97.50','28',0),
 ('11040','21','50.00','20',0),
 ('11041','2','95.00','30',0.2),
 ('11041','63','219.50','30',0),
 ('11042','44','97.25','15',0),
 ('11042','61','142.50','4',0),
 ('11043','11','105.00','10',0),
 ('11044','62','246.50','12',0),
 ('11045','33','12.50','15',0),
 ('11045','51','265.00','24',0),
 ('11046','12','190.00','20',0.05),
 ('11046','32','160.00','15',0.05),
 ('11046','35','90.00','18',0.05),
 ('11047','1','90.00','25',0.25),
 ('11047','5','106.75','30',0.25),
 ('11048','68','62.50','42',0),
 ('11049','2','95.00','10',0.2),
 ('11049','12','190.00','4',0.2),
 ('11050','76','90.00','50',0.1),
 ('11051','24','22.50','10',0.2),
 ('11052','43','230.00','30',0.2),
 ('11052','61','142.50','10',0.2),
 ('11053','18','312.50','35',0.2),
 ('11053','32','160.00','20',0),
 ('11053','64','166.25','25',0.2);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('11054','33','12.50','10',0),
 ('11054','67','70.00','20',0),
 ('11055','24','22.50','15',0),
 ('11055','25','70.00','15',0),
 ('11055','51','265.00','20',0),
 ('11055','57','97.50','20',0),
 ('11056','7','150.00','40',0),
 ('11056','55','120.00','35',0),
 ('11056','60','170.00','50',0),
 ('11057','70','75.00','3',0),
 ('11058','21','50.00','3',0),
 ('11058','60','170.00','21',0),
 ('11058','61','142.50','4',0),
 ('11059','13','30.00','30',0),
 ('11059','17','195.00','12',0),
 ('11059','60','170.00','35',0),
 ('11060','60','170.00','4',0),
 ('11060','77','65.00','10',0),
 ('11061','60','170.00','15',0),
 ('11062','53','164.00','10',0.2),
 ('11062','70','75.00','12',0.2),
 ('11063','34','70.00','30',0),
 ('11063','40','92.00','40',0.1),
 ('11063','41','48.25','30',0.1),
 ('11064','17','195.00','77',0.1),
 ('11064','41','48.25','12',0),
 ('11064','53','164.00','25',0.1),
 ('11064','55','120.00','4',0.1),
 ('11064','68','62.50','55',0);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('11065','30','129.45','4',0.25),
 ('11065','54','37.25','20',0.25),
 ('11066','16','87.25','3',0),
 ('11066','19','46.00','42',0),
 ('11066','34','70.00','35',0),
 ('11067','41','48.25','9',0),
 ('11068','28','228.00','8',0.15),
 ('11068','43','230.00','36',0.15),
 ('11068','77','65.00','28',0.15),
 ('11069','39','90.00','20',0),
 ('11070','1','90.00','40',0.15),
 ('11070','2','95.00','20',0.15),
 ('11070','16','87.25','30',0.15),
 ('11070','31','62.50','20',0),
 ('11071','7','150.00','15',0.05),
 ('11071','13','30.00','10',0.05),
 ('11072','2','95.00','8',0),
 ('11072','41','48.25','40',0),
 ('11072','50','81.25','22',0),
 ('11072','64','166.25','130',0),
 ('11073','11','105.00','10',0),
 ('11073','24','22.50','20',0),
 ('11074','16','87.25','14',0.05),
 ('11075','2','95.00','10',0.15),
 ('11075','46','60.00','30',0.15),
 ('11075','76','90.00','2',0.15),
 ('11076','6','125.00','20',0.25),
 ('11076','14','116.25','20',0.25);
INSERT INTO `details_commandes` (`NO_COMMANDE`,`REF_PRODUIT`,`PRIX_UNITAIRE`,`QUANTITE`,`REMISE`) VALUES 
 ('11076','19','46.00','10',0.25),
 ('11077','2','95.00','24',0.2),
 ('11077','3','50.00','4',0),
 ('11077','4','110.00','1',0),
 ('11077','6','125.00','1',0.02),
 ('11077','7','150.00','1',0.05),
 ('11077','8','200.00','2',0.1),
 ('11077','10','155.00','1',0),
 ('11077','12','190.00','2',0.05),
 ('11077','13','30.00','4',0),
 ('11077','14','116.25','1',0.03),
 ('11077','16','87.25','2',0.03),
 ('11077','20','405.00','1',0.04),
 ('11077','23','45.00','2',0),
 ('11077','32','160.00','1',0),
 ('11077','39','90.00','2',0.05),
 ('11077','41','48.25','3',0),
 ('11077','46','60.00','3',0.02),
 ('11077','52','35.00','2',0),
 ('11077','55','120.00','2',0),
 ('11077','60','170.00','2',0.06),
 ('11077','64','166.25','2',0.03),
 ('11077','66','85.00','1',0),
 ('11077','73','75.00','2',0.01),
 ('11077','75','38.75','4',0),
 ('11077','77','65.00','2',0);
/*!40000 ALTER TABLE `details_commandes` ENABLE KEYS */;


--
-- Table structure for table `northwind`.`employes`
--

DROP TABLE IF EXISTS `employes`;
CREATE TABLE `employes` (
  `NO_EMPLOYE` decimal(6,0) NOT NULL,
  `REND_COMPTE` decimal(6,0) default NULL,
  `NOM` varchar(20) NOT NULL,
  `PRENOM` varchar(10) NOT NULL,
  `FONCTION` varchar(30) NOT NULL,
  `TITRE` varchar(5) NOT NULL,
  `DATE_NAISSANCE` date NOT NULL,
  `DATE_EMBAUCHE` date NOT NULL,
  `SALAIRE` decimal(8,2) NOT NULL,
  `COMMISSION` decimal(8,2) default NULL,
  PRIMARY KEY  (`NO_EMPLOYE`),
  KEY `EMPLOYES_REND_COMPTE_FK` (`REND_COMPTE`),
  CONSTRAINT `FK_EMPLOYES_EMPLOYES` FOREIGN KEY (`REND_COMPTE`) REFERENCES `employes` (`NO_EMPLOYE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `northwind`.`employes`
--

/*!40000 ALTER TABLE `employes` DISABLE KEYS */;
INSERT INTO `employes` (`NO_EMPLOYE`,`REND_COMPTE`,`NOM`,`PRENOM`,`FONCTION`,`TITRE`,`DATE_NAISSANCE`,`DATE_EMBAUCHE`,`SALAIRE`,`COMMISSION`) VALUES 
 ('1','2','Davolio','Nancy','Représentant(e)','Mlle','1968-12-08','1992-05-01','3135.00','1500.00'),
 ('2',NULL,'Fuller','Andrew','Vice-Président','Dr.','1952-02-19','1992-08-14','10000.00',NULL),
 ('3','2','Leverling','Janet','Représentant(e)','Mlle','1963-08-30','1992-04-01','3500.00','1000.00'),
 ('4','2','Peacock','Margaret','Représentant(e)','Mme','1958-09-19','1993-05-03','2856.00','250.00'),
 ('5','2','Buchanan','Steven','Chef des ventes','M.','1955-03-04','1993-10-17','8000.00',NULL),
 ('6','5','Suyama','Michael','Représentant(e)','M.','1963-07-02','1993-10-17','2534.00','600.00'),
 ('7','2','King','Robert','Représentant(e)','M.','1960-05-29','1994-01-02','2356.00','800.00'),
 ('8','2','Callahan','Laura','Assistante commerciale','Mlle','1958-01-09','1994-03-05','2000.00',NULL),
 ('9','5','Dodsworth','Anne','Représentant(e)','Mlle','1969-07-02','1994-11-15','2180.00','0.00');
/*!40000 ALTER TABLE `employes` ENABLE KEYS */;


--
-- Table structure for table `northwind`.`fournisseurs`
--

DROP TABLE IF EXISTS `fournisseurs`;
CREATE TABLE `fournisseurs` (
  `NO_FOURNISSEUR` decimal(6,0) NOT NULL,
  `SOCIETE` varchar(40) NOT NULL,
  `ADRESSE` varchar(60) NOT NULL,
  `VILLE` varchar(20) NOT NULL,
  `CODE_POSTAL` varchar(10) NOT NULL,
  `PAYS` varchar(15) NOT NULL,
  `TELEPHONE` varchar(24) NOT NULL,
  `FAX` varchar(24) default NULL,
  PRIMARY KEY  (`NO_FOURNISSEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `northwind`.`fournisseurs`
--

/*!40000 ALTER TABLE `fournisseurs` DISABLE KEYS */;
INSERT INTO `fournisseurs` (`NO_FOURNISSEUR`,`SOCIETE`,`ADRESSE`,`VILLE`,`CODE_POSTAL`,`PAYS`,`TELEPHONE`,`FAX`) VALUES 
 ('1','Exotic Liquids','49 Gilbert St.','London','EC1 4SD','Royaume-Uni','(171) 555-2222',''),
 ('2','Nouvelle-Orléans Cajun Delights','P.O. Box 78934','Nouvelle-Orléans','70117','Etats-Unis','(100) 555-4822',''),
 ('3','Grandma Kelly\'s Homestead','707 Oxford Rd.','Ann Arbor','48104','Etats-Unis','(313) 555-5735','(313) 555-3349'),
 ('4','Tokyo Traders','9-8 SekimaiMusashino-shi','Tokyo','100','Japon','(03) 3555-5011',''),
 ('5','Cooperativa de Quesos \'Las Cabras\'','Calle del Rosal 4','Oviedo','33007','Espagne','(98) 598 76 54',''),
 ('6','Mayumi\'s','92 SetsukoChuo-ku','Osaka','545','Japon','(06) 431-7877',''),
 ('7','Pavlova, Ltd.','74 Rose St.Moonie Ponds','Melbourne','3058','Australie','(059) 55-5450','(03) 444-6588'),
 ('8','Specialty Biscuits, Ltd.','29 King\'s Way','Manchester','M14 GSD','Royaume-Uni','(161) 555-4448',''),
 ('9','PB Knäckebröd AB','Kaloadagatan 13','Göteborg','S-345 67','Suède','031-987 65 43','031-987 65 91'),
 ('10','Refrescos Americanas LTDA','Av. das Americanas 12.890','São Paulo','5442','Brésil','(11) 555 4640','');
INSERT INTO `fournisseurs` (`NO_FOURNISSEUR`,`SOCIETE`,`ADRESSE`,`VILLE`,`CODE_POSTAL`,`PAYS`,`TELEPHONE`,`FAX`) VALUES 
 ('11','Heli Süßwaren GmbH  Co. KG','Tiergartenstraße 5','Berlin','10785','Allemagne','(010) 9984510',''),
 ('12','Plutzer Lebensmittelgroßmärkte AG','Bogenallee 51','Frankfurt','60439','Allemagne','(069) 992755',''),
 ('13','Nord-Ost-Fisch Handelsgesellschaft mbH','Frahmredder 112a','Cuxhaven','27478','Allemagne','(04721) 8713','(04721) 8714'),
 ('14','Formaggi Fortini s.r.l.','Viale Dante, 75','Ravenna','48100','Italie','(0544) 60323','(0544) 60603'),
 ('15','Norske Meierier','Hatlevegen 5','Sandvika','1320','Norvège','(0)2-953010',''),
 ('16','Bigfoot Breweries','3400 - 8th AvenueSuite 210','Bend','97101','Etats-Unis','(503) 555-9931',''),
 ('17','Svensk Sjöföda AB','Brovallavägen 231','Stockholm','S-123 45','Suède','08-123 45 67',''),
 ('18','Aux joyeux ecclésiastiques','203, Rue des Francs-Bourgeois','Paris','75004','France','01.03.83.00.68','01.03.83.00.62'),
 ('19','New England Seafood Cannery','Order Processing Dept.2100 Paul Revere Blvd.','Boston','02134','Etats-Unis','(617) 555-3267','(617) 555-3389');
INSERT INTO `fournisseurs` (`NO_FOURNISSEUR`,`SOCIETE`,`ADRESSE`,`VILLE`,`CODE_POSTAL`,`PAYS`,`TELEPHONE`,`FAX`) VALUES 
 ('20','Leka Trading','471 Serangoon Loop, Suite #402','Singapore','0512','Singapour','555-8787',''),
 ('21','Lyngbysild','LyngbysildFiskebakken 10','Lyngby','2800','Danemark','43844108','43844115'),
 ('22','Zaanse Snoepfabriek','VerkoopRijnweg 22','Zaandam','9999 ZZ','Pays-Bas','(12345)1212','(12345) 1210'),
 ('23','Karkki Oy','Valtakatu 12','Lappeenranta','53120','Finlande','(953) 10956',''),
 ('24','G\'day, Mate','170 Prince Edward ParadeHunter\'s Hill','Sydney','2042','Australie','(02) 555-4873','(02) 555-4873'),
 ('25','Ma Maison','2960 Rue St. Laurent','Montréal','H1J 1C3','Canada','(514) 555-9022',''),
 ('26','Pasta Buttini s.r.l.','Via dei Gelsomini, 153','Salerno','84100','Italie','(089) 6547665','(089) 6547667'),
 ('27','Escargots Nouveaux','22, rue H. Voiron','Montceau','71300','France','04.85.57.00.07',''),
 ('28','Gai pâturage','Bat. B3, rue des Alpes','Annecy','74000','France','04.38.76.98.06','04.38.76.98.58'),
 ('29','Forêts d\'érables','148 rue Chasseur','Ste-Hyacinthe','J2S 7S8','Canada','(514) 555-2955','(514) 555-2921');
/*!40000 ALTER TABLE `fournisseurs` ENABLE KEYS */;


--
-- Table structure for table `northwind`.`produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE `produits` (
  `REF_PRODUIT` decimal(6,0) NOT NULL,
  `NOM_PRODUIT` varchar(40) NOT NULL,
  `NO_FOURNISSEUR` decimal(6,0) NOT NULL,
  `CODE_CATEGORIE` decimal(6,0) NOT NULL,
  `QUANTITE` varchar(30) default NULL,
  `PRIX_UNITAIRE` decimal(8,2) NOT NULL,
  `UNITES_STOCK` decimal(5,0) default NULL,
  `UNITES_COMMANDEES` decimal(5,0) default NULL,
  `INDISPONIBLE` decimal(1,0) default NULL,
  PRIMARY KEY  (`REF_PRODUIT`),
  KEY `FOURNISEURS_PRODUITS_FK` (`NO_FOURNISSEUR`),
  KEY `CATEGORIES_PRODUITS_FK` (`CODE_CATEGORIE`),
  CONSTRAINT `FK_PRODUITS_CATEGORIE` FOREIGN KEY (`CODE_CATEGORIE`) REFERENCES `categories` (`CODE_CATEGORIE`),
  CONSTRAINT `FK_PRODUITS_FOURNISEUR` FOREIGN KEY (`NO_FOURNISSEUR`) REFERENCES `fournisseurs` (`NO_FOURNISSEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `northwind`.`produits`
--

/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
INSERT INTO `produits` (`REF_PRODUIT`,`NOM_PRODUIT`,`NO_FOURNISSEUR`,`CODE_CATEGORIE`,`QUANTITE`,`PRIX_UNITAIRE`,`UNITES_STOCK`,`UNITES_COMMANDEES`,`INDISPONIBLE`) VALUES 
 ('1','Chai','1','1','10 boîtes x 20 sacs','90.00','39',NULL,'0'),
 ('2','Chang','1','1','24 bouteilles (1 litre)','95.00','17','40','0'),
 ('3','Aniseed Syrup','1','2','12 bouteilles (550 ml)','50.00','13','70','0'),
 ('4','Chef Anton\'s Cajun Seasoning','2','2','48 pots (6 onces)','110.00','53',NULL,'0'),
 ('5','Chef Anton\'s Gumbo Mix','2','2','36 boîtes','106.00','0',NULL,'1'),
 ('6','Grandma\'s Boysenberry Spread','3','2','12 pots (8 onces)','125.00','120',NULL,'0'),
 ('7','Uncle Bob\'s Organic Dried Pears','3','7','12 cartons (1 kg)','150.00','15',NULL,'0'),
 ('8','Northwoods Cranberry Sauce','3','2','12 pots (12 onces)','200.00','6',NULL,'0'),
 ('9','Mishi Kobe Niku','4','6','18 cartons (500 g)','485.00',NULL,NULL,'-1'),
 ('10','Ikura','4','8','12 pots (200 g)','155.00','31',NULL,'0'),
 ('11','Queso Cabrales','5','4','1 carton (1 kg)','105.00','22','30','0'),
 ('12','Queso Manchego La Pastora','5','4','10 cartons (500 g)','190.00','86',NULL,'0');
INSERT INTO `produits` (`REF_PRODUIT`,`NOM_PRODUIT`,`NO_FOURNISSEUR`,`CODE_CATEGORIE`,`QUANTITE`,`PRIX_UNITAIRE`,`UNITES_STOCK`,`UNITES_COMMANDEES`,`INDISPONIBLE`) VALUES 
 ('13','Konbu','6','8','1 boîtes (2 kg)','30.00','24',NULL,'0'),
 ('14','Tofu','6','7','40 cartons (100 g)','116.00','35',NULL,'0'),
 ('15','Genen Shouyu','6','2','24 bouteilles (250 ml)','78.00','39',NULL,'0'),
 ('16','Pavlova','7','3','32 boîtes (500 g)','87.00','29',NULL,'0'),
 ('17','Alice Mutton','7','6','20 boîtes (1 kg)','195.00',NULL,NULL,'-1'),
 ('18','Carnarvon Tigers','7','8','1 carton (16 kg)','313.00','42',NULL,'0'),
 ('19','Teatime Chocolate Biscuits','8','3','10 boîtes x 12 pièces','46.00','25',NULL,'0'),
 ('20','Sir Rodney\'s Marmalade','8','3','30 boîtes','405.00','40',NULL,'0'),
 ('21','Sir Rodney\'s Scones','8','3','24 cartons x 4 pièces','50.00','3','40','0'),
 ('22','Gustaf\'s Knäckebröd','9','5','24 cartons (500 g)','105.00','104',NULL,'0'),
 ('23','Tunnbröd','9','5','12 cartons (250 g)','45.00','61',NULL,'0'),
 ('24','Guaraná Fantástica','10','1','12 canettes (355 ml)','23.00',NULL,NULL,'-1');
INSERT INTO `produits` (`REF_PRODUIT`,`NOM_PRODUIT`,`NO_FOURNISSEUR`,`CODE_CATEGORIE`,`QUANTITE`,`PRIX_UNITAIRE`,`UNITES_STOCK`,`UNITES_COMMANDEES`,`INDISPONIBLE`) VALUES 
 ('25','NuNuCa Nuß-Nougat-Creme','11','3','20 verres (450 g)','70.00','76',NULL,'0'),
 ('26','Gumbär Gummibärchen','11','3','100 sacs (250 g)','156.00','15',NULL,'0'),
 ('27','Schoggi Schokolade','11','3','100 pièces (100 g)','220.00','49',NULL,'0'),
 ('28','Rössle Sauerkraut','12','7','25 canettes (825 g)','228.00',NULL,NULL,'-1'),
 ('29','Thüringer Rostbratwurst','12','6','50 sacs x 30 saucisses','619.00',NULL,NULL,'-1'),
 ('30','Nord-Ost Matjeshering','13','8','10 verres (200 g)','129.00','10',NULL,'0'),
 ('31','Gorgonzola Telino','14','4','12 cartons (100 g)','63.00','0','70','0'),
 ('32','Mascarpone Fabioli','14','4','24 cartons (200 g)','160.00','9','40','0'),
 ('33','Geitost','15','4','1 carton (500 g)','13.00','112',NULL,'0'),
 ('34','Sasquatch Ale','16','1','24 bouteilles (70 cl)','70.00','111',NULL,'0'),
 ('35','Steeleye Stout','16','1','24 bouteilles (1 litre)','90.00','20',NULL,'0');
INSERT INTO `produits` (`REF_PRODUIT`,`NOM_PRODUIT`,`NO_FOURNISSEUR`,`CODE_CATEGORIE`,`QUANTITE`,`PRIX_UNITAIRE`,`UNITES_STOCK`,`UNITES_COMMANDEES`,`INDISPONIBLE`) VALUES 
 ('36','Inlagd Sill','17','8','24 pots (250 g)','95.00','112',NULL,'0'),
 ('37','Gravad lax','17','8','12 cartons (500 g)','130.00','11','50','0'),
 ('38','Côte de Blaye','18','1','12 bouteilles (75 cl)','1318.00','17',NULL,'0'),
 ('39','Chartreuse verte','18','1','1 bouteille (750 cc)','90.00','69',NULL,'0'),
 ('40','Boston Crab Meat','19','8','24 boîtes (4 onces)','92.00','123',NULL,'0'),
 ('41','Jack\'s New England Clam Chowder','19','8','12 canettes (330 ml)','48.00','85',NULL,'0'),
 ('42','Singaporean Hokkien Fried Mee','20','5','32 cartons (1 kg)','70.00',NULL,NULL,'-1'),
 ('43','Ipoh Coffee','20','1','16 boîtes (500 g)','230.00','17','10','0'),
 ('44','Gula Malacca','20','2','20 cartons (2 kg)','97.00','27',NULL,'0'),
 ('45','Røgede sild','21','8','1 carton (1kg)','48.00','5','70','0'),
 ('46','Spegesild','21','8','4 boîtes (250 g)','60.00','95',NULL,'0'),
 ('47','Zaanse koeken','22','3','10 boîtes (4 onces)','48.00','36',NULL,'0');
INSERT INTO `produits` (`REF_PRODUIT`,`NOM_PRODUIT`,`NO_FOURNISSEUR`,`CODE_CATEGORIE`,`QUANTITE`,`PRIX_UNITAIRE`,`UNITES_STOCK`,`UNITES_COMMANDEES`,`INDISPONIBLE`) VALUES 
 ('48','Chocolade','22','3','10 cartons','64.00','15','70','0'),
 ('49','Maxilaku','23','3','24 cartons (50 g)','100.00','10','60','0'),
 ('50','Valkoinen suklaa','23','3','12 plaquettes (100 g)','81.00','65',NULL,'0'),
 ('51','Manjimup Dried Apples','24','7','50 cartons (300 g)','265.00','20',NULL,'0'),
 ('52','Filo Mix','24','5','16 boîtes (2 kg)','35.00','38',NULL,'0'),
 ('53','Perth Pasties','24','6','48 pièces','164.00',NULL,NULL,'-1'),
 ('54','Tourtière','25','6','16 tartes','37.00','21',NULL,'0'),
 ('55','Pâté chinois','25','6','24 boîtes x 2 tartes','120.00','115',NULL,'0'),
 ('56','Gnocchi di nonna Alice','26','5','24 cartons (250 g)','190.00','21','10','0'),
 ('57','Ravioli Angelo','26','5','24 cartons (250 g)','98.00','36',NULL,'0'),
 ('58','Escargots de Bourgogne','27','8','24 pièces','66.00','62',NULL,'0'),
 ('59','Raclette Courdavault','28','4','1 carton (5 kg)','275.00','79',NULL,'0');
INSERT INTO `produits` (`REF_PRODUIT`,`NOM_PRODUIT`,`NO_FOURNISSEUR`,`CODE_CATEGORIE`,`QUANTITE`,`PRIX_UNITAIRE`,`UNITES_STOCK`,`UNITES_COMMANDEES`,`INDISPONIBLE`) VALUES 
 ('60','Camembert Pierrot','28','4','15 unités (300 g)','170.00','19',NULL,'0'),
 ('61','Sirop d\'érable','29','2','24 bouteilles (500 ml)','143.00','113',NULL,'0'),
 ('62','Tarte au sucre','29','3','48 tartes','247.00','17',NULL,'0'),
 ('63','Vegie-spread','7','2','15 pots (625 g)','220.00','24',NULL,'0'),
 ('64','Wimmers gute Semmelknödel','12','5','20 sacs x 4 pièces','166.00','22','80','0'),
 ('65','Louisiana Fiery Hot Pepper Sauce','2','2','32 bouteilles (8 onces)','105.00','76',NULL,'0'),
 ('66','Louisiana Hot Spiced Okra','2','2','24 pots (8 onces)','85.00','4','100','0'),
 ('67','Laughing Lumberjack Lager','16','1','24 bouteilles (12 onces)','70.00','52',NULL,'0'),
 ('68','Scottish Longbreads','8','3','10 sacs x 8 pièces','63.00','6','10','0'),
 ('69','Gudbrandsdalsost','15','4','1 carton (10 kg)','180.00','26',NULL,'0'),
 ('70','Outback Lager','7','1','24 bouteilles (355 ml)','75.00','15','10','0');
INSERT INTO `produits` (`REF_PRODUIT`,`NOM_PRODUIT`,`NO_FOURNISSEUR`,`CODE_CATEGORIE`,`QUANTITE`,`PRIX_UNITAIRE`,`UNITES_STOCK`,`UNITES_COMMANDEES`,`INDISPONIBLE`) VALUES 
 ('71','Fløtemysost','15','4','10 cartons (500 g)','108.00','26',NULL,'0'),
 ('72','Mozzarella di Giovanni','14','4','24 cartons (200 g)','174.00','14',NULL,'0'),
 ('73','Röd Kaviar','17','8','24 pots (150 g)','75.00','101',NULL,'0'),
 ('74','Longlife Tofu','4','7','1 carton (5 kg)','50.00','4','20','0'),
 ('75','Rhönbräu Klosterbier','12','1','24 bouteilles (0,5 litre)','39.00','125',NULL,'0'),
 ('76','Lakkalikööri','23','1','1 bouteille (500 ml)','90.00','57',NULL,'0'),
 ('77','Original Frankfurter grüne Soße','12','2','12 boîtes','65.00','32',NULL,'0');
/*!40000 ALTER TABLE `produits` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
