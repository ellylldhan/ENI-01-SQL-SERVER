
SELECT REFERENCE_ART, SUM(QTE_STK) as Quantité
	FROM STOCKS
	GROUP BY REFERENCE_ART;