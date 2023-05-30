#!/usr/bin/env sh

set -e

if [ ! -d "$ILIAS_WEB_DIR/Customizing/global/flux-ilias-rest-api" ]; then
    echo "First you need to install flux-ilias-rest-api in flux-ilias-ilias-base" >&2
    exit 1
fi

echo "Link $ILIAS_WEB_DIR/Customizing/global/flux-ilias-rest-api/src/nginx.conf to /flux-ilias-nginx-base/src/custom/flux-ilias-rest-api.conf"

ln -sfT "$ILIAS_WEB_DIR/Customizing/global/flux-ilias-rest-api/src/nginx.conf" /flux-ilias-nginx-base/src/custom/flux-ilias-rest-api.conf
