#!/usr/bin/with-contenv sh
# shellcheck shell=sh
# https://github.com/crazy-max/docker-nextcloud/blob/master/rootfs/etc/cont-init.d/04-svc-main.sh

mkdir -p /etc/services.d/nginx
cat > /etc/services.d/nginx/run <<EOL
#!/usr/bin/execlineb -P
with-contenv
s6-setuidgid ${PUID}:${PGID}
nginx -g "daemon off;"
EOL
chmod +x /etc/services.d/nginx/run
