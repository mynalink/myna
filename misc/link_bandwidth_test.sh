#!/bin/bash

wget -nc https://speed.hetzner.de/100MB.bin

script -q -c "scp 100MB.bin root@101.32.116.141:/~ & \
scp 100MB.bin root@101.32.83.201:/~ & \
scp 100MB.bin root@101.33.74.94:/~ & \
scp 100MB.bin root@162.62.216.230:/~ & \
scp 100MB.bin root@43.133.163.234:/~" > scp.log