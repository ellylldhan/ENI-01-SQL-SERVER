
DECLARE @augmente numeric(4,2)=1.01;

WHILE (SELECT AVG(prixht_art) FROM ARTICLES)<240 
BEGIN
	UPDATE ARTICLES 
		SET prixht_art=ISNULL(prixht_art,0)*@augmente
	IF(SELECT MAX(prixht_art) FROM ARTICLES WHERE code_cat=10)>300
		BREAK;
	SELECT @augmente=@augmente+0.01;
END;