
exec sp_addmessage @msgnum=50006, @severity=12,
				   @msgtext='Error for customer: %s on invoice: %d',
				   @lang='us_english',
				   @replace='replace';
go
exec sp_addmessage @msgnum=50006, @severity=12,
				   @msgtext='Erreur sur la commande %2! du client %1!',
				   @lang='french',
				   @replace='replace';
go
RAISERROR(50006,12,1,'Dupond',153);