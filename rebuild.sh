#!/bin/bash

git checkout v2.2.x

docker exec -t docker_postgres_1 pg_dumpall -c -U postgres > /srv/docker/greenlight_`date +%d-%m-%Y"_"%H_%M_%S`.sql

git fetch upstream
git merge upstream/v2.2.x

./scripts/upgrade

./scripts/compose up -d
