
EXEC sp_addmessage @msgnum=50005, @severity=12,
				   @msgtext='Minimun stock is over maximum stock',
				   @lang='us_english',
				   @replace='replace';
go
EXEC sp_addmessage @msgnum=50005, @severity=12,
				   @msgtext='Stock minimun supérieur au stock maximum',
				   @lang='french',
				   @replace='replace';
go
RAISERROR(50005,12,1);