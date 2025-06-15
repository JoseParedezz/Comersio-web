USE BDcomercioWeb;
GO

create trigger tr_actualizar_registro
on Venta
after insert
as
BEGIN
    set nocount on;

    declare @mes DATE
    declare @importe_total FLOAT
    declare @stock_total INT

    select @mes = DATEFROMPARTS(year(fecha_hora), month(fecha_hora), 1)
    from inserted;

    select
        @importe_total = sum(v.importe_total),
        @stock_total = sum(d.cantidad)
    from Venta as v
    JOIN insterted i on v.id_venta = i.id_venta
    JOIN Detalles d on d.id_venta = v.id_venta;

    if EXISTS (select 1 from Registros where fecha = @mes)
        BEGIN
            UPDATE Registros
            SET
                Cantidad_compras = cantidad_compras + @stock_total,
                total_importe_mes = total_importe_mes + @importe_total
            WHERE fecha = @mes;
    END
    ELSE
        BEGIN
            insert into Registros (fecha, cantidad_compras, total_importe_mes)
            values (@mes, @importe_total, @stock_total);
        END
end;
go

SELECT name
FROM sys.triggers;
