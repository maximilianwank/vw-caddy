#!/bin/bash

# Download and move Caddyfile
curl -O https://raw.githubusercontent.com/maximilianwank/vw-caddy/deploy/Caddyfile
sudo mkdir /srv/caddy
sudo mv Caddyfile /srv/caddy/Caddyfile

# Download the files
curl -O https://raw.githubusercontent.com/maximilianwank/vw-caddy/deploy/docker-compose.yaml
mkdir /home/ec2-user/vw_caddy
mv docker-compose.yaml /home/ec2-user/vw_caddy/docker-compose.yaml
