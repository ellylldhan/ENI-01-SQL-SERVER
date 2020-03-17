
SELECT numero_cli, ca=sum(lig.qte_cde*art.prixht_art)
  INTO SyntheseClients
  FROM COMMANDES cdes
  INNER JOIN LIGNES_CDE lig ON cdes.numero_cde=lig.numero_cde
  INNER JOIN ARTICLES art ON lig.reference_art=art.reference_art
  GROUP BY cdes.numero_cli;
GO

SELECT * FROM SyntheseClients;