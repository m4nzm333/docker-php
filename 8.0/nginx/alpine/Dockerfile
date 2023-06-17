FROM sunasteriskrnd/php:8.0-nginx-alpine

COPY config/php/php.ini /usr/local/etc/php/php.ini
COPY config/nginx/template.conf /etc/nginx/templates.d/default.conf

RUN /bin/sh -c nginx -s reload -c /etc/nginx/nginx.conf
