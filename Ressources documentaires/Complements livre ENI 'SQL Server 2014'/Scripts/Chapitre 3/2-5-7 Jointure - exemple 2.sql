
SELECT CAT.CODE_CAT, CAT.LIBELLE_CAT, ART.DESIGNATION_ART
	FROM CATEGORIES CAT INNER JOIN ARTICLES ART
	ON ART.CODE_CAT=CAT.CODE_CAT;