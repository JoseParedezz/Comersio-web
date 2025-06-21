create procedure sp_registrar_detalle_venta
    @id_venta int,
    @id_producto int,
    @cantidad int
as
begin
    begin try
        declare @precio_venta float;

        select @precio_venta = precio_venta
        from Producto
        where id_Producto = @id_producto;

        if exists (
            select 1
            from detalles
            where id_venta = @id_venta and id_producto = @id_producto
        )

        begin
            update detalles
            set cantidad = cantidad + @cantidad
            where id_venta = @id_venta and id_producto = @id_producto;
        end
        
        else
        begin
            insert into detalles (id_venta, id_producto, cantidad, precio_venta)
            values (@id_venta, @id_producto, @cantidad, @precio_venta);
        end

        update producto
        set stock = stock - @cantidad
        where id_producto = @id_producto;
    end try
    begin catch
        declare @msg nvarchar(4000) = error_message();
        raiserror('Error: %s', 16, 1, @msg);
    end catch
end;

--EXEC sp_registrar_detalle_venta @id_venta = x, @id_producto = x, @cantidad = x;