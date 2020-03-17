SELECT numero, nom, prenom, ville
  FROM CLIENTS
  WHERE (ville like 'N%' OR ville IS NULL)
    AND prenom like 'No_m%';