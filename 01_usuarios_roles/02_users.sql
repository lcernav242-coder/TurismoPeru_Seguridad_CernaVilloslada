USE TURISMOPERU_LFCV;
GO

CREATE USER turismo_admin
FOR LOGIN turismo_admin;
GO

CREATE USER turismo_vendedor
FOR LOGIN turismo_vendedor;
GO

CREATE USER turismo_analista
FOR LOGIN turismo_analista;
GO

--consulta
SELECT
    name,
    type_desc
FROM sys.database_principals
WHERE name IN (
    'turismo_admin',
    'turismo_vendedor',
    'turismo_analista'
);
GO