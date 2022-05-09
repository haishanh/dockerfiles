#!/usr/bin/with-contenv sh
# shellcheck shell=sh

echo "Fixing perms..."

mkdir -p /data /var/run/nginx /var/log/nginx

chown -R nginx. \
  /data \
  /tpls \
  /var/lib/nginx \
  /var/log/nginx \
  /var/run/nginx
