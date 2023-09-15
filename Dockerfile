FROM nginx/unit:1.29.1-php8.1

RUN apt-get update && \
    apt-get install -y zip vim git curl fontconfig libmemcached-dev libcurl4-openssl-dev default-mysql-client libpng-dev libzip-dev libxml2-dev libonig-dev libxml2 libpq-dev postgresql-client \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pgsql pdo pdo_mysql pdo_pgsql
RUN docker-php-ext-install xml bcmath mbstring
RUN docker-php-ext-install opcache gd zip curl
RUN pecl install memcached memcache redis
RUN docker-php-ext-enable memcached memcache redis

RUN apt remove -y --autoremove gcc *-dev
