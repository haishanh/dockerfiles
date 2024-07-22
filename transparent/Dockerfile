FROM crazymax/alpine-s6:3.20-2.2.0.3 AS init
RUN apk --update --no-cache add \
  bash \
  ca-certificates \
  curl \
  nginx

FROM crazymax/yasu:latest AS yasu
FROM init AS base

ENV PUID="1000" PGID="1000"

COPY --from=yasu / /
COPY docker/rootfs /

WORKDIR /var/www

EXPOSE 8000
VOLUME [ "/data" ]

ENTRYPOINT [ "/init" ]

# HEALTHCHECK --interval=10s --timeout=5s --start-period=20s CMD healthcheck
