ARG NGINX_IMAGE=nginx:mainline-alpine

FROM $NGINX_IMAGE

LABEL org.opencontainers.image.source="https://github.com/fluxapps/flux-ilias-nginx-base"
LABEL maintainer="fluxlabs <support@fluxlabs.ch> (https://fluxlabs.ch)"

RUN unlink /etc/nginx/conf.d/default.conf

RUN adduser -u 82 -D -S -G www-data www-data

ENV ILIAS_WEB_DIR /var/www/html
RUN mkdir -p "$ILIAS_WEB_DIR" && chown www-data:www-data -R "$ILIAS_WEB_DIR"

ENV ILIAS_NGINX_HTTP_PORT 80
EXPOSE $ILIAS_NGINX_HTTP_PORT

ENV ILIAS_NGINX_HTTPS_PORT 443
EXPOSE $ILIAS_NGINX_HTTPS_PORT

ENTRYPOINT ["/flux-ilias-nginx-base/bin/entrypoint.sh"]

COPY . /flux-ilias-nginx-base
