# Constraint - FOREIGN KEY

### Definition
* **Convention de nommage**: `FK_tableOuOnEst_tableOuOnVa`
* Une FK fait toujours référence à une PK
* La table à laquelle il est fait référence doit être créée avant la table référante (= peut pas lié une clé à une FK qui n'existe pas encore).

### SYNTAXE
<pre>
CONSTRAINT fk_name
FOREIGN KEY (child_col1, child_col2, ... child_col_n)
REFERENCES parent_table (parent_col1, parent_col2, ... parent_col_n)
<b>ON DELETE CASCADE</b>
[ ON UPDATE { NO ACTION | CASCADE | SET NULL | SET DEFAULT } ] 
</pre>

<pre>
<b><span class='comment'>-- Forme simple (best):</span></b>
CREATE TABLE ma_table (
    id int PRIMARY KEY,
    id_fk int REFERENCES autre_table(autre_id)
);

<b><span class='comment'>-- Forme Contrainte de Table :</span></b>
CREATE TABLE TestA (
    id int PRIMARY KEY,
    name char(2)
);

CREATE TABLE TestB (
    id int PRIMARY KEY,
    FK_id int,
    <span class="bold">CONSTRAINT FK_TestB_TestA (FK_id) REFERENCES TestA (id)</span>
);

<b><span class='comment'>-- CLE COMPOSITE</span></b>
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

### ADD CONSTRAINT : Ajouter une FK, post-création
<pre>
ALTER TABLE child_table
ADD CONSTRAINT fk_name
    FOREIGN KEY (child_col1, child_col2, ... child_col_n)
    REFERENCES parent_table (parent_col1, parent_col2, ... parent_col_n)
    ON DELETE CASCADE;
</pre>

### DROP CONSTRAINT : Supprimer une FK, post-création
<pre>
ALTER TABLE child_table
DROP CONSTRAINT fk_name;
</pre>
**Note**: A verifier








<style>
@import 'https://fonts.googleapis.com/css?family=Ubuntu+Mono';

* {
    font-size: 12px;
    font-family: 'Ubuntu',serif;
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
    padding: 0 0 .3em;
    text-shadow: 2px 2px 3px #ccc;
    text-align: left;
    line-height: 1em;
    margin-top: 2em;
    margin-bottom: 0;
}

h2_new {
    font-size: 1.3em;
    font-weight: normal;
    padding: 0 0 .3em;
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
    padding: 0 0 .3em;
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

.bold {
    font-weight: bold;
    font-size: inherit;
}

</style>




