--SELECT fun_multi(3);
CREATE OR REPLACE FUNCTION fun_multi(wnum INTEGER) RETURNS VARCHAR AS
$$
    DECLARE wproducto   BIGINT;
    DECLARE wcontador   SMALLINT;
    BEGIN
        FOR wcontador IN 1..10 LOOP
            wproducto = wnum * wcontador;
            RAISE NOTICE 'El resultado de multiplicar % por % es: %',wnum,wcontador,wproduto;
        END LOOP;
        RETURN 'Esta vaina ya terminó...';
    END;
$$
LANGUAGE PLPGSQL;