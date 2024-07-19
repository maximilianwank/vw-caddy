#!/bin/bash

# Caddyfile
curl -O https://raw.githubusercontent.com/maximilianwank/vw-caddy/deploy/configs/Caddyfile
sudo mkdir /srv/caddy
sudo mv Caddyfile /srv/caddy/Caddyfile
chown -R ec2-user:ec2-user /home/ec2-user

# docker-compose.yaml
curl -O https://raw.githubusercontent.com/maximilianwank/vw-caddy/deploy/configs/docker-compose.yaml
mkdir /home/ec2-user/vw_caddy
mv docker-compose.yaml /home/ec2-user/vw_caddy/docker-compose.yaml
chown -R ec2-user:ec2-user /home/ec2-user/vw_caddy

# fail2ban filter
curl -O https://raw.githubusercontent.com/maximilianwank/vw-caddy/deploy/configs/filter_vaultwarden.local
mv filter_vaultwarden.local /etc/fail2ban/filter.d/vaultwarden.local
chown ec2-user:ec2-user /etc/fail2ban/filter.d/vaultwarden.local

# fail2ban jail
curl -O https://raw.githubusercontent.com/maximilianwank/vw-caddy/deploy/configs/jail_vaultwarden.local
mv jail_vaultwarden.local /etc/fail2ban/jail.d/vaultwarden.local
chown ec2-user:ec2-user /etc/fail2ban/jail.d/vaultwarden.local

# restart fail2ban
sudo systemctl restart fail2ban
