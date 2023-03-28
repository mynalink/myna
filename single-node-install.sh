#!/bin/bash

echo -e " \033[0;34m┌─────────────────────────────────────────────┐\033[0m "
echo -e " \033[0;34m│ \033[0;31m _____    \033[0;33m_____  \033[0;32m _____   \033[0;32m _____   \033[5;35m  ____   \033[0;34m│ "
echo -e " \033[0;34m│ \033[0;31m|  __ \  \033[0;33m|_   _| \033[0;32m|  __ \  \033[0;32m|  __ \  \033[5;35m / __ \  \033[0;34m│ "
echo -e " \033[0;34m│ \033[0;31m| |__) |   \033[0;33m| |   \033[0;32m| |__) | \033[0;32m| |__) | \033[5;35m| |__| | \033[0;34m│ "
echo -e " \033[0;34m│ \033[0;31m|  ___/    \033[0;33m| |   \033[0;32m|  ___/  \033[0;32m|  _  /  \033[5;35m|  __  | \033[0;34m│ "
echo -e " \033[0;34m│ \033[0;31m| |       \033[0;33m_| |_  \033[0;32m| |      \033[0;32m| | \ \  \033[5;35m| |  | | \033[0;34m│ "
echo -e " \033[0;34m│ \033[0;31m|_|      \033[0;33m|_____| \033[0;32m|_|      \033[0;32m|_|  \_\ \033[5;35m|_|  |_| \033[0;34m│ "
echo -e " \033[0;34m└─────────────────────────────────────────────┘\033[0m "
echo -e ""
echo -e "PIPRA Installation"

# update system config
chmod a+x init_env.sh && ./init_env.sh

chmod -R 777 ./elasticsearch/plugins/
cd ./elasticsearch/plugins/elasticsearch-analysis-ik-7.14.2 && rm ._*
cd ../../../

# compose up containers
docker-compose -f single-node.yaml --env-file .env up -d

# update Keycloak realm
sleep 60
docker cp ./keycloak/export keycloak:/tmp/import
docker exec -it keycloak /bin/bash -c "/opt/keycloak/bin/kc.sh import  --dir /tmp/import"
docker restart keycloak

sleep 10
# reset default user passwords
docker exec piper rm /opt/piper/cache/fingerprints.ser
docker restart piper