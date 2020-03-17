
DECLARE cLesClients CURSOR FOR SELECT numero, nom, prenom FROM CLIENTS;
DECLARE @numero int;
DECLARE @nom varchar(80);
DECLARE @prenom varchar(80);
DECLARE @nombre int;
BEGIN
	OPEN cLesClients;
	FETCH cLesCLients INTO @numero, @nom, @prenom;
	WHILE (@@FETCH_STATUS=0)
	BEGIN
		SELECT @nombre=COUNT(*) FROM COMMANDES
			WHERE numero_cli=@numero;
		PRINT @nom +' '+@prenom+' --> '+convert(char(2),@nombre)+' Commandes';
		FETCH cLesCLients INTO @numero, @nom, @prenom;
	END;
	CLOSE cLesCLients;
	DEALLOCATE cLesClients;
END;