--                   SELECT fun_kardex('E',4,1000,100,'Algo...');
--                   UPDATE tab_prod SET val_stock=800 WHERE id_prod =2;
--                   SELECT  * FROM tab_prod ORDER BY id_prod;
--					 SELECT * FROM tab_kardex;
CREATE OR REPLACE FUNCTION fun_conse() RETURNS INTEGER AS

$$ 
	DECLARE ULTIMO_ID INTEGER;

	BEGIN
		SELECT MAX (a.val_consec) INTO ULTIMO_ID  FROM tab_kardex a;

		IF ULTIMO_ID IS NULL THEN
			ULTIMO_ID=1;

			RAISE NOTICE 'funca %', ULTIMO_ID;

			RETURN ULTIMO_ID;
		END IF;
		ULTIMO_ID=ULTIMO_ID+1;
		RETURN ULTIMO_ID;

	END;

$$
LANGUAGE PLPGSQL;


CREATE OR REPLACE FUNCTION fun_kardex(
    wind_tipomov tab_kardex.ind_tipomov%TYPE,
    wid_prod tab_prod.id_prod%TYPE,
    wval_prod tab_kardex.val_prod%TYPE,
    wcant_prod tab_kardex.cant_prod%TYPE,
    wval_observa tab_kardex.val_observa%TYPE
) RETURNS VARCHAR AS
$$
DECLARE
    wreg_prod RECORD;
    sal_stock INTEGER;
    ent_stock INTEGER;
    consec INTEGER;
    value_total BIGINT;
    cosprom BIGINT;
    total_prom FLOAT;
BEGIN
    IF wind_tipomov <> 'E' AND wind_tipomov <> 'S' OR wind_tipomov IS NULL THEN
        RETURN 'Operación no válida';
    END IF;

    IF wid_Prod IS NULL OR wid_prod <= 0 THEN
        RETURN 'ID de producto no válido';
    END IF;

    IF wval_prod IS NULL OR wval_prod <= 0 OR wval_prod > 100000000 THEN
        RETURN 'Valor de producto no válido';
    END IF;

    IF wcant_prod IS NULL OR wcant_prod <= 0 OR wcant_prod > 1000 THEN
        RETURN 'Cantidad de producto no válida';
    END IF;

    -- ACÁ EMPIEZA LA VALIDACIÓN DEL KARDEX PARA INSERTAR
    SELECT a.val_cosprom, a.val_stock, a.val_stockmin, a.val_stockmax, a.ind_estado
    INTO wreg_prod
    FROM tab_prod a
    WHERE a.id_prod = wid_prod AND a.ind_estado = TRUE;

    value_total := wval_prod * wcant_prod;
    sal_stock := wreg_prod.val_stock - wcant_prod;
    ent_stock := wreg_prod.val_stock + wcant_prod;

    -- Validate and process for entry
    IF ent_stock >= wreg_prod.val_stockmin AND ent_stock <= wreg_prod.val_stockmax AND wind_tipomov = 'E' THEN
        SELECT fun_conse() INTO consec;
        INSERT INTO tab_kardex VALUES(consec, CURRENT_DATE, wind_tipomov, wid_prod, wval_prod, wcant_prod, value_total, wval_observa);
        UPDATE tab_prod SET val_stock = ent_stock WHERE id_prod = wid_prod;
        RAISE NOTICE 'Entrada realizada';
        RETURN 'Entrada realizada';
    END IF;

    -- Validate and process for exit
    IF sal_stock >= wreg_prod.val_stockmin AND sal_stock <= wreg_prod.val_stockmax AND wind_tipomov = 'S' THEN
        SELECT fun_conse() INTO consec;
        INSERT INTO tab_kardex VALUES(consec, CURRENT_DATE, wind_tipomov, wid_prod, wval_prod, wcant_prod, value_total, wval_observa);
        UPDATE tab_prod SET val_stock = sal_stock WHERE id_prod = wid_prod;
        RAISE NOTICE 'Salida realizada';
        RETURN 'Salida realizada';
    END IF;

    RETURN 'Operación no válida';
END;
$$
LANGUAGE PLPGSQL;
