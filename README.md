# TurismoPeru Seguridad - Cerna Villoslada

## Descripción
Proyecto de administración y seguridad de la base de datos TURISMOPERU_LFCV.

El proyecto implementa control de usuarios, roles, permisos, pruebas de seguridad, importación y exportación de datos, respaldo de base de datos y documentación del proceso mediante Git y GitHub.

## Tecnologías utilizadas
- SQL Server
- SQL Server Management Studio
- BCP
- Git
- GitHub
- Power BI

## Base de datos
Base de datos utilizada:

TURISMOPERU_LFCV

Esquema principal:

LFCV

## Funcionalidades implementadas
- Creación de logins.
- Creación de usuarios de base de datos.
- Creación de roles.
- Asignación de permisos.
- Aplicación del principio de mínimo privilegio.
- Pruebas de seguridad.
- Importación y exportación mediante BCP.
- Backup completo en formato BACPAC.
- Control de versiones mediante Git y GitHub.

## Estructura del proyecto

- `01_usuarios_roles`: scripts de logins, usuarios, roles y permisos.
- `02_importacion_exportacion`: scripts y archivos de intercambio de datos.
- `03_backups`: respaldo completo de la base de datos.
- `04_seguridad`: pruebas de permisos.
- `05_reportes`: reporte final.
- `06_powerbi`: archivos relacionados con Power BI.
- `evidencias`: capturas que demuestran la ejecución del proyecto.

## Scripts disponibles

### 01_logins.sql
Crea los logins necesarios en SQL Server.

### 02_users.sql
Crea los usuarios asociados a los logins dentro de TURISMOPERU_LFCV.

### 03_roles.sql
Crea los roles de vendedor y analista.

### 04_permisos.sql
Asigna los permisos correspondientes según las responsabilidades de cada rol.

### importacion.sql
Implementa la tabla de staging, validación de registros y detección de duplicados.

### pruebas_permisos.sql
Permite comprobar que los usuarios pueden realizar únicamente las operaciones autorizadas.

## Principio de mínimo privilegio

No se asigna `db_owner` al vendedor ni al analista porque este rol otorga control completo sobre la base de datos.

El vendedor recibe únicamente los permisos necesarios para consultar y registrar información relacionada con clientes y reservas.

El analista dispone solamente de permisos de lectura, ya que su función consiste en consultar información para la generación de reportes.

## Backup y restauración

Se generó un respaldo completo en formato BACPAC:

`03_backups/TurismoPeru_LFCV_Full.bacpac`

Este archivo permite conservar el esquema y los datos de la base de datos para su posterior importación o restauración.

## Importación y exportación

La exportación de datos se realizó mediante la herramienta BCP de SQL Server.

Se trabajó con información relacionada con:

- Clientes.
- Reservas.
- Pagos.
- Lugares turísticos.

Para la importación se utiliza una tabla de staging denominada:

`LFCV.cliente_importacion`

Antes de insertar información se realizan validaciones de datos incompletos, duplicados y registros previamente existentes.

## Evidencias

Las evidencias se encuentran en la carpeta `evidencias`.

Se incluyen capturas relacionadas con:

- Creación de logins.
- Roles.
- Permisos.
- Backup de la base de datos.
- Pruebas de seguridad.

## Autor
Cerna Villoslada