/***
 * BDD LOCATION
 * 
 * Population des tables
 */

-- DELETE Clients;
INSERT INTO Clients Values(1,'Albert','Anatole','Rue des accacias','61000','Amiens')
INSERT INTO Clients Values(2,'Bernard','Barnabé','Rue du bar','01000','Bourg en Bresse')
INSERT INTO Clients Values(3,'Dupond','Camille','Rue Crébillon','44000','Nantes')
INSERT INTO Clients Values(4,'Desmoulin','Daniel','Rue descendante','21000','Dijon')
INSERT INTO Clients Values(5,'Ernest','Etienne','Rue de l’échaffaud','42000','Saint Étienne')
INSERT INTO Clients Values(6,'Ferdinand','François','Rue de la convention','44100','Nantes')
INSERT INTO Clients Values(9,'Dupond','Jean','Rue des mimosas','75018','Paris')
INSERT INTO Clients Values(14,'Boutaud','Sabine','Rue des platanes','75002','Paris')


-- DELETE Fiches;
INSERT INTO Fiches VALUES (1001,'14',GETDATE() - 15,GETDATE() -  13,'SO')
INSERT INTO Fiches VALUES (1002,'4',GETDATE() -  13,NULL,'EC')
INSERT INTO Fiches VALUES (1003,'1',GETDATE() -  12,GETDATE() -  10,'SO')
INSERT INTO Fiches VALUES (1004,'6',GETDATE() -  11,NULL,'EC')
INSERT INTO Fiches VALUES (1005,'3',GETDATE() -  10,NULL,'EC')
INSERT INTO Fiches VALUES (1006,'9',GETDATE() -  10,NULL,'RE')
INSERT INTO Fiches VALUES (1007,'1',GETDATE() -  3,NULL,'EC')
INSERT INTO Fiches VALUES (1008,'2',GETDATE(),NULL,'EC')


-- DELETE Gammes;
INSERT INTO Gammes VALUES ('PR','Matériel Professionnel')
INSERT INTO Gammes VALUES ('HG','Haut de gamme')
INSERT INTO Gammes VALUES ('MG','Moyenne gamme')
INSERT INTO Gammes VALUES ('EG','Entrée de gamme')


-- DELETE Categories;
INSERT INTO Categories VALUES ('MONO','Monoski')
INSERT INTO Categories VALUES ('SURF','Surf')
INSERT INTO Categories VALUES ('PA','Patinette')
INSERT INTO Categories VALUES ('FOA','Ski de fond alternatif')
INSERT INTO Categories VALUES ('FOP','Ski de fond patineur')
INSERT INTO Categories VALUES ('SA','Ski alpin')


-- DELETE Tarifs;
INSERT INTO Tarifs VALUES ('T1','Base','10')
INSERT INTO Tarifs VALUES ('T2','Chocolat','15')
INSERT INTO Tarifs VALUES ('T3','Bronze','20')
INSERT INTO Tarifs VALUES ('T4','Argent','30')
INSERT INTO Tarifs VALUES ('T5','Or','50')
INSERT INTO Tarifs VALUES ('T6','Platine','90')


-- DELETE GrilleTarifs;
INSERT INTO GrilleTarifs VALUES ('EG','MONO','T1')
INSERT INTO GrilleTarifs VALUES ('MG','MONO','T2')
INSERT INTO GrilleTarifs VALUES ('EG','SURF','T1')
INSERT INTO GrilleTarifs VALUES ('MG','SURF','T2')
INSERT INTO GrilleTarifs VALUES ('HG','SURF','T3')
INSERT INTO GrilleTarifs VALUES ('PR','SURF','T5')
INSERT INTO GrilleTarifs VALUES ('EG','PA','T1')
INSERT INTO GrilleTarifs VALUES ('MG','PA','T2')
INSERT INTO GrilleTarifs VALUES ('EG','FOA','T1')
INSERT INTO GrilleTarifs VALUES ('MG','FOA','T2')
INSERT INTO GrilleTarifs VALUES ('HG','FOA','T4')
INSERT INTO GrilleTarifs VALUES ('PR','FOA','T6')
INSERT INTO GrilleTarifs VALUES ('EG','FOP','T2')
INSERT INTO GrilleTarifs VALUES ('MG','FOP','T3')
INSERT INTO GrilleTarifs VALUES ('HG','FOP','T4')
INSERT INTO GrilleTarifs VALUES ('PR','FOP','T6')
INSERT INTO GrilleTarifs VALUES ('EG','SA','T1')
INSERT INTO GrilleTarifs VALUES ('MG','SA','T2')
INSERT INTO GrilleTarifs VALUES ('HG','SA','T4')
INSERT INTO GrilleTarifs VALUES ('PR','SA','T6')


