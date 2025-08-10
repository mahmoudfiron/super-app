#!/bin/bash
set -e

# Install Docker on Amazon Linux 2023
sudo dnf install -y docker
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ec2-user || true

docker pull mahmoudfiron/super-app-node:latest
docker pull mahmoudfiron/super-app-php:latest
docker pull mysql:8.0.28