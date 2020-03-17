-- Ajout d'une colonne
ALTER TABLE CLIENTS ADD CODEREP char(2) NOT NULL;
-- Modification d'une colonne existante
ALTER TABLE CLIENTS ALTER COLUMN TELEPHONE char(14) NOT NULL;
-- Ajout d'une contrainte
ALTER TABLE CLIENTS ADD CONSTRAINT ck_clients_codepostal
  CHECK (convert(int,codepostal) between 1000 and 95999); 