
create procedure noms_tables as
  select TABLE_SCHEMA, TABLE_NAME  from INFORMATION_SCHEMA.TABLES;
GO
EXECUTE dbo.noms_tables