#!/bin/sh

WAN_IP=$1

docker run -d \
  --name=wg-easy \
  -e WG_HOST=$WAN_IP \
  -e PASSWORD=password \
  -e WG_DEFAULT_ADDRESS=10.1.0.x \
  -e WG_ALLOWED_IPS=10.1.0.0/24 \
  -e WG_PERSISTENT_KEEPALIVE=15 \
  -v ~/.wg-easy:/etc/wireguard \
  -p 51820:51820/udp \
  -p 51821:51821/tcp \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --sysctl="net.ipv4.ip_forward=1" \
  --restart unless-stopped \
  weejewel/wg-easy