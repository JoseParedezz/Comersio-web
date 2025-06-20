create procedure sp_buscar_producto_por_categoria
    @id_categoria int
as
begin
    begin try
        select 
            id_producto,
            nombre_producto,
            descripcion,
            precio_compra,
            precio_venta,
            stock,
            fecha_vencimiento,
            id_categoria,
            id_proveedor
        from producto
        where id_categoria = @id_categoria;
    end try
    begin catch
        declare @msg nvarchar(4000) = error_message();
        raiserror('Error: %s', 16, 1, @msg);
    end catch
end;

--exec sp_buscar_producto_por_categoria @id_categoria = 1;