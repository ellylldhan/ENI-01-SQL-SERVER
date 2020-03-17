
SELECT nom, prenom, libelle, valeur
  FROM CLIENTS
  OUTER APPLY AnalyseClient(numero);