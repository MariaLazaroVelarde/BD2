/* 1. Crear base de datos dbMarket2023 */
DROP DATABASE IF EXISTS dbMarket2023;
CREATE DATABASE dbMarket2023;


ALTER DATABASE dbMarket2023
ADD FILE (
    NAME = 'Market2023',
    FILENAME = 'C:\VENTAS/Market2023.mdf',
    SIZE = 15MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 5MB
);

ALTER DATABASE dbMarket2023
ADD FILE (
    NAME = 'Market2023_Data',
    FILENAME = 'C:\VENTAS/Market2023.ndf',
    SIZE = 30MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 25%
);

ALTER DATABASE dbMarket2023
ADD FILE (
    NAME = 'Market2023_Log',
    FILENAME = 'C:\VENTAS/Market2023.ldf',
    SIZE = 60MB,
    MAXSIZE = 150MB,
    FILEGROWTH = 20%
);

/* 2. Crear esquemas persona, producto y venta*/
CREATE SCHEMA PERSONA;

CREATE SCHEMA PRODUCTO;

CREATE SCHEMA VENTA;

/* 3. Crear tabla PERSONA  y tener registros */
CREATE TABLE PERSONA (
    IDPER INT identity(200,1) PRIMARY KEY,
    DNIPER CHAR(8),
    NOMPER VARCHAR(60),
	APEPER VARCHAR(90),
	EMAPER VARCHAR(150),
	CELPER CHAR(9),
	FECNACPER DATE,
	TIPPER CHAR(1) CHECK (TIPPER IN ('V', 'C')),
	ESTPER CHAR(1) DEFAULT 'A' CHECK (ESTPER IN ('A', 'I'))
);

INSERT INTO PERSONA (DNIPER, NOMPER, APEPER, EMAPER, CELPER, FECNACPER, TIPPER)
VALUES
    ('77889555', 'Alberto', 'Solano Pariona', 'alberto.pariona@empresa.com', '998456321','', 'V'),
    ('45781233', 'Alicia', 'García Campos', 'alicia.garcia@gmail.com', '929185236','', 'C'),
	('15487922', 'Juana', 'Ávila Chumpitaz', 'juana.avila@gmail.com', '923568741','', 'C'),
	('22116633', 'Ana', 'Enriquez Flores', 'ana.enriquez@empresa.com', '978848551','', 'V'),
	('88741589', 'Claudia', 'Perales Ortíz', 'claudia.perales@yahoo.com', '997845263','', 'C'),
	('45122587', 'Mario', 'Barrios Martínez', 'mario.barrios@outlook.com', '986525874','', 'C'),
	('15258564', 'Brunela', 'Tarazona Guerra', 'brunela.tarazona@gmail.com', '986525877','', 'C');

	SELECT * FROM PERSONA;

/* 4. Crear tabla CATEGORIA  y tener registros */
CREATE TABLE CATEGORIA (
    IDCAT INT identity(10,10) PRIMARY KEY,
    NOMCAT VARCHAR(60),
);

INSERT INTO CATEGORIA (NOMCAT)
VALUES
    ('Abarrotes'),
    ('Carnes y Pollo'),
	('Higiene y Limpieza');
	
	SELECT * FROM CATEGORIA;

/* 5. Crear tabla PRODUCTO  y tener registros */
CREATE TABLE PRODUCTO (
    CODPROD CHAR (3)  PRIMARY KEY,
    NOMPRO VARCHAR(80),
	PREPRO DECIMAL (8,2),
	STOCKPRO CHAR(5),
	IDCATPRO CHAR (80),
	ESTPRO CHAR(1) DEFAULT 'A' CHECK (ESTPRO IN ('A', 'I'))
);

INSERT INTO PRODUCTO (CODPROD, NOMPRO, PREPRO, STOCKPRO, IDCATPRO)
VALUES
    ('P01', 'Arroz', '4.65', 50, 10),
	('P02', 'Azúcar', '3.45', 60, 10),
	('P03', 'Pollo fresco', '8.70', 20, 20),
	('P04', 'Lomo fino', '18.50', 40, 20),
	('P05', 'Detergente Opal', '8.75', 60, 30),
	('P06', 'Suavizante Ariel', '7.85', 30, 30);
	
	SELECT * FROM PRODUCTO;

/* 6. Determinar la relación de las tablas PRODUCTO y CATEGORIA */


/* 7. Crear tabla VENTA  y tener registros */
CREATE TABLE VENTA (
    IDVEN INT identity (1,1)  PRIMARY KEY,
    FECVEN DATETIME,
	IDVEND DECIMAL (8,2),
	IDCLI CHAR(5),
	TIPPAGVEN CHAR(1) CHECK (TIPPAGVEN IN ('E', 'T')),
	ESTVEN CHAR(1) DEFAULT 'A' CHECK (ESTVEN IN ('A', 'I'))
);

INSERT INTO VENTA (FECVEN, IDVEND, IDCLI, TIPPAGVEN)
VALUES
    ('25/10/2022 06:20:45', 200, 202, 'E'),
	('25/10/2022 06:20:45', 200, 204, 'T'),
	('25/10/2022 06:20:45', 203, 205, 'T'),
	('25/10/2022 06:20:45', 203, 206, 'E');
	
	SELECT * FROM VENTA;

/* 8. Relacion de la tabla VENTA y PERSONA para la validacion de datos de 
VENDEDORES (V) y CLIENTES(C) */


/* 9. Crear tabla VENTA_DETALLE  y tener registros */
CREATE TABLE VENTA_DETALLE (
    IDVENDET INT identity (300,1)  PRIMARY KEY,
    IDVEN CHAR (2),
	CODPRO CHAR (3),
	CANVENDET CHAR(5),
);

INSERT INTO VENTA_DETALLE (IDVEN, CODPRO, CANVENDET)
VALUES
    (1, 'P01', 2),
	(1, 'P04', 4);
	
	SELECT * FROM VENTA_DETALLE;

/* 10. Relacion de la tabla VENTA_DETALLE y PRODUCTO */