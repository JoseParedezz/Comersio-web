USE BDcomercioWeb
GO

CREATE PROCEDURE sp_registro_proveedor(
    -- Establecemos los parametros:
    @nombre varchar (100),
    @E_mail varchar(100),
    @telefono int,
    @direccion varchar(150)
)
-- Inicio del procedimiento:
AS 
BEGIN
 -- Comenzamos el manejo de errores
 BEGIN TRY
   -- Verificamos que no haya un proveedor con el mismo Mail
    IF EXISTS (SELECT 1 FROM Proveedor WHERE E_mail = @E_mail) -- Usamos email porque el id se autocompleta
        BEGIN
            RAISERROR('Ya existe en la lista un proveedor con ese E-mail.', 16, 1)
            RETURN
    END

     INSERT INTO Proveedor (nombre, E_mail, telefono, direccion)
       VALUES(@nombre, @E_mail, @telefono, @direccion)
     END TRY
     --Si ocurre un error
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH    
 -- Final del procedimiento
END

--Probamos que esté bien:

EXEC sp_registro_proveedor
    'Prueba', 
    'prueba@gmail.com', 
    123455, 
    'Hipolito Yrigoyen 123';

-- Verificamos los procedimientos de nuestra Store Procedures
SELECT name FROM sys.procedures;
