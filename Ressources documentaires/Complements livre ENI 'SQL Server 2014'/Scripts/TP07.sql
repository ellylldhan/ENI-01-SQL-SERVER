Select c.titre as cours, count(*) as "Nombre de salles"
  FROM Cours c
  INNER JOIN CoursMachines cm ON cm.cours=c.id
  INNER JOIN Salles s ON S.machine=cm.machine
  GROUP BY c.titre;