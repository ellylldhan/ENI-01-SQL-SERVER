
USE master
CREATE LOGIN marie WITH PASSWORD='P@ssw0rd';
CREATE LOGIN paul WITH PASSWORD='P@ssw0rd';
ALTER LOGIN marie WITH DEFAULT_DATABASE=gescom
ALTER LOGIN paul WITH DEFAULT_DATABASE=gescom
USE gescom
go
CREATE USER marie FOR LOGIN marie;
CREATE USER paul FOR LOGIN paul;
GRANT CONNECT TO marie;
GRANT CONNECT TO paul;
GRANT CREATE PROCEDURE TO marie
EXEC sp_addrolemember 'db_datareader', 'marie'
GRANT SELECT ON SCHEMA::dbo TO marie;
GRANT ALTER ON SCHEMA::dbo TO marie;
GRANT EXECUTE ON SCHEMA::dbo TO marie
go
GRANT IMPERSONATE ON USER::Marie TO Paul