
ALTER FUNCTION ftest(@ref nchar(16))
  RETURNS int
  WITH SCHEMABINDING
AS
BEGIN
	DECLARE @qte_stock int;
	SELECT @qte_stock=SUM(qte_stk) FROM dbo.STOCKS
	WHERE reference_art=@ref;
	RETURN @qte_stock;
END;
go
-- test de la fonction
SELECT Quantité=dbo.ftest('CLA11');