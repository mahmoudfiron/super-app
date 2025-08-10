#!/usr/bin/env bash
set -e

# Start PHP (Apache on 80) -> expose outside on 8080
docker run -itd --name super-app-php  -p 8080:80   mahmoudfiron/super-app-php:latest

# Start Node (listens on 3000) -> expose outside on 3000
docker run -itd --name super-app-node -p 3000:3000 mahmoudfiron/super-app-node:latest

# Start MySQL
docker run -itd --name super-app-mysql \ -p 3306:3306 \ -e MYSQL_DATABASE=super-app \ -e MYSQL_ROOT_PASSWORD=password \ mysql:8.0.28