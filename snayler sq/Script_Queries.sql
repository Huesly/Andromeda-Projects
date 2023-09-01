UPDATE tab_prod SET val_stock = 1
WHERE id_prod >= 1 AND id_prod <= 5;

UPDATE tab_prod SET val_stock = 0
WHERE id_prod BETWEEN 1 AND 5;

--SELECT * FROM tab_prod ORDER BY id_prod;