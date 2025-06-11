create trigger ActualizarStockPorVenta
on Detalles
after insert
as
begin
    set nocount on;

    if exists (
        select 1
        from inserted i
        join Producto p on p.id_Producto = i.id_producto
        where p.stock < i.cantidad
    )
    begin
        rollback transaction;
        raiserror('Stock insuficiente para uno o más productos.', 16, 1);
        return;
    end;

    update p
    set p.stock = p.stock - i.cantidad
    from Producto p
    inner join inserted i on p.id_Producto = i.id_producto;
end;