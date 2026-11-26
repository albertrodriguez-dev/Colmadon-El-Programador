SELECT DB_NAME() AS Base_Datos_Actual; 

USE master; 
GO

SELECT DB_NAME() AS Base_Datos_Actual; 

CREATE DATABASE ColmadonElProgramador; 

USE ColmadonElProgramador; 
GO



-- 1- Creamos Categoria primero porque no depende de otras tablas.
-- PK: identifica cada categoria.
-- UNIQUE: evita nombres de categorias duplicados.

CREATE TABLE Categoria (
ID_Categoria INT IDENTITY(1,1) CONSTRAINT PK_Categoria PRIMARY KEY, 
Nombre NVARCHAR(60) NOT NULL CONSTRAINT UQ_Categoria_Nombre UNIQUE,

); 
GO

-- 2- Tabla de cliente
-- Se crea antes de VENTAS  porque Ventas
-- necesita ID_CLientes como clave foranea.

CREATE TABLE Cliente (
    ID_Cliente INT IDENTITY(1,1) CONSTRAINT PK_CLiente PRIMARY KEY, 
    Nombre NVARCHAR(60) NOT NULL, 
    Apellido NVARCHAR(60) NOT NULL, 
    Telefono  NVARCHAR(60) NULL, 
    Ciudad  NVARCHAR(60) NULL, 
    Email NVARCHAR(150) NOT NULL CONSTRAINT UQ_Email_Cliente UNIQUE,
    Fecha_Registro DATE NOT NULL DEFAULT GETDATE(),
    Estado NVARCHAR(20), 
);
GO


--3- TABLA PROVEEDOR
-- Se crea antes de Compras porque Compras
-- necesita ID_Proveedor como clave foranea.
CREATE TABLE Proveedor (
    ID_Proveedor INT IDENTITY(1,1) CONSTRAINT PK_Proveedor PRIMARY KEY, 
    Nombre_Compania NVARCHAR(60) NOT NULL, 
    RNC NVARCHAR(60) NOT NULL CONSTRAINT UQ_Proveedor_RNC UNIQUE, 
    Telefono  NVARCHAR(60) NULL, 
    Ciudad  NVARCHAR(60) NULL, 
    Email NVARCHAR(150) NOT NULL CONSTRAINT UQ_Email_Proveedor UNIQUE,
);
GO

-- 4- TABLA  VENTAS
-- Esta tabla registra las ventas realizadas en el Colmadon El Programador.
-- Se crea despues de Cliente porque necesita ID_Cliente como clave foranea (FK).
CREATE TABLE Ventas (
    ID_Ventas INT IDENTITY(1,1)  CONSTRAINT PK_Ventas PRIMARY KEY, 
    ID_Cliente INT NOT NULL CONSTRAINT FK_Ventas_Cliente FOREIGN KEY REFERENCES Cliente(ID_Cliente),
    Fecha_Venta DATETIME2  NOT NULL CONSTRAINT DF_Venta_Fecha DEFAULT SYSDATETIME(),  --registra automáticamente la fecha y hora
    Monto_Pagado DECIMAL(10,2) CONSTRAINT CK_Ventas_Monto CHECK (Monto_Pagado >= 0) -- montos mayores o iguales a 0
); 
GO

-- 5- TABLA: COMPRAS 
-- Registra las compras de mercancia realizadas
-- por el Colmadon El Programador a sus proveedores. y - Relacion: Proveedor (1:N) Compras.

CREATE TABLE Compras (
    ID_Compra INT IDENTITY(1,1) CONSTRAINT PK_Compras PRIMARY KEY, 
    ID_Proveedor INT NOT NULL CONSTRAINT FK_Compras_Proveedor FOREIGN KEY REFERENCES Proveedor(ID_Proveedor),
    Fecha_Compra DATETIME2 NOT NULL  CONSTRAINT DF_Compras_Fecha DEFAULT SYSDATETIME(), 
    Monto_Pagado DECIMAL(10,2) CONSTRAINT CK_Compras_Monto CHECK (Monto_Pagado >= 0) -- montos mayores o iguales a 0
); 
GO


-- 6 TABLA PRODUCTO
-- Registra los productos y sus precios de venta.
-- PK: identifica cada producto.
-- FK: relaciona cada producto con su categoria.
-- CHECK: evita precios y existencias negativos.
-- Relacion: Categoria (1:N) Producto.

