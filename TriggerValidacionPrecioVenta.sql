create trigger ValidarPrecioVenta
on Producto
after update
as
begin
    set nocount on;

    if exists (
        select 1
        from inserted i
        where i.precio_venta < i.precio_compra
    )
    begin
        rollback transaction;
        raiserror('El precio de venta no puede ser menor que el precio de compra.', 16, 1);
        return;
    end
end
go
