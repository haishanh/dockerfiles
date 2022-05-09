#!/usr/bin/with-contenv bash
# shellcheck shell=bash

DNS_SERVER=${DNS_SERVER:-8.8.8.8}
UPLOAD_MAX_SIZE=${UPLOAD_MAX_SIZE:-512M}
REAL_IP_FROM=${REAL_IP_FROM:-0.0.0.0/32}
REAL_IP_HEADER=${REAL_IP_HEADER:-X-Forwarded-For}
LOG_IP_VAR=${LOG_IP_VAR:-remote_addr}
HSTS_HEADER=${HSTS_HEADER:-max-age=15768000; includeSubDomains}
XFRAME_OPTS_HEADER=${XFRAME_OPTS_HEADER:-SAMEORIGIN}
RP_HEADER=${RP_HEADER:-strict-origin}
SUBDIR=

# Nginx
echo "Setting Nginx configuration..."
sed -e "s/@UPLOAD_MAX_SIZE@/$UPLOAD_MAX_SIZE/g" \
  -e "s#@DNS_SERVER@#$DNS_SERVER#g" \
  -e "s#@REAL_IP_FROM@#$REAL_IP_FROM#g" \
  -e "s#@REAL_IP_HEADER@#$REAL_IP_HEADER#g" \
  -e "s#@LOG_IP_VAR@#$LOG_IP_VAR#g" \
  -e "s/@HSTS_HEADER@/$HSTS_HEADER/g" \
  -e "s/@XFRAME_OPTS_HEADER@/$XFRAME_OPTS_HEADER/g" \
  -e "s/@RP_HEADER@/$RP_HEADER/g" \
  -e "s#@SUBDIR@#$SUBDIR#g" \
  /tpls/etc/nginx/nginx.conf >/etc/nginx/nginx.conf

echo hello > /var/www/index.html
