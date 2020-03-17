# SQL SERVER - PRIMARY KEY Constraint

## Définition CLE PRIMAIRE <hr>
- **PRIMARY KEY** is a type of **CONSTRAINT**.
- Par défaut, toutes les PK sont implicitement NOT NULL. Vrai pour toutes les LGBD (=tous les SQL)
- Par défaut, toutes les PK ont un nom dans le système (PK_FOOTABLE_0123456). En ajoutant la contrainte PK en fin de table ('constrainte de table'), on peut lui attribuer un nom custom, par convention PK_NomDeLaTableConcernee.  

### Forme la plus simple (best)
<pre>
CREATE TABLE Services (
	CodeService char(5) <b>PRIMARY KEY</b>,
	Libelle varchar(30) NOT NULL
);
</pre>

<blockquote class="note">

**Note**: quand la contrainte porte sur une colonne, comme ici, c'est une **CONTRAINTE DE COLONNE**. (opp. CONSTRAINTE DE TABLE, en fin de table, quand la contrainte porte sur plusieurs colonnes)

</blockquote>

### Full letters + nom explicite de PK
<pre>
DROP TABLE Services;
CREATE TABLE Services (
    CodeService char(5) <b>CONSTRAINT <i>PK_SERVICES</i> PRIMARY KEY</b>,
    Libelle varchar(30) NOT NULL
);
</pre>

`PK_SERVICES` devient le nom de la PK. Fabriquée avec le nom de la table en question.


### En fin de table 
<pre>
DROP TABLE Services;
CREATE TABLE Services (
    CodeService char(5),
    Libelle varchar(30) NOT NULL,
    <b>CONSTRAINT <i>PK_SERVICES</i> PRIMARY KEY(CodeServices)</b>
);
</pre>


## Création CLE COMPOSEE <hr>
<pre>
CREATE TABLE Conges (
    <b>CodeEmp</b> int REFERENCES Employes(CodeEmp),
    <b>Annee</b> numeric(4,0),
    NbJoursAcquis numeric(2,0),
    <b>CONSTRAINT PK_Conges PRIMARY KEY(CodeEmp, Annee)</b>  <span class="comment">-- clé composée</span> 
)
</pre>

<blockquote class="important">

**Note**:
- CONTRAINTE DE COLONNE : utilisée si la contrainte porte sur une seule colonne.
- CONTRAINTE DE TABLE : quand la contrainte porte sur plusieurs colonnes (comme ici avec clé composée)

</blockquote>

## Ajouter une PRIMARY KEY à une TABLE (SQL Server)<hr>
<pre>
ALTER TABLE Clients 
ADD CONSTRAINT PK_CLIENTS PRIMARY KEY (id);
</pre>

<pre>
<span class="comment">-- Autre exemple</span>
ALTER TABLE Persons
ADD CONSTRAINT PK_PERSONS PRIMARY KEY (ID,LastName);
</pre>


## Supprimer une contrainte de clé primaire<hr>
<pre>
<span class="comment">-- SQL Server / Oracle / MS Access</span>
ALTER TABLE Clients
DROP CONSTRAINT PK_CLIENTS
</pre>

<pre>
<span class="comment">-- MySQL only</span>
ALTER TABLE Clients
DROP PRIMARY KEY;
</pre>


## Auto Incrementation : IDENTITY (SQL Server)<hr>
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





<link href="https://fonts.googleapis.com/css?family=Ubuntu+Mono&display=swap" rel="stylesheet">

<style>
* {
    font-size: 10px;
    font-family: 'Ubuntu';
    line-height: 1.5em;
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
    font-family: 'Ubuntu Mono', monospace serif;
    border: solid 1px; 
    border-radius: .7em;
    padding-left: .7em;}

h2 {
    font-size: 1.2em;
    font-weight: normal;
    padding: 0;
    padding-bottom: .3em;
    text-shadow: 2px 2px 3px #ccc;
    text-align: left;
    line-height: 2.1em;
    margin-top: 1.1em;
    margin-bottom: 1em;
}

hr {
    -webkit-box-shadow: 2px 2px 3px #ccc;
    -moz-box-shadow: 2px 2px 3px #ccc;
    padding: 0;
    padding-bottom: .3em;
    text-shadow: 2px 2px 3px #ccc;
    text-align: left;
    margin-top: .1em;
    margin-bottom: 1em;
    border-bottom-style: ridge;
    border-bottom-color: black;
    border-bottom-width: .1em;
    box-shadow: 2px 2px 3px #ccc;
}

h3 {
    line-height: 2em;
    margin-top: 1.2em;
    margin-bottom: 5px;
    border-bottom-style:dashed;
    border-bottom-width: .09em;
}

h1 {
    margin-bottom: 1px;
}

.comment {
    font-style: italic;
    color: green;
    font-family: inherit;
}

.italic {
    font-style: italic;
    font-size: inherit;
}

.bold {
    font-weight: bold;
    font-size: inherit;
}

.noborder {
    border: none;
}

.incognito {
    font-family: inherit;
}

</style>