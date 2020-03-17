# SQL SERVER - DEFAULT Constraint
## Create a DEFAULT Constraint
<pre>
ALTER TABLE Clients
ADD CONSTRAINT <span class="italic">DF_VILLE</span>
DEFAULT 'Nantes' FOR ville;
</pre>




<style>
* {
    font-size: 14px;
    font-family: 'Ubuntu';
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
    border-radius: 10px;
    padding-left: 10px;}

h2 {
    -webkit-box-shadow: 2px 2px 3px #ccc;
    -moz-box-shadow: 2px 2px 3px #ccc;
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

h3 {
    line-height: 30px;
    margin-top: 20px;
    margin-bottom: 5px;
    border-bottom-style:dotted;
    border-bottom-width: .09em;
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