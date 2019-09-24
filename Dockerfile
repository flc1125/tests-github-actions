FROM php:7.2.9

MAINTAINER Flc <i@flc.io>

# php extension
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libgmp-dev \
    && docker-php-ext-install -j$(nproc) bcmath \
        iconv \
        mysqli \
        gettext \
        pcntl \
        pdo_mysql \
        sysvsem \
        sockets \
        gmp \
        zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

CMD ['php', '-a']