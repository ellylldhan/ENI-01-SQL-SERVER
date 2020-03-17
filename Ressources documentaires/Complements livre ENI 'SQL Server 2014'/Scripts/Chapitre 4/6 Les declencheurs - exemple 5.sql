
exec sp_settriggerorder 'ins_cde_taux', 'FIRST','INSERT'
exec sp_settriggerorder 'ins_cde_date','LAST','INSERT'