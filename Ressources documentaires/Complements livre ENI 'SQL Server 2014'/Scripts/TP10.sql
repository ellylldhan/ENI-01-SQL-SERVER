
SELECT *
  FROM Machines
  WHERE id NOT IN (SELECT DISTINCT machine FROM Salles);
