USE BDcomercioWeb
GO
CREATE PROCEDURE sp_buscar_stock_productos(
    @stock INT
)
-- Inicio del procedimiento:
AS 
BEGIN
   
    begin try
     --Traemos los productos
        SELECT
            id_Producto,
            nombre_producto,
            precio_venta,
            stock,
            id_categoria,
            id_proveedor
        FROM Producto
        WHERE stock < @stock;
    END try
    begin catch
        
    end catch
END;

--Probamos
EXEC sp_buscar_stock_productos 20;
