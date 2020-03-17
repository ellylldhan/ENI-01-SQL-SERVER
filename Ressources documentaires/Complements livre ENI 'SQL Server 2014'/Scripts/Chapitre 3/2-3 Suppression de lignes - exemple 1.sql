ALTER TABLE CLIENTS
  ADD CONSTRAINT pk_clients
  PRIMARY KEY (numero);
GO
ALTER TABLE COMMANDES 
  ADD CONSTRAINT fk_commandes_clients
  FOREIGN KEY (numero_cli) REFERENCES CLIENTS(numero);
 GO
 
DELETE FROM CLIENTS;