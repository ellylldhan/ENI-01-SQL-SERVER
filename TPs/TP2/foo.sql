INSERT INTO Clients (noCli, nom, prenom, adresse, cpo, ville)
VALUES
(1, 'Albert', 'Anatole', 'Rue des Acacias', '61000', 'Amiens'),
(2, 'Bernard', 'Barnabé', 'Rue du Bar', '01000', 'Bourg-en-Bresse'),
(3, 'Dupond', 'Camille', 'Rue Crébillon', '44000', 'Nantes'),
(4, 'Desmoulin', 'Daniel', 'Rue Descendante', '21000', 'Dijon'),
(5, 'Ernest', 'Etienne', 'Rue de l''echafaud', '42000', 'Saint-Etienne'),
(6, 'Ferdinand', 'François', 'Rue de la Convention', '44100', 'Nantes'),
(9, 'Dupond', 'Jean', 'Rue des mimosas', '75018', 'Paris'),
(14, 'Boutaud', 'Sabine', 'Rue des platanes', '75002', 'Paris');

INSERT INTO Fiches (noFic, noCli, dateCrea, datePaye, etat)
VALUES
(1001, 14, getDate() - 15, getDate()  13, 'SO'),
(1002, 4, getDate() - 13, Null, 'EC'),
(1003, 1, getDate() - 12, getDate()  10, 'SO'),
(1004, 6, getDate()-  11, Null, 'EC'),
(1005, 3, getDate() - 10, Null, 'EC'),
(1006, 9, getDate() - 10, Null, 'RE'),
(1007, 1, getDate() - 3, Null, 'EC'),
(1008, 2, getDate(), Null, 'EC');

INSERT INTO LIGNESFIC (noFic, noLig, refart, depart, retour)
VALUES
(1001, 1, 'F05', getDate()-15, getDate()-13),
(1001, 2, 'F50', getDate()-15, getDate()-14),
(1001, 3, 'F60', getDate()-13, getDate()-13),
(1002, 1, 'A03', getDate()-13, getDate()-9),
(1002, 2, 'A04', getDate()-12, getDate()-7),
(1002, 3, 'S03', getDate()-8, Null),
(1003, 1, 'F50', getDate()-12, getDate()-10),
(1003, 2, 'F05', getDate()-12, getDate()-10),
(1004, 1, 'P01', getDate()-6, Null),
(1005, 1, 'F05', getDate()-9, getDate()-5),
(1005, 2, 'F10', getDate()-4, Null),
(1006, 1, 'S01', getDate()-10, getDate()-9),
(1006, 2, 'S02', getDate()-10, getDate()-9),
(1006, 3, 'S03', getDate()-10, getDate()-9),
(1007, 1, 'F50', getDate()-3, getDate()-2),
(1007, 3, 'F60', getDate()-1, Null),
(1007, 2, 'F05', getDate()-3, Null),
(1007, 4, 'S02', getDate(), Null),
(1008, 1, 'S01', getDate(), Null);


INSERT INTO ARTICLES (Refart, Designation, codeGam, codeCate)
VALUES
('F01', 'Fischer Cruiser', 'EG', 'FOA'),
('F02', 'Fischer Cruiser', 'EG', 'FOA'),
('F03', 'Fischer Cruiser', 'EG', 'FOA'),
('F04', 'Fischer Cruiser', 'EG', 'FOA'),
('F05', 'Fischer Cruiser', 'EG', 'FOA'),
('F10', 'Fischer Sporty Crown', 'MG', 'FOA'),
('F20', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
('F21', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
('F22', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
('F23', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
('F50', 'Fischer SOSSkating VASA', 'HG', 'FOP'),
('F60', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
('F61', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
('F62', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
('F63', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
('F64', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
('P01', 'Décathlon Allegre junior 150', 'EG', 'PA'),
('P10', 'Fischer mini ski patinette', 'MG', 'PA'),
('P11', 'Fischer mini ski patinette', 'MG', 'PA'),
('S01', 'Décathlon Apparition', 'EG', 'SURF'),
('S02', 'Décathlon Apparition', 'EG', 'SURF'),
('S03', 'Décathlon Apparition', 'EG', 'SURF'),
('A01', 'Salomon 24X+Z12', 'EG', 'SA'),
('A02', 'Salomon 24X+Z12', 'EG', 'SA'),
('A03', 'Salomon 24X+Z12', 'EG', 'SA'),
('A04', 'Salomon 24X+Z12', 'EG', 'SA'),
('A05', 'Salomon 24X+Z12', 'EG', 'SA'),
('A10', 'Salomon Pro Link Equipe 4S', 'PR', 'SA'),
('A11', 'Salomon Pro Link Equipe 4S', 'PR', 'SA'),
('A21', 'Salomon 3V RACE JR+L10', 'PR', 'SA');