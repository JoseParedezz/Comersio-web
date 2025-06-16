USE BDcomercioWeb
GO

CREATE PROCEDURE sp_actualizar_stock(
    @id_producto INT,
    @nuevo_stock INT
)
-- Inicio del procedimiento:
AS 
BEGIN
 -- Comenzamos el manejo de errores
 BEGIN TRY
        --Chequeamos si existe un producto con el ID ingresado:
        IF EXISTS (SELECT 1 FROM Producto WHERE id_Producto = @id_producto)
        BEGIN
            --Si existe modificamos el stock
            UPDATE Producto
            SET Stock = @nuevo_stock
            WHERE id_Producto = @id_producto;

            PRINT 'STOCK ACTUALIZADO';
        END
        ELSE
        BEGIN
            RAISERROR ('El ID no coincide con un producto existente', 16, 1);
        END
    END TRY
    --Si ocurre un error
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END;

--Probamos:
EXEC sp_actualizar_stock 1, 150;