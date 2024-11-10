FROM php:8.1.2-fpm-alpine3.15

USER root

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Install database driver (enable acces from PHP to MYSQL database)
RUN docker-php-ext-install pdo pdo_mysql mysqli
