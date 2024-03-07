FROM php:7.4-fpm

# Install Ruby
RUN apt-get update && apt-get install -y -q git rake ruby-ronn zlib1g-dev && apt-get clean

# Install composer
RUN cd /usr/local/bin && curl -sS https://getcomposer.org/installer | php
RUN cd /usr/local/bin && mv composer.phar composer

# Install Nginx
RUN apt-get install -y nginx

# Environment Variable
ENV NGINX_HOST localhost

# Copy Config to Nginx
RUN rm /etc/nginx/sites-enabled/default
RUN rm /etc/nginx/sites-available/default
COPY config/nginx/myhost /etc/nginx/laravel.template
COPY config/nginx/myhost /etc/nginx/sites-enabled/default
RUN ln /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default

# Copy index page for page testing
COPY config/html/index.php /var/www/html/public/index.php

# Install gettext-base for envsubt
RUN apt-get -y install gettext-base

RUN apt-get update && apt-get install -y \
    vim \
    curl \
    nginx \
    supervisor \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    libpq-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    net-tools \
    nano \
    && docker-php-ext-install mbstring zip pdo pdo_mysql bcmath gd zip soap 
# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pecl install -o -f redis &&  rm -rf /tmp/pear && docker-php-ext-enable redis

# Exec Script for Startup
COPY config/script/run.sh /run.sh
RUN chmod 777 /run.sh
RUN /bin/sh /run.sh

COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=node /usr/local/bin/node /usr/local/bin/node
RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm

# Run nginx in background
CMD composer install & php-fpm -F & nginx -g "daemon off;"

# Port
EXPOSE 80
EXPOSE 443