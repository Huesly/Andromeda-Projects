--SELECT fun_listar_prod();
--SELECT COUNT(*) FROM tab_prod;
--SELECT a.id_prod,a.nom_prod FROM tab_prod a
--LIMIT 5;
CREATE OR REPLACE FUNCTION fun_listar_prod() RETURNS VARCHAR AS
$$
    DECLARE wreg_prod   RECORD;
    DECLARE wcur_prod   REFCURSOR;
    DECLARE wcont       INTEGER;
    BEGIN
        OPEN wcur_prod FOR SELECT a.id_prod,a.nom_prod,a.val_cosprom FROM tab_prod a;     
            FETCH wcur_prod INTO wreg_prod;
            WHILE FOUND LOOP
                RAISE NOTICE 'Producto: % Nombre: % Costo: %',wreg_prod.id_prod,wreg_prod.nom_prod,wreg_prod.val_cosprom;
                FETCH wcur_prod INTO wreg_prod;
            END LOOP;
        CLOSE wcur_prod;
        RETURN 'Esta vaina funcionó';        
    END;
$$
LANGUAGE PLPGSQL;