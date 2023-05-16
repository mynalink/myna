#!/bin/bash

wget -nc https://speed.hetzner.de/100MB.bin

script -q -c "scp 100MB.bin root@${IP_1}:/~ & \
scp 100MB.bin root@${IP_2}:/~ & \
scp 100MB.bin root@${IP_3}:/~ & \
scp 100MB.bin root@${IP_4}:/~ & \
scp 100MB.bin root@${IP_5}:/~" > scp.log