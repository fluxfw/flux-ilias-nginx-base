FROM nginx:mainline-alpine

LABEL org.opencontainers.image.source="https://github.com/flux-caps/flux-ilias-nginx-base"
LABEL maintainer="fluxlabs <support@fluxlabs.ch> (https://fluxlabs.ch)"

RUN unlink /etc/nginx/conf.d/default.conf

RUN adduser -u 82 -D -S -G www-data www-data

ENV ILIAS_WEB_DIR /var/www/html
RUN mkdir -p "$ILIAS_WEB_DIR" && chown www-data:www-data -R "$ILIAS_WEB_DIR"

ENV ILIAS_FILESYSTEM_DATA_DIR /var/iliasdata
RUN mkdir -p "$ILIAS_FILESYSTEM_DATA_DIR" && chown www-data:www-data -R "$ILIAS_FILESYSTEM_DATA_DIR"

ENV ILIAS_FILESYSTEM_WEB_DATA_DIR $ILIAS_FILESYSTEM_DATA_DIR/web
RUN mkdir -p "$ILIAS_FILESYSTEM_WEB_DATA_DIR" && chown www-data:www-data -R "$ILIAS_FILESYSTEM_WEB_DATA_DIR"
VOLUME $ILIAS_FILESYSTEM_WEB_DATA_DIR

ENV _ILIAS_WEB_DATA_DIR $ILIAS_WEB_DIR/data
RUN ln -sfT "$ILIAS_FILESYSTEM_WEB_DATA_DIR" "$_ILIAS_WEB_DATA_DIR" && chown -h www-data:www-data "$_ILIAS_WEB_DATA_DIR"

ENV ILIAS_NGINX_HTTP_PORT 80
EXPOSE $ILIAS_NGINX_HTTP_PORT

ENV ILIAS_NGINX_HTTPS_PORT 443
EXPOSE $ILIAS_NGINX_HTTPS_PORT

ENTRYPOINT ["/flux-ilias-nginx-base/bin/docker-entrypoint.sh"]

RUN mkdir -p /flux-ilias-nginx-base/src/custom

COPY . /flux-ilias-nginx-base

ARG COMMIT_SHA
LABEL org.opencontainers.image.revision="$COMMIT_SHA"
