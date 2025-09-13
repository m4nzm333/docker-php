
# Docker PHP Multi-Version Images

![Docker Build](https://img.shields.io/badge/build-passing-brightgreen)

Multi-version PHP-FPM Docker images with Nginx, based on Alpine Linux. Supports PHP 5.6, 7.1, 7.4, 8.0, and 8.1. Each version includes common PHP extensions, Composer, and is ready for development, testing, staging, uat, or production.

## Supported Tags and Versions

- `5.6-fpm-nginx-alpine`
- `7.1-fpm-nginx-alpine`
- `7.4-fpm-nginx-alpine`
- `8.0-fpm-nginx-alpine`
- `8.1-fpm-nginx-alpine`
- `8.1-fpm-nginx-alpine-grcp`
- `8.2-fpm-nginx-alpine`

## Features

- PHP-FPM with Nginx (Alpine-based)
- Common PHP extensions (pdo_mysql, mysqli, gd, mbstring, zip, etc.)
- Composer pre-installed
- Customizable PHP, FPM, and Nginx configs
- Runs as non-root user (`www-data`)

## Usage

### Run the Container

```bash
docker run -p 8080:80 m4nzm333/php:7.4-fpm-nginx-alpine
```

### Access

Visit [http://localhost:8080](http://localhost:8080)

## Configuration
You can mount your own code:

```bash
docker run -v /path/to/your/app:/var/www/html/public -p 8080:80 m4nzm333/php:7.4-fpm-nginx-alpine
```

## Notes

- Each PHP version may have slightly different dependencies/configuration.
- Images are for development/testing. Harden for production as needed.

## License

MIT

## Notes
- Each PHP version may have slightly different dependencies or configuration.

## License
MIT

## Maintainer
- [Irman Mashuri](https://github.com/m4nzm333)
