
SELECT COUNT(*) FROM COMMANDES;
SELECT TOP 5 PERCENT cde.numero_cde,
       ca=SUM(qte_cde*prixht_art)
  FROM COMMANDES cde INNER JOIN LIGNES_CDE lig
  ON cde.numero_cde=lig.numero_cde
  INNER JOIN ARTICLES art
  ON lig.reference_art=art.reference_art
  GROUP BY cde.numero_cde
  ORDER BY ca DESC;