USE master
GO
CREATE PROCEDURE qui AS
	SELECT "login initial"=ORIGINAL_LOGIN(),"login contexte"=SUSER_NAME(),
		   utilisateur=USER_NAME();
GO
GRANT EXEC ON dbo.qui TO PUBLIC;
-- debut du test
EXEC dbo.qui;
-- basculer sur le contexte invité
EXECUTE AS USER='guest';
EXEC dbo.qui;
-- revenir au contexte initial
REVERT;
EXEC dbo.qui;
-- changer d'utilisateur
SETUSER 'guest'
EXEC dbo.qui;