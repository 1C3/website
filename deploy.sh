DEPLOY_DIR='/var/www/atmtc.eu'
CADDY_USER='caddy:www-data'
CADDY_CONFIG='/etc/caddy/Caddyfile'
CADDYFILE='
atmtc.eu

root * /var/www/atmtc.eu/
file_server
'

printf '%s' "$CADDYFILE" > $CADDY_CONFIG
caddy fmt --overwrite $CADDY_CONFIG
caddy reload --config $CADDY_CONFIG

cp -r atmtc.eu/* $DEPLOY_DIR

chown $CADDY_USER -R $DEPLOY_DIR
find $DEPLOY_DIR -type d -exec chmod 775 {} \;
find $DEPLOY_DIR -type f -exec chmod 664 {} \;
