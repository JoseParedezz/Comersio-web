USE BDcomercioWeb
GO

CREATE PROCEDURE sp_registro_nueva_venta (
    @DNI_usuario INT,
    @metodo_pago varchar(50),
    @importe_total float
)
-- Inicio del procedimiento:
AS 
BEGIN
    -- Comenzamos el manejo de errores
    BEGIN TRY
        -- Insertamos la venta en la tabla Venta
        INSERT INTO Venta (DNI_usuario, fecha_hora, importe_total, metodo_pago)
        VALUES (@DNI_usuario, GETDATE(), @importe_total, @metodo_pago);
        --GATEDATE es la función que nos trae la fecha y hora
    END TRY
     --Si ocurre un error
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH    
 -- Final del procedimiento
END

--Prueba:
--Primero traemos el DNI de un usuario que ya existe
--USE BDcomercioWeb;
--GO
--SELECT DNI_usuario, nombre_usuario FROM Usuario;

--Registramos una nueva venta con el DNI del ususario
--EXEC sp_registro_nueva_venta 
    --10000001, 
    --'Efectivo', 
    --2000;

--Verificamos el ID de la venta
--SELECT TOP 1 * 
--FROM Venta 
--ORDER BY id_venta DESC;

--Cargammos los productos de la venta con el ID correspondiente:
--INSERT INTO Detalles (id_venta, id_producto, cantidad)
--VALUES 
    --(21, 1, 2),  
    --(21, 2, 1);

--SELECT * FROM Registros ORDER BY fecha DESC;
