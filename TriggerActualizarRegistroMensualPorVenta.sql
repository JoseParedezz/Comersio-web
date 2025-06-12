create trigger ActualizarRegistro
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
    from Venta v
    JOIN insterted i on v.id_venta = i.id_venta
    JOIN Detalles d on d.id_venta = v.id_venta;
    -- Usamos los joins para unir las tablas

    if EXISTS (select 1 from Registros where fehca = @mes)
        BEGIN
            UPDATE Registros
            SET
                Cantidad_compras = cantidad_compras + @stock_total,
                total_mes = total mes + @importe_total
            WHERE fecha = @mes;
    END
    ELSE
        BEGIN
            insert into Registros (fecha, cantidad_compras, total_importe_mes)
            values (@mes, @importe_total, @stock_total);
        END
end;
go

        