-- DELETE Articles
INSERT INTO Articles VALUES ('F01','Fischer Cruiser','EG','FOA')
INSERT INTO Articles VALUES ('F02','Fischer Cruiser','EG','FOA')
INSERT INTO Articles VALUES ('F03','Fischer Cruiser','EG','FOA')
INSERT INTO Articles VALUES ('F04','Fischer Cruiser','EG','FOA')
INSERT INTO Articles VALUES ('F05','Fischer Cruiser','EG','FOA')
INSERT INTO Articles VALUES ('F10','Fischer Sporty Crown','MG','FOA')
INSERT INTO Articles VALUES ('F20','Fischer RCS Classic GOLD','PR','FOA')
INSERT INTO Articles VALUES ('F21','Fischer RCS Classic GOLD','PR','FOA')
INSERT INTO Articles VALUES ('F22','Fischer RCS Classic GOLD','PR','FOA')
INSERT INTO Articles VALUES ('F23','Fischer RCS Classic GOLD','PR','FOA')
INSERT INTO Articles VALUES ('F50','Fischer SOSSkating VASA','HG','FOP')
INSERT INTO Articles VALUES ('F60','Fischer RCS CARBOLITE Skating','PR','FOP')
INSERT INTO Articles VALUES ('F61','Fischer RCS CARBOLITE Skating','PR','FOP')
INSERT INTO Articles VALUES ('F62','Fischer RCS CARBOLITE Skating','PR','FOP')
INSERT INTO Articles VALUES ('F63','Fischer RCS CARBOLITE Skating','PR','FOP')
INSERT INTO Articles VALUES ('F64','Fischer RCS CARBOLITE Skating','PR','FOP')
INSERT INTO Articles VALUES ('P01','Décathlon Allegre junior 150','EG','PA')
INSERT INTO Articles VALUES ('P10','Fischer mini ski patinette','MG','PA')
INSERT INTO Articles VALUES ('P11','Fischer mini ski patinette','MG','PA')
INSERT INTO Articles VALUES ('S01','Décathlon Apparition','EG','SURF')
INSERT INTO Articles VALUES ('S02','Décathlon Apparition','EG','SURF')
INSERT INTO Articles VALUES ('S03','Décathlon Apparition','EG','SURF')
INSERT INTO Articles VALUES ('A01','Salomon 24X+Z12','EG','SA')
INSERT INTO Articles VALUES ('A02','Salomon 24X+Z12','EG','SA')
INSERT INTO Articles VALUES ('A03','Salomon 24X+Z12','EG','SA')
INSERT INTO Articles VALUES ('A04','Salomon 24X+Z12','EG','SA')
INSERT INTO Articles VALUES ('A05','Salomon 24X+Z12','EG','SA')
INSERT INTO Articles VALUES ('A10','Salomon Pro Link Equipe 4S','PR','SA')
INSERT INTO Articles VALUES ('A11','Salomon Pro Link Equipe 4S','PR','SA')
INSERT INTO Articles VALUES ('A21','Salomon 3V RACE JR+L10','PR','SA')


-- DELETE LignesFic;
INSERT INTO LignesFic VALUES ('1001','1','F05',GETDATE()-15,GETDATE()-13)
INSERT INTO LignesFic VALUES ('1001','2','F50',GETDATE()-15,GETDATE()-14)
INSERT INTO LignesFic VALUES ('1001','3','F60',GETDATE()-13,GETDATE()-12.75)
INSERT INTO LignesFic VALUES ('1002','1','A03',GETDATE()-13,GETDATE()-9)
INSERT INTO LignesFic VALUES ('1002','2','A04',GETDATE()-12,GETDATE()-7)
INSERT INTO LignesFic VALUES ('1002','3','S03',GETDATE()-8,NULL)
INSERT INTO LignesFic VALUES ('1003','1','F50',GETDATE()-12,GETDATE()-10)
INSERT INTO LignesFic VALUES ('1003','2','F05',GETDATE()-12,GETDATE()-10)
INSERT INTO LignesFic VALUES ('1004','1','P01',GETDATE()-6,NULL)
INSERT INTO LignesFic VALUES ('1005','1','F05',GETDATE()-9,GETDATE()-5)
INSERT INTO LignesFic VALUES ('1005','2','F10',GETDATE()-4,NULL)
INSERT INTO LignesFic VALUES ('1006','1','S01',GETDATE()-10,GETDATE()-9)
INSERT INTO LignesFic VALUES ('1006','2','S02',GETDATE()-10,GETDATE()-9)
INSERT INTO LignesFic VALUES ('1006','3','S03',GETDATE()-10,GETDATE()-9)
INSERT INTO LignesFic VALUES ('1007','1','F50',GETDATE()-3,GETDATE()-2)
INSERT INTO LignesFic VALUES ('1007','3','F60',GETDATE()-1,NULL)
INSERT INTO LignesFic VALUES ('1007','2','F05',GETDATE()-3,NULL)
INSERT INTO LignesFic VALUES ('1007','4','S02',GETDATE(),NULL)
INSERT INTO LignesFic VALUES ('1008','1','S01',GETDATE(),NULL)