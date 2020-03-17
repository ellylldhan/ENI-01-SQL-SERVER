-- Creation table TARIFS
DROP TABLE IF EXISTS TARIFS;
CREATE TABLE TARIFS
(
    codeTarif char(5)
        CONSTRAINT PK_TARIFS PRIMARY KEY,
    libelle   varchar(30)   NOT NULL,
    prixJour  numeric(5, 2) NOT NULL,
);


-- Creation table GAMMES
DROP TABLE IF EXISTS GAMMES;
CREATE TABLE GAMMES
(
    codeGam char(5)
        CONSTRAINT PK_GAMMES PRIMARY KEY,
    libelle varchar(30) NOT NULL UNIQUE
);


-- Creation table CATEGORIES
DROP TABLE IF EXISTS CATEGORIES;
CREATE TABLE CATEGORIES
(
    codeCate char(5)
        CONSTRAINT PK_CATEGORIES PRIMARY KEY,
    libelle  varchar(30) NOT NULL UNIQUE
);


-- Creation table GRILLETARIFS
DROP TABLE IF EXISTS GRILLETARIFS;
CREATE TABLE GRILLETARIFS
(
    codeGam   char(5) NOT NULL
        CONSTRAINT FK_GAMMES FOREIGN KEY (codeGam) REFERENCES GAMMES (codeGam),
    codeCate  char(5) NOT NULL
        CONSTRAINT FK_CATEGORIES FOREIGN KEY (codeCate) REFERENCES CATEGORIES (codeCate),
    codeTarif char(5),
    CONSTRAINT PK_GRILLETARIFS PRIMARY KEY (codeGam, codeCate),
);


-- Creation table ARTICLES
DROP TABLE IF EXISTS ARTICLES;
CREATE TABLE ARTICLES
(
    refart      char(8)
        CONSTRAINT PK_ARTICLES PRIMARY KEY,
    designation varchar(80),
    codeGam     char(5),
    codeCate    char(5),
    CONSTRAINT FK_ARTICLES_LIGNEFIC FOREIGN KEY (refart) REFERENCES LIGNESFIC (refart)
);


-- Creation table FICHES
DROP TABLE IF EXISTS FICHES;
CREATE TABLE FICHES
(
    noFic    numeric(6)
        CONSTRAINT PK_FICHES PRIMARY KEY,
    noCli    numeric(6),
    dateCrea datetime DEFAULT getDate(),
    datePaye datetime,
    etat     char(2)  DEFAULT 'EC', -- 'EC' pour 'En cours'
    CONSTRAINT FK_FICHES_CLIENT FOREIGN KEY (noCli) REFERENCES CLIENTS (noCli)
);


-- Creation Table LIGNESFIC
DROP TABLE IF EXISTS LIGNESFIC;
CREATE TABLE LIGNESFIC
(
    noFic  numeric(6) NOT NULL,
    noLig  numeric(3) NOT NULL,
    refart char(8)    NOT NULL,
    depart datetime   NOT NULL DEFAULT getDate(),
    retour datetime,
    CONSTRAINT PK_LIGNESFIC PRIMARY KEY (noFic, noLig),
    CONSTRAINT FK_LIGNESFIC_FICHES FOREIGN KEY (noFic) REFERENCES FICHES (noFic)
);


-- Creation table CLIENTS
DROP TABLE IF EXISTS CLIENTS;
CREATE TABLE CLIENTS
(
    noCli   numeric(6) REFERENCES FICHES (noCli),
    nom     varchar(30),
    prenom  varchar(30),
    adresse varchar(120),
    cpo     char(5),
    ville   varchar(80) DEFAULT 'Nantes',
    CONSTRAINT PK_CLIENTS PRIMARY KEY (noCli)
);



