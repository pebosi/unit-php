FROM php:8.1-apache

RUN apt-get update && \
    apt-get install -y --no-install-recommends zip vim git curl fontconfig libmemcached-dev libcurl4-openssl-dev default-mysql-client libjpeg-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libwebp-dev libavif-dev \
    libxpm-dev zlib1g-dev \
    libpng-dev libzip-dev libxml2-dev libonig-dev libxml2 libpq-dev postgresql-client \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pgsql pdo pdo_mysql pdo_pgsql
RUN docker-php-ext-install intl xml bcmath mbstring
RUN docker-php-ext-install opcache curl

RUN docker-php-ext-configure gd --prefix=/usr --with-webp --with-jpeg --with-xpm --with-freetype --with-avif
RUN docker-php-ext-install -j$(nproc) gd

RUN pecl install memcache redis apcu
RUN docker-php-ext-enable memcache redis apcu

RUN apt remove -y --autoremove gcc *-dev
