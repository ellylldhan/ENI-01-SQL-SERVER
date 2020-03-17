
CREATE PROCEDURE NbCommande @nocli int AS
BEGIN 
	SELECT nom, prenom, count(*)
	  FROM COMMANDES cde INNER JOIN CLIENTS cli
	  ON cde.numero_cli=cli.numero
	  WHERE cli.numero=@nocli
	  GROUP BY nom, prenom;
END;
go
exec NbCommande @nocli=2 
	WITH RESULT SETS(
		(nomCli nvarchar(30),
		prenomCli nvarchar(30),
		nbCommandes int)
	);