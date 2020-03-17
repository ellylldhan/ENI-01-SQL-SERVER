
declare @doc nvarchar(500);
set @doc='<bibliotheque>
            <auteur nom="Verne" prenom="Jules">
              <livre>Voyage au centre de la terre</livre>
              <livre>De la terre à la lune</livre>
            </auteur>
            <auteur nom="Hofstadter" prenom="Douglas">
              <livre>Gödel, Escher, Bach</livre>
            </auteur>
          </bibliotheque>';

declare @identifiant int;
exec sp_xml_preparedocument @identifiant out, @doc
select *
  from openxml(@identifiant,'bibliotheque/*')
       with (nom varchar(30), prenom varchar(30));
exec sp_xml_removedocument @identifiant;