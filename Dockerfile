# Usamos la imagen oficial de PHP 8.2 con Apache ya configurado.
FROM php:8.2-apache

# Actualizamos la lista de paquetes e instalamos herramientas útiles:
# - unzip, git, zip: herramientas básicas para Composer
RUN apt-get update && apt-get install -y unzip git zip

# Copiamos el ejecutable de Composer desde la imagen oficial de Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Instalamos las extensiones necesarias para trabajar con MySQL:
RUN docker-php-ext-install mysqli pdo pdo_mysql

# --- CAMBIOS NECESARIOS PARA CODE COV (COBERTURA) ---

# 1. Instalamos Xdebug (el driver que mide la cobertura de código)
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# 2. Configuramos Xdebug para que funcione en modo 'coverage'. 
#    Esto es esencial para PHP 8+ y genera el reporte.
ENV XDEBUG_MODE=coverage

# --- FIN DE CAMBIOS NECESARIOS ---

# Copiamos todo el contenido del proyecto dentro del servidor Apache
COPY . /var/www/html/

# Definimos la carpeta de trabajo dentro del contenedor
WORKDIR /var/www/html

# Ejecutamos "composer install" para instalar todas las dependencias
RUN composer install

# Cambiamos los permisos de la carpeta del proyecto para que Apache (www-data)
# pueda leer y ejecutar correctamente los archivos.
RUN chown -R www-data:www-data /var/www/html

# Exponemos el puerto 80 para que se pueda acceder al servidor Apache
EXPOSE 80