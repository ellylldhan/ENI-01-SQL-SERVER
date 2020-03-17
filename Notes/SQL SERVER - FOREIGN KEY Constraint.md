# SQL SERVER - FOREIGN KEY Constraint
## Creation FOREIGN KEY <hr>
### Règles
- Naming: `FK_tableOuOnEst_tableOuOnVa`
- Une FK fait toujours référence à une PK

### Simple (best)
<pre>
CREATE TABLE Employes (
    CodeEmp int PRIMARY KEY IDENTITY,
    Nom varchar(20) NOT NULL,
    Prenom varchar(50) NOT NULL,
    CodeService char(5) <span class="bold">REFERENCES Services(CodeService)</span>
);
</pre>

### Fin de table
<pre>
CREATE TABLE TestB (
    id int PRIMARY KEY,
    FK_id int,
    <span class="bold">CONSTRAINT FK_TESTB_TESTA (FK_id) REFERENCES TestA (id)</span>
);
</pre>

### Cle Composite
<pre>
CREATE TABLE CongesMens (
    CodeEmp int ,
    Annee numeric(4,0),
    Mois numeric(2,0),
    NbJoursPris numeric(2,0),
    CONSTRAINT PK_CongesMens PRIMARY KEY(CodeEmp, Annee, Mois),
    <span class="bold">CONSTRAINT FK_CongesMens_Conges 
               FOREIGN KEY(CodeEmp, Annee) 
               REFERENCES Conges(CodeEmp,Annee)</span>
);
</pre>

## Syntaxe <hr>
### Avec CREATE TABLE
<pre>
CONSTRAINT fk_name
FOREIGN KEY (child_col1, child_col2, ... child_col_n)
REFERENCES parent_table (parent_col1, parent_col2, ... parent_col_n)
ON DELETE CASCADE
[ ON UPDATE { NO ACTION | CASCADE | SET NULL | SET DEFAULT } ] 
</pre>

### Avec ALTER TABLE
<pre>
ALTER TABLE child_table
ADD CONSTRAINT fk_name
    FOREIGN KEY (child_col1, child_col2, ... child_col_n)
    REFERENCES parent_table (parent_col1, parent_col2, ... parent_col_n)
    ON DELETE CASCADE;
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
    margin-bottom: 0;
    border-bottom-style: ridge;
    border-bottom-color: black;
    border-bottom-width: .1em;
    box-shadow: 2px 2px 3px #ccc;
}

h3 {
    line-height: 1.5em;
    margin-top: 1em;
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
</style>