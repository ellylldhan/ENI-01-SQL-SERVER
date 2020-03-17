-- CREATION TABLE EMPLOYES
DROP TABLE IF EXISTS Employes;
CREATE TABLE Employes
(
    CodeEmp       int PRIMARY KEY IDENTITY, -- auto incrementation
    Nom           varchar(20) NOT NULL,
    Prenom        varchar(50) NOT NULL,
    DateNaissance datetime    NULL,         -- implicite
    DateEmbauche  datetime    NOT NULL DEFAULT GETDATE(),
    Salaire       decimal(8, 2),
    CodeService   char(5) REFERENCES Services (CodeService),
    CodeChef      int
        CONSTRAINT FK_Employes_Employes REFERENCES Employes (CodeEmp)
)


-- CREATION TABLE EMPLOYES v2
DROP TABLE IF EXISTS Employes;
CREATE TABLE Employes
(
    CodeEmp       int PRIMARY KEY IDENTITY, -- auto incrementation
    Nom           varchar(20) NOT NULL,
    Prenom        varchar(50) NOT NULL,
    DateNaissance datetime    NULL,         -- implicitement NULL mais on peut pr�ciser
    DateEmbauche  datetime    NOT NULL DEFAULT GETDATE(),
    Salaire       decimal(8, 2),
    CodeService   char(5),
    CodeChef      int
        CONSTRAINT FK_Employes_Employes REFERENCES Employes (CodeEmp),
    CONSTRAINT FK_Employes_Services FOREIGN KEY (CodeService) REFERENCES Services (CodeService)
)

-- CREATION TABLE CONGES ET DEFINITION d'une cle primaire compos�e
DROP TABLE IF EXISTS Conges;
CREATE TABLE Conges
(
    CodeEmp       int REFERENCES Employes (CodeEmp),
    Annee         numeric(4, 0),
    NbJoursAcquis numeric(2, 0),
    CONSTRAINT PK_Conges PRIMARY KEY (CodeEmp, Annee) -- 1 pk avec 2 elements

);

-- Creation table CONGES_MENS, PK sur 3 col
DROP TABLE IF EXISTS CongesMens;
CREATE TABLE CongesMens
(
    CodeEmp     int,
    Annee       numeric(4, 0),
    Mois        numeric(2, 0),
    NbJoursPris numeric(2, 0),
    CONSTRAINT PK_CongesMens PRIMARY KEY (CodeEmp, Annee, Mois),
    CONSTRAINT FK_CongesMens_Conges FOREIGN KEY (CodeEmp, Annee) REFERENCES Conges (CodeEmp, Annee)
);

-- TP1