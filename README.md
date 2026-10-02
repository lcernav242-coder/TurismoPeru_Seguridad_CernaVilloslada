# TurismoPeru_Seguridad_CernaVilloslada

## Descripción

Proyecto correspondiente a la Tercera Evaluación del curso Base de Datos II.

El objetivo es implementar mecanismos básicos de administración y seguridad para la base de datos de TurismoPeru, incluyendo:

- Creación de logins y usuarios.
- Creación de roles.
- Asignación de permisos.
- Aplicación del principio de mínimo privilegio.
- Importación y exportación de datos.
- Respaldo de la base de datos.
- Pruebas de seguridad.
- Gestión del proyecto mediante Git y GitHub.
- Elaboración de reportes mediante Power BI.

## Tecnologías utilizadas

- Microsoft SQL Server
- SQL Server Management Studio / SQL Server
- Visual Studio Code
- Git
- GitHub
- Power BI Desktop

## Requisitos

- SQL Server instalado o acceso a un servidor SQL Server.
- Acceso a la base de datos asignada.
- Git instalado.
- Cuenta de GitHub.
- Visual Studio Code.
- Power BI Desktop.

## Base de datos

Base de datos utilizada:

```text
TURISMOPERU_LFCV

## Principio de mínimo privilegio

El principio de mínimo privilegio establece que cada usuario debe disponer únicamente de los permisos necesarios para realizar sus funciones.

No es adecuado asignar el rol `db_owner` al vendedor ni al analista porque este rol concede control completo sobre la base de datos.

El vendedor únicamente necesita registrar y consultar información relacionada con clientes y reservas, además de consultar alojamientos y habitaciones. No necesita administrar usuarios, roles, logins, respaldos ni eliminar información crítica.

El analista únicamente necesita permisos de lectura para consultar la información utilizada en los reportes. No debe realizar operaciones `INSERT`, `UPDATE` ni `DELETE`.

Por este motivo se crearon los roles `rol_vendedor` y `rol_analista`, asignándoles únicamente los permisos necesarios para cumplir sus respectivas funciones.