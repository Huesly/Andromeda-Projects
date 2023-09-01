--             SELECT fun_kardex('E',1,10000,400,'Algo...');
--             SELECT * FROM tab_prod;
--             UPDATE tab_prod SET val_stock=0 WHERE id_prod='wid_prod';


CREATE OR REPLACE FUNCTION fun_kardex(wind_tipomov tab_kardex.ind_tipomov%TYPE,wid_prod tab_prod.id_prod%TYPE,
                                      wval_prod tab_kardex.val_prod%TYPE,wcant_prod tab_kardex.cant_prod%TYPE,
                                      wval_observa tab_kardex.val_observa%TYPE) RETURNS VARCHAR AS
$$
	
    DECLARE wreg_prod   RECORD;
	DECLARE suma INT;
	DECLARE resta INT;
   BEGIN
        IF wind_tipomov <> 'E'  AND
           wind_tipomov <> 'S'  OR
           wind_tipomov IS NULL THEN
           RAISE NOTICE 'Escriba algo en el tipo que sirva pingo... Vuelva a hacerlo';
           RETURN 'Me salí de esta vaina en el tipo de novedad';
        END IF;
        IF wid_Prod IS NULL OR
           wid_prod <= 0 THEN
           RAISE NOTICE 'Escriba algo en el id_producto que sirva pingo... Vuelva a hacerlo';
           RETURN 'Me salí de esta vaina en el id del producto';
        END IF;
        IF wval_prod IS NULL     OR
           wval_prod <= 0        OR
           wval_prod > 100000000 THEN
           RAISE NOTICE 'Escriba algo en el valor del producto que sirva pingo... Vuelva a hacerlo';
           RETURN 'Me salí de esta vaina en el valor del producto';
        END IF;
        IF wcant_prod IS NULL OR
           wcant_prod <= 0    OR
           wcant_prod > 1000  THEN
           RAISE NOTICE 'Escriba algo en cantidad de producto que sirva pingo... Vuelva a hacerlo';
           RETURN 'Me salí de esta vaina en cantidad de producto';
        END IF;
           --RAISE NOTICE 'Acá sigue el desarrollo porque vamos bien, como dijo el borracho';
           --RETURN 'Vamos bien...';

-- ACÁ EMPIEZA LA VALIDACIÓN DEL KARDEX PARA INSERTAR
        SELECT a.val_cosprom,a.val_stock,a.val_stockmin,a.val_stockmax,a.ind_estado INTO wreg_prod FROM tab_prod a
        WHERE a.id_prod = wid_prod AND
              a.ind_estado = TRUE;
         
            
			CASE wind_tipomov
               WHEN 'E' THEN
			   
			IF wcant_prod >= wreg_prod.val_stock    AND
			   wcant_prod <= wreg_prod.val_stockmax THEN
			   suma = wcant_prod + wreg_prod.val_stock;
			   IF suma <= wreg_prod.val_stockmax THEN
			   UPDATE tab_prod SET val_stock=suma WHERE id_prod=wid_prod;
			   RETURN 'Se detuvo en suma';
			   END IF;
			   RAISE NOTICE 'Se agrego la cantidad correctamente';
			   RETURN 'No es una entrada';
			END IF;   
               WHEN 'S' THEN
            IF wcant_prod >= wreg_prod.val_stockmin THEN
				resta = wreg_prod.val_stock - wcant_prod;
				UPDATE tab_prod SET val_stock=resta WHERE id_prod=wid_prod;
                RAISE NOTICE 'Se ha sacado la cantidad del producto deseado';
                RETURN 'El inventario queda en 0... Es necesario reabastecer el inventario';
            END IF;
        
            END CASE;
			RETURN 'Se termino aca';
   END;
$$
LANGUAGE PLPGSQL;