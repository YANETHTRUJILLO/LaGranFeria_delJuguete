# --- Etapa 1: Instalar Dependencias del Sistema ---
# Usamos una imagen base con PHP y Apache
FROM php:8.2-apache

# Instalación de herramientas de sistema y extensiones de PHP necesarias
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    unzip \
    zip \
    && rm -rf /var/lib/apt/lists/*

# Instalar extensiones de PHP para MySQL (mysqli, pdo y pdo_mysql)
RUN docker-php-ext-install -j$(nproc) mysqli pdo pdo_mysql

# Instalar y habilitar XDebug (necesario para la cobertura de código)
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# --- Etapa 2: Instalar Composer y Configurar el Contenedor ---
# Copiamos Composer desde una imagen oficial (multi-stage build)
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Configurar el directorio de trabajo (Working Directory)
WORKDIR /var/www/html

# *** CORRECCIÓN CLAVE: ELIMINAR EL COPY ***
# La línea COPY . /var/www/html/ debe ser eliminada/comentada.
# El código se monta en tiempo de ejecución desde docker-compose.yml.

# Exponer puerto 80 para el servicio 'web'
EXPOSE 80

# Comando por defecto (para el servicio web, el servicio tests usará sh)
CMD ["apache2-foregroud"]