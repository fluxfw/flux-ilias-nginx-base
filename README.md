# flux-ilias-nginx-base

ILIAS base nginx docker image

First look at [flux-ilias](https://github.com/fluxapps/flux-ilias)

## Environment variables

| Variable | Description | Default value |
| -------- | ----------- | ------------- |
| ILIAS_FILESYSTEM_DATA_DIR | Path to data directory | /var/iliasdata |
| ILIAS_WEB_DIR | Path to ILIAS source code | /var/www/html |
| ILIAS_FILESYSTEM_WEB_DATA_DIR | Path to web data directory<br>This is a volume | *%ILIAS_FILESYSTEM_DATA_DIR%*/web |
| ILIAS_NGINX_HTTPS_CERT | Path to HTTPS certificate file<br>Set this will enable listen on HTTPS and redirect HTTP to HTTPS<br>Should be on a volume | *-* |
| ILIAS_NGINX_HTTPS_KEY | Path to HTTPS key file<br>Should be on a volume | *-* |
| ILIAS_NGINX_HTTPS_DHPARAM | Path to HTTPS pem file<br>Should be on a volume | *-* |
| ILIAS_NGINX_HTTP_PORT | Listen HTTP port | 80 |
| ILIAS_NGINX_HTTPS_PORT | Listen HTTPS port | 443 |
| ILIAS_NGINX_LISTEN | Listen IP | 0.0.0.0 |
| ILIAS_NGINX_PHP_HOST | ILIAS php-fpm host | ilias |
| ILIAS_NGINX_PHP_PORT | ILIAS php-fpm port | 9000 |
| ILIAS_NGINX_SERVER_TOKENS | Show nginx server tokens | off |
| ILIAS_NGINX_CLIENT_MAX_BODY_SIZE | Maximal upload size | 200M |
| ILIAS_NGINX_PHP_READ_TIMEOUT | Maximal execution time | 900 |

Minimal variables required to set are **bold**

## Custom config

You can put custom conf files in /flux-ilias-nginx-base/src/custom in your Dockerfile which will be loaded too
