
SELECT reference_art
  FROM ARTICLES
  WHERE NOT EXISTS(SELECT *
    FROM LIGNES_CDE
	WHERE LIGNES_CDE.reference_art= ARTICLES.reference_art);