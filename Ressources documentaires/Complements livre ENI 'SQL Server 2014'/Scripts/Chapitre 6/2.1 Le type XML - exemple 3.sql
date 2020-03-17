
CREATE TABLE VENDEURS(
  id int constraint pk_vendeurs primary key,
  nom nvarchar(50),
  prenom nvarchar(50),
  telephone nvarchar(14),
  email nvarchar(80),
  prospect xml (schemaClient)
);