
CREATE TABLE HISTO_FAC(
  numero_fac int identity(1000,1) not null,
  date_fac datetime,
  numero_cde int,
  montantht smallmoney,
  etat_fac char(2),
  constraint pk_histo_fac primary key(numero_fac)
);