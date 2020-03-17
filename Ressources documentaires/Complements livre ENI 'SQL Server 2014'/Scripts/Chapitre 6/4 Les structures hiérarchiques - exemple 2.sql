
ALTER TABLE employes
 ADD CONSTRAINT pk_employes PRIMARY KEY (id);
CREATE INDEX employes_position
  ON employes(position);
-- modifier la table pour ajouter une colonne relative au niveau
ALTER TABLE employes
  ADD niveau AS position.GetLevel();  
CREATE INDEX employes_niveau
  ON employes(niveau, position);