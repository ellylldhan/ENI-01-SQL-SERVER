declare @doc xml;
set @doc='<bibliotheque>
            <auteur nom="Verne" prenom="Jules">
              <livre>Voyage au centre de la terre</livre>
              <livre>De la terre à la lune</livre>
            </auteur>
            <auteur nom="Hofstadter" prenom="Douglas">
              <livre>Gödel, Escher, Bach</livre>
            </auteur>
            <auteur nom="Renard" prenom="Jules">
              <livre classique="Oui">Poil de carotte</livre>
            </auteur>
          </bibliotheque>';
select @doc.query('
  <analyse>{
	for $element in /bibliotheque/auteur
		let $nombre:=count($element/livre)
		return
			<auteur>
				{$element/@nom}
				<nombreLivres>{$nombre}</nombreLivres>
			</auteur>
  }</analyse>');
