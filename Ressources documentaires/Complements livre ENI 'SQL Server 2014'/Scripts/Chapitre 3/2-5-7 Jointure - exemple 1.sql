
SELECT CAT.CODE_CAT, CAT.LIBELLE_CAT, ART.DESIGNATION_ART
	FROM CATEGORIES CAT, ARTICLES ART
	WHERE ART.CODE_CAT=CAT.CODE_CAT;