# VM Specifications
* CPU cores >= 4
* MEM >= 8G
* Free HDD/SSD > 100GB
* Network bandwidth > 4Mbps
* Recommended OS: Ubuntu Server 20.04/22.04

# Install

## Single Node
```shell
git clone https://poda.cc:543/rewind/myna-depl.git && \
cd myna-depl && chmod a+x ./single-node-install.sh && \
./single-node-install.sh
```

## Dev Env
```shell
# Windows
./dev-env-init.bat
# Linux
./dev-env-init.sh
```

## Cluster deployment
1. Prerequisites
   - Keycloak: unified identity authentication service
   - Elasticsearch/Kibana: document indexing and search
   - Ceph / MinIO: object storage service
   - Prometheus/Grafana: monitoring tool
2. modify `.env`, update env variables
3. Execute script
   ```shell
   docker-compose -f myna-node.yaml up -d
   ```

# Usage
* Access in browser ```http://${your-vm-ip}```
* [User Manual](../../wikis/用户手册)

# Update
```shell
chmod a+x ./update.sh && ./update.sh
```