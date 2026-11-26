USE ColmadonElProgramador; 
GO

-- que es view : es una consulta de SQL que nos permite guardar en la base de datos las informacion o los reporte que 
-- nos piden consultar de forma que no tengamos que repetir o hacer la misma colsulta varias veces 



-- VIEW 1: PRODUCTOS CON SUS CATEGORIAS

CREATE VIEW vw_ProductosCategorias  -- nombre de la tabla y convinamos con join 
AS
SELECT
    P.Nombre AS Producto,
    P.Precio_Unitario AS Precio,
    C.Nombre AS Categoria
FROM Producto AS P
INNER JOIN Categoria AS C
    ON P.ID_Categoria = C.ID_Categoria;
GO

-- aqui la consultamos 
SELECT *
FROM vw_ProductosCategorias;


-- VIEW 2: VALOR DEL INVENTARIO

GO
CREATE VIEW vw_ValorInventario
AS
SELECT
    Nombre AS Producto,
    Stock AS Cantidad_Disponible,
    Costo_Promedio,
    Stock * Costo_Promedio AS Valor_Inventario
FROM Producto;
GO
-- aqui la consultamos 
SELECT *
FROM vw_ValorInventario;




-- VIEW 3: REPORTE CONTABLE DE VENTAS

GO
CREATE VIEW vw_ReporteVentas
AS
SELECT
    V.ID_Ventas,
    V.Fecha_Venta,
    C.Nombre AS Cliente,
    C.Apellido,
    V.Monto_Pagado AS Total_Venta
FROM Ventas AS V
INNER JOIN Cliente AS C
    ON V.ID_Cliente = C.ID_Cliente;
GO

-- aqui la consultamos 
SELECT * FROM vw_ReporteVentas;


--====================================
--mini Estado de Resultado
--====================================
GO
CREATE VIEW vw_Ganancias
AS
SELECT
    P.Nombre AS Producto,
    D.Cantidad,
    D.Precio_Unitario AS Precio_Venta,
    P.Costo_Promedio AS Costo,
    D.Cantidad * D.Precio_Unitario AS Ingreso_Total,
    D.Cantidad * P.Costo_Promedio AS Costo_Total,
    D.Cantidad * (D.Precio_Unitario - P.Costo_Promedio)
        AS Ganancia_Bruta
FROM Detalle_Venta AS D
INNER JOIN Producto AS P
    ON D.ID_Producto = P.ID_Producto;
GO

-- aqui la consultamos 
SELECT *
FROM vw_Ganancias;




-- STORED PROCEDURE 1:
-- CONSULTAR VENTAS POR CLIENTE

GO
CREATE PROCEDURE sp_VentasPorCliente
    @ID_Cliente INT
AS
BEGIN
    SELECT
        C.Nombre,
        C.Apellido,
        V.ID_Ventas,
        V.Fecha_Venta,
        V.Monto_Pagado
    FROM Cliente AS C
    INNER JOIN Ventas AS V
        ON C.ID_Cliente = V.ID_Cliente
    WHERE C.ID_Cliente = @ID_Cliente;
END;
GO


--AQUI LO CONSULTAMOS
EXEC sp_VentasPorCliente @ID_Cliente = 1;


--Un TRIGGER es una instrucción que se ejecuta automáticamente 
--cuando ocurre un evento en una tabla, como un INSERT, UPDATE o DELETE.


-- TRIGGER: DESCONTAR INVENTARIO AL VENDER

GO
CREATE TRIGGER trg_DescontarInventario
ON Detalle_Venta
AFTER INSERT
AS
BEGIN
    UPDATE P
    SET P.Stock = P.Stock - I.Cantidad
    FROM Producto AS P
    INNER JOIN (
        SELECT ID_Producto, SUM(Cantidad) AS Cantidad
        FROM inserted
        GROUP BY ID_Producto
    ) AS I
        ON P.ID_Producto = I.ID_Producto;
END;
GO

SELECT
    name AS Nombre_Trigger,
    is_disabled AS Deshabilitado
FROM sys.triggers
WHERE name = 'trg_DescontarInventario';


