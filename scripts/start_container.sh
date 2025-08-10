#!/usr/bin/env bash
set -euo pipefail

# Ensure images are present (ok if already pulled)
docker pull mahmoudfiron/super-app-node:latest
docker pull mahmoudfiron/super-app-php:latest
docker pull mysql:8.0.28

# Start MySQL first
docker run -d --name super-app-mysql \
  -p 3306:3306 \
  -e MYSQL_DATABASE=super-app \
  -e MYSQL_ROOT_PASSWORD=password \
  mysql:8.0.28

# PHP app listens on 80 in the container → expose as 8080 outside
docker run -d --name super-app-php \
  -p 8080:80 \
  mahmoudfiron/super-app-php:latest

# Node app listens on 3000 in the container → expose as 3000 outside
docker run -d --name super-app-node \
  -p 3000:3000 \
  mahmoudfiron/super-app-node:latest