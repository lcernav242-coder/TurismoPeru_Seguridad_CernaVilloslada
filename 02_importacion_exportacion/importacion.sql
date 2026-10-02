USE TURISMOPERU_LFCV;
GO

IF OBJECT_ID('LFCV.cliente_importacion', 'U') IS NOT NULL
    DROP TABLE LFCV.cliente_importacion;
GO

CREATE TABLE LFCV.cliente_importacion
(
    Documento        VARCHAR(20),
    Nombres          VARCHAR(100),
    ApellidoPaterno  VARCHAR(100),
    ApellidoMaterno  VARCHAR(100)
);
GO

-- Registros incompletos
SELECT *
FROM LFCV.cliente_importacion
WHERE Documento IS NULL
   OR Nombres IS NULL
   OR ApellidoPaterno IS NULL;
GO

-- Duplicados
SELECT Documento, COUNT(*) AS Cantidad
FROM LFCV.cliente_importacion
GROUP BY Documento
HAVING COUNT(*) > 1;
GO

-- Documentos que ya existen
SELECT ci.*
FROM LFCV.cliente_importacion ci
INNER JOIN LFCV.persona p
    ON p.numero_documento = ci.Documento;
GO

-- Registros válidos nuevos
SELECT ci.*
FROM LFCV.cliente_importacion ci
WHERE ci.Documento IS NOT NULL
  AND ci.Nombres IS NOT NULL
  AND ci.ApellidoPaterno IS NOT NULL
  AND NOT EXISTS (
      SELECT 1
      FROM LFCV.persona p
      WHERE p.numero_documento = ci.Documento
  )
  AND ci.Documento IN (
      SELECT Documento
      FROM LFCV.cliente_importacion
      GROUP BY Documento
      HAVING COUNT(*) = 1
  );
GO