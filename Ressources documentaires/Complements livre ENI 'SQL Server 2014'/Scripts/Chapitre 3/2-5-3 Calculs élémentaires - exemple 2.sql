
SELECT RTRIM(nom)+' '+RTRIM(prenom) AS Patronyme,
	SUBSTRING(codepostal,1,2) AS DEPARTEMENT
	FROM CLIENTS;