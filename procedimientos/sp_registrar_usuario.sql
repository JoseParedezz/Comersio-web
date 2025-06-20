create procedure sp_registrar_usuario
    @DNI_usuario int,
    @nombre_usuario varchar(100),
    @apellido_usuario varchar(100),
    @email varchar(100),
    @telefono int,
    @id_rol int
as
begin
    begin try
        insert into Usuario (DNI_usuario, nombre_usuario, apellido_usuario, email, telefono, id_rol)
        values (@DNI_usuario, @nombre_usuario, @apellido_usuario, @email, @telefono, @id_rol);
    end try
    begin catch
        declare @msg nvarchar(4000) = error_message();
        raiserror('Error capturado: %s', 16, 1, @msg);
    end catch
end;

-- exec sp_registrar_usuario
--     @DNI_usuario = x,
--     @nombre_usuario = '',
--     @apellido_usuario = '',
--     @email = '',
--     @telefono = x,
--     @id_rol = x;  