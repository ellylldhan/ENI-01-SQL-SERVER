
SELECT TOP 3 s.libelle as Salle, count(*) as "Nombre de formations"
  FROM Formations f
  INNER JOIN Salles s on f.salle=s.id
  GROUP BY s.libelle
  ORDER BY 2 desc;
