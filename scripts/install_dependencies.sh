#!/usr/bin/env bash
set -euo pipefail

# Install & enable Docker on Amazon Linux 2023
sudo dnf -y install docker
sudo systemctl enable --now docker


# Pull YOUR images (Docker will also pull on first run, but this makes start faster)
docker pull mahmoudfiron/super-app-node:latest
docker pull mahmoudfiron/super-app-php:latest
docker pull mysql:8.0.28