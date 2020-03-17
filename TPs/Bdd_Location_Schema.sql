/***
 * BDD LOCATION
 * 
 * Creation des tables
 */

DROP TABLE IF EXISTS LignesFic;
DROP TABLE IF EXISTS Fiches;
DROP TABLE IF EXISTS Clients;
DROP TABLE IF EXISTS Articles;
DROP TABLE IF EXISTS GrilleTarifs;
DROP TABLE IF EXISTS Gammes;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Tarifs;


--CREATION DE LA TABLE CLIENTS
CREATE TABLE Clients
(
    noCli   numeric(6) PRIMARY KEY,
    nom     varchar(30) NOT NULL,
    prenom  varchar(30),
    adresse varchar(120),
    cpo     char(5)     NOT NULL,
    ville   varchar(80) NOT NULL
);


--AJOUT D'UNE CONSTRAINTE DE VALEUR PAR DEFAULT
ALTER TABLE Clients
    ADD CONSTRAINT DF_VILLE DEFAULT 'Nantes' FOR ville;


--CREATION DE LA TABLE FICHES
CREATE TABLE Fiches
(
    noFic    numeric(6) PRIMARY KEY,
    noCli    numeric(6) REFERENCES Clients (noCli) ON DELETE CASCADE,
    dateCrea datetime DEFAULT GETDATE(),
    datePaye datetime,
    etat     char(2)  DEFAULT 'EC',
    CONSTRAINT CK_DATEPAYE CHECK (datePaye > dateCrea),
    CONSTRAINT CK_DATEPAYE_ETAT CHECK (
            (datePaye IS NOT NULL AND etat = 'SO')
            OR
            (datePaye IS NULL) )
);


--CREATION DE LA TABLE GAMMES
CREATE TABLE Gammes
(
    codeGam char(5) PRIMARY KEY,
    libelle varchar(30) NOT NULL UNIQUE
);


--CREATION DE LA TABLE CATEGORIES
CREATE TABLE Categories
(
    codeCate char(5) PRIMARY KEY,
    libelle  varchar(30) NOT NULL UNIQUE
);


--CREATION DE LA TABLE TARIFS
CREATE TABLE Tarifs
(
    codeTarif char(5)
        CONSTRAINT PK_Tarifs PRIMARY KEY,
    libelle   varchar(30) NOT NULL
);


--Ajout d'une contrainte d'unicite
ALTER TABLE Tarifs
    ADD CONSTRAINT UQ_LIBELLE UNIQUE (libelle);


--Suppression d'une contrainte
ALTER TABLE Tarifs
    DROP CONSTRAINT [UQ_LIBELLE];


--Ajout d'une colonne dans une table
ALTER TABLE Tarifs
    ADD prixJour numeric(5, 2) NOT NULL


--CREATION DE LA TABLE GRILLETARIFS
CREATE TABLE GrilleTarifs
(
    codeGam   char(5) REFERENCES Gammes (codeGam),
    codeCate  char(5) REFERENCES Categories (codeCate),
    codeTarif char(5) REFERENCES Tarifs (codeTarif),
    CONSTRAINT PK_GRILLETARIFS PRIMARY KEY (codeGam, codeCate)
);


--CREATION DE LA TABLE ARTICLES 
CREATE TABLE Articles
(
    refart      char(8) PRIMARY KEY,
    designation varchar(80) NOT NULL,
    codeGam     char(5)     NOT NULL,
    codeCate    char(5)     NOT NULL,
    CONSTRAINT FK_Articles_GrilleTarifs
        FOREIGN KEY (codeGam, codeCate)
            REFERENCES GrilleTarifs (codeGam, codeCate)
);


--CREATION DE LA TABLE LignesFic 
-- la date de retour d’une fiche est toujours,
-- si elle est renseignée, postérieure à sa date de départ.
CREATE TABLE LignesFic
(
    noFic  numeric(6),
    noLig  numeric(3),
    refart char(8)  NOT NULL REFERENCES Articles (refart),
    depart datetime NOT NULL DEFAULT GETDATE(),
    retour datetime,
    CONSTRAINT CK_RETOUR CHECK (retour > depart),
    CONSTRAINT PK_LIGNESFIC PRIMARY KEY (noFic, noLig),
    CONSTRAINT FK_LignesFic_Fiches
        FOREIGN KEY (noFic)
            REFERENCES Fiches (noFic) ON DELETE CASCADE
);


-- le code postal est compris entre 01000 et 95999.
ALTER TABLE CLIENTS
    ADD CONSTRAINT CK_CPO CHECK (cpo BETWEEN 1000 AND 95999);


-- les états possibles sont ‘EC’, ‘RE’ et ‘SO’ (en cours, rendue et soldée).
ALTER TABLE FICHES
    ADD CONSTRAINT CK_ETAT
        CHECK (etat IN ('EC', 'RE', 'SO'))


-- le prix d’une journée est toujours positif.
ALTER TABLE Tarifs
    ADD CONSTRAINT CK_PRIX
        CHECK (prixJour > 0)
