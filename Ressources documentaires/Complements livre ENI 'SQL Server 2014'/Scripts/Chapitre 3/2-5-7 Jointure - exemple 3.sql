
SELECT CDE.numero_cde,
	CONVERT(char(10), date_cde,103) as DateCde,
	SUBSTRING(nom,1,10) Nom,
	ART.reference_art, prixht_art, qte_cde
	FROM CLIENTS CLI INNER JOIN COMMANDES CDE
	  ON CLI.numero=CDE.numero_cli
	INNER JOIN LIGNES_CDE LIG
	  ON CDE.numero_cde=LIG.numero_cde
	INNER JOIN ARTICLES ART
	  ON LIG.reference_art=ART.reference_art;