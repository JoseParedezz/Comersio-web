use BDcomercioWeb
go
create trigger tr_actualizar_registro_en_detalles
on Detalles
after insert
as
begin
    set nocount on;

    declare @mes date;

    select top 1 @mes = DATEFROMPARTS(YEAR(v.fecha_hora), month(v.fecha_hora), 1)
    from inserted i
    join Venta v on i.id_venta = v.id_venta;

    declare @importe_total float;
    declare @stock_total int;

    select 
        @importe_total = sum(i.precio_venta * i.cantidad),
        @stock_total = sum(i.cantidad)
    from inserted i;


   if exists (select 1 from Registros where fecha = @mes)
    begin
        update Registros
        set
            cantidad_compras = cantidad_compras + @stock_total,
            total_importe_mes = total_importe_mes + @importe_total
        where fecha = @mes;
    end
    else
    begin
        insert into Registros (fecha, cantidad_compras, total_importe_mes)
        values (@mes, @stock_total, @importe_total);
    end
end;


