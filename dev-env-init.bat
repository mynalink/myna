:: git submodule init
:: git submodule update
wsl -d docker-desktop sysctl -w vm.max_map_count=262144
docker-compose -f dev-env.yaml up -d
timeout 30
docker cp ./keycloak/export keycloak:/tmp/import
docker exec -it keycloak /bin/bash -c "/opt/keycloak/bin/kc.sh import  --dir /tmp/import"
docker restart keycloak