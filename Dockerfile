ARG NGINX_IMAGE=nginx:mainline-alpine

FROM $NGINX_IMAGE

LABEL org.opencontainers.image.source="https://github.com/fluxapps/flux-ilias-nginx-base"
LABEL maintainer="fluxlabs <support@fluxlabs.ch> (https://fluxlabs.ch)"

RUN unlink /etc/nginx/conf.d/default.conf

COPY . /flux-ilias-nginx-base

ENTRYPOINT ["/flux-ilias-nginx-base/bin/entrypoint.sh"]

ENV ILIAS_WEB_DIR /var/www/html

ENV ILIAS_NGINX_HTTP_PORT 80
EXPOSE $ILIAS_NGINX_HTTP_PORT

ENV ILIAS_NGINX_HTTPS_PORT 443
EXPOSE $ILIAS_NGINX_HTTPS_PORT
