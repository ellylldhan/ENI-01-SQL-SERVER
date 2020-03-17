
DECLARE @nb int;
SELECT @nb=COUNT(*) FROM CLIENTS;
PRINT 'Nombre total de clients:'
PRINT @nb;