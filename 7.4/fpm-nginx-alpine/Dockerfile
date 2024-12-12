FROM php:7.4-fpm-alpine

RUN apk update && apk upgrade

# Install necessary dependencies
RUN apk add --no-cache \
    openssl \
    openssl-dev \
    libmcrypt-dev \
    autoconf \
    g++ \
    make \
    zlib-dev \
    libpng-dev \
    oniguruma-dev \
    libzip-dev \
    curl-dev \
    libxml2-dev

# Install common PHP extensions
RUN docker-php-ext-install \
    pdo_mysql \
    mysqli \
    opcache \
    gd \
    mbstring \
    zip \
    curl \
    xml \
    simplexml \
    json \
    exif \
    bcmath \
    soap

# Install mcrypt extension
RUN pecl install mcrypt-1.0.4 \
    && docker-php-ext-enable mcrypt

# Install bash
RUN apk add bash

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

# Install nginx
RUN apk add nginx
COPY config/nginx/myhost /etc/nginx/http.d/default.conf

# Copy base index.php for testing
COPY config/html/index.php /var/www/html/public/index.php

# Script
ADD config/script/start.bash /
RUN chmod +x /start.bash

CMD ["bash", "/start.bash"]

EXPOSE 80
