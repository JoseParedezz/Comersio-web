use BDcomercioWeb
go

create trigger tr_email_duplicado on Usuario 
instead of insert
as
begin 
	begin try
		begin transaction
		
		if exists (
			select 1
			from inserted as i
			where exists(
				select 1 from usuario u where u.email = i.email
			)
		)
		begin
			raiserror('El correo electronico ya existe en la base de datos.', 15, 1);
			rollback transaction
			return
		end

		insert into Usuario (DNI_usuario, nombre_usuario, apellido_usuario, email, telefono, id_rol)
		SELECT DNI_usuario, nombre_usuario, apellido_usuario, email, telefono, id_rol
		from inserted

		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
end
