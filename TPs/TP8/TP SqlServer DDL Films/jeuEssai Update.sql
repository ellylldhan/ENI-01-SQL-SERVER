
------ les genres
INSERT INTO GENRES VALUES ('SF', 'Science fiction');
INSERT INTO GENRES VALUES ('DR', 'Drame');
INSERT INTO GENRES VALUES ('FA', 'Famille');
INSERT INTO GENRES VALUES ('CO', 'Comédie');
INSERT INTO GENRES VALUES ('CR', 'Comédie romantique'); 
INSERT INTO GENRES VALUES ('CD', 'Comédie dramatique');
INSERT INTO GENRES VALUES ('PO', 'Policier');
INSERT INTO GENRES VALUES ('HO', 'Horreur');
INSERT INTO GENRES VALUES ('AC', 'Action');
INSERT INTO GENRES VALUES ('DO', 'Documentaire');
--select * from genres;

-- les cinémas
INSERT INTO CINEMAS VALUES (1,'Pathé Nantes Atlantis','Centre commercial Atlantis','44800','Saint Herblain','0240568924');
INSERT INTO CINEMAS VALUES (2,'Ciné Pole Sud','Centre Commercial Pôle Sud, Route de Clisson','44115','Basse Goulaine','0240367815');
INSERT INTO CINEMAS VALUES (3,'Le concorde','79, bd de l''Egalite','44000','Nantes','0240167878');
INSERT INTO CINEMAS VALUES (4,'Cineville','Rue Marie Curie','44230','Saint Sebastien sur Loire','0240784035');
INSERT INTO CINEMAS VALUES (5,'Cineville','rue François Cevert','85000','La Roche sur Yon','0251568924');
INSERT INTO CINEMAS VALUES (6,'Gaumont Nantes','12, place du Commerce','44000','NANTES','0240145236');
INSERT INTO CINEMAS VALUES (7,'Le cinoche','33 rue carnot','85300','CHALLANS','0251234685');
--select * from cinemas;

-- les films
INSERT INTO FILMS VALUES (1,'Alvin et les Chipmunks 3',90,2011,'FA','USA');
INSERT INTO FILMS VALUES (2,'Intouchables',112,2011,'CO','France');
INSERT INTO FILMS VALUES (3,'Mission : Impossible - Protocole fantôme',133,2011,'AC','USA');
INSERT INTO FILMS VALUES (4,'Hollywoo',107,2011,'CO','France');
INSERT INTO FILMS VALUES (5,'The Darkest Hour',89,2011,'SF','USA');
INSERT INTO FILMS VALUES (6,'Le Pacte',105,2011,'AC','USA');
INSERT INTO FILMS VALUES (7,'10 jours en or',95,2012,'CD','France');
INSERT INTO FILMS VALUES (8,'La Colline aux Coquelicots',91,2012,'FA','Japon');
INSERT INTO FILMS VALUES (9,'Ma Première fois',95,2012,'DR','France');
INSERT INTO FILMS VALUES (10,'Toutes nos envies',120,2011,'DR','France');
INSERT INTO FILMS VALUES (11,'Le Chat Potté',90,2011,'FA','USA');
INSERT INTO FILMS VALUES (12,'Tous au Larzac',118,2011,'DO','France');
INSERT INTO FILMS VALUES (13,'Polisse',127,2011,'DR','France');
INSERT INTO FILMS VALUES (14,'La Vérité si je mens ! 3',119,2012,'CO','France');
INSERT INTO FILMS VALUES (15,'La Délicatesse',108,2011,'CR','France');
INSERT INTO FILMS VALUES (16,'Millenium : Les hommes qui n''aimaient pas les femmes',158,2012,'PO','USA');
INSERT INTO FILMS VALUES (17,'Underworld : Nouvelle ère',90,2012,'SF','USA');
--select * from films;

-- les passages et les séances :
INSERT INTO PASSAGES VALUES (1,1,'VF'); -- au pathé
INSERT INTO PASSAGES VALUES (2,1,'VO');
INSERT INTO PASSAGES VALUES (3,1,'VF');
INSERT INTO PASSAGES VALUES (4,1,'VO');
INSERT INTO PASSAGES VALUES (5,1,'VOST');
INSERT INTO PASSAGES VALUES (6,1,'VF');
INSERT INTO PASSAGES VALUES (7,1,'VO');
INSERT INTO PASSAGES VALUES (8,1,'VF');
INSERT INTO PASSAGES VALUES (9,1,'VO');
INSERT INTO PASSAGES VALUES (10,1,'VO');
INSERT INTO PASSAGES VALUES (13,1,'VO');
INSERT INTO PASSAGES VALUES (14,1,'VO');
INSERT INTO PASSAGES VALUES (15,1,'VO');
INSERT INTO PASSAGES VALUES (16,1,'VO');
INSERT INTO PASSAGES VALUES (17,1,'VF');

