
SELECT * 
  FROM Salles 
  WHERE id NOT IN (SELECT salle FROM Formations);