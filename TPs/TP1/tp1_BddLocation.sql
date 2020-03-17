DROP TABLE IF EXISTS LignesFic;
DROP TABLE IF EXISTS Fiches;
DROP TABLE IF EXISTS Articles;
DROP TABLE IF EXISTS GrilleTarifs;
DROP TABLE IF EXISTS Gammes;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Clients;
DROP TABLE IF EXISTS Tarifs;


-- Creation table Clients
CREATE TABLE Clients
(
    noCli   numeric(6) PRIMARY KEY,
    nom     varchar(30)                  NOT NULL,
    prenom  varchar(30),
    adresse varchar(120),
    cpo     char(5)                      NOT NULL,
    ville   varchar(80) DEFAULT 'Nantes' NOT NULL
);

-- Creation table Fiches

/*
CREATE TABLE Fiches_moi
(
	noFic    numeric(6) CONSTRAINT PK_Fiches PRIMARY KEY,
	noCli    numeric(6),
	dateCrea datetime    DEFAULT getDate(),
	datePaye datetime,
	etat     char(2)     DEFAULT 'EC',   -- 'EC' pour 'En cours'
	CONSTRAINT FK_Fiches_CLIENT FOREIGN KEY(noCli) REFERENCES Clients(noCli)
);
*/


-- Creation table Fiches
CREATE TABLE Fiches
(
    noFic    numeric(6) PRIMARY KEY,
    noCli    numeric(6)
        REFERENCES Clients (noCli)  -- definition FK
            ON DELETE CASCADE,      -- suppr. fiche client
    dateCrea datetime DEFAULT getDate(),
    datePaye datetime,
    etat     char(2)  DEFAULT 'EC', -- 'EC' pour 'En cours'
);


-- Creation table TARIFS
CREATE TABLE TARIFS
(
    codeTarif char(5) PRIMARY KEY,
    libelle   varchar(30)   NOT NULL,
    prixJour  numeric(5, 2) NOT NULL,
);


-- Creation table Gammes
CREATE TABLE Gammes
(
    codeGam char(5) PRIMARY KEY,
    libelle varchar(30) NOT NULL UNIQUE
);


-- Creation table CATEGORIES
CREATE TABLE CATEGORIES
(
    codeCate char(5) PRIMARY KEY,
    libelle  varchar(30) NOT NULL UNIQUE
);


-- Creation table GrilleTarifs
CREATE TABLE GrilleTarifs
(
    codeGam   char(5) NOT NULL REFERENCES Gammes (codeGam),
    codeCate  char(5) NOT NULL REFERENCES CATEGORIES (codeCate),
    codeTarif char(5) REFERENCES TARIFS (codeTarif),
    CONSTRAINT PK_GrilleTarifs PRIMARY KEY (codeGam, codeCate),
);


-- Creation table ARTICLES
CREATE TABLE Articles
(
    refart      char(8) PRIMARY KEY,
    designation varchar(80) NOT NULL,
    codeGam     char(5)     NOT NULL,
    codeCate    char(5)     NOT NULL,
    -- contrainte qui prend +2 colonne donc contrainte de table
    CONSTRAINT FK_Articles_GrilleTarifs
        FOREIGN KEY (codeGam, CodeCate)
            REFERENCES GrilleTarifs (codeGam, codeCate)
);


-- Creation Table LIGNESFIC
CREATE TABLE LignesFic
(
    noFic  numeric(6) NOT NULL
        REFERENCES Fiches (noFic)
            ON DELETE CASCADE, -- suppr. fiche client
    noLig  numeric(3) NOT NULL,
    refart char(8)    NOT NULL REFERENCES Articles (refart),
    depart datetime   NOT NULL DEFAULT getDate(),
    retour datetime,
    CONSTRAINT PK_LIGNESFIC PRIMARY KEY (noFic, noLig),
);


-- code postal compris entre 01000 et 95999
ALTER TABLE Clients
    ADD CONSTRAINT CK_CPO
        CHECK (cpo BETWEEN 1000 AND 95999);
-- fonctionne meme si type cpo est char


-- Etat possibles sont EC RE et SO
ALTER TABLE Fiches
    ADD CONSTRAINT CK_ETAT
        CHECK (etat IN ('EC', 'RE', 'SO'));


-- le prix d'une journee est toujours positif
ALTER TABLE Tarifs
    ADD CONSTRAINT CK_PRIX
        CHECK (prixJour > 0);


-- La date de paiement d'une fiche est tjs, si renseign�e, posterieure � sa date de creation
-- Ici, check sur 2 colonnes, donc contrainte de table
ALTER TABLE Fiches
    ADD CONSTRAINT CK_DATEPAYE
        CHECK (datePaye > dateCrea);


-- la date de retour d�une fiche est toujours, si elle est renseign�e, post�rieure � sa date de d�part.
ALTER TABLE LignesFic
    ADD CONSTRAINT CK_RETOUR
        CHECK (retour > depart);


ALTER TABLE Fiches
    DROP CONSTRAINT CK_DATEPAYE_ETAT;


-- La date de payement d�une fiche est renseign�e si l��tat est sold� et n�est pas renseign�e dans le cas contraire.
ALTER TABLE Fiches
    ADD CONSTRAINT CK_DATEPAYE_ETAT
        CHECK (
                (datePaye IS NOT NULL AND etat = 'SO')
                OR
                (datePaye IS NULL))


-- AJOUT CONTRAINTES : Unique
--ALTER TABLE Tarifs ADD CONSTRAINT UQ_libelle UNIQUE(libelle);

-- DROP CONTRAINTE
--ALTER TABLE Tarifs DROP CONSTRAINT UQ_libelle;



