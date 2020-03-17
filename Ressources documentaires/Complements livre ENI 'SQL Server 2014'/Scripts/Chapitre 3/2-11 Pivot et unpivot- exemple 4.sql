
WITH MonStock(reference_art,Nantes, Paris1, PAris2, designation_art) AS (
  SELECT pvt.reference_art, [N],[P1],[P2], designation_art
    FROM STOCKS
	PIVOT (sum(qte_stk) FOR depot in ([N],[P1],[P2])) as pvt
	INNER JOIN ARTICLES
	ON ARTICLES.reference_art=pvt.reference_art
)
SELECT reference_art, designation_art, quantite
  FROM MonStock
  UNPIVOT (quantite FOR MonStock IN (Paris2)) as unpvt;