INSERT INTO PASSAGES VALUES (4,3,'VF'); -- au concorde
INSERT INTO PASSAGES VALUES (7,3,'VO');
INSERT INTO PASSAGES VALUES (8,3,'VF');
INSERT INTO PASSAGES VALUES (11,3,'VF');
INSERT INTO PASSAGES VALUES (12,3,'VO');

INSERT INTO PASSAGES VALUES (1,4,'VF'); -- cineville st seb
INSERT INTO PASSAGES VALUES (2,4,'VO');
INSERT INTO PASSAGES VALUES (3,4,'VF');
INSERT INTO PASSAGES VALUES (5,4,'VF');
INSERT INTO PASSAGES VALUES (6,4,'VF');
INSERT INTO PASSAGES VALUES (10,4,'VO');
INSERT INTO PASSAGES VALUES (11,4,'VF');
INSERT INTO PASSAGES VALUES (13,4,'VO');
INSERT INTO PASSAGES VALUES (15,4,'VO');
INSERT INTO PASSAGES VALUES (17,4,'VF');

INSERT INTO PASSAGES VALUES (1,5,'VF'); -- cineville la roche
INSERT INTO PASSAGES VALUES (2,5,'VO');
INSERT INTO PASSAGES VALUES (3,5,'VF');
INSERT INTO PASSAGES VALUES (5,5,'VF');
INSERT INTO PASSAGES VALUES (6,5,'VF');
INSERT INTO PASSAGES VALUES (10,5,'VO');
INSERT INTO PASSAGES VALUES (11,5,'VF');
INSERT INTO PASSAGES VALUES (13,5,'VO');
INSERT INTO PASSAGES VALUES (15,5,'VO');
INSERT INTO PASSAGES VALUES (17,5,'VF');


INSERT INTO PASSAGES VALUES (1,6,'VF'); --gaumont
INSERT INTO PASSAGES VALUES (2,6,'VO');
INSERT INTO PASSAGES VALUES (3,6,'VF');
INSERT INTO PASSAGES VALUES (4,6,'VO');
INSERT INTO PASSAGES VALUES (5,6,'VF');
INSERT INTO PASSAGES VALUES (6,6,'VF');
INSERT INTO PASSAGES VALUES (7,6,'VO');
INSERT INTO PASSAGES VALUES (8,6,'VF');
INSERT INTO PASSAGES VALUES (9,6,'VO');
INSERT INTO PASSAGES VALUES (10,6,'VO');
INSERT INTO PASSAGES VALUES (11,6,'VF');
INSERT INTO PASSAGES VALUES (12,6,'VO');
INSERT INTO PASSAGES VALUES (13,6,'VO');
INSERT INTO PASSAGES VALUES (14,6,'VO');
INSERT INTO PASSAGES VALUES (15,6,'VO');
INSERT INTO PASSAGES VALUES (16,6,'VF');
INSERT INTO PASSAGES VALUES (17,6,'VF');


--
INSERT INTO PASSAGES VALUES (12,7,'VO'); -- challans
INSERT INTO PASSAGES VALUES (2,7,'VO');
INSERT INTO PASSAGES VALUES (4,7,'VO');


--select * from seances;
--select * from seances;

