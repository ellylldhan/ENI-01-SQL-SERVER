--CREATION DE LA TABLE SERVICES ET DEFINITIONS D'UNE PK
CREATE TABLE Services
(
    CodeService char(5) PRIMARY KEY,
    Libelle     varchar(30) NOT NULL
)
DROP TABLE Services;
CREATE TABLE Services
(
    CodeService char(5)
        CONSTRAINT PK_SERVICES PRIMARY KEY,
    Libelle     varchar(30) NOT NULL
)
DROP TABLE Services;
CREATE TABLE Services
(
    CodeService char(5),
    Libelle     varchar(30) NOT NULL,
    CONSTRAINT PK_SERVICES PRIMARY KEY (CodeService)
);


--CREATION DE LA TABLE EMPLOYES ET DEFINITIONS DE FK
CREATE TABLE Employes
(
    CodeEmp       int PRIMARY KEY IDENTITY,
    Nom           varchar(20) NOT NULL,
    Prenom        varchar(50) NOT NULL,
    DateNaissance datetime    NULL,
    DateEmbauche  datetime    NOT NULL DEFAULT GETDATE(),
    Salaire       decimal(8, 2),
    CodeService   char(5) REFERENCES Services (CodeService),
    CodeChef      int
        CONSTRAINT FK_Employes_Employes REFERENCES Employes (CodeEmp)
);
DROP TABLE Employes;
CREATE TABLE Employes
(
    CodeEmp       int PRIMARY KEY IDENTITY,
    Nom           varchar(20) NOT NULL,
    Prenom        varchar(50) NOT NULL,
    DateNaissance datetime    NULL,
    DateEmbauche  datetime    NOT NULL DEFAULT GETDATE(),
    Salaire       decimal(8, 2),
    CodeService   char(5),
    CodeChef      int
        CONSTRAINT FK_Employes_Employes REFERENCES Employes (CodeEmp),
    CONSTRAINT FK_Employes_Services FOREIGN KEY (CodeService) REFERENCES Services (CodeService)
);


--CREATION DE LA TABLE CONGES ET DEFINITION D'UNE CLE PRIMAIRE COMPOSEE
CREATE TABLE Conges
(
    CodeEmp       int REFERENCES Employes (CodeEmp),
    Annee         numeric(4, 0),
    NbJoursAcquis numeric(2, 0),
    CONSTRAINT PK_Conges PRIMARY KEY (CodeEmp, Annee)
)


--CREATION DE LA TABLE CONGES_MENS
CREATE TABLE Conges_Mens
(
    CodeEmp     int,
    Annee       numeric(4, 0),
    Mois        numeric(2, 0),
    NbJoursPris numeric(2, 0),
    CONSTRAINT PK_Conges_Mens PRIMARY KEY (CodeEmp, Annee, Mois),
    CONSTRAINT FK_Conges_Mens_Conges FOREIGN KEY (CodeEmp, Annee) REFERENCES Conges (CodeEmp, Annee)
);


