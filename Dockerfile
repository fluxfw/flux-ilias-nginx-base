FROM nginx:mainline-alpine

RUN unlink /etc/nginx/conf.d/default.conf

RUN adduser -u 82 -D -S -G www-data www-data

RUN sed -i "s/}/\n    application\/javascript mjs;\n    application\/manifest+json webmanifest;\n}/" /etc/nginx/mime.types

ENV ILIAS_WEB_DIR /var/www/html
RUN mkdir -p "$ILIAS_WEB_DIR" && chown www-data:www-data -R "$ILIAS_WEB_DIR"

ENV ILIAS_FILESYSTEM_DATA_DIR /var/iliasdata
RUN mkdir -p "$ILIAS_FILESYSTEM_DATA_DIR" && chown www-data:www-data -R "$ILIAS_FILESYSTEM_DATA_DIR"

ENV ILIAS_FILESYSTEM_WEB_DATA_DIR $ILIAS_FILESYSTEM_DATA_DIR/web
RUN mkdir -p "$ILIAS_FILESYSTEM_WEB_DATA_DIR" && chown www-data:www-data -R "$ILIAS_FILESYSTEM_WEB_DATA_DIR"

ENV _ILIAS_WEB_DATA_DIR $ILIAS_WEB_DIR/data
RUN ln -sfT "$ILIAS_FILESYSTEM_WEB_DATA_DIR" "$_ILIAS_WEB_DATA_DIR" && chown -h www-data:www-data "$_ILIAS_WEB_DATA_DIR"

ENTRYPOINT ["/flux-ilias-nginx-base/bin/server.sh"]

RUN mkdir -p /flux-ilias-nginx-base/src/custom

COPY . /flux-ilias-nginx-base
