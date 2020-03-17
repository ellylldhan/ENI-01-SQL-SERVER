
SELECT reference_art, sum(qte_cde) as quantite
  INTO ##artCde
  FROM LIGNES_CDE
  GROUP BY reference_art;
GO
SELECT * FROM ##artCde;