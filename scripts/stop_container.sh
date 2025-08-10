#!/usr/bin/env bash
set -euo pipefail

for name in super-app-php super-app-node super-app-mysql; do
  if docker ps -a --format '{{.Names}}' | grep -Eq "^${name}$"; then
    docker rm -f "$name"
  fi
done

docker image rm -f mahmoudfiron/super-app-node:latest || true
docker image rm -f mahmoudfiron/super-app-php:latest || true