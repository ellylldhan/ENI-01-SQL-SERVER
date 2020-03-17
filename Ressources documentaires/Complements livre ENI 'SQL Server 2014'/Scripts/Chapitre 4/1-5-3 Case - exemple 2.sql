
SELECT 'désignation prix' =CASE
	WHEN prixht_art<50 THEN 'Promotion'
	WHEN prixht_art BETWEEN 50 AND 150 THEN 'Normal'
	ELSE 'Exclusif'
	END,
	reference_art, designation_art
  FROM ARTICLES;