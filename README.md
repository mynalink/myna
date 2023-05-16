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
./dev-env-init.bat
OR
./dev-env-init.sh
```

## Cluster
1. 前提条件
   - 部署 Keycloak 提供统一认证服务
   - 部署 Elasticsearch / Kibana 提供文档索引服务
   - 部署 Ceph 或 MinIO 提供对象存储服务
   - 部署 Prometheus / Grafana 提供监控服务
2. 修改`.env`，更新配置变量
3. 执行部署脚本
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