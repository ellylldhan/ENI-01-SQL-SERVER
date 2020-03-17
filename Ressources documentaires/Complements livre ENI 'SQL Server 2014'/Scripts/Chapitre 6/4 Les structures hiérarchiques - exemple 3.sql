-- Ajouter le sommet de la hiérarchie
INSERT INTO employes (position, nom,prenom, poste) VALUES 
  (hierarchyId::GetRoot(), 'DUPONT','Emile','Directeur');
  
DECLARE @patron hierarchyid; 
SELECT @patron=hierarchyid::GetRoot() FROM employes;
-- Ajouter le second niveau
DECLARE @drh hierarchyid;
DECLARE @compta hierarchyid
SET @drh=@patron.GetDescendant(null, null);
INSERT INTO employes (position, nom, prenom, poste) VALUES
    (@drh,'BARTIN','Jeanne','DRH');
SET @compta=@patron.GetDescendant(@drh, null);
INSERT INTO employes (position, nom, prenom, poste)  VALUES 
  ( @compta,'MICHALON','Paul','Comptable');
-- ajouter un troisième niveau
INSERT INTO employes (position, nom, prenom, poste) VALUES
  (@drh.GetDescendant(null, null),'BERNAUD','Beatrice','Assistante');
INSERT INTO employes ( position, nom, prenom, poste) VALUES
  (@compta.GetDescendant(null, null),'MARBOT','Marcel','Assistant');
