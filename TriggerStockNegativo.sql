-- Trigger para evitar una venta que deje stock negativo a los productos
USE BDcomercioWeb;
GO

create trigger StockNegativo
on Detalles
after INSERT
AS
BEGIN
    SET nocount on;

    if EXISTS (
        SELECT 1 
        FROM inserted i 
        JOIN Producto p on i.id_prodcuto = p.Producto
        WHERE i.cantidad >= p.stock
    )
    -- Preguntamos si algun insert pide una cantidad del inserted mayor al stock de producto
    BEGIN
        rollback transaction;
        raiserror('No se puede ralizar la compra por falta de stock', 16, 1)
        return;
        end;
    -- Si la cantidad que se quiere comprar es mayor a la cantidad se muestra el mensaje que no hay stock

    UPDATE p
    SET p.stock = p.stock - i.cantidad
    FROM Producto p
    JOIN inserted i ON p.id_Producto = i.id_producto;
    -- Restamos los productos que se vendieron
END;
GO