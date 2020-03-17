-- Préparer le jeu d'essai
UPDATE Formations SET salle =2 WHERE id=3
-- Création de la procédure
CREATE PROC pVerificationSalles (@jour datetime) AS
BEGIN
  DECLARE cLesDoublons CURSOR FOR
    SELECT f.salle
    FROM Formations f
    WHERE datediff(dd,dateDebut,@jour)>=0 AND datediff(dd,dateFin, @jour)<=0
    GROUP BY f.salle
    HAVING COUNT(*)>1;
  DECLARE @idSalle int

  OPEN cLesDoublons
  FETCH cLesDoublons INTO @idSalle
  IF (@@FETCH_STATUS!=0)
	BEGIN
		Print 'Pas de double utilisation'
	END
  ELSE
    WHILE (@@FETCH_STATUS=0) BEGIN
	  -- Afficher les formations consernées
	  SELECT c.titre, f.dateDebut, f.dateFin
		FROM Formations f INNER JOIN Cours c ON f.cours=c.id
		WHERE datediff(dd,dateDebut,@jour)>=0 AND datediff(dd,dateFin, @jour)<=0
		  AND salle=@idSalle;
	  -- Passer à la salle suivante
	  FETCH cLesDoublons INTO @idSalle
	END;
  CLOSE cLesDoublons
  DEALLOCATE cLesDoublons
END;
-- Test de la procédure
EXEC pVerficationSalles @jour='02/06/2014'
-- Retablir le jeu d'essai
UPDATE Formations SET salle =1 WHERE id=3