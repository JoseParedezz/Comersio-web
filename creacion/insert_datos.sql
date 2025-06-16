USE BDcomercioWeb
GO
INSERT INTO Roles (nombre_rol) VALUES
	(N'Administrador'),
	(N'Vendedor');
go

INSERT INTO Categoria (Nombre_categoria) VALUES
	(N'Remeras'),
	(N'Pantalones'),
	(N'Hoodies');
go

INSERT INTO Proveedor (nombre, E_mail, telefono, direccion) VALUES
	(N'Proveedor A', N'a@email.com', 111111111, N'Calle 1'),
	(N'Proveedor B', N'b@email.com', 222222222, N'Calle 2');
go

INSERT INTO Producto (nombre_producto, descripcion, precio_compra, precio_venta, stock, fecha_vencimiento, id_categoria, id_proveedor) VALUES
	(N'Producto 1', N'Descripción producto 1', 1.0, 2.0, 100, '2025-12-01', 1, 1),
	(N'Producto 2', N'Descripción producto 2', 1.1, 2.2, 90, '2025-12-02', 1, 1),
	(N'Producto 3', N'Descripción producto 3', 1.2, 2.4, 80, '2025-12-03', 1, 1),
	(N'Producto 4', N'Descripción producto 4', 1.3, 2.6, 70, '2025-12-04', 1, 1),
	(N'Producto 5', N'Descripción producto 5', 1.4, 2.8, 60, '2025-12-05', 1, 1),
	(N'Producto 6', N'Descripción producto 6', 1.5, 3.0, 50, '2025-12-06', 1, 1),
	(N'Producto 7', N'Descripción producto 7', 1.6, 3.2, 40, '2025-12-07', 1, 1),
	(N'Producto 8', N'Descripción producto 8', 1.7, 3.4, 30, '2025-12-08', 1, 1),
	(N'Producto 9', N'Descripción producto 9', 1.8, 3.6, 20, '2025-12-09', 1, 1),
	(N'Producto 10', N'Descripción producto 10', 1.9, 3.8, 10, '2025-12-10', 1, 1),
	(N'Producto 11', N'Descripción producto 11', 2.0, 4.0, 15, '2025-12-11', 1, 1),
	(N'Producto 12', N'Descripción producto 12', 2.1, 4.2, 25, '2025-12-12', 1, 1),
	(N'Producto 13', N'Descripción producto 13', 2.2, 4.4, 35, '2025-12-13', 1, 1),
	(N'Producto 14', N'Descripción producto 14', 2.3, 4.6, 45, '2025-12-14', 1, 1),
	(N'Producto 15', N'Descripción producto 15', 2.4, 4.8, 55, '2025-12-15', 1, 1),
	(N'Producto 16', N'Descripción producto 16', 2.5, 5.0, 65, '2025-12-16', 1, 1),
	(N'Producto 17', N'Descripción producto 17', 2.6, 5.2, 75, '2025-12-17', 1, 1),
	(N'Producto 18', N'Descripción producto 18', 2.7, 5.4, 85, '2025-12-18', 1, 1),
	(N'Producto 19', N'Descripción producto 19', 2.8, 5.6, 95, '2025-12-19', 1, 1),
	(N'Producto 20', N'Descripción producto 20', 2.9, 5.8, 105, '2025-12-20', 1, 1);
go

INSERT INTO Usuario (DNI_usuario, nombre_usuario, apellido_usuario, email, telefono, id_rol) VALUES
	(10000001, N'Carlos', N'Gómez', N'carlos.gomez@email.com', 123456789, 1),
	(10000002, N'Lucía', N'Martínez', N'lucia.martinez@email.com', 987654321, 2),
	(10000003, N'Ana', N'Pérez', N'ana.perez@email.com', 112233445, 2),
	(10000004, N'Miguel', N'Soto', N'miguel.soto@email.com', 998877665, 2),
	(10000005, N'Laura', N'Vega', N'laura.vega@email.com', 554433221, 1);
go

INSERT INTO Venta (DNI_usuario, fecha_hora, importe_total, metodo_pago) VALUES
	(10000001, '2025-06-01 10:00:00.0', 150.0, N'Efectivo'),
	(10000002, '2025-06-02 11:30:00.0', 200.5, N'Tarjeta'),
	(10000003, '2025-06-03 12:15:00.0', 99.99, N'Transferencia'),
	(10000004, '2025-06-04 13:00:00.0', 175.75, N'Efectivo'),
	(10000005, '2025-06-05 14:45:00.0', 89.9, N'Tarjeta'),
	(10000001, '2025-06-06 15:20:00.0', 120.0, N'Transferencia'),
	(10000002, '2025-06-07 16:10:00.0', 310.3, N'Efectivo'),
	(10000003, '2025-06-08 17:00:00.0', 230.4, N'Tarjeta'),
	(10000004, '2025-06-09 17:45:00.0', 115.5, N'Efectivo'),
	(10000005, '2025-06-10 18:30:00.0', 275.8, N'Tarjeta');
go

INSERT INTO Registros (fecha, cantidad_compras, total_importe_mes) VALUES
	('2025-01-01', 25, 1250.0),
	('2025-02-01', 18, 980.5),
	('2025-03-01', 30, 1600.75),
	('2025-04-01', 22, 1100.9),
	('2025-05-01', 27, 1400.25),
	('2025-06-01', 10, 820.3);
go

INSERT INTO Detalles (id_venta, id_producto, cantidad) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 3),
(2, 4, 1),
(3, 5, 2),
(4, 6, 1),
(4, 7, 2),
(5, 8, 1),
(6, 9, 1),
(6, 10, 2),
(7, 11, 1),
(8, 12, 3),
(9, 13, 2),
(10, 14, 1),
(10, 15, 2);
