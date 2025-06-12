create procedure SP_agregarVenta(
    @DNI_usuario int,
    @fecha_hora datetime,
    @importe_total float,
    @metodo_pago varchar(50)
)
as
begin
	insert into Venta(DNI_usuario, fecha_hora, importe_total, metodo_pago)
	values (@DNI_usuario, @fecha_hora, @importe_total, @metodo_pago)
end
