#!/bin/bash

git checkout v2.2.x
git fetch upstream
git merge upstream/v2.2.x

git checkout behind-nginx
git log v2.2.x..behind-nginx

echo "merge v2.2.x into behind-nginx? CTRL-C to cancel"
read

git merge v2.2.x

#docker exec -t docker_postgres_1 pg_dumpall -c -U postgres > /srv/docker/greenlight_`date +%d-%m-%Y"_"%H_%M_%S`.sql

./scripts/upgrade

./scripts/compose up -d
