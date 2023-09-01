-- *********************************************
-- * SCRIPT PARA CREAR LAS ESTRUCTURAS CON DDL *
-- Fecha: Mayo 24 de 2023                      *
-- Autores: ADSO 2560215                       *
-- *********************************************
DROP TABLE IF EXISTS tab_ciudades;
DROP TABLE IF EXISTS tab_marcas;
DROP TABLE IF EXISTS tab_pmtros;
DROP TABLE IF EXISTS tab_sucurbode;
DROP TABLE IF EXISTS tab_bodegas;
DROP TABLE IF EXISTS tab_sucur;
DROP TABLE IF EXISTS tab_kardex;
DROP TABLE IF EXISTS tab_prodprov;
DROP TABLE IF EXISTS tab_prod;
DROP TABLE IF EXISTS tab_prov;


CREATE TABLE tab_pmtros
(
    id_pmtro        INTEGER     NOT NULL,
    ind_metinv      VARCHAR     NOT NULL, -- indicador de tipo de método para inventario (PP)
    PRIMARY KEY(id_pmtro)
);

CREATE TABLE tab_ciudades
(
    id_ciudad       INTEGER     NOT NULL,
    nom_ciudad      VARCHAR     NOT NULL,
    PRIMARY KEY(id_ciudad)
);

CREATE TABLE tab_marcas
(
    id_marca        INTEGER     NOT NULL,
    nom_marca       VARCHAR     NOT NULL,
    PRIMARY KEY(id_marca)
);

CREATE TABLE tab_bodegas
(
    id_bodega       INTEGER     NOT NULL,
    nom_bodega      VARCHAR     NOT NULL,
    tel_bodega      BIGINT      NOT NULL,
    ind_estado      BOOLEAN     NOT NULL    DEFAULT TRUE, -- TRUE=Activa / FALSE= Inactiva
    PRIMARY KEY(id_bodega)
);

CREATE TABLE tab_sucur
(
    id_sucur        INTEGER     NOT NULL,
    nom_sucur       VARCHAR     NOT NULL,
    tel_sucur       BIGINT      NOT NULL,
    dir_sucur       VARCHAR     NOT NULL,
    nom_encargado   VARCHAR     NOT NULL,
    PRIMARY KEY(id_sucur)
);

CREATE TABLE tab_sucurbode
(
    id_sucur        INTEGER     NOT NULL,
    id_bodega       INTEGER     NOT NULL,
    PRIMARY KEY(id_sucur,id_bodega),
    FOREIGN KEY(id_sucur)   REFERENCES tab_sucur(id_sucur),
    FOREIGN KEY(id_bodega)  REFERENCES tab_bodegas(id_bodega)    
);

CREATE TABLE tab_prov
(
    id_prov         INTEGER     NOT NULL,
    nom_prov        VARCHAR     NOT NULL,
    tel_prov        BIGINT      NOT NULL,
    dir_prov        VARCHAR     NOT NULL,
    mail_prov       VARCHAR     NOT NULL,
    id_ciudad       INTEGER     NOT NULL,
    ind_estado      BOOLEAN     NOT NULL    DEFAULT TRUE, -- TRUE=Activo / FALSE=Inactivo
    PRIMARY KEY(id_prov),
    FOREIGN KEY(id_ciudad)  REFERENCES tab_ciudades(id_ciudad)
);

CREATE TABLE tab_prod
(
    id_prod         INTEGER     NOT NULL,
    nom_prod        VARCHAR     NOT NULL,
    ref_prod        VARCHAR     NOT NULL,
    val_cosprom     INTEGER     NOT NULL    CHECK(val_cosprom >=0),
    val_stock       INTEGER     NOT NULL,
    val_stockmin    INTEGER     NOT NULL,
    val_stockmax    INTEGER     NOT NULL,
    val_reorden     INTEGER     NOT NULL,
    id_marca        INTEGER     NOT NULL,
    fec_compra      DATE        NOT NULL,
    fec_vence       DATE        NOT NULL,
    ind_estado      BOOLEAN     NOT NULL    DEFAULT TRUE, --TRUE=Activo / FALSE=Inactivo
    PRIMARY KEY(id_prod),
    FOREIGN KEY(id_marca)   REFERENCES tab_marcas(id_marca)
);

CREATE UNIQUE INDEX idx_ref_prod ON tab_prod(ref_prod);

CREATE TABLE tab_prodprov
(
    id_prov         INTEGER     NOT NULL,
    id_prod         INTEGER     NOT NULL,
    val_costo       INTEGER     NOT NULL,
    val_stock       INTEGER     NOT NULL,
    PRIMARY KEY(id_prov,id_prod),
    FOREIGN KEY(id_prov)    REFERENCES tab_prov(id_prov),
    FOREIGN KEY(id_prod)    REFERENCES tab_prod(id_prod)
);

CREATE TABLE tab_kardex
(
    val_consec      INTEGER     NOT NULL    CHECK(val_consec>0),
    fec_movim       TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    ind_tipomov     VARCHAR     NOT NULL CHECK(ind_tipomov = 'E' OR ind_tipomov = 'S'),
    id_prod         INTEGER     NOT NULL,
    val_prod        INTEGER     NOT NULL,
    cant_prod       INTEGER     NOT NULL, 
    val_total       BIGINT      NOT NULL,
    val_observa     TEXT,
    PRIMARY KEY(val_consec),
    FOREIGN KEY(id_prod)    REFERENCES tab_prod(id_prod)
);