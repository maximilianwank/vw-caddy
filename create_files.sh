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

# fail2ban filter for user login
curl -O https://raw.githubusercontent.com/maximilianwank/vw-caddy/deploy/configs/filter_vaultwarden-user.local
mv filter_vaultwarden.local /etc/fail2ban/filter.d/vaultwarden-user.local
chown ec2-user:ec2-user /etc/fail2ban/filter.d/vaultwarden-user.local

# fail2ban jail for user login
curl -O https://raw.githubusercontent.com/maximilianwank/vw-caddy/deploy/configs/jail_vaultwarden-user.local
mv jail_vaultwarden.local /etc/fail2ban/jail.d/vaultwarden-user.local
chown ec2-user:ec2-user /etc/fail2ban/jail.d/vaultwarden-user.local

# fail2ban filter for admin login
curl -O https://raw.githubusercontent.com/maximilianwank/vw-caddy/deploy/configs/filter_vaultwarden-admin.local
mv filter_vaultwarden.local /etc/fail2ban/filter.d/vaultwarden-admin.local
chown ec2-user:ec2-user /etc/fail2ban/filter.d/vaultwarden-admin.local

# fail2ban jail for admin login
curl -O https://raw.githubusercontent.com/maximilianwank/vw-caddy/deploy/configs/jail_vaultwarden-admin.local
mv jail_vaultwarden.local /etc/fail2ban/jail.d/vaultwarden-admin.local
chown ec2-user:ec2-user /etc/fail2ban/jail.d/vaultwarden-admin.local
