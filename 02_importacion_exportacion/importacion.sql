USE TURISMOPERU_LFCV;
GO

-- TABLA DE STAGING PARA IMPORTACIÓN DE CLIENTES

CREATE TABLE LFCV.cliente_importacion (
    Documento VARCHAR(20) NOT NULL,
    Nombres VARCHAR(100) NULL,
    ApellidoPaterno VARCHAR(100) NULL,
    ApellidoMaterno VARCHAR(100) NULL
);
GO

-- Verificar que la tabla fue creada
SELECT *
FROM LFCV.cliente_importacion;
GO


USE TURISMOPERU_LFCV;
GO

SELECT *
FROM LFCV.cliente_importacion;
GO

SELECT * FROM LFCV.cliente_importacion

-- VALIDACIÓN DE REGISTROS IMPORTADOS

SELECT
    Documento,
    Nombres,
    ApellidoPaterno,
    ApellidoMaterno,
    CASE
        WHEN Documento IS NULL OR LTRIM(RTRIM(Documento)) = ''
            THEN 'INVALIDO: documento vacío'

        WHEN Nombres IS NULL OR LTRIM(RTRIM(Nombres)) = ''
            THEN 'INVALIDO: nombres vacíos'

        WHEN ApellidoPaterno IS NULL OR LTRIM(RTRIM(ApellidoPaterno)) = ''
            THEN 'INVALIDO: apellido paterno vacío'

        WHEN ApellidoMaterno IS NULL OR LTRIM(RTRIM(ApellidoMaterno)) = ''
            THEN 'INVALIDO: apellido materno vacío'

        ELSE 'VALIDO'
    END AS EstadoValidacion
FROM LFCV.cliente_importacion;
GO

-- IDENTIFICACIÓN DE DUPLICADOS

SELECT
    Documento,
    COUNT(*) AS Cantidad
FROM LFCV.cliente_importacion
GROUP BY Documento
HAVING COUNT(*) > 1;
GO


----------
-- INSERTAR REGISTROS VALIDOS


;WITH DatosValidos AS (
    SELECT DISTINCT
        Documento,
        Nombres,
        ApellidoPaterno,
        ApellidoMaterno
    FROM LFCV.cliente_importacion
    WHERE Documento IS NOT NULL
      AND Nombres IS NOT NULL
      AND ApellidoPaterno IS NOT NULL
      AND ApellidoMaterno IS NOT NULL
)

INSERT INTO LFCV.persona (
    tipo_persona,
    nombres,
    apaterno,
    amaterno,
    razon_social,
    id_tipo_documento,
    numero_documento,
    id_nacionalidad
)
SELECT
    'N',
    Nombres,
    ApellidoPaterno,
    ApellidoMaterno,
    CONCAT(Nombres, ' ', ApellidoPaterno, ' ', ApellidoMaterno),
    1,      -- DNI
    Documento,
    142     -- Peruano/a
FROM DatosValidos d
WHERE NOT EXISTS (
    SELECT 1
    FROM LFCV.persona p
    WHERE p.numero_documento = d.Documento
);
GO


-- Crear los clientes asociados a las personas importadas
INSERT INTO LFCV.cliente (id_persona)
SELECT p.id_persona
FROM LFCV.persona p
INNER JOIN (
    SELECT DISTINCT Documento
    FROM LFCV.cliente_importacion
) i
    ON p.numero_documento = i.Documento
WHERE NOT EXISTS (
    SELECT 1
    FROM LFCV.cliente c
    WHERE c.id_persona = p.id_persona
);
GO

----
SELECT
    p.id_persona,
    p.numero_documento,
    p.nombres,
    p.apaterno,
    p.amaterno
FROM LFCV.persona p
WHERE p.numero_documento IN (
    SELECT Documento
    FROM LFCV.cliente_importacion
);
GO

-----
SELECT
    p.numero_documento,
    p.nombres,
    p.apaterno,
    p.amaterno
FROM LFCV.persona p
WHERE p.numero_documento IN (
    SELECT Documento
    FROM LFCV.cliente_importacion
);
GO