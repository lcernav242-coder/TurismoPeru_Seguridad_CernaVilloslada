USE TURISMOPERU_LFCV;
GO

-- ROL VENDEDOR

-- Puede consultar e insertar clientes
GRANT SELECT, INSERT
ON LFCV.cliente
TO rol_vendedor;
GO

-- Puede consultar e insertar reservas
GRANT SELECT, INSERT
ON LFCV.reserva
TO rol_vendedor;
GO

-- Puede consultar alojamientos
GRANT SELECT
ON LFCV.alojamiento
TO rol_vendedor;
GO

-- Puede consultar habitaciones
GRANT SELECT
ON LFCV.habitacion
TO rol_vendedor;
GO

-- No puede eliminar clientes
DENY DELETE
ON LFCV.cliente
TO rol_vendedor;
GO

-- No puede eliminar reservas
DENY DELETE
ON LFCV.reserva
TO rol_vendedor;
GO


-- ROL ANALISTA

-- Solo puede consultar clientes
GRANT SELECT
ON LFCV.cliente
TO rol_analista;
GO

-- Solo puede consultar reservas
GRANT SELECT
ON LFCV.reserva
TO rol_analista;
GO

-- Solo puede consultar pagos
GRANT SELECT
ON LFCV.pago
TO rol_analista;
GO

-- Solo puede consultar alojamientos
GRANT SELECT
ON LFCV.alojamiento
TO rol_analista;
GO

-- Solo puede consultar habitaciones
GRANT SELECT
ON LFCV.habitacion
TO rol_analista;
GO

-- Solo puede consultar paquetes
GRANT SELECT
ON LFCV.paquete
TO rol_analista;
GO

-- Solo puede consultar lugares turísticos
GRANT SELECT
ON LFCV.lugar_turistico
TO rol_analista;
GO


-- RESTRICCIONES DEL ROL ANALISTA

DENY INSERT, UPDATE, DELETE
ON LFCV.cliente
TO rol_analista;
GO

DENY INSERT, UPDATE, DELETE
ON LFCV.reserva
TO rol_analista;
GO

DENY INSERT, UPDATE, DELETE
ON LFCV.pago
TO rol_analista;
GO

DENY INSERT, UPDATE, DELETE
ON LFCV.alojamiento
TO rol_analista;
GO

DENY INSERT, UPDATE, DELETE
ON LFCV.habitacion
TO rol_analista;
GO

DENY INSERT, UPDATE, DELETE
ON LFCV.paquete
TO rol_analista;
GO

DENY INSERT, UPDATE, DELETE
ON LFCV.lugar_turistico
TO rol_analista;
GO