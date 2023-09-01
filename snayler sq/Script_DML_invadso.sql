    INSERT INTO tab_pmtros VALUES(1,'PP');

    INSERT INTO tab_ciudades VALUES(1,'BogotáDVC');
    INSERT INTO tab_ciudades VALUES(2,'Medellino');
    INSERT INTO tab_ciudades VALUES(3,'Bucaramanga');

    INSERT INTO tab_marcas VALUES(1,'Marca 1');
    INSERT INTO tab_marcas VALUES(2,'Marca 2');
    INSERT INTO tab_marcas VALUES(3,'Marca 3');

    INSERT INTO tab_bodegas VALUES(1,'Bodega 1',3101111111);
    INSERT INTO tab_bodegas VALUES(2,'Bodega 2',3112222222);
    INSERT INTO tab_bodegas VALUES(3,'Bodega 3',3123333333);

    INSERT INTO tab_sucur VALUES(1,'Sucursal 1',3101111111,'Dir. Sucursal 1','Encargado Sucursal 1');
    INSERT INTO tab_sucur VALUES(2,'Sucursal 2',3102222222,'Dir. Sucursal 2','Encargado Sucursal 2');
    INSERT INTO tab_sucur VALUES(3,'Sucursal 3',3103333333,'Dir. Sucursal 3','Encargado Sucursal 3');

    INSERT INTO tab_sucurbode VALUES(1,1);
    INSERT INTO tab_sucurbode VALUES(1,2);
    INSERT INTO tab_sucurbode VALUES(1,3);
    INSERT INTO tab_sucurbode VALUES(2,1);
    INSERT INTO tab_sucurbode VALUES(2,2);
    INSERT INTO tab_sucurbode VALUES(3,1);

    INSERT INTO tab_prov VALUES(1,'Proveedor 1',3201111111,'Dirección Proveedor 1','proveedor1@mail.com',1);
    INSERT INTO tab_prov VALUES(2,'Proveedor 2',3202222222,'Dirección Proveedor 2','proveedor2@mail.com',2);
    INSERT INTO tab_prov VALUES(3,'Proveedor 3',3203333333,'Dirección Proveedor 3','proveedor3@mail.com',3);
    INSERT INTO tab_prov VALUES(4,'Proveedor 4',3204444444,'Dirección Proveedor 4','proveedor4@mail.com',3);
    INSERT INTO tab_prov VALUES(5,'Proveedor 5',3205555555,'Dirección Proveedor 5','proveedor5@mail.com',3);
    INSERT INTO tab_prov VALUES(6,'Proveedor 6',3206666666,'Dirección Proveedor 6','proveedor6@mail.com',3);
    INSERT INTO tab_prov VALUES(7,'Proveedor 7',3207777777,'Dirección Proveedor 7','proveedor7@mail.com',3);
    INSERT INTO tab_prov VALUES(8,'Proveedor 8',3208888888,'Dirección Proveedor 8','proveedor8@mail.com',1);
    INSERT INTO tab_prov VALUES(9,'Proveedor 9',3209999999,'Dirección Proveedor 9','proveedor9@mail.com',3);
    INSERT INTO tab_prov VALUES(10,'Proveedor 10',3201010101,'Dirección Proveedor 10','proveedor10@mail.com',1);

    INSERT INTO tab_prod VALUES(1,'Producto 1','Ref. 1',1000,0,300,800,500,1,'2023-01-01','2023-12-31');
    INSERT INTO tab_prod VALUES(2,'Producto 2','Ref. 2',2000,0,700,1100,800,2,'2023-01-01','2023-11-30');
    INSERT INTO tab_prod VALUES(3,'Producto 3','Ref. 3',3000,0,300,800,500,1,'2023-01-01','2023-12-31',FALSE);
    INSERT INTO tab_prod VALUES(4,'Producto 4','Ref. 4',4000,0,50,200,100,1,'2023-01-01','2023-12-31',TRUE);
    INSERT INTO tab_prod VALUES(5,'Producto 5','Ref. 5',1000,0,300,800,500,3,'2023-01-01','2023-12-31',TRUE);
    INSERT INTO tab_prod VALUES(6,'Producto 6','Ref. 6',5000,0,300,700,400,3,'2023-01-01','2023-12-31',TRUE);
    INSERT INTO tab_prod VALUES(7,'Producto 7','Ref. 7',10000,0,3000,8000,5000,1,'2023-01-01','2023-12-31',TRUE);
    INSERT INTO tab_prod VALUES(8,'Producto 8','Ref. 8',1000,0,300,800,500,3,'2023-01-01','2023-12-31',TRUE);
    INSERT INTO tab_prod VALUES(9,'Producto 9','Ref. 9',100,0,30,80,50,2,'2023-01-01','2023-12-31',TRUE);
    INSERT INTO tab_prod VALUES(10,'Producto 10','Ref. 10',1000,0,300,800,500,1,'2023-01-01','2023-12-31',TRUE);

    INSERT INTO tab_prodprov VALUES(1,1,1000,1000);
    INSERT INTO tab_prodprov VALUES(1,2,2000,2000);
    INSERT INTO tab_prodprov VALUES(1,3,3000,3000);
    INSERT INTO tab_prodprov VALUES(1,4,4000,2000);
    INSERT INTO tab_prodprov VALUES(1,5,5000,1000);
    INSERT INTO tab_prodprov VALUES(2,1,100,100);
    INSERT INTO tab_prodprov VALUES(2,2,200,200);
    INSERT INTO tab_prodprov VALUES(2,3,300,300);
    INSERT INTO tab_prodprov VALUES(3,4,400,500);
    INSERT INTO tab_prodprov VALUES(3,5,500,500);
    INSERT INTO tab_prodprov VALUES(3,6,600,600);
    INSERT INTO tab_prodprov VALUES(4,1,700,700);
    INSERT INTO tab_prodprov VALUES(4,2,800,800);
    INSERT INTO tab_prodprov VALUES(4,3,900,900);
    INSERT INTO tab_prodprov VALUES(4,4,1000,1000);
    INSERT INTO tab_prodprov VALUES(5,5,2000,2000);
    INSERT INTO tab_prodprov VALUES(5,6,3000,3000);
    INSERT INTO tab_prodprov VALUES(5,7,4000,4000);
    INSERT INTO tab_prodprov VALUES(5,8,5000,5000);
    INSERT INTO tab_prodprov VALUES(5,10,7000,7000);
    INSERT INTO tab_prodprov VALUES(1,10,8000,8000);