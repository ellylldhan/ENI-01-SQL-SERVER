
SELECT *
  FROM ARTICLES
  WHERE code_cat IN (SELECT code_cat
	FROM CATEGORIES
	WHERE libelle_cat like 'Cl%'
  );