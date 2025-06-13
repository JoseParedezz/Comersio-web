create procedure sp_buscar_producto_por_categoria
    @id_categoria INT
as
begin
    set nocount on;

    select 
        id_Producto,
        nombre_producto,
        descripcion,
        precio_compra,
        precio_venta,
        stock,
        fecha_vencimiento,
        id_categoria,
        id_proveedor
    from Producto
    where id_categoria = @id_categoria;
END;
GO

-- exec BuscarProductoPorCategoria @id_categoria = 1;