# Prueba Técnica - Ingreso a Pragma

Este proyecto es una prueba técnica para el proceso de ingreso a la empresa **Pragma**. A continuación, se describen las características y la arquitectura de la aplicación.

## Arquitectura

El proyecto está diseñado para seguir un enfoque modular, utilizando **inyección de dependencias** a través de un mecanismo llamado `injectionDependency`. Esta arquitectura asegura una alta flexibilidad y permite adaptar el comportamiento de la aplicación según el entorno de desarrollo.

### Flujo de la Aplicación

1. **Interfaz de Usuario (UI):**  
   Desde la UI se obtienen los casos de uso (Use Cases) necesarios para invocar los servicios requeridos.

2. **Casos de Uso (Use Cases):**  
   Los casos de uso gestionan la lógica del negocio y seleccionan el repositorio adecuado según el modo de desarrollo (por ejemplo, desarrollo local o producción).

3. **Repositorios:**  
   Los repositorios se encargan de acceder a los datos, ya sea desde un servicio remoto, una base de datos local, o simulaciones de datos para pruebas.

## Funcionalidades

- **Tema Oscuro y Claro:**  
  La aplicación permite alternar entre un tema oscuro y un tema claro, mejorando la experiencia del usuario según su preferencia.

- **Soporte Multilenguaje:**  
  La aplicación cuenta con una arquitectura preparada para soportar múltiples idiomas. Sin embargo, por razones de tiempo, esta funcionalidad no está completamente implementada.

## Descargar la Aplicación

Si deseas probar la aplicación en Android, puedes descargar el archivo APK desde:  
`/app-release.apk`

## Consideraciones

Este proyecto está estructurado para ser fácilmente escalable y adaptable a las necesidades futuras. La separación de responsabilidades y la inyección de dependencias garantizan un código limpio y mantenible.
