FROM alpine:latest

ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG BUILDOS
ARG BUILDARCH

RUN apk --update --no-cache add \
  bash \
  xz \
  curl \
  tzdata \
  ca-certificates \
  sqlite && \
  curl -O "https://downloads.rclone.org/v1.58.1/rclone-v1.58.1-${BUILDOS}-${BUILDARCH}.zip" && \
  unzip "rclone-v1.58.1-${BUILDOS}-${BUILDARCH}.zip" && \
  rm "rclone-v1.58.1-${BUILDOS}-${BUILDARCH}.zip" && \
  cd "rclone-v1.58.1-${BUILDOS}-${BUILDARCH}" && \
  cp rclone /usr/bin/ && \
  chown root:root /usr/bin/rclone && \
  chmod 755 /usr/bin/rclone

RUN addgroup -g 1000 rclone && adduser -u 1000 -Ds /bin/sh -G rclone rclone

ENV XDG_CONFIG_HOME=/config
