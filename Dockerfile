# Usamos la imagen oficial de PHP 8.2 con Apache
FROM php:8.2-apache

# Instalamos herramientas necesarias
RUN apt-get update && apt-get install -y unzip git zip

# Instalamos Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Instalamos extensiones para MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Instalamos Xdebug para cobertura
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Activamos modo cobertura
ENV XDEBUG_MODE=coverage

# Directorio de trabajo
WORKDIR /var/www/html

# Copiamos solo el archivo de configuración de Apache (si lo tienes)
# COPY apache.conf /etc/apache2/sites-available/000-default.conf

# Exponemos puerto 80
EXPOSE 80