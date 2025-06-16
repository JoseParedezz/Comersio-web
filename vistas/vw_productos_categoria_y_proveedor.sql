USE BDcomercioWeb
GO
CREATE VIEW vw_producto_categoria_proveedor AS 
SELECT 
    p.id_Producto,
    p.nombre_producto,
    c.Nombre_categoria,
    pr.id_proveedor,
    pr.nombre AS nombre_proveedor,
    pr.E_mail AS email_proveedor
    --Les ponemos alias para evitar la ambiguedad en los nombres 
FROM Producto p
INNER JOIN Categoria c ON p.id_categoria = c.ID_categoria
--Buscamos las coincidencias entre la tabla producto y categoria con el id_categoria
LEFT JOIN Proveedor pr ON p.id_proveedor = pr.id_proveedor;
-- Devuelve los proveedores

SELECT * FROM vw_producto_categoria_proveedor;