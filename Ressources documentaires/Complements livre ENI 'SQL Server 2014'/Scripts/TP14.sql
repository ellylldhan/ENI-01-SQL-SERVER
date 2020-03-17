CREATE PROC pDispoSalles (@jour datetime) AS
BEGIN
  DECLARE cLesDispos CURSOR FOR
    SELECT DISTINCT id
	FROM Salles
	WHERE id NOT IN(
		SELECT f.salle
		FROM Formations f
		WHERE datediff(dd,dateDebut,@jour)>=0 AND datediff(dd,dateFin, @jour)<=0);
    
  DECLARE @idSalle int

  OPEN cLesDispos
  FETCH cLesDispos INTO @idSalle
  IF (@@FETCH_STATUS!=0)
	BEGIN
		Print 'Pas de salle disponible'
	END
  ELSE
    WHILE (@@FETCH_STATUS=0) BEGIN
	  SELECT id, libelle, nombrePlaces
		FROM Salles
		WHERE id=@idSalle;
	  FETCH cLesDispos INTO @idSalle
	END;
  CLOSE cLesDispos
  DEALLOCATE cLesDispos
END;
GO
-- Test de la procédure
EXEC pDispoSalles @jour='21/07/2014'