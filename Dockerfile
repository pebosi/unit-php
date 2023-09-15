FROM unit:1.31.0-php8.2

RUN apt-get update && \
    apt-get install -y zip vim git curl fontconfig libmemcached-dev libcurl4-openssl-dev default-mysql-client libpng-dev libzip-dev libxml2-dev libonig-dev libxml2 libpq-dev postgresql-client \
    && apt-get clean && apt-get remove --autoremove gcc *-dev && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pgsql pdo pdo_mysql
RUN docker-php-ext-install xml bcmath mbstring
RUN docker-php-ext-install opcache gd zip curl
RUN pecl install memcached redis
RUN docker-php-ext-enable memcached redis
