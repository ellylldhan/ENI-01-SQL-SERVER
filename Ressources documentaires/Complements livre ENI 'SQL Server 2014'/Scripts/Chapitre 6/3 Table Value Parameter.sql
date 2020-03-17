
create type tclient as table(
numero int,
nom nvarchar(30));
go
create procedure affiche (@lesClients tclient readonly) as
  select * from @lesClients;
go
declare @lesParisiens tclient;
insert into @lesParisiens
select numero, nom
from clients
where ville='Paris';
exec affiche @lesParisiens;