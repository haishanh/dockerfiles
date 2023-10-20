FROM alpine:latest

ARG TARGETOS
ARG TARGETARCH

ARG PB_VERSION=0.19.0

# RUN apk add --no-cache \
#     unzip \
#     ca-certificates

# download and unzip PocketBase
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_${TARGETOS}_${TARGETARCH}.zip -O /tmp/pb.zip && \
  unzip /tmp/pb.zip -d /app/ && \
  rm /tmp/pb.zip

EXPOSE 8090

ENTRYPOINT ["/app/pocketbase"]
CMD ["serve", "--http", "0.0.0.0:8090"]

# https://github.com/pocketbase/pocketbase/releases/download/v0.19.0/pocketbase_0.19.0_linux_amd64.zip
# https://github.com/pocketbase/pocketbase/releases/download/v0.19.0/pocketbase_0.19.0_linux_arm64.zip

# https://downloads.rclone.org/v1.64.2/rclone-v1.64.2-linux-amd64.zip
# https://downloads.rclone.org/v1.64.2/rclone-v1.64.2-linux-arm64.zip
