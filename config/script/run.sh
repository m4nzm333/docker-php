#!/bin/sh

# export NGINXPROXY
envsubst '${NGINX_HOST}' < /etc/nginx/laravel.template > /etc/nginx/sites-enabled/default
exec "$@"