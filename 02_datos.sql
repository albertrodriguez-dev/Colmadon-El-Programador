USE ColmadonElProgramador; 
GO


INSERT INTO Categoria (Nombre)
VALUES  
(N'Cervezas'),
(N'Licores_Romos'),
(N'Embutidos'), 
(N'Producto_Limpieza'), 
(N'Vegetales'),
(N'Carnes'),
(N'Bazar'),
(N'Panaderia'), 
(N'Hogar'), 
(N'Electrodomestico');

-- verificamos la informacion introducida
SELECT * FROM Categoria;


-- Insertar proveedores del colmado

INSERT INTO Proveedor
    (Nombre_Compania, RNC, Telefono, Ciudad, Email)
VALUES 
(N'Grupo Rica', N'101-1100021', N'809-570-2040', N'Santo Domingo', N'GrupoRica@gruporica.com'), 
(N'El Catador', N'101-1100022', N'809-570-2041', N'Santo Domingo', N'Elcatador@catador.com'),
(N'La Sirena', N'101-1100023', N'809-571-2043', N'Santo Domingo', N'GrupoRamos@GrupoRamos.com'),
(N'Grupo Alonzo', N'101-1100024', N'809-571-2046', N'Santiago', N'Grupo_Alonzos@GrupoAlonzo.com'),
(N'Cecomsa', N'101-1100025', N'809-571-2047', N'La Vega', N'Cecomsa@cecomsa.com'),
(N'Distribuidora Caribe', N'101-1100026', N'809-555-0106', N'Santo Domingo', N'caribe@ejemplo.com'),
(N'Comercial La Vega', N'101-1100027', N'809-555-0107', N'La Vega', N'lavega@ejemplo.com'),
(N'Importadora del Norte', N'101-1100028', N'809-555-0108', N'Santiago', N'norte@ejemplo.com'),
(N'Distribuidora del Cibao', N'101-1100029', N'809-555-0109', N'Moca', N'cibao@ejemplo.com'),
(N'Suplidora Dominicana', N'101-1100030', N'809-555-0110', N'San Cristobal', N'suplidora@ejemplo.com');

-- verificamos la informacion introducida
SELECT * FROM Proveedor;


-- INSERTAR CLIENTES DEL COLMADON

INSERT INTO Cliente
    (Nombre, Apellido, Telefono, Ciudad, Email, Estado)
VALUES
    (N'Juan', N'Perez', N'809-555-0101', N'Santo Domingo', N'juan.perez@ejemplo.com', N'Activo'), 
    (N'Maria', N'Rodriguez', N'809-555-0201', N'Santo Domingo', N'maria@ejemplo.com', N'Activo'),
    (N'Carlos', N'Jimenez', N'809-555-0202', N'Santiago', N'carlos@ejemplo.com', N'Activo'), 
    (N'Ana', N'Fernandez', N'809-555-0203', N'La Vega', N'ana@ejemplo.com', N'Activo'),
    (N'Pedro', N'Martinez', N'809-555-0204', N'San Cristobal', N'pedro@ejemplo.com', N'Activo'),
    (N'Lucia', N'Gomez', N'809-555-0205', N'Bonao', N'lucia@ejemplo.com', N'Inactivo');

-- verificamos la informacion introducida
SELECT * FROM Cliente;


---- INSERTAR PRODUCTOS DEL COLMADON

--1 PRIMERO CONSULTAMOS LAS CATEGORIA PARA SABER LOS ID 
SELECT ID_Categoria, Nombre
FROM Categoria
ORDER BY ID_Categoria;

--ID_Categoria,Nombre
-- 1,Cervezas
--2,Licores_Romos
--3,Embutidos
--4,Producto_Limpieza
--5,Vegetales
--6,Carnes
--7,Bazar
--8,Panaderia
--9,Hogar
-- 10,Electrodomestico

-- 2 Ahora si podemos ingresar datos correctamente 

INSERT INTO Producto
    (Nombre, Precio_Unitario, Stock, ID_Categoria)
