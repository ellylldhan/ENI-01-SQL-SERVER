CREATE TYPE typenom
  FROM VARCHAR(30);

CREATE TYPE entier_3
  FROM numeric(3) not null;

CREATE TYPE tIndividu AS TABLE(
  civilite char(3) check (civilite in ('Mlle','Mme','M')),
  nom nvarchar(80),
  prenom nvarchar(80)
);
