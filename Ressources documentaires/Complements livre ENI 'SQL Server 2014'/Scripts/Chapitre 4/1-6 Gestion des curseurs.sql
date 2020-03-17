CREATE TABLE tempoArt(
	reference_art nchar(16),
	categorie int,
	prix numeric(8,2));
go
--Déclaration du curseur et des variables
DECLARE c_art CURSOR FOR SELECT reference_art, code_cat, prixht_art
FROM ARTICLES ORDER BY code_cat, prixht_art DESC
DECLARE @cpt int;
DECLARE @ref nchar(16);
DECLARE @cate int;
DECLARE @prix numeric(10,2);
DECLARE @catref int;
OPEN c_art;	-- ouverture du curseur
FETCH c_art INTO @ref, @cate, @prix;	-- ramener la première ligne
WHILE (@@FETCH_STATUS=0) BEGIN -- Le dernier Fetch a t il ramené une ligne?
	INSERT INTO tempoArt VALUES(@ref, @cate, @prix);
	SELECT @catref=@cate;	-- mémoriser la catégorie
	SELECT @cpt=1;
	FETCH c_art INTO @ref, @cate, @prix;	-- ligne suivante
	WHILE (@@FETCH_STATUS=0 AND @catref=@cate) BEGIN
		IF (@cpt<3) BEGIN
			INSERT INTO tempoArt VALUES(@ref, @cate, @prix);
			SELECT @cpt=@cpt+1;	
		END;
		FETCH c_art INTO @ref, @cate, @prix;	-- ligne suivante
	END;
END;
CLOSE c_art;
DEALLOCATE c_art;
go