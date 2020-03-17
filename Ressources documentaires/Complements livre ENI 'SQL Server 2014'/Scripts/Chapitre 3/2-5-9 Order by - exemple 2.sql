
SELECT nom, prenom, adresse, codepostal, ville
  FROM CLIENTS
  ORDER BY nom, prenom, codepostal, ville
  OFFSET 10 ROWS FETCH NEXT 5 ROWS ONLY;