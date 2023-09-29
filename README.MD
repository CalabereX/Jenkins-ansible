## Jenkins & Ansible

### Descripción

Este repositorio contiene un archivo Dockerfile diseñado para crear una imagen de contenedor optimizada para ejecutar Jenkins junto con Ansible. La imagen se basa en la imagen oficial de Jenkins y se realizan varias configuraciones clave para garantizar un entorno funcional y seguro.

### Pasos Clave

1. **Selección de la Imagen Base**: Utilizamos la imagen oficial de Jenkins como punto de partida para nuestro contenedor.

2. **Cambios de Usuario**: Cambiamos temporalmente al usuario "root" dentro del contenedor para realizar instalaciones de software a nivel del sistema.

3. **Actualización e Instalación de Paquetes**: Actualizamos el sistema operativo y agregamos paquetes esenciales, como "software-properties-common" y "python3-pip", necesario para instalar pip, una herramienta de gestión de paquetes de Python.

4. **Configuración de Ansible**: Agregamos manualmente el repositorio de software de Ansible al sistema para permitir su instalación.

5. **Instalación de Ansible**: Después de agregar el repositorio, actualizamos nuevamente el sistema y procedemos a instalar Ansible.

6. **Seguridad del Contenedor**: Finalmente, volvemos a cambiar al usuario "jenkins" para evitar que Jenkins se ejecute como usuario "root" dentro del contenedor, lo cual es una práctica de seguridad recomendada.

Este Dockerfile proporciona una base sólida para ejecutar Jenkins junto con Ansible en un entorno de contenedorizado, lo que facilita la automatización de tareas de CI/CD y la administración de infraestructura.
