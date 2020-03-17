
USE master
go
exec sp_addmessage @msgnum=50001, @severity=12, @msgtext=N'message d''erreur',
				@lang='us_english', @replace='replace'
go
BEGIN TRY
	RAISERROR (50001,12,1);
END TRY
BEGIN CATCH
	DECLARE @msgerreur nvarchar(60);
	SET @msgerreur=ERROR_MESSAGE();
	PRINT @msgerreur+N' géré par le bloc CACTH';
END CATCH