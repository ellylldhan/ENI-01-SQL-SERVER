SELECT s.libelle, count(*) as "NbreUtilisation"
  FROM Formations f
  INNER JOIN Salles s ON f.salle=s.id
  WHERE datediff(dd,dateDebut,getdate())>=0 AND datediff(dd,dateFin, GETDATE())<=0
  GROUP BY s.libelle
  HAVING COUNT(*)>1;

go
drop proc p1;
go
create proc p1 (@jour datetime) as
BEGIN
  -- Liste des salles utilisés 2 fois
  DECLARE cLesDoublons CURSOR FOR
  SELECT s.libelle
  FROM Formations f
  INNER JOIN Salles s ON f.salle=s.id
  WHERE datediff(dd,dateDebut,@jour)>=0 AND datediff(dd,dateFin, @jour)<=0
  GROUP BY s.libelle
  HAVING COUNT(*)>1;
  DECLARE @libelleSalle nvarchar(40)
  DECLARE @nbUtilisations int
  OPEN cLesDoublons
  FETCH cLesDoublons INTO @libelleSalle
  IF (@@FETCH_STATUS!=0)
	BEGIN
		Print 'Pas de double Utilisation'
	END
  ELSE
    WHILE (@@FETCH_STATUS=0) BEGIN
	  -- Afficher la salle 
	    Print 'Salle:'+@libelleSalle
	  -- Passer à la salle suivante
	  FETCH NEXT cLesDoublons INTO @libelleSalle
	END;
  CLOSE cLesDoublons
  DEALLOCATE cLesDoublons
END;
go
exec p1 @jour='01/02/2014'
exec sp_help salles