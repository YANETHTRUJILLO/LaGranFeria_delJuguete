# Imagen oficial de PHP 8.2 con Apache
FROM php:8.2-apache

# Instalar herramientas necesarias
RUN apt-get update && apt-get install -y unzip git zip

# Instalar Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Instalar extensiones MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Instalar Xdebug para cobertura
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Activar modo cobertura
ENV XDEBUG_MODE=coverage

# Directorio de trabajo
WORKDIR /var/www/html

# Copiar proyecto (tu Jenkinsfile usa volumen, así que aquí no se sobreescribe)
COPY . /var/www/html/

# Exponer puerto Apache
EXPOSE 80