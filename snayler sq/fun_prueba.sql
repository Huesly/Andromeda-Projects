CREATE OR REPLACE FUNCTION fun_prueba() RETURNS VARCHAR AS
$$
    DECLARE wid_prueba  tab_prueba.id_prueba%TYPE;
    DECLARE wnom_prueba tab_prueba.nom_prueba%TYPE;
    DECLARE wind        INTEGER;
    BEGIN
        FOR wind IN 1..5000000 LOOP
            wid_prueba  = wind;
            wnom_prueba = 'Nombre Prueba' || wind;
            INSERT INTO tab_prueba VALUES(wid_prueba,wnom_prueba);
            IF FOUND THEN
                RAISE NOTICE 'Esta vaina está sirviendo....';
            END IF;
        END LOOP;
        RETURN 'Acabamos... Qué más quiere';
    END;
$$
LANGUAGE PLPGSQL;