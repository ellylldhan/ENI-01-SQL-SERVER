SELECT c.titre as Cours, s.libelle as Salle
  FROM COURS c
  INNER JOIN Formations f ON c.id=f.cours
  INNER JOIN Salles s on s.id=f.salle
  WHERE DATEDIFF(ww, GETDATE(), dateadd(ww,11,dateDebut)) = 1;