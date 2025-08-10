#!/usr/bin/env bash
set -e

# Stop containers by CONTAINER NAME (not image)
docker rm -f super-app-node  || true
docker rm -f super-app-php   || true
docker rm -f super-app-mysql || true