VALUES
    -- cervezas
    (N'Presidente Light 12 oz', 110.00, 30, 1),
    (N'Presidente Regular 12 oz', 110.00, 25, 1),
    (N'Bohemia Especial 12 oz', 100.00, 20, 1),
    (N'Brahma 12 oz', 90.00, 35, 1),
    --romos
    (N'Ron Brugal Blanco 700 ml', 650.00, 12, 2),
    (N'Ron Barcelo Dorado 700 ml', 700.00, 15, 2),
    (N'Ron Bermudez 700 ml', 580.00, 10, 2),
    (N'Ron Brugal Extra Viejo 700 ml', 850.00, 8, 2),
    --Embutidos
    (N'Salami Induveca 1 LB', 180.00, 20, 3),
    (N'Jamon cocido 1 LB', 160.00, 50 , 3),
    (N'Salchicha 1 LB', 60.00, 50, 3),
    (N'Longaniza 1 LB ', 75.50, 150, 3),
    --Producto_Limpieza
    (N'Detergente en polvo 1 kg', 150.00, 25, 4),
    (N'Cloro 1 litro', 85.00, 30, 4),
    (N'Jabon liquido', 125.00, 20, 4),
    (N'Desinfectante', 160.00, 15, 4),
    ---Vegetales
    (N'Tomate 1 lb', 65.00, 40, 5),
    (N'Cebolla 1 lb', 75.00, 35, 5),
    (N'Papa 1 lb', 60.00, 45, 5),
    (N'Zanahoria 1 lb', 55.00, 30, 5),
    --Carnes
    (N'Pollo fresco 1 lb', 95.00, 30, 6),
    (N'Carne de res 1 lb', 250.00, 20, 6),
    (N'Carne de cerdo 1 lb', 145.00, 25, 6),
    (N'Chuleta ahumada 1 lb', 190.00, 15, 6),
    --Bazar
    (N'Vasos plasticos paquete', 85.00, 50, 7),
    (N'Platos desechables', 100.00, 40, 7),
    (N'Servilletas paquete', 65.00, 60, 7),
    (N'Fundas plasticas', 45.00, 80, 7),
    --panederia 
    (N'Pan de agua', 15.00, 80, 8),
    (N'Pan sobao', 20.00, 70, 8),
    (N'Pan integral', 125.00, 25, 8),
    (N'Galletas dulces', 75.00, 45, 8),
    --hogar
    (N'Escoba', 175.00, 15, 9),
    (N'Cubeta plastica', 200.00, 12, 9),
    (N'Recogedor', 110.00, 18, 9),
    (N'Trapeador', 185.00, 14, 9),
    --electrodomestico
    (N'Licuadora 1.5 L', 1850.00, 8, 10),
    (N'Abanico', 2450.00, 6, 10),
    (N'Tostadora', 1350.00, 9, 10),
    (N'Cafetera', 1650.00, 7, 10);

-- verificamos si todo esto se introducjo 
SELECT ID_Categoria, COUNT(*) AS Total_Productos
FROM Producto
GROUP BY ID_Categoria
ORDER BY ID_Categoria;

SELECT * FROM Producto
ORDER BY Nombre;

--- para orenar con proveedor 
SELECT ID_Proveedor, Nombre_Compania
FROM Proveedor
ORDER BY ID_Proveedor;


-- para regirar relaciones entre producto y proveedor 
-- Esto funcina como una cotizacion 
INSERT INTO Detalle_Proveedor
    (ID_Producto, ID_Proveedor, Costo_Unitario)
