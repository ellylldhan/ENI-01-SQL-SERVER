# Constraint - PRIMARY KEY


### Definition
* PRIMARY KEY fait partie des **contraintes** possibles.
* Par défaut, toutes les PK sont **implicitement NOT NULL**. 
  C'est le cas pour toutes les LGBD (=tous les SQL)
* Par défaut, toutes les PK ont un nom dans le système (PK_FOOTABLE_0123456).
  En ajoutant la contrainte PK en fin de table ('constrainte de table'), on peut 
  lui attribuer un nom custom, par convention <span class="inline_code">PK_NomDeLaTableConcernee</span>.


### Syntaxe
<pre>
<b><span class='comment'>-- Syntaxe simple :</span></b>
[ CONSTRAINT nomContrainte ] PRIMARY KEY [ (nomCol[, ...]) ]

<b><span class='comment'>-- Syntaxe complete :</span></b>
[ CONSTRAINT nomContrainte ] PRIMARY KEY (nomCol[, ...])
[WITH FILLFACTOR=x] [ON groupe_de_fichiers]
</pre>

<pre>
<b><span class='comment'>-- Forme Simple :</span></b>
CREATE TABLE riri (
    id int <b>PRIMARY KEY</b>,
    age int NOT NULL
);

<b><span class='comment'>-- Forme avec mot-clé CONSTRAINT</span></b>
CREATE TABLE fifi (
    id int <b>CONSTRAINT <i>PK_FIFI</i> PRIMARY KEY</b>
    age int NOT NULL
);

<b><span class='comment'>-- Forme Contrainte de Table</span></b>
CREATE TABLE loulou (
    id int NOT NULL,
    age int NOT NULL,
    <b>CONSTRAINT PK_LOULOU PRIMARY KEY(loulou)</b>
);

<b><span class='comment'>-- CLE COMPOSEE</span></b>
CREATE TABLE Conges (
    <b>CodeEmp</b> int REFERENCES Employes(CodeEmp),
    <b>Annee</b> numeric(4,0),
    NbJoursAcquis numeric(2,0),
    <b>CONSTRAINT PK_Conges PRIMARY KEY(CodeEmp, Annee)</b>
);

<b><span class='comment'>-- IDENTITY : Auto Incrementation (SQL Server)</span></b>
CREATE TABLE Livres (
    id int PRIMARY KEY <b>IDENTITY</b>,
    isbn int NOT NULL
);
</pre>


<blockquote class="note">

- Quand la contrainte porte sur une seule colonne, c'est une **CONTRAINTE DE COLONNE**.
- Quand la contrainte porte sur plusieurs colonnes, c'est une **CONSTRAINTE DE TABLE**, qui devra être placée à la fin du statement CREATE TABLE.
- **Convention de nommage de PK**, le cas échéant, `PK_NOMTABLECONCERNEE`

</blockquote>

**Note**: Le système donne automatiquement un nom à la PK créée, sous forme PK_MATABLE_[RandomNumbers]. En la déclarant avec `CONSTRAINT`, on peut lui donner un nom perso. Convention de nommage de PK: `PK_TABLECONCERNEE`


### ADD CONSTRAINT : Ajouter une PRIMARY KEY à une TABLE (SQL Server)

<pre>
ALTER TABLE Clients 
	ADD CONSTRAINT PK_CLIENTS 
	PRIMARY KEY (id);
</pre>
<pre>
<span class="comment">-- Autre exemple</span>
ALTER TABLE Persons
    ADD CONSTRAINT PK_PERSONS 
    PRIMARY KEY (ID,LastName);
</pre>


### DROP CONSTRAINT : Supprimer une contrainte de clé primaire

<pre>
<span class="comment">-- SQL Server / Oracle / MS Access</span>
ALTER TABLE Clients
    DROP CONSTRAINT PK_CLIENTS

<span class="comment">-- MySQL only</span>
ALTER TABLE Clients
	DROP PRIMARY KEY;
</pre>


### IDENTITY : Auto Incrementation (SQL Server)
<pre>
CREATE TABLE Employes (
	CodeEmp int PRIMARY KEY <span class="bold">IDENTITY</span>,
	Nom varchar(20) NOT NULL,
	Prenom varchar(50) NOT NULL,
	DateNaissance datetime NULL,
	DateEmbauche datetime NOT NULL DEFAULT GETDATE(),
	Salaire decimal(8,2),
	CodeService char(5) REFERENCES Services(CodeService),
	CodeChef int CONSTRAINT FK_Employes_Employes REFERENCES Employes(CodeEmp)
);
</pre>

**Note**: Permet d'ignorer la colonne PK lors de l'INSERT, la colonne étant auto-incrémentée grâce au mot-clé `IDENTITY`.



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
    width: 70%;
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

h2_new {
    font-size: 1.3em;
    font-weight: normal;
    padding: 0;
    padding-bottom: .3em;
    text-shadow: 2px 2px 3px #ccc;
    text-align: left;
    line-height: 30px;
    margin-top: 30px;
    margin-bottom: 15px;
    border-bottom-style: ridge;
    border-bottom-color: black;
    border-bottom-width: .1em;
    box-shadow: 2px 2px 3px #ccc;
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



