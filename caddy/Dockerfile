ARG CADDY_TAG=2.6.1

FROM caddy:${CADDY_TAG}-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:${CADDY_TAG}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
