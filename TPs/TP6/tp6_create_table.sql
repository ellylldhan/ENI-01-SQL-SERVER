/**
 * TP6 - Location Vidéo
 * Script création de tables 
 */

---- DROP TABLES
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS dvd;
DROP TABLE IF EXISTS factures;
DROP TABLE IF EXISTS genres_film;
DROP TABLE IF EXISTS realisateurs;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS types_location;


---- LIEN DE PARENTE <= 1
-- Table CLIENTS
CREATE TABLE clients
(
    Code_client    char(6) PRIMARY KEY,
    Titre          char(4)      NOT NULL,
    Prenom         varchar(100) NOT NULL,
    Nom            varchar(100) NOT NULL,
    Adresse_rue    varchar(100) NOT NULL,
    Code_postal    char(5)      NOT NULL,
    Ville          varchar(50)  NOT NULL,
    Num_telephone  char(15)     NOT NULL,
    Date_naissance datetime     NOT NULL,
    Enfants        bit          NULL -- bit (0 ou 1) == BOOLEAN, pas de BOOLEAN en SQL SERVER
);

-- Table TYPES_LOCATION
CREATE TABLE types_location
(
    Code_type   char(2) PRIMARY KEY,
    Libelle     varchar(100) NOT NULL,
    Coefficient decimal(1, 0),
    Nb_jours    int
);

-- Table REALISATEURS
CREATE TABLE realisateurs
(
    Code_realisateur char(6) PRIMARY KEY,
    Prenom           varchar(50) NULL,
    Nom              varchar(50) NOT NULL,
    Annee_naissance  int         NULL,
    Pays             varchar(50) NULL
);

-- Table GENRES_FILM
CREATE TABLE genres_film
(
    Code_genre    char(2) PRIMARY KEY,
    Signification varchar(50) NOT NULL
);


---- LIENS PARENTES > 1
-- Table FACTURES
CREATE TABLE factures
(
    Num_facture  int PRIMARY KEY IDENTITY,
    Code_client  char(6) REFERENCES clients (Code_client),
    Date_facture datetime NOT NULL
);

-- Table DVD
CREATE TABLE dvd
(
    Num_dvd          INT PRIMARY KEY IDENTITY (1,1), -- identity(start, step)
    Titre            varchar(120)  NOT NULL,
    Prix_base        numeric(4, 2) NOT NULL,
    Code_realisateur char(6)       NOT NULL REFERENCES realisateurs (Code_realisateur),
    Code_genre       char(2)       NOT NULL REFERENCES genres_film (Code_genre),
    Annee            int           NOT NULL,
    Descriptif       varchar(200)  NOT NULL,
    Duree            int           NOT NULL
);
-- ALTER TABLE dvd ALTER COLUMN Prix_base numeric(4,2)

-- Table LOCATIONS
CREATE TABLE locations
(
    Num_facture int REFERENCES factures (Num_facture),
    Num_dvd     int REFERENCES dvd (Num_dvd),
    Code_type   char(2) REFERENCES types_location (Code_type),
    Date_retour datetime,
    CONSTRAINT PK_LOCATIONS PRIMARY KEY (Num_facture, Num_dvd)
);

alter table dvd
    add constraint FK_dvd_real
        foreign key (code_realisateur)
            references realisateurs (code_realisateur);

alter table dvd
    add constraint FK_dvd_genres
        foreign key (code_genre)
            references genres_film (code_genre);

