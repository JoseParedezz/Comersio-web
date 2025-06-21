USE BDcomercioWeb;
GO

create trigger tr_stock_negativo
on Detalles
after INSERT
AS
BEGIN
    SET nocount on;

    if EXISTS (
        SELECT 1 
        FROM inserted i 
        JOIN Producto p on i.id_producto = p.id_producto
        WHERE i.cantidad >= p.stock
    )
    BEGIN
        rollback transaction;
        raiserror('No se puede ralizar la compra por falta de stock', 16, 1)
        return;
        end;

    UPDATE p
    SET p.stock = p.stock - i.cantidad
    FROM Producto p
    JOIN inserted i ON p.id_Producto = i.id_producto;
END;
GO
