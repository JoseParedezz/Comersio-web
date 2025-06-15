create trigger TR_ValidarPrecios_Producto_Insert on producto
instead of insert
as
begin 
	begin try
		begin transaction
		if exists (
			select 1
			from inserted
			where precio_venta <= precio_compra  
		)
		begin
			raiserror('El precio de venta debe ser mayor que el precio de compra.', 14, 1);
			rollback transaction
			return
		end
		
		insert into Producto (
			nombre_producto, descripcion, precio_compra, precio_venta, stock, fecha_vencimiento, id_categoria, id_proveedor
		)
		select nombre_producto, descripcion, precio_compra, precio_venta, stock, fecha_vencimiento, id_categoria, id_proveedor
        from inserted

		commit transaction 
	end try
	begin catch
		rollback transaction
	end catch
end