VALUES
    (1, 1, 75.00),  --Presidente Light 12 oz
    (2, 1, 85.00),  ---Presidente Regular 12 oz
    (3, 2, 70.00),  --Bohemia Especial 12 oz
    (4, 2, 65.00),  --Brahma 12 oz
    (5, 3, 500.00),  --Ron Brugal Blanco 700 ml
    (6, 3, 550.00),   --Ron Barcelo Dorado 700 ml
    (7, 4, 450.00),  --Ron Bermudez 700 ml
    (8, 4, 700.00),  --Ron Brugal Extra Viejo 700 ml
    (9, 5, 130.00),  --Salami Induveca 1 lb
    (10, 5, 150.00);  --Jamon cocido 1 lb

    -- para validar lo introducido 
SELECT * FROM Detalle_Proveedor;

SELECT COUNT(*) AS Total_Relaciones
FROM Detalle_Proveedor;

-- compras para registar datos a compra 

SELECT * FROM Compras;

-- ingresando compras 
INSERT INTO Compras
    (ID_Proveedor, Monto_Pagado)
VALUES
    (1, 750.00),   -- Presidente Light 12 oz : 10 x 75
    (1, 850.00),   -- Presidente Light 12 oz: 10 x 85
    (2, 700.00),   -- Presidente Regular 12 oz: 10 x 70
    (2, 650.00),   -- Presidente Regular 12 oz: 10 x 65
    (3, 5000.00),  -- Bohemia Especial 12 oz: 10 x 500
    (3, 5500.00),  -- Bohemia Especial 12 oz : 10 x 550
    (4, 4500.00),  -- Brahma 12 oz: 10 x 450
    (4, 7000.00),  -- Brahma 12 oz: 10 x 700
    (5, 1300.00),  -- Ron Brugal Blanco 700 ml: 10 x 130
    (5, 1500.00);  -- Ron Brugal Blanco 700 ml: 10 x 150


-- para verificar ya el pedido realizado al proveedor y consultar los datos 
SELECT * FROM Compras;


-- DETALLE DE COMPRA
-- Los mismos productos y costos de tus pedidos -- para segir la secuencia de mis pedido 
-- realizados 

SELECT * FROM Detalle_Compra;

INSERT INTO Detalle_Compra
    (ID_Compra, ID_Producto, Cantidad, Costo_Unitario)
VALUES
    (1, 1, 10, 75.00),    -- Presidente Light 12 oz: 10 x 75
    (2, 1, 10, 85.00),    -- Presidente Light 12 oz: 10 x 85
    (3, 2, 10, 70.00),    -- Presidente Regular 12 oz: 10 x 70
    (4, 2, 10, 65.00),    -- Presidente Regular 12 oz: 10 x 65
    (5, 3, 10, 500.00),   -- Bohemia Especial 12 oz: 10 x 500
    (6, 3, 10, 550.00),   -- Bohemia Especial 12 oz: 10 x 550
    (7, 4, 10, 450.00),   -- Brahma 12 oz: 10 x 450
    (8, 4, 10, 700.00),   -- Brahma 12 oz: 10 x 700
    (9, 5, 10, 130.00),   -- Ron Brugal Blanco 700 ml: 10 x 130
    (10, 5, 10, 150.00);  -- Ron Brugal Blanco 700 ml: 10 x 150

SELECT * FROM Detalle_Compra;

---================================================
-- inventatio 
--=================================================
-- consultamos nuestro inventario primero 
SELECT ID_Producto, Nombre, Stock
FROM Producto
WHERE ID_Producto BETWEEN 1 AND 5
ORDER BY ID_Producto;

-- RECEPCION DE MERCANCIA DEL COLMADON
-- Sumar 10 unidades a cada producto comprado -- segun pedido de compras 
UPDATE Producto
SET Stock = Stock + 10
WHERE ID_Producto IN (1, 2, 3, 4, 5);

-- consultamos nuestro inventario primero 
SELECT ID_Producto, Nombre, Stock
FROM Producto
WHERE ID_Producto BETWEEN 1 AND 5
ORDER BY ID_Producto;

---================================================
-- ventas o cotizaciones 
---================================================
-- consultamos nuestro clientes 
SELECT
    ID_Cliente,
    Nombre,
    Apellido
FROM Cliente
ORDER BY ID_Cliente;


