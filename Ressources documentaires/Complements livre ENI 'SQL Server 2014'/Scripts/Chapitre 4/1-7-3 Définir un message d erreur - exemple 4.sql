
DECLARE @message nvarchar(100)
BEGIN
	SELECT @message=FORMATMESSAGE(50006,'Dupond',153);
	RAISERROR(@message, 12,2)
END;