
USE GestSalles;
GO
CREATE TABLE Machines(
  id int identity(1,1) constraint pk_machines primary key,
  libelle nvarchar(50) not null,
  processeur nvarchar(50) not null,
  memoire smallint not null,
  disque smallint not null,
  ecran tinyint not null,
  constraint ck_memoire check (memoire>0),
  constraint ck_disque check (disque>0),
  constraint ck_ecran check (ecran>0)
);
GO
CREATE TABLE Cours(
  id int identity(1,1) constraint pk_cours primary key,
  code nvarchar(10),
  titre nvarchar(50),
  duree tinyint,
  programme xml
);
GO
CREATE TABLE CoursMachines(
  id int identity(1,1) constraint pk_coursMachines primary key,
  cours int constraint fk_coursMachines_cours references Cours(id),
  machine int constraint fk_coursMachines_machines references Machines(id)
)
GO
CREATE TABLE Salles(
  id int identity(1,1) constraint pk_salles primary key,
  libelle nvarchar(20),
  nombrePlaces smallint constraint ck_salles_nombrePlaces check (nombrePlaces>0),
  machine int constraint fk_salles_machines references Machines(id)
);
GO
CREATE TABLE Formations(
  id int identity(1,1) constraint pk_formations primary key,
  cours int constraint fk_formations_cours references Cours(id),
  salle int constraint fk_formations_salles references Salles(id),
  dateDebut date,
  dateFin date
);