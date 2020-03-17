
CREATE TRIGGER update_commandes ON COMMANDES
AFTER UPDATE AS
IF UPDATE(etat_cde) BEGIN
	DECLARE @etat AS char(2)
	DECLARE @numero AS int
	DECLARE cUpdated CURSOR FOR
		SELECT numero_cde, etat_cde FROM inserted;
	OPEN cUpdated;
	FETCH cUpdated INTO @numero, @etat;
	WHILE (@@FETCH_STATUS=0) BEGIN
		IF (@etat='LI')
			INSERT INTO HISTO_FAC(numero_cde, date_fac)
				VALUES (@numero, GETDATE());
		FETCH cUpdated INTO @numero, @etat;
	END;
	CLOSE cUpdated;
	DEALLOCATE cUpdated;
END;