CREATE TABLE Producto (
    ID_Producto INT IDENTITY(1,1) CONSTRAINT PK_Producto PRIMARY KEY, 
    Nombre NVARCHAR(60) NOT NULL,
    Precio_Unitario DECIMAL(10, 2) CONSTRAINT Ck_Producto_PrecioUnitario CHECK(Precio_Unitario >= 0), 
    Stock INT CONSTRAINT CK_Producto_Stok DEFAULT 0 CONSTRAINT DF_Producto_Stock  CHECK(Stock >=0),  --los productos nuevos comiencen con cero unidades
    ID_Categoria INT NOT NULL CONSTRAINT FK_Producto_Categoria FOREIGN KEY REFERENCES Categoria(ID_Categoria), 
    Fecha_Creacion DATETIME2 NOT NULL  CONSTRAINT DF_Producto_Fecha DEFAULT SYSDATETIME()
); 
GO

ALTER TABLE Producto
ADD Costo_Promedio DECIMAL(10,2) NULL;


-- 7 -TABLA DETALLE_PROVEEDOR
-- Relaciona los productos con sus proveedores (N:M).
-- Las FK hacen referencia a Producto y Proveedor.
-- La PK compuesta evita duplicar la misma combinacion.
-- CHECK impide registrar costos negativos.
--PRIMARY KEY compuesta, porque esta tabla necesita identificar de manera única cada combinación de producto y proveedor.
CREATE TABLE Detalle_Proveedor (
    ID_Producto INT NOT NULL CONSTRAINT FK_Producto_Detalle_Proveedor FOREIGN KEY REFERENCES Producto(ID_Producto), 
    ID_Proveedor INT NOT NULL CONSTRAINT FK_Proveedor_Detalle_Proveedor FOREIGN KEY REFERENCES Proveedor(ID_Proveedor), 
    Costo_Unitario DECIMAL(10,2) CONSTRAINT CK_Detalle_Proveedor_Costo_unitario  CHECK(Costo_Unitario >=0) CONSTRAINT PK_Detalle_Proveedor PRIMARY KEY (ID_Producto, ID_Proveedor),

); 
GO

-- 8- TABLA DETALLE_COMPRA
-- Registra productos, cantidades y costos de cada compra.
-- FK: relaciona Compras y Producto.
-- PK compuesta: evita repetir un producto en la misma compra.
-- CHECK: evita cantidades y costos invalidos.

CREATE TABLE Detalle_Compra (
 ID_Compra INT NOT NULL CONSTRAINT FK_ID_Compra_Detalle_Compras FOREIGN KEY REFERENCES Compras(ID_Compra), 
 ID_Producto INT NOT NULL CONSTRAINT FK_ID_Producto_Detalle_Compra FOREIGN KEY REFERENCES Producto(ID_Producto),
 Cantidad INT NOT NULL CONSTRAINT CK_Cantidad_Detalle_Compra CHECK(Cantidad>=0), 
 Costo_Unitario DECIMAL(10,2) NOT NULL CONSTRAINT CK_Costo_Unitario_Detalle_Compra CHECK(Costo_Unitario >=0),

 --para crear una clave primaria compuesta 
 CONSTRAINT PK_Detalle_Compra
    PRIMARY KEY (ID_Compra, ID_Producto)

);
GO

-- 9 TABLA DETALLE_VENTA
-- Registra los productos, cantidades y precios vendidos.
-- FK: relaciona Ventas y Producto.
-- PK compuesta: evita repetir un producto en la misma venta.
-- CHECK: impide cantidades y precios invalidos.

CREATE TABLE Detalle_Venta (
    ID_Ventas INT NOT NULL CONSTRAINT FK_ID_Venta_Detalle_Venta FOREIGN KEY REFERENCES Ventas(ID_Ventas), 
    ID_Producto INT NOT NULL CONSTRAINT FK_ID_Producto_Detalle_Venta FOREIGN KEY REFERENCES producto(ID_Producto), 
    Cantidad INT NOT NULL CONSTRAINT CK_Cantidad_Detalle_Venta CHECK(Cantidad >=0),
    Precio_Unitario DECIMAL(10,2) NOT NULL CONSTRAINT CK_Precio_Unitatio_Detalle_Venta CHECK(Precio_Unitario >=0),

--para crear una clave primaria compuesta 
CONSTRAINT PK_Detalle_Venta
    PRIMARY KEY (ID_Ventas, ID_Producto)

); 
GO

-- Para verificar todas las tablas creadas
USE ColmadonElProgramador;
GO

SELECT name AS Nombre_Tabla
FROM sys.tables
ORDER BY name;
