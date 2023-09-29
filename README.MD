# Jenkins & Ansible

## Dockerfile

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



## Docker-compose

### Descripción

El archivo `docker-compose.yml` proporciona una configuración para orquestar y ejecutar un contenedor de Jenkins utilizando Docker Compose. Este entorno está diseñado para trabajar junto con el Dockerfile anterior que crea una imagen personalizada de Jenkins con Ansible.

- **Versión de Docker Compose**: Se utiliza la versión 3 de Docker Compose para definir la estructura del servicio.
- **Servicio de Jenkins**:
  - `container_name`: Asigna el nombre "jenkins" al contenedor.
  - `image`: Indica que se utilizará la imagen "ansible" (la que hemos construido previamente con el Dockerfile personalizado).
  - `build`: Especifica que se construirá el contenedor utilizando el contexto del directorio "ansible", lo que significa que se utilizará el Dockerfile presente en ese directorio para crear la imagen.
  - `ports`: Mapea el puerto 8080 del host al puerto 8080 del contenedor, lo que permite acceder a la interfaz web de Jenkins desde el host.
  - `volumes`: Monta un volumen para persistir los datos de Jenkins en el directorio `$PWD/jenkins_home` del host.
  - `networks`: Conecta el servicio al grupo de red "jenkins-net" para facilitar la comunicación entre contenedores si es necesario.

- **Redes**:
  - `jenkins-net`: Define una red personalizada llamada "jenkins-net" que se utiliza para conectar los contenedores de Jenkins y otros servicios si es necesario.

Este archivo de Docker Compose facilita la ejecución y gestión del entorno de Jenkins junto con Ansible en contenedores, lo que es útil para automatizar flujos de trabajo de CI/CD y administración de infraestructura.

