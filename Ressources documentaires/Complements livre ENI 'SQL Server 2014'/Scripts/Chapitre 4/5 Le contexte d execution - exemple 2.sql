
-- en tant que marie
USE GESCOM
GO
CREATE PROCEDURE voir AS
  SELECT * FROM clients;
GRANT IMPERSONATE ON USER::Marie TO Paul