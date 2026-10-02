USE TURISMOPERU_LFCV;
GO

-- 
-- PRUEBAS DE PERMISOS
-- Usuario: turismo_analista

-- Ejecutar temporalmente como el usuario analista
EXECUTE AS USER = 'turismo_analista';
GO


-- PRUEBA 1: SELECT PERMITIDO
-- Esta consulta debe ejecutarse correctamente
-- 

SELECT TOP 5 *
FROM LFCV.cliente;
GO


-- PRUEBA 2: INSERT NO PERMITIDO
-- SQL Server debe rechazar esta operación

BEGIN TRY

    INSERT INTO LFCV.cliente
    DEFAULT VALUES;

    PRINT 'ERROR: el analista pudo insertar información.';

END TRY
BEGIN CATCH

    PRINT 'PRUEBA CORRECTA: el analista NO puede insertar información.';

    SELECT
        ERROR_NUMBER() AS NumeroError,
        ERROR_MESSAGE() AS MensajeError;

END CATCH;
GO


-- Regresar al usuario original
REVERT;
GO


-- Verificar que regresamos al usuario original
SELECT USER_NAME() AS UsuarioActual;
GO

EXECUTE AS USER = 'turismo_analista';
GO

SELECT TOP 5 *
FROM LFCV.cliente;
GO

REVERT;
GO