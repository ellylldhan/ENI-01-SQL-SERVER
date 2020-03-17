-- Table des commandes
CREATE TABLE COMMANDES(
  numero_cde int identity(1350,1),
  date_cde date,
  taux_remise numeric(2,0),
  numero_cli int,
  etat_cde char(2));