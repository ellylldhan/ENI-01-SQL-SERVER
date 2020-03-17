ALTER TABLE ARTICLES
  ALTER COLUMN reference_art nvarchar(16) not null;
GO
ALTER TABLE ARTICLES
  ADD CONSTRAINT pk_articles
  PRIMARY KEY(reference_art);
go
ALTER TABLE ARTICLES
  ADD CONSTRAINT uq_des_prix
  UNIQUE NONCLUSTERED (designation_art, prixht_art);
