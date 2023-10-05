# Utilizamos la imagen oficial de Jenkins como base
FROM jenkins/jenkins

# Cambiamos al usuario root para instalar software a nivel de sistema
USER root

# Actualizamos el sistema e instalamos paquetes necesarios
RUN apt-get update && apt-get install -y \
    software-properties-common \
    python3-pip  # Instalamos pip

# Agregamos el repositorio de Ansible manualmente
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu focal main" \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367

# Actualizamos nuevamente el sistema e instalamos Ansible
RUN apt-get update && apt-get install -y ansible

# Volvemos a cambiar al usuario jenkins para evitar ejecutar Jenkins como root
USER jenkins
