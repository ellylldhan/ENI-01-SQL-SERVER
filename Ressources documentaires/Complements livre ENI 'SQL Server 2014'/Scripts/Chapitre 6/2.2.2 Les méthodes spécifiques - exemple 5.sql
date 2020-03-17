
declare @liste xml;
set @liste='<page><article>Aquabeat 2</article><article>YP-F3QB</article></page>';
declare @nouvelArticle xml;
set @nouvelArticle='<article>i10</article>'
set @liste.modify('insert sql:variable("@nouvelArticle") as last into (/page)[1]');
select @liste;