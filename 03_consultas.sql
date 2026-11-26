use ColmadonElProgramador; 
GO


-- CONSULTA 1 UNIMOS VENTAS CON CLIENTES 

SELECT * FROM Cliente AS C 
INNER JOIN Ventas AS V 
ON C.ID_Cliente = V.ID_Cliente; 


-- CONSULTAMOS 2 UNIMOS VENTAS CON DETALLE DE VENTAS Y CLEINTE

SELECT * FROM Cliente AS C 
INNER JOIN Ventas AS V 
ON C.ID_Cliente  = V.ID_Cliente
INNER JOIN Detalle_Venta AS D 
ON V.ID_Ventas = D.ID_Ventas
INNER JOIN Producto  AS P
ON D.ID_Producto = P.ID_Producto; 
 

-- CONSULTA 3: PROVEEDORES Y SUS PRODUCTOS

SELECT
    PR.Nombre_Compania AS Name_Proveedor,
    PR.RNC AS RNC,
    DP.Costo_Unitario
FROM Proveedor AS PR
INNER JOIN Detalle_Proveedor AS DP
    ON PR.ID_Proveedor = DP.ID_Proveedor;


-- CONSULTA 4: PRODUCTOS Y SUS VENTAS

SELECT
    P.Nombre AS Producto,
    D.Cantidad
FROM Producto AS P
LEFT JOIN Detalle_Venta AS D
    ON P.ID_Producto = D.ID_Producto;



-- CONSULTA 4: PRODUCTOS Y PROVEEDORES
-- FULL OUTER JOIN

SELECT
    P.Nombre AS Producto,
    PR.Nombre_Compania AS Proveedor,
    DP.Costo_Unitario AS Costo
FROM Producto AS P
FULL OUTER JOIN Detalle_Proveedor AS DP
    ON P.ID_Producto = DP.ID_Producto
FULL OUTER JOIN Proveedor AS PR
    ON DP.ID_Proveedor = PR.ID_Proveedor;



-- CONSULTA 5: CANTIDAD DE VENTAS POR CLIENTE

SELECT
    C.Nombre,
    C.Apellido,
    COUNT(V.ID_Ventas) AS Total_Ventas
FROM Cliente AS C
INNER JOIN Ventas AS V
    ON C.ID_Cliente = V.ID_Cliente
GROUP BY
    C.ID_Cliente,
    C.Nombre,
    C.Apellido;



-- CONSULTA 6: PRODUCTOS CON PRECIO MAYOR AL PROMEDIO

SELECT
    Nombre AS Producto,
    Precio_Unitario AS Precio
FROM Producto
WHERE Precio_Unitario > (
    SELECT AVG(Precio_Unitario)
    FROM Producto
);    