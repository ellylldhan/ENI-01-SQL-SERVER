SELECT m.libelle as "Type de machine", sum(nombrePlaces) as "Nombre de postes"
  FROM Machines m
  INNER JOIN Salles s on s.machine=m.id
  GROUP BY m.libelle;
  