USE TURISMOPERU_LFCV;
GO

-- Creación de roles

CREATE ROLE rol_vendedor;
GO

CREATE ROLE rol_analista;
GO

-- Asignación de usuarios a sus respectivos roles

ALTER ROLE rol_vendedor
ADD MEMBER turismo_vendedor;
GO

ALTER ROLE rol_analista
ADD MEMBER turismo_analista;
GO

-- Verificación de roles creados

SELECT
    name,
    type_desc
FROM sys.database_principals
WHERE name IN (
    'rol_vendedor',
    'rol_analista'
);
GO