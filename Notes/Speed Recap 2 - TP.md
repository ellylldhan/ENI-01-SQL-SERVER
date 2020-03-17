# Speed Recap 2 - TP


## En Vrac 2 - TP
### ADD CONSTRAINT : DEFAULT
<pre>
ALTER TABLE Clients 
    ADD CONSTRAINT DF_VILLE 
    DEFAULT 'Nantes' FOR ville;
</pre>

### CHECK, ON DELETE CASCADE
<pre>
CREATE TABLE Fiches
(
    noFic numeric(6) PRIMARY KEY,
    noCli numeric(6) REFERENCES Clients(noCli) <b>ON DELETE CASCADE</b>,
    dateCrea datetime DEFAULT GETDATE(),
    datePaye datetime,
    etat char(2) DEFAULT 'EC',
    <b>CONSTRAINT CK_DATEPAYE 
                CHECK (datePaye > dateCrea)</b>,
    CONSTRAINT CK_DATEPAYE_ETAT 
        CHECK (
            (datePaye IS NOT NULL AND etat = 'SO') 
            OR
            (datePaye IS NULL)
        )
);
</pre>
**Note**: Ce que fait un CHECK, c'est de contrôler la véracité du ou des tests qu'on lui donne en paramètre.<br>
Si le test est FALSE alors un message d'erreur est retourné -- avec un numéro d'erreur qui peut eventuellement être traité par une appli.

### ADD CONSTRAINT: CHECK
<pre>
ALTER TABLE CLIENTS 
    ADD CONSTRAINT CK_CPO 
    CHECK (cpo BETWEEN 1000 AND 95999);
</pre>

### CONSTRAINT: UNIQUE - garantit une clé unique (pas de doublons)
<pre>
CREATE TABLE Gammes
(
	codeGam char(5) PRIMARY KEY,
	libelle varchar(30) NOT NULL <b>UNIQUE</b>
);
</pre>
**Note**: Possède les mêmes caracteriques que PK à 2 exceptions :
- on peut avoir plusieurs clés UNIQUE dans la même table
- les colonnes utilisées peuvent être NULL (non recommandé!)

### ADD CONSTRAINT: UNIQUE - Ajout d'une contrainte d'unicite
<pre>
ALTER TABLE Tarifs 
    ADD CONSTRAINT UQ_LIBELLE 
    UNIQUE(libelle);
</pre>
**Note**: UQ_LIBELLE est le nom qu'on lui a donné à sa création, en utilisant une contrainte étendue (CONSTRAINT nom UNIQUE etc.)

### DROP CONSTRAINT : UNIQUE - Suppression d'une contrainte
<pre>
ALTER TABLE Tarifs 
    DROP CONSTRAINT [UQ_LIBELLE];
</pre>


### ALTER TABLE : ajouter une colonne
<pre>
ALTER TABLE Tarifs ADD prixJour numeric(5,2) NOT NULL
</pre>


### ON DELETE CASCADE sur une FK
<pre>
CREATE TABLE LignesFic (
    noFic numeric(6) PRIMARY KEY,
    ...
    CONSTRAINT FK_LignesFic_Fiches 
    	FOREIGN KEY(noFic)
    	REFERENCES Fiches(noFic) <b>ON DELETE CASCADE</b>
);
</pre>

### Methode d'analyse
1. les infos qu'il nous faut sont dans quelles tables ?
2. en choisir une et faire les jointure (rassembler toutes les infos)
3. des restrictions ?
4. regrouper par ? (group by)
5. des restrictions sur les aggregations ? (donc un HAVING) 









<link href="https://fonts.googleapis.com/css?family=Ubuntu+Mono&display=swap" rel="stylesheet">

<style>
* {
    font-size: 12px;
    font-family: 'Ubuntu';
    line-height: 1.3em;
}

th {
    font-weight: normal;
    background: none
}

blockquote.note {
    border-left: thick solid green;
    color: black;
}

blockquote.important {
    border-left: thick solid orange;
    color: black;
}

blockquote.warning {
    border-left: thick solid red;
    color: black;
}

pre { 
    font-family: "Ubuntu Mono", "Lucida Console", "Liberation Mono", "DejaVu Sans Mono", "Bitstream Vera Sans Mono", "Courier New", monospace, serif;
    border: solid 1px; 
    border-radius: .7em;
    padding: 5px 10px 10px;
    width: 66%;
    margin-top: 0;
    font-size: 1.1em;
}

h2 {
    font-size: 1.2em;
    font-weight: normal;
    padding: 0;
    padding-bottom: .3em;
    text-shadow: 2px 2px 3px #ccc;
    text-align: left;
    line-height: 1em;
    margin-top: 2em;
    margin-bottom: 0;
}

hr {
    -webkit-box-shadow: 2px 2px 3px #ccc;
    -moz-box-shadow: 2px 2px 3px #ccc;
    padding: 0;
    padding-bottom: .3em;
    text-shadow: 2px 2px 3px #ccc;
    text-align: left;
    margin-top: .1em;
    margin-bottom: .1em;
    border-bottom-style: ridge;
    border-bottom-color: black;
    border-bottom-width: .1em;
    box-shadow: 2px 2px 3px #ccc;
}

h3 {
    line-height: 2em;
    margin-top: 1.2em;
    margin-bottom: 1.2em;
    border-bottom-style:dashed;
    border-bottom-width: .09em;
    font-size: 1.1em;
    color: #acac1a;
}

h1 {
    margin-bottom: 1px;
}

.comment {
    font-style: italic;
    color: green;
    font-size: 1.1em;
    font-family: "Ubuntu Mono", "Lucida Console", "Liberation Mono", "DejaVu Sans Mono", "Bitstream Vera Sans Mono", "Courier New", monospace, sans-serif;
}

.italic {
    font-style: italic;
    font-size: inherit;
}

.bold {
    font-weight: bold;
    font-size: inherit;
}

</style>
