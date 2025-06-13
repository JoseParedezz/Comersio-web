create view vw_usuario_roles as
select 
    U.DNI_usuario,
    U.nombre_usuario,
    U.apellido_usuario,
    U.email,
    U.telefono,
    R.nombre_rol
from Usuario U
inner join Roles R on U.id_rol = R.id_rol;