INSERT INTO SEANCES VALUES (1,1,convert(datetime, convert(date,getdate()))+20/24,convert(datetime, convert(date,getdate()))+20/24 + 15/60/24);
INSERT INTO SEANCES VALUES (1,1,convert(datetime, convert(date,getdate()))+1 +20/24,convert(datetime, convert(date,getdate())) +1 +20/24 + 15/60/24);
INSERT INTO SEANCES VALUES (1,1,convert(datetime, convert(date,getdate()))+2 +20/24,convert(datetime, convert(date,getdate())) +2 +20/24 + 15/60/24);
INSERT INTO SEANCES VALUES (2,1,convert(datetime, convert(date,getdate()))   +21/24,convert(datetime, convert(date,getdate()))    +21/24 + 15/60/24);
INSERT INTO SEANCES VALUES (2,1,convert(datetime, convert(date,getdate()))+1 +21/24,convert(datetime, convert(date,getdate())) +1 +21/24 + 15/60/24);
INSERT INTO SEANCES VALUES (2,1,convert(datetime, convert(date,getdate()))+2 +21/24,convert(datetime, convert(date,getdate())) +2 +21/24 + 15/60/24);
INSERT INTO SEANCES VALUES (3,1,convert(datetime, convert(date,getdate()))   +20/24 +15/24/60,convert(datetime, convert(date,getdate()))    +20/24 + 30/60/24);
INSERT INTO SEANCES VALUES (3,1,convert(datetime, convert(date,getdate()))+1 +20/24 +15/24/60,convert(datetime, convert(date,getdate())) +1 +20/24 + 30/60/24);
INSERT INTO SEANCES VALUES (3,1,convert(datetime, convert(date,getdate()))+2 +20/24 +17/24/60,convert(datetime, convert(date,getdate())) +2 +20/24 + 32/60/24);
INSERT INTO SEANCES VALUES (4,1,convert(datetime, convert(date,getdate()))   +21/24 +10/24/60,convert(datetime, convert(date,getdate()))    +21/24 + 25/60/24);
INSERT INTO SEANCES VALUES (4,1,convert(datetime, convert(date,getdate()))+1 +21/24 +10/24/60,convert(datetime, convert(date,getdate())) +1 +21/24 + 25/60/24);
INSERT INTO SEANCES VALUES (4,1,convert(datetime, convert(date,getdate()))+2 +21/24 +10/24/60,convert(datetime, convert(date,getdate())) +2 +21/24 + 25/60/24);
INSERT INTO SEANCES VALUES (5,1,convert(datetime, convert(date,getdate()))   +20/24 +15/24/60,convert(datetime, convert(date,getdate()))    +20/24 + 30/60/24);
INSERT INTO SEANCES VALUES (5,1,convert(datetime, convert(date,getdate()))+1 +20/24 +15/24/60,convert(datetime, convert(date,getdate())) +1 +20/24 + 30/60/24);
INSERT INTO SEANCES VALUES (6,1,convert(datetime, convert(date,getdate()))+1 +21/24 +10/24/60,convert(datetime, convert(date,getdate())) +1 +21/24 + 25/60/24);
INSERT INTO SEANCES VALUES (6,1,convert(datetime, convert(date,getdate()))+2 +21/24 +10/24/60,convert(datetime, convert(date,getdate())) +2 +21/24 + 25/60/24);
INSERT INTO SEANCES VALUES (7,1,convert(datetime, convert(date,getdate()))+2 +20/24 +15/24/60,convert(datetime, convert(date,getdate())) +2 +20/24 + 35/60/24);
INSERT INTO SEANCES VALUES (8,1,convert(datetime, convert(date,getdate()))+1 +21/24 +5/24/60,convert(datetime, convert(date,getdate())) +1 +21/24 + 16/60/24);
INSERT INTO SEANCES VALUES (9,1,convert(datetime, convert(date,getdate()))    +19/24 +15/24/60,convert(datetime, convert(date,getdate()))    +19/24 + 35/60/24);
INSERT INTO SEANCES VALUES (9,1,convert(datetime, convert(date,getdate()))+2  +19/24 +15/24/60,convert(datetime, convert(date,getdate())) +2 +19/24 + 35/60/24);
INSERT INTO SEANCES VALUES (10,1,convert(datetime, convert(date,getdate()))+1 +21/24 +5/60/24,convert(datetime, convert(date,getdate()))  +1 +21/24 + 16/60/24);
INSERT INTO SEANCES VALUES (13,1,convert(datetime, convert(date,getdate()))   +22/24 +3/24/60,convert(datetime, convert(date,getdate()))      +22/24 + 15/60/24);
INSERT INTO SEANCES VALUES (13,1,convert(datetime, convert(date,getdate()))+1 +22/24 +15/24/60,convert(datetime, convert(date,getdate())) +1 +22/24  + 30/60/24);
INSERT INTO SEANCES VALUES (13,1,convert(datetime, convert(date,getdate()))+2 +22/24 +15/24/60,convert(datetime, convert(date,getdate())) +2 +22/24  + 30/60/24);
INSERT INTO SEANCES VALUES (14,1,convert(datetime, convert(date,getdate()))   +21/24  +10/24/60,convert(datetime, convert(date,getdate()))    +21/24  + 25/60/24);
INSERT INTO SEANCES VALUES (14,1,convert(datetime, convert(date,getdate()))+1 +21/24  +10/24/60,convert(datetime, convert(date,getdate())) +1 +21/24  + 25/60/24);
INSERT INTO SEANCES VALUES (14,1,convert(datetime, convert(date,getdate()))+2 +21/24  +10/24/60,convert(datetime, convert(date,getdate())) +2 +21/24  + 25/60/24);
INSERT INTO SEANCES VALUES (16,1,convert(datetime, convert(date,getdate()))+19/24,convert(datetime, convert(date,getdate())) +19/24 + 15/60/24);
INSERT INTO SEANCES VALUES (16,1,convert(datetime, convert(date,getdate()))+1+19/24,convert(datetime, convert(date,getdate())) +1+19/24 + 15/60/24);
INSERT INTO SEANCES VALUES (16,1,convert(datetime, convert(date,getdate()))+2+19/24,convert(datetime, convert(date,getdate())) +2+19/24 + 15/60/24);
INSERT INTO SEANCES VALUES (16,1,convert(datetime, convert(date,getdate()))+22/24,convert(datetime, convert(date,getdate())) +22/24 + 15/60/24);
INSERT INTO SEANCES VALUES (16,1,convert(datetime, convert(date,getdate()))+1+22/24,convert(datetime, convert(date,getdate())) +1+22/24 + 15/60/24);
INSERT INTO SEANCES VALUES (16,1,convert(datetime, convert(date,getdate()))+2+22/24,convert(datetime, convert(date,getdate())) +2+22/24 + 15/60/24);
INSERT INTO SEANCES VALUES (17,1,convert(datetime, convert(date,getdate()))+18/24,convert(datetime, convert(date,getdate())) +18/24 + 15/60/24);
INSERT INTO SEANCES VALUES (17,1,convert(datetime, convert(date,getdate()))+1+18/24,convert(datetime, convert(date,getdate())) +1+18/24 + 15/60/24);
INSERT INTO SEANCES VALUES (17,1,convert(datetime, convert(date,getdate()))+2+18/24,convert(datetime, convert(date,getdate())) +2+18/24 + 15/60/24);
INSERT INTO SEANCES VALUES (17,1,convert(datetime, convert(date,getdate()))+21/24,convert(datetime, convert(date,getdate())) +21/24 + 15/60/24);
INSERT INTO SEANCES VALUES (17,1,convert(datetime, convert(date,getdate()))+1+21/24,convert(datetime, convert(date,getdate())) +1+21/24 + 15/60/24);
INSERT INTO SEANCES VALUES (17,1,convert(datetime, convert(date,getdate()))+2+21/24,convert(datetime, convert(date,getdate())) +2+21/24 + 15/60/24);


