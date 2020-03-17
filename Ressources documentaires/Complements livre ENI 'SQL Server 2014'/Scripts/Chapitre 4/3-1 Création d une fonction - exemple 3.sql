
CREATE FUNCTION AnalyseClient (@nocli int)
	RETURNS @FicheClient TABLE(libelle nchar(30), valeur int)
AS
BEGIN
	INSERT INTO @FicheClient
		VALUES ('Nombre de commandes',dbo.nbre_cde(@nocli));
	INSERT INTO @FicheClient
		SELECT 'Montant total', CONVERT(int,SUM(qte_cde*prixht_art))
		FROM COMMANDES cde INNER JOIN LIGNES_CDE lig
		  ON cde.numero_cde=lig.numero_cde
		  INNER JOIN ARTICLES art
		  ON lig.reference_art=art.reference_art;
	RETURN;
END;