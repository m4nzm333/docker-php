FROM php:7.4-fpm-alpine

RUN apk update

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

# Install PHP GD extension
RUN apk add --no-cache libpng-dev freetype-dev libjpeg-turbo-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"
# Install nginx
RUN apk add nginx
# COPY config/nginx/nginx.conf /etc/nginx/nginx.conf 

# Create a non-root user and give permissions
RUN apk add --no-cache shadow
RUN usermod -u 1000 www-data \
    && groupmod -g 1000 www-data \
    && mkdir -p /var/www/html /run/nginx /var/lib/nginx/logs /var/log/nginx \
    && touch /var/lib/nginx/logs/error.log /var/log/nginx/error.log \
    && chown -R www-data:www-data /var/www /run/nginx /var/lib/nginx /var/log/nginx /tmp

USER www-data
WORKDIR /var/www/html
# Copy nginx config and app entrypoint script
COPY --chown=www-data:www-data config/html/ public/
COPY --chown=www-data:www-data config/nginx/myhost /etc/nginx/http.d/default.conf

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD curl -f http://localhost/ || exit 1

EXPOSE 80
CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]