-- pole sud :rien !



INSERT INTO SEANCES VALUES (4,3,convert(datetime, convert(date,getdate()))+21/24,convert(datetime, convert(date,getdate())) +21/24 + 15/60/24);
INSERT INTO SEANCES VALUES (7,3,convert(datetime, convert(date,getdate()))+2+21/24,convert(datetime, convert(date,getdate())) +2+21/24 + 15/60/24);
INSERT INTO SEANCES VALUES (8,3,convert(datetime, convert(date,getdate()))+1+21/24,convert(datetime, convert(date,getdate())) +1+21/24 + 15/60/24);
INSERT INTO SEANCES VALUES (11,3,convert(datetime, convert(date,getdate()))+21/24,convert(datetime, convert(date,getdate())) +21/24 + 15/60/24);
INSERT INTO SEANCES VALUES (11,3,convert(datetime, convert(date,getdate()))+1+21/24,convert(datetime, convert(date,getdate())) +1+21/24 + 15/60/24);
INSERT INTO SEANCES VALUES (12,3,convert(datetime, convert(date,getdate()))+2+21/24,convert(datetime, convert(date,getdate())) +2+21/24 + 15/60/24);


INSERT INTO SEANCES VALUES (1,4,convert(datetime, convert(date,getdate()))   +21.5/24,convert(datetime, convert(date,getdate())) +21.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (1,4,convert(datetime, convert(date,getdate()))+2 +21.25/24,convert(datetime, convert(date,getdate())) +2+21.25/24 + 15/60/24);
INSERT INTO SEANCES VALUES (2,4,convert(datetime, convert(date,getdate()))+1 +21.25/24,convert(datetime, convert(date,getdate())) +1+21.25/24 + 15/60/24);
INSERT INTO SEANCES VALUES (2,4,convert(datetime, convert(date,getdate()))   +21.20/24,convert(datetime, convert(date,getdate())) +21.2/24 + 15/60/24);
INSERT INTO SEANCES VALUES (2,4,convert(datetime, convert(date,getdate()))+1 +21/24,convert(datetime, convert(date,getdate())) +1+21/24 + 15/60/24);
INSERT INTO SEANCES VALUES (3,4,convert(datetime, convert(date,getdate()))+2 +21/24,convert(datetime, convert(date,getdate())) +2+21/24 + 15/60/24);
INSERT INTO SEANCES VALUES (5,4,convert(datetime, convert(date,getdate()))   +21.25/24,convert(datetime, convert(date,getdate())) +21.25/24 + 15/60/24);
INSERT INTO SEANCES VALUES (5,4,convert(datetime, convert(date,getdate()))+2 +19.5/24,convert(datetime, convert(date,getdate())) +2+19.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (5,4,convert(datetime, convert(date,getdate()))+1 +19.5/24,convert(datetime, convert(date,getdate())) +1+19.51/24 + 15/60/24);
INSERT INTO SEANCES VALUES (5,4,convert(datetime, convert(date,getdate()))+1 +22.5/24,convert(datetime, convert(date,getdate())) +1+22.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (6,4,convert(datetime, convert(date,getdate()))   +22.5/24,convert(datetime, convert(date,getdate())) +22.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (10,4,convert(datetime, convert(date,getdate()))+2 +18.5/24,convert(datetime, convert(date,getdate())) +2+18.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (10,4,convert(datetime, convert(date,getdate()))   +18.5/24,convert(datetime, convert(date,getdate())) +18.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (11,4,convert(datetime, convert(date,getdate()))+2 +20/24,convert(datetime, convert(date,getdate())) +2+20/24 + 15/60/24);
INSERT INTO SEANCES VALUES (11,4,convert(datetime, convert(date,getdate()))+1 +20/24,convert(datetime, convert(date,getdate())) +1+20/24 + 15/60/24);
INSERT INTO SEANCES VALUES (11,4,convert(datetime, convert(date,getdate()))   +20/24,convert(datetime, convert(date,getdate())) +20/24 + 15/60/24);
INSERT INTO SEANCES VALUES (13,4,convert(datetime, convert(date,getdate()))+1 +21.25/24,convert(datetime, convert(date,getdate())) +1+21.25/24 + 15/60/24);
INSERT INTO SEANCES VALUES (13,4,convert(datetime, convert(date,getdate()))+2 +21.25/24,convert(datetime, convert(date,getdate())) +2+21.25/24 + 15/60/24);
INSERT INTO SEANCES VALUES (15,4,convert(datetime, convert(date,getdate()))   +17.5/24,convert(datetime, convert(date,getdate())) +17.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (15,4,convert(datetime, convert(date,getdate()))+1 +17.5/24,convert(datetime, convert(date,getdate())) +1+17.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (15,4,convert(datetime, convert(date,getdate()))+2 +17.5/24,convert(datetime, convert(date,getdate())) +2+17.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (17,4,convert(datetime, convert(date,getdate()))   +22/24,convert(datetime, convert(date,getdate())) +22/24 + 15/60/24);
INSERT INTO SEANCES VALUES (17,4,convert(datetime, convert(date,getdate()))+1 +22/24,convert(datetime, convert(date,getdate())) +1+22/24 + 15/60/24);
INSERT INTO SEANCES VALUES (17,4,convert(datetime, convert(date,getdate()))+2 +22/24,convert(datetime, convert(date,getdate())) +2+22/24 + 15/60/24);

INSERT INTO SEANCES VALUES (1,5,convert(datetime, convert(date,getdate()))   +21.5/24,convert(datetime, convert(date,getdate())) +21.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (1,5,convert(datetime, convert(date,getdate()))+2 +21.25/24,convert(datetime, convert(date,getdate())) +2+21.25/24 + 15/60/24);
INSERT INTO SEANCES VALUES (2,5,convert(datetime, convert(date,getdate()))+1 +21.25/24,convert(datetime, convert(date,getdate())) +1+21.25/24 + 15/60/24);
INSERT INTO SEANCES VALUES (2,5,convert(datetime, convert(date,getdate()))   +21.20/24,convert(datetime, convert(date,getdate())) +21.2/24 + 15/60/24);
INSERT INTO SEANCES VALUES (2,5,convert(datetime, convert(date,getdate()))+1 +21/24,convert(datetime, convert(date,getdate())) +1+21/24 + 15/60/24);
INSERT INTO SEANCES VALUES (3,5,convert(datetime, convert(date,getdate()))+2 +21/24,convert(datetime, convert(date,getdate())) +2+21/24 + 15/60/24);
INSERT INTO SEANCES VALUES (5,5,convert(datetime, convert(date,getdate()))   +21.25/24,convert(datetime, convert(date,getdate())) +21.25/24 + 15/60/24);
INSERT INTO SEANCES VALUES (5,5,convert(datetime, convert(date,getdate()))+2 +19.5/24,convert(datetime, convert(date,getdate())) +2+19.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (5,5,convert(datetime, convert(date,getdate()))+1 +19.5/24,convert(datetime, convert(date,getdate())) +1+19.51/24 + 15/60/24);
INSERT INTO SEANCES VALUES (5,5,convert(datetime, convert(date,getdate()))+1 +22.5/24,convert(datetime, convert(date,getdate())) +1+22.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (6,5,convert(datetime, convert(date,getdate()))   +22.5/24,convert(datetime, convert(date,getdate())) +22.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (10,5,convert(datetime, convert(date,getdate()))+2 +18.5/24,convert(datetime, convert(date,getdate())) +2+18.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (10,5,convert(datetime, convert(date,getdate()))   +18.5/24,convert(datetime, convert(date,getdate())) +18.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (11,5,convert(datetime, convert(date,getdate()))+2 +20/24,convert(datetime, convert(date,getdate())) +2+20/24 + 15/60/24);
INSERT INTO SEANCES VALUES (11,5,convert(datetime, convert(date,getdate()))+1 +20/24,convert(datetime, convert(date,getdate())) +1+20/24 + 15/60/24);
INSERT INTO SEANCES VALUES (11,5,convert(datetime, convert(date,getdate()))   +20/24,convert(datetime, convert(date,getdate())) +20/24 + 15/60/24);
INSERT INTO SEANCES VALUES (13,5,convert(datetime, convert(date,getdate()))+1 +21.25/24,convert(datetime, convert(date,getdate())) +1+21.25/24 + 15/60/24);
INSERT INTO SEANCES VALUES (13,5,convert(datetime, convert(date,getdate()))+2 +21.25/24,convert(datetime, convert(date,getdate())) +2+21.25/24 + 15/60/24);
INSERT INTO SEANCES VALUES (15,5,convert(datetime, convert(date,getdate()))   +17.5/24,convert(datetime, convert(date,getdate())) +17.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (15,5,convert(datetime, convert(date,getdate()))+1 +17.5/24,convert(datetime, convert(date,getdate())) +1+17.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (15,5,convert(datetime, convert(date,getdate()))+2 +17.5/24,convert(datetime, convert(date,getdate())) +2+17.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (17,5,convert(datetime, convert(date,getdate()))   +22/24,convert(datetime, convert(date,getdate())) +22/24 + 15/60/24);
INSERT INTO SEANCES VALUES (17,5,convert(datetime, convert(date,getdate()))+1 +22/24,convert(datetime, convert(date,getdate())) +1+22/24 + 15/60/24);
INSERT INTO SEANCES VALUES (17,5,convert(datetime, convert(date,getdate()))+2 +22/24,convert(datetime, convert(date,getdate())) +2+22/24 + 15/60/24);


INSERT INTO SEANCES VALUES (1,6,convert(datetime, convert(date,getdate()))   +20.5/24,convert(datetime, convert(date,getdate()))    +20.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (1,6,convert(datetime, convert(date,getdate()))+1 +20.5/24,convert(datetime, convert(date,getdate())) +1 +20.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (1,6,convert(datetime, convert(date,getdate()))+2 +20.5/24,convert(datetime, convert(date,getdate())) +2 +20.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (2,6,convert(datetime, convert(date,getdate()))   +21.5/24,convert(datetime, convert(date,getdate()))    +21.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (2,6,convert(datetime, convert(date,getdate()))+1 +21.5/24,convert(datetime, convert(date,getdate())) +1 +21.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (2,6,convert(datetime, convert(date,getdate()))+2 +21.5/24,convert(datetime, convert(date,getdate())) +2 +21.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (3,6,convert(datetime, convert(date,getdate()))   +20.5/24 +15/24/60,convert(datetime, convert(date,getdate()))    +20.5/24 + 30/60/24);
INSERT INTO SEANCES VALUES (3,6,convert(datetime, convert(date,getdate()))+1 +20.5/24 +15/24/60,convert(datetime, convert(date,getdate())) +1 +20.5/24 + 30/60/24);
INSERT INTO SEANCES VALUES (3,6,convert(datetime, convert(date,getdate()))+2 +20.5/24 +17/24/60,convert(datetime, convert(date,getdate())) +2 +20.5/24 + 32/60/24);
INSERT INTO SEANCES VALUES (4,6,convert(datetime, convert(date,getdate()))   +21.5/24 +10/24/60,convert(datetime, convert(date,getdate()))    +21.5/24 + 25/60/24);
INSERT INTO SEANCES VALUES (4,6,convert(datetime, convert(date,getdate()))+1 +21.5/24 +10/24/60,convert(datetime, convert(date,getdate())) +1 +21.5/24 + 25/60/24);
INSERT INTO SEANCES VALUES (4,6,convert(datetime, convert(date,getdate()))+2 +21.5/24 +10/24/60,convert(datetime, convert(date,getdate())) +2 +21.5/24 + 25/60/24);
INSERT INTO SEANCES VALUES (5,6,convert(datetime, convert(date,getdate()))   +19.5/24 +15/24/60,convert(datetime, convert(date,getdate()))    +19.5/24 + 30/60/24);
INSERT INTO SEANCES VALUES (5,6,convert(datetime, convert(date,getdate()))+1 +19.5/24 +15/24/60,convert(datetime, convert(date,getdate())) +1 +19.5/24 + 30/60/24);
INSERT INTO SEANCES VALUES (6,6,convert(datetime, convert(date,getdate()))+1 +21/24 +10/24/60,convert(datetime, convert(date,getdate())) +1 +21/24 + 25/60/24);
INSERT INTO SEANCES VALUES (6,6,convert(datetime, convert(date,getdate()))+2 +21/24 +10/24/60,convert(datetime, convert(date,getdate())) +2 +21/24 + 25/60/24);
INSERT INTO SEANCES VALUES (7,6,convert(datetime, convert(date,getdate()))+2 +20/24 +15/24/60,convert(datetime, convert(date,getdate())) +2 +20/24 + 35/60/24);
INSERT INTO SEANCES VALUES (8,6,convert(datetime, convert(date,getdate()))+1 +21/24 +5/24/60,convert(datetime, convert(date,getdate())) +1 +21/24 + 16/60/24);
INSERT INTO SEANCES VALUES (8,6,convert(datetime, convert(date,getdate()))+2 +21/24 +5/24/60,convert(datetime, convert(date,getdate())) +2 +21/24 + 16/60/24);
INSERT INTO SEANCES VALUES (9,6,convert(datetime, convert(date,getdate()))+1  +19.5/24 +15/24/60,convert(datetime, convert(date,getdate())) +1 +19.5/24 + 35/60/24);
INSERT INTO SEANCES VALUES (10,6,convert(datetime, convert(date,getdate()))+2 +20.5/24 +5/60/24,convert(datetime, convert(date,getdate()))  +2 +20.5/24 + 16/60/24);
INSERT INTO SEANCES VALUES (9,6,convert(datetime, convert(date,getdate()))  +19.5/24 +15/24/60,convert(datetime, convert(date,getdate()))  +19.5/24 + 35/60/24);
INSERT INTO SEANCES VALUES (10,6,convert(datetime, convert(date,getdate()))+1 +20.5/24 +5/60/24,convert(datetime, convert(date,getdate()))  +1 +20.5/24 + 16/60/24);
INSERT INTO SEANCES VALUES (11,6,convert(datetime, convert(date,getdate()))   +22/24 +13/24/60,convert(datetime, convert(date,getdate()))      +22/24 + 25/60/24);
INSERT INTO SEANCES VALUES (11,6,convert(datetime, convert(date,getdate()))+1 +22/24 +15/24/60,convert(datetime, convert(date,getdate())) +1 +22/24  + 30/60/24);
INSERT INTO SEANCES VALUES (11,6,convert(datetime, convert(date,getdate()))+2 +22/24 +15/24/60,convert(datetime, convert(date,getdate())) +2 +22/24  + 30/60/24);
INSERT INTO SEANCES VALUES (12,6,convert(datetime, convert(date,getdate()))   +21/24  +10/24/60,convert(datetime, convert(date,getdate()))    +21/24  + 25/60/24);
INSERT INTO SEANCES VALUES (12,6,convert(datetime, convert(date,getdate()))+1 +21/24  +10/24/60,convert(datetime, convert(date,getdate())) +1 +21/24  + 25/60/24);
INSERT INTO SEANCES VALUES (12,6,convert(datetime, convert(date,getdate()))+2 +21/24  +10/24/60,convert(datetime, convert(date,getdate())) +2 +21/24  + 25/60/24);
INSERT INTO SEANCES VALUES (13,6,convert(datetime, convert(date,getdate()))   +22.5/24 +3/24/60,convert(datetime, convert(date,getdate()))      +22.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (13,6,convert(datetime, convert(date,getdate()))+1 +22.5/24 +15/24/60,convert(datetime, convert(date,getdate())) +1 +22.5/24  + 30/60/24);
INSERT INTO SEANCES VALUES (13,6,convert(datetime, convert(date,getdate()))+2 +22.5/24 +15/24/60,convert(datetime, convert(date,getdate())) +2 +22.5/24  + 30/60/24);
INSERT INTO SEANCES VALUES (14,6,convert(datetime, convert(date,getdate()))   +21.5/24  +10/24/60,convert(datetime, convert(date,getdate()))    +21.5/24  + 25/60/24);
INSERT INTO SEANCES VALUES (14,6,convert(datetime, convert(date,getdate()))+1 +21.5/24  +10/24/60,convert(datetime, convert(date,getdate())) +1 +21.5/24  + 25/60/24);
INSERT INTO SEANCES VALUES (14,6,convert(datetime, convert(date,getdate()))+2 +21.5/24  +10/24/60,convert(datetime, convert(date,getdate())) +2 +21.5/24  + 25/60/24);
INSERT INTO SEANCES VALUES (16,6,convert(datetime, convert(date,getdate()))+19.5/24,convert(datetime, convert(date,getdate())) +19.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (16,6,convert(datetime, convert(date,getdate()))+22.25/24,convert(datetime, convert(date,getdate())) +22.25/24 + 15/60/24);
INSERT INTO SEANCES VALUES (16,6,convert(datetime, convert(date,getdate()))+1+22.25/24,convert(datetime, convert(date,getdate())) +1+22.25/24 + 15/60/24);
INSERT INTO SEANCES VALUES (16,6,convert(datetime, convert(date,getdate()))+2+22.25/24,convert(datetime, convert(date,getdate())) +2+22.25/24 + 15/60/24);
INSERT INTO SEANCES VALUES (17,6,convert(datetime, convert(date,getdate()))+19/24,convert(datetime, convert(date,getdate())) +19/24 + 15/60/24);
INSERT INTO SEANCES VALUES (17,6,convert(datetime, convert(date,getdate()))+2+19/24,convert(datetime, convert(date,getdate())) +2+19/24 + 15/60/24);
INSERT INTO SEANCES VALUES (17,6,convert(datetime, convert(date,getdate()))+23/24,convert(datetime, convert(date,getdate())) +23/24 + 15/60/24);
INSERT INTO SEANCES VALUES (17,6,convert(datetime, convert(date,getdate()))+2+23/24,convert(datetime, convert(date,getdate())) +2+23/24 + 15/60/24);


INSERT INTO SEANCES VALUES (12,7,convert(datetime, convert(date,getdate()))   +19.5/24,convert(datetime, convert(date,getdate())) +19.5/24 + 15/60/24);
INSERT INTO SEANCES VALUES (2,7,convert(datetime, convert(date,getdate()))+1 +17/24,convert(datetime, convert(date,getdate())) +1 +17/24 + 15/60/24);
INSERT INTO SEANCES VALUES (4,7,convert(datetime, convert(date,getdate()))+2 +20/24,convert(datetime, convert(date,getdate())) +2 +20/24 + 15/60/24);
