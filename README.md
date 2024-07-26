# vw-caddy
Deploy vaultwarden with a caddy reverse proxy.

The current scope is an EC2 instance running Amazon Linux 2023. 
Some parts like setting up the server and the generation of config files are 
already separated to be prepared for other deployment scenarios.

## :warning: Disclaimer
This is work in progress. Use at your own risk, so read and understand the content of this repository first. 
I am not responsible for any damage caused by using these scripts or templates. 

## :bowing_man: Acknowledgements
* [Daniel García](https://github.com/dani-garcia) for [vaultwarden](https://github.com/dani-garcia/vaultwarden)
* [Matt Holt](https://github.com/mholt) for [caddy](https://github.com/caddyserver/caddy)
* [Helge Klein](https://helgeklein.com/) for his article [Vaultwarden Setup Guide With Automatic HTTPS](https://helgeklein.com/blog/vaultwarden-setup-guide-with-automatic-https/)
* [Thomas Schick](https://github.com/ginmaster) for his [installation scripts](https://gist.github.com/ginmaster/c6d11697c4fa67442889f379380ba6c0)

## :gear: Setup
1. Run the Cloudformation template `cloudformation.yaml` to create the EC2 instance.
2. SSH into the instance.
3. Create an admin token via `echo -n "MySecretPassword" | argon2 "$(openssl rand -base64 32)" -e -id -k 65540 -t 3 -p 4 | sed 's#\$#\$\$#g'` (and replace `MySecretPassword` with your password).
4. Add the result to `~/vw_caddy/docker-compose.yml` in the `environment` section.
5. Set admins, domain (no tailing /) and e-mail in `~/vw_caddy/docker-compose.yml`.
6. Change diretory to `~/vw_caddy` and run `docker-compose up -d`.
