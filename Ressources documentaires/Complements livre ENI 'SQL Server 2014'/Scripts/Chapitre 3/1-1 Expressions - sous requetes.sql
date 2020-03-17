declare @nombre int;
select @nombre=count(*) from CLIENTS;
select 'nombre de clients'=@nombre;