FROM php:8.0-fpm-alpine

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
    exif \
    bcmath \
    soap

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
ADD config/script/start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]

EXPOSE 80
