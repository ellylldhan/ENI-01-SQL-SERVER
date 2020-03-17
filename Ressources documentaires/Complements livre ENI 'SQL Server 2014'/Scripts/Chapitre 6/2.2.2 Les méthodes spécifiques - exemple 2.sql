
SELECT numero, 
	page.value('(page/article/reference)[1]','nvarchar(20)'),
	page.value('(page/article/prixttc)[1]','smallmoney')
  FROM CATALOGUES; 