-- vamos a registrar ventas o cotizacione de ventas 

-- Venta al cliente 
INSERT INTO Ventas (ID_Cliente, Monto_Pagado)
VALUES
    (1, 220.00),   -- Juan: Presidente Light 12 oz, 2 x RD$110
    (2, 330.00),   -- Maria: Presidente Light 12 oz, 3 x RD$110
    (3, 220.00),   -- Carlos: Presidente Regular 12 oz, 2 x RD$110
    (4, 440.00),   -- Ana: Presidente Regular 12 oz, 4 x RD$110
    (5, 300.00),   -- Pedro: Bohemia Especial 12 oz, 3 x RD$100
    (6, 200.00),   -- Lucia: Bohemia Especial 12 oz, 2 x RD$100
    (1, 450.00),   -- Juan: Brahma 12 oz, 5 x RD$90
    (2, 180.00),   -- Maria: Brahma 12 oz, 2 x RD$90
    (3, 650.00),   -- Carlos: Ron Brugal Blanco 700 ml, 1 x RD$650
    (4, 1300.00);  -- Ana: Ron Brugal Blanco 700 ml, 2 x RD$650

-- consultamos nuestro pedidos o cotizaciones 
SELECT COUNT(*) AS Total_Ventas
FROM Ventas;


-- ahora confirmaos la ventas en detalle de ventas 

SELECT
    ID_Ventas,
    ID_Producto,
    Cantidad,
    Precio_Unitario
FROM Detalle_Venta
ORDER BY ID_Ventas;
 
INSERT INTO Detalle_Venta
    (ID_Ventas, ID_Producto, Cantidad, Precio_Unitario)
VALUES
    (18, 1, 2, 110.00),  -- Juan: Presidente Light, 2 x RD$110
    (19, 1, 3, 110.00),  -- Maria: Presidente Light, 3 x RD$110
    (20, 2, 2, 110.00),  -- Carlos: Presidente Regular, 2 x RD$110
    (21, 2, 4, 110.00),  -- Ana: Presidente Regular, 4 x RD$110
    (22, 3, 3, 100.00),  -- Pedro: Bohemia Especial, 3 x RD$100
    (23, 3, 2, 100.00),  -- Lucia: Bohemia Especial, 2 x RD$100
    (24, 4, 5, 90.00),   -- Juan: Brahma, 5 x RD$90
    (25, 4, 2, 90.00),   -- Maria: Brahma, 2 x RD$90
    (26, 5, 1, 650.00),  -- Carlos: Ron Brugal Blanco, 1 x RD$650
    (27, 5, 2, 650.00);  -- Ana: Ron Brugal Blanco, 2 x RD$650

SELECT COUNT(*) AS Total_Detalle_Ventas
FROM Detalle_Venta;


---================================================
-- inventatio  actulizar despues de la venta
--=================================================

SELECT ID_Producto, Nombre, Stock
FROM Producto
WHERE ID_Producto BETWEEN 1 AND 5
ORDER BY ID_Producto;


-- REBAJAR  LAS UNIDADES VENDIDAS
UPDATE Producto
SET Stock = Stock -
    CASE ID_Producto
        WHEN 1 THEN 5   -- Presidente Light = 5
        WHEN 2 THEN 6    --- Presidente Regular = 6 
        WHEN 3 THEN 5    --Bohemia Especial = 5 
        WHEN 4 THEN 7    --Brahma = 7 
        WHEN 5 THEN 3    --Ron Brugal Blanco = 3 
    END
WHERE ID_Producto IN (1, 2, 3, 4, 5);


SELECT ID_Producto, Nombre, Stock
FROM Producto
WHERE ID_Producto BETWEEN 1 AND 5
ORDER BY ID_Producto;





-- ASIGNAR COSTO INICIAL A TODOS LOS PRODUCTOS

UPDATE Producto
SET Costo_Promedio = ROUND(Precio_Unitario * 0.75, 2)
WHERE Costo_Promedio IS NULL;