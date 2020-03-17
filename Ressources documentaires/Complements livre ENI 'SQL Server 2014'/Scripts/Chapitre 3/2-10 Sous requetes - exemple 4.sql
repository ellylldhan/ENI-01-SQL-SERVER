
SELECT reference_art, prixht_art
  FROM ARTICLES art1
  WHERE prixht_art=(SELECT distinct art2.prixht_art
    FROM ARTICLES art2
	WHERE art2.prixht_art=art1.prixht_art
	  AND art2.reference_art!=art1.reference_art)
  ORDER BY prixht_art DESC;