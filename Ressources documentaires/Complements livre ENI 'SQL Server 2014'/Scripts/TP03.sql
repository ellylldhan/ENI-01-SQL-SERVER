USE GestSalles;
Go
ALTER TABLE FORMATIONS
  ADD CONSTRAINT ck_formations_date CHECK (dateFin is null or (dateFin>dateDebut));