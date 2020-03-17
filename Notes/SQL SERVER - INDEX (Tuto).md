# SQL SERVER - INDEX (Tuto)


Source : http://www.sqlservertutorial.net/sql-server-indexes/sql-server-filtered-indexes/

# SQL Server Filtered Indexes
## Intro <hr>
A nonclustered index can improve the performance of queries, however the benefits of nonclustered indexes come at costs: storage and maintenance.

- It takes additional storage to store the copy of data of the index key columns.
- When you insert, update, or delete rows from the table, SQL Server needs to update the associated non-clustered index.

It would be inefficient if applications just query a portion of rows of a table. This is why filtered indexes come into play. A **filtered index** is a non-clustered index with a predicate that allows you to specifdy which rows should be added to the index.

### SYNTAX
```sql
CREATE INDEX index_name
ON table_name(column_list)
WHERE predicate
```
- index_name : name you give to your index
- column_list : list of key columns that will be included in the index
- predicate : conditions to specify which rows of the table should be included in the index

### Examples
Consider this :

<table>
<th style="border:solid 1px;"> sales.customers </th> 
<tr>
    <td style="border:solid 1px;">
<b>*customer_id</b>    <br /> 
    first_name     <br /> 
    last_name      <br /> 
    phone          <br /> 
    email          <br /> 
    street         <br /> 
    city           <br /> 
    state          <br /> 
    zip_code
    </td>
</tr> 
</table>
The `sales.customers` table has the `phone` column which contains many `NULL` values.

```sql
SELECT 
    SUM(CASE
            WHEN phone IS NULL
            THEN 1
            ELSE 0
        END) AS [Has Phone], 
    SUM(CASE
            WHEN phone IS NULL
            THEN 0
            ELSE 1
        END) AS [No Phone]
FROM 
    sales.customers;
```

**Output**:
```
Has Phone   No Phone
----------- -----------
1267        178
 
(1 row affected)
```

The next statement will create a filtered index for the `phone` column of the `sales.customers`table
```sql
CREATE INDEX ix_cust_phone
ON sales.customers(phone)
WHERE phone IS NOT NULL;
```

The following query finds the customer whose phone number is '(281) 363-3309'
```sql
SELECT    
    first_name,
    last_name, 
    phone
FROM    
    sales.customers
WHERE 
    phone = '(281) 363-3309';
```

Here's the estimated execution plan:

<img src="http://www.sqlservertutorial.net/wp-content/uploads/SQL-Server-Filtered-Index-example.png" alt="img">

The query optimizer can leverage the filtered index `ix_cust_phone` for searching.
Note that to improve the key lookup, you can use an index with included columns, which includes both `first_name` and `last_name` columns in the index :
```sql
CREATE INDEX ix_cust_phone
ON sales.customers(phone)
INCLUDE (first_name, last_name)
WHERE phone IS NOT NULL;
```

## Benefits of filtered indexes <hr>
- **save space**, especially when the index key columns are sparse, meaning they have many NULL values
- **reduce the maintenance cost**, because only a portion of data rows, not all, needs to be updated when the data in the associated table changes.

-FIN-




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
    width: 50%;
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