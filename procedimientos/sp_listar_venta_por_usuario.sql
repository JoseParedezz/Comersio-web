create procedure sp_listar_venta_por_usuario(
	@DNI_usuario int
)
as
begin
	begin try
		select V.id_venta, V.fecha_hora, V.importe_total, V.metodo_pago,
		U.nombre_usuario, U.apellido_usuario from Venta V
		inner join  Usuario U on V.DNI_usuario = U.DNI_usuario
		where u.DNI_usuario = @DNI_usuario
		order by v.fecha_hora desc
	end try
	begin catch
		
	end catch
end
