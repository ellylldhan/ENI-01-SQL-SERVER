
CREATE VIEW vart(ref, libelle, prix) AS
  SELECT CONVERT(char(5),code_cat)+'-'+REFERENCE_ART,
		 SUBSTRING(designation_art,1,10), prixht_art
    FROM ARTICLES;
GO
SELECT * FROM vart;
