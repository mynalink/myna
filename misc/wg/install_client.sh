#!/bin/sh

# Copy wg0.conf --> ./

mkdir /etc/wireguard && \
cp $(pwd)/wg0.conf /etc/wireguard/ && \
apt-get update -y && \
apt-get install wireguard resolvconf -y && \
echo "net.ipv4.ip_forward = 1
net.ipv6.conf.all.forwarding = 1" > /etc/sysctl.d/wg.conf && \
sysctl --system && \
systemctl enable wg-quick@wg0 && \
systemctl start wg-quick@wg0 && \
systemctl status wg-quick@wg0