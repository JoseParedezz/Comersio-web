create procedure sp_registrar_detelle_venta
    @id_venta INT,
    @id_producto INT,
    @cantidad INT
as
begin
    set nocount on;

    insert into Detalles (id_venta, id_producto, cantidad)
    values (@id_venta, @id_producto, @cantidad);

    update Producto
    set stock = stock - @cantidad
    where id_Producto = @id_producto;
end;
go


-- exec RegistrarDetalleVenta
--     @id_venta = x,
--     @id_producto = x, 
--     @cantidad = x;
