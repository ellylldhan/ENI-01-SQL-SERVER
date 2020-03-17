
SELECT c.code, COUNT(cm.machine) as "Nombre de machines"
  FROM CoursMachines cm
  RIGHT OUTER JOIN Cours c ON cm.cours=c.id
  GROUP BY c.code
  ORDER BY 2 ASC;