
DECLARE @chef hierarchyid;
SELECT @chef=hierarchyid::GetRoot() FROM employes

SELECT *
  FROM employes
  WHERE position.GetAncestor(1)=@chef;