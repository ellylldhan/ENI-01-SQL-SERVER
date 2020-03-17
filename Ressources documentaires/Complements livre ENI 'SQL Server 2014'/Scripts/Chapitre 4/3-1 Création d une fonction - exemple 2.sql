
CREATE FUNCTION ArticlesPetitPrix(@seuil int)
	RETURNS TABLE 
  AS
	RETURN(SELECT * FROM ARTICLES WHERE prixht_art<@seuil);