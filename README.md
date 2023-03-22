# VM Specifications
* CPU cores >= 4
* MEM >= 8G
* Free HDD/SSD > 100GB
* Network bandwidth > 4Mbps
* Recommended OS: Ubuntu Server 20.04/22.04

# Install
```shell
git clone https://poda.cc:543/rewind/pipra-deploy.git && \
cd piper-deploy && chmod a+x ./single-node-install.sh && \
./single-node-install.sh
```

# Usage
* Access in browser ```http://${your-vm-ip}```
* [User Manual](../../wikis/用户手册)

# Update
```shell
chmod a+x ./update.sh && ./update.sh
```