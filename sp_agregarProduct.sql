create procedure sp_agregarProducto(   
	@nombre_producto varchar(100),
    @descripcion varchar(255),
    @precio_compra float,
    @precio_venta float,
    @stock int,
    @fecha_vencimiento date,
    @id_categoria int,
    @id_proveedor int)
as
begin
	insert into Producto(nombre_producto, descripcion, precio_compra,
	 precio_venta, stock, fecha_vencimiento, id_categoria, id_proveedor)
	values(@nombre_producto, @descripcion, @precio_compra, @precio_venta,
	@stock, @fecha_vencimiento, @id_categoria, @id_proveedor)
end
