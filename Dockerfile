FROM php:8.1-apache

RUN apt-get update && \
    apt-get install -y zip vim git curl fontconfig libmemcached-dev libcurl4-openssl-dev default-mysql-client libpng-dev libzip-dev libxml2-dev libonig-dev libxml2 libpq-dev postgresql-client \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pgsql pdo pdo_mysql pdo_pgsql
RUN docker-php-ext-install intl xml bcmath mbstring
RUN docker-php-ext-install opcache gd curl
RUN pecl install memcache redis apcu
RUN docker-php-ext-enable memcache redis apcu

RUN apt remove -y --autoremove gcc *-dev
