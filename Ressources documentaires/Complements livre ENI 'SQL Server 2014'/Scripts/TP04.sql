USE GestSalles;
GO
Print '----> table des Machines'
SET IDENTITY_INSERT Machines ON

INSERT Machines(id,libelle,processeur,memoire,disque,ecran) 
VALUES(1,'860','Core i5',8,300,15),(2,'890','Core i5',8,300,15),
      (3,'960','Core i5',16,500,17),(4,'980','Core i7',16,500,17),
	  (5,'990','Core i7',16,1000,20);

SET IDENTITY_INSERT Machines OFF
Print '----> table des Cours'
SET IDENTITY_INSERT Cours ON
INSERT Cours (id, code, titre, duree) 
VALUES (1,'T220-10054','Ecrire des requêtes Transact-SQL pour SQL Server ',3),
       (2,'T221-10775','Administration de bases de données SQL Server',5),
	   (3,'T120-10967','Les fondamentaux d''une infrastructure Windows',5),
	   (4,'T115-020','Linux/Unix : utilisation en mode commande',4),
	   (5,'T120-10970','Mise en réseau avec Windows Server',5),
	   (6,'T127-VS501','VMware vSphere 5.1',4),
	   (7,'T325-20341','Principales solutions de Microsoft Exchange Server',5),
	   (8,'T420-020','Modélisation et conception UML',4),
	   (9,'T461-20483','Programmer en C#',5),
	   (10,'T461-20486','Développer des applications Web ASP.NET MVC 4',5)
SET IDENTITY_INSERT Cours OFF
Print '----> table des CoursMachines'
SET IDENTITY_INSERT CoursMachines ON
INSERT CoursMachines (id, cours, machine)
VALUES ( 1,1,1),( 2,1,2),( 3,1,3),( 4,1,4),
	   ( 5,1,5),( 6,2,1),( 7,2,2),( 8,2,3),
	   ( 9,2,4),(10,2,5),(11,3,3),(12,3,4),
	   (13,3,5),(14,4,1),(15,4,2),(16,4,3),
	   (17,4,4),(18,4,5),(19,5,3),(20,5,4),
	   (21,5,5),(22,6,4),(23,6,5),(24,7,4),
	   (25,7,5),(26,8,1),(27,8,2),(28,8,3),
	   (29,8,4),(30,8,5),(31,9,5),(32,10,5)
SET IDENTITY_INSERT CoursMachines OFF
Print '----> table des Salles'
SET IDENTITY_INSERT Salles ON
INSERT Salles (id, libelle, nombrePlaces, machine)
VALUES ( 1,'Loire',10,1),( 2,'Seine',10,4),
	   ( 3,'Rhône',12,2),( 4,'Garonne',12,4),
	   ( 5,'Gironde',8,1),( 6,'Tarn',20,3),
	   ( 7,'Rhin',10,5),( 8,'Meuse',12,3),
	   ( 9,'Saône',15,4),(10,'Ardèche',8,5)
SET IDENTITY_INSERT Salles OFF
Print '----> table des Formations'
SET IDENTITY_INSERT Formations ON
INSERT Formations(id, cours, salle, dateDebut, dateFin)
VALUES (1,4,1,'28/04/2014','02/05/2014'),
	   (2,2,2,'02/06/2014','06/06/2014'),
	   (3,8,1,'02/06/2014','05/06/2014'),
	   (4,3,7,'16/06/2014','20/06/2014'),
	   (5,8,2,'15/07/2014','18/07/2014'),
	   (6,7,4,'07/07/2014','11/07/2014'),
	   (7,5,8,'25/08/2014','29/08/2014'),
	   (8,1,5,'02/06/2014','04/06/2014'),
	   (9,6,7,'01/09/2014','04/09/2014'),
	   (10,10,10,'01/09/2014','05/09/2014')
SET IDENTITY_INSERT Formations OFF
