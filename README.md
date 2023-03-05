# VM Specifications
* CPU cores >= 4
* MEM >= 8G
* Free HDD/SSD > 100GB
* Network bandwidth > 4Mbps
* Recommended OS: Ubuntu Server 20.04/22.04

# Install
```shell
git clone ${this-repo-url.git}
cd piper-deploy && chmod a+x ./single-node-install.sh
./single-node-install.sh
```

# Usage
Access in browser ```http://${your-vm-ip}```

# Update
```shell
docker pull piper/piper:v1
docker pull piper/web:v1
docker pull piper/chrome:v1
\\ kill chrome containers if exist
docker-compose -f single-node.yaml up -d
```