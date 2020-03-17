
insert into categories(code_cat, libelle_cat) values (226,'livres');
go
set identity_insert categories on
insert into categories(code_cat, libelle_cat) values (226,'livres');
set identity_insert categories off
go
select * from categories where code_cat=226;