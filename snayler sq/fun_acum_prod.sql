--SELECT * FROM tab_acum_prod;
--SELECT fun_acum_prod();
CREATE OR REPLACE FUNCTION fun_acum_prod() RETURNS BOOLEAN AS
$BODY$
    DECLARE wreg_acum_prod  RECORD;
    DECLARE wcur_acum_prod  REFCURSOR;
    DECLARE wval_total      BIGINT;
    BEGIN
        TRUNCATE tab_acum_prod;
        OPEN wcur_acum_prod FOR SELECT a.id_prod,SUM(a.val_stock) AS wval_total FROM tab_prodprov a
                                GROUP BY 1
                                ORDER BY 1;
            FETCH wcur_acum_prod INTO wreg_acum_prod;
            WHILE FOUND LOOP
                INSERT INTO tab_acum_prod VALUES(wreg_acum_prod.id_prod,wreg_acum_prod.wval_total);
                FETCH wcur_acum_prod INTO wreg_acum_prod;
            END LOOP;
        CLOSE wcur_acum_prod;
        RETURN TRUE;
    END;
$BODY$
LANGUAGE PLPGSQL;