SELECT a.cant_prod FROM tab_kardex a
WHERE a.id_prod = 1;
SELECT SUM(a.cant_prod) FROM tab_kardex a
WHERE a.id_prod = 1 AND a.ind_tipomov = 'S';
--SELECT * FROM tab_prod;
SELECT * FROM tab_kardex;
--SELECT prueba();
CREATE OR REPLACE FUNCTION prueba() RETURNS BOOLEAN AS
$$
	DECLARE reg_prod RECORD;
	DECLARE cur_prod REFCURSOR;
	DECLARE reg_kardex RECORD; 
	DECLARE cur_kardex REFCURSOR; 
	DECLARE resu_prueba INTEGER;
	BEGIN
		OPEN cur_prod FOR SELECT a.id_prod FROM tab_prod a;
			FETCH cur_prod INTO reg_prod;
			WHILE FOUND LOOP
              	resu_prueba=0;
				OPEN cur_kardex FOR SELECT a.id_prod,a.ind_tipomov,a.cant_prod FROM tab_kardex a
					WHERE reg_prod.id_prod=a.id_prod;
					FETCH cur_kardex INTO reg_kardex;
					WHILE FOUND LOOP
						IF reg_kardex.ind_tipomov='E' THEN
							resu_prueba=resu_prueba+reg_kardex.cant_prod;
						ELSE
							resu_prueba=resu_prueba-reg_kardex.cant_prod;
						END IF;
						FETCH cur_kardex INTO reg_kardex;
					END LOOP;
				CLOSE cur_kardex;
				UPDATE tab_prod SET val_stock=resu_prueba WHERE id_prod=reg_prod.id_prod;
				FETCH cur_prod INTO reg_prod;
			END LOOP;
		CLOSE cur_prod;
	RETURN TRUE;
	END
$$
LANGUAGE PLPGSQL;
