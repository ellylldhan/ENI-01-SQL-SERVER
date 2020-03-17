INSERT INTO Services
VALUES ('INFOR', 'Informatique');
INSERT INTO Services (CodeService, Libelle)
VALUES ('COMPT', 'Comptabilité');
INSERT INTO Services (Libelle, CodeService)
VALUES ('DIRECTION', 'DIREC');
INSERT INTO Employes
VALUES ('Kilo', 'Sandy', '05/10/1990', GETDATE() - 10, 3000, 'INFOR', NULL);
