
declare @doc xml;
set @doc='<bibliotheque>
            <auteur nom="Verne" prenom="Jules">
              <livre>Voyage au centre de la terre</livre>
              <livre>De la terre à la lune</livre>
            </auteur>
            <auteur nom="Hofstadter" prenom="Douglas">
              <livre>Gödel, Escher, Bach</livre>
            </auteur>
          </bibliotheque>';
-----------> Requete 1
select @doc.query('bibliotheque/auteur[1]/*');
-----------> Requete 2
select @doc.query('bibliotheque/auteur[2]/*');