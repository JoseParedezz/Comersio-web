USE BDcomercioWeb
GO
CREATE PROCEDURE sp_buscar_stock_productos(
    @stock INT
)
as 
begin   
    begin try
        select
            id_Producto,
            nombre_producto,
            precio_venta,
            stock,
            id_categoria,
            id_proveedor
        from Producto
        where stock < @stock;
    end try
    begin catch
        print error_message()
    end catch
end;
