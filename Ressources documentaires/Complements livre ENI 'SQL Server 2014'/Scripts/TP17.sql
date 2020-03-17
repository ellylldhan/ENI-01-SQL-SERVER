CREATE TRIGGER trFormations ON Formations
  FOR INSERT , UPDATE AS
  BEGIN
	DECLARE @salle int;
	DECLARE @cours int;
	DECLARE @id int;
	DECLARE cUpdated CURSOR FOR
	  SELECT id,cours, salle FROM inserted;
	OPEN cUpdated;
	FETCH cUpdated INTO @id, @cours, @salle;
	WHILE (@@FETCH_STATUS=0) BEGIN
	    DECLARE @resultat int;
		SELECT @resultat=COUNT(*) FROM Salles
		WHERE id=@salle
		  AND machine IN (
			SELECT machine
				FROM CoursMachines
				WHERE cours=@cours);
		IF (@resultat=0) BEGIN
			RAISERROR('Machines non compatibles',18,12);
			ROLLBACK TRAN;
		END;
		FETCH cUpdated INTO @id, @cours, @salle;
	END;
	CLOSE cUpdated;
	DEALLOCATE cUpdated;
  END;