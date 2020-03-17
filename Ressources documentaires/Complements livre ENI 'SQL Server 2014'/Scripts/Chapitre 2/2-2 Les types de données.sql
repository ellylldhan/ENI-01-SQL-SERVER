-- exemple d'utilisation du type table
declare @tableau table(
	code int primary key,
	nom varchar(30)
);

insert into @tableau values(1,'Albert');
insert into @tableau values(2,'Bernard');

select * from @tableau;