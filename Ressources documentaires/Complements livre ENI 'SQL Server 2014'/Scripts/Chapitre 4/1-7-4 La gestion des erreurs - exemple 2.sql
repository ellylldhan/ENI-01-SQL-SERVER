
BEGIN TRY
	THROW 50100,'Mon erreur',16;
END TRY
BEGIN CATCH
	PRINT 'Déclenchement de mon erreur';
	THROW
END CATCH