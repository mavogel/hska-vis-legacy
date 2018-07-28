#!/bin/sh

###################
# Config
###################
# Aborts the script if a command fails
set -e

###################
# Vars and helpers
###################
SP='********';
info () {
  echo "";
  echo "${SP}${SP}${SP}${SP}${SP}${SP}${SP}${SP}${SP}${SP}${SP}${SP}";
  echo "$SP [SCRIPT INFO] $1";
  echo "${SP}${SP}${SP}${SP}${SP}${SP}${SP}${SP}${SP}${SP}${SP}${SP}";
  echo "";
}

###################
## Go woop woop
###################
info "Check for needed binaries in PATH";
BINS_TO_CHECK=( docker docker-compose )
for BIN in "${BINS_TO_CHECK[@]}"; do
  command -v $BIN >/dev/null 2>&1 || { echo >&2 "I require '$BIN' but it's not installed.  Aborting."; exit 1; };
done
echo "=> Fine √"

info "Checking if docker is running";
docker ps
echo "=> Fine √"

info "Composing MySQL Server container, tomcat8 and deploying webshop war"
docker-compose up -d --force-recreate --remove-orphans

info "Legacy WebShop started => 'http://localhost:8888/EShop-1.0.0/'"
info "get logs via: '$ docker-compose logs -tf'"
info "to shutdown run '$ docker-compose down'"
