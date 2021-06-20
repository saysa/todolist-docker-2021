FROM php:5.6-fpm as base

ARG WORKFOLDER

ENV COMPOSER_ALLOW_SUPERUSER 1

RUN apt-get update && apt-get install -y libicu-dev \
    wget \
    git \
    libzip-dev \
    zip \
    && docker-php-ext-configure intl \
    && docker-php-ext-install pdo pdo_mysql zip intl

# Install xdebug
RUN pecl install xdebug-2.5.5 \
    && docker-php-ext-enable xdebug \
    && echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "display_startup_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_connect_back=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.profiler_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.profiler_output_dir=/tmp/snapshots" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.max_nesting_level=9999" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.profiler_enable_trigger=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

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