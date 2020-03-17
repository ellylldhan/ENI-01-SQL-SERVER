
CREATE TABLE #TBN(leSchema sysname, leNom sysname);
go
INSERT INTO #TBN execute dbo.noms_tables;