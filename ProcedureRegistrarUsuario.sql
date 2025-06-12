create procedure RegistrarUsuario
    @DNI_usuario INT,
    @nombre_usuario VARCHAR(100),
    @apellido_usuario VARCHAR(100),
    @email VARCHAR(100),
    @telefono INT,
    @id_rol INT
as
begin
    set nocount on;

    insert int Usuario (DNI_usuario, nombre_usuario, apellido_usuario, email, telefono, id_rol)
    values (@DNI_usuario, @nombre_usuario, @apellido_usuario, @email, @telefono, @id_rol);
end;
go

-- exec RegistrarUsuario
--     @DNI_usuario = x,
--     @nombre_usuario = '',
--     @apellido_usuario = '',
--     @email = '',
--     @telefono = x,
--     @id_rol = x;  