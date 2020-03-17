# SQL SERVER - UNION (Tuto)
Source : http://www.sqlservertutorial.net/sql-server-basics/sql-server-union/

Combines the results of two or more queries into a single result set.

### Syntax :
```
query1
UNION
query2
```

**Requirements**:
- The **number** and the **order** of the columns must be the **same in both queries**.
- The **data types** of the corresponding columns must be the **same or compatible**.

![8fab05266a685b4a394ecd26a786a3c0.png](../../_resources/62edeec7b0ac4172bb33f5bd37526801.png)

**Note**: C'est un JOIN sans *on_conditions* ???


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
    font-family: "Ubuntu Mono", "Consolas", "Liberation Mono", "DejaVu Sans Mono", "Bitstream Vera Sans Mono", "Courier New", monospace, serif;
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

.sql {
    text-transform: uppercase;
    color: #9966ff;
}

.dt_int {
    text-transform: lowercase;
    color: orange;
}

.dt_str {
    text-transform: lowercase;
    color: rgb(0, 204, 153);
}

</style>
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
    font-family: "Ubuntu Mono", "Consolas", "Liberation Mono", "DejaVu Sans Mono", "Bitstream Vera Sans Mono", "Courier New", monospace, serif;
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

.sql {
    text-transform: uppercase;
    color: #9966ff;
}

.dt_int {
    text-transform: lowercase;
    color: orange;
}

.dt_str {
    text-transform: lowercase;
    color: rgb(0, 204, 153);
}

</style>