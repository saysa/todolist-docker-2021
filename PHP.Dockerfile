FROM php:7.4-fpm as base

ARG WORKFOLDER

ENV COMPOSER_ALLOW_SUPERUSER 1

RUN apt-get update && apt-get install -y libicu-dev \
    wget \
    git \
    libzip-dev \
    zip \
    && docker-php-ext-configure intl \
    && docker-php-ext-install pdo pdo_mysql zip intl

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN mkdir -p /var/www/todolist \
    && chown -R www-data /tmp/ \
    && mkdir -p \
       /var/www/todolist/var/cache \
       /var/www/todolist/var/logs \
       /var/www/todolist/var/sessions \
    && chown -R www-data /var/www/todolist/var

WORKDIR /var/www/todolist

COPY --chown=www-data:www-data . ./