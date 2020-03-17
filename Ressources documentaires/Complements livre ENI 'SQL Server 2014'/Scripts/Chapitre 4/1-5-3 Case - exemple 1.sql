
SELECT libelle=CASE code_cat
	WHEN 10 THEN 'Imprimantes'
	WHEN 20 THEN 'Scanners'
	ELSE 'Autres'
	END,
	reference_art, designation_art
  FROM ARTICLES
  ORDER BY code_cat;