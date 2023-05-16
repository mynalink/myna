#!/bin/bash

docker-compose -f dev-env.yaml up -d

sleep 20
docker cp ./keycloak/export keycloak:/tmp/import
docker exec -it keycloak /bin/bash -c "/opt/keycloak/bin/kc.sh import  --dir /tmp/import"
docker restart keycloak
