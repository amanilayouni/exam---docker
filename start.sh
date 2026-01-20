#!/bin/bash
set -e

# Initialisation DB
/tmp/init_mysql.sh

# AutoinDEX via ENV
if [ "$AUTOINDEX" = "off" ]; then
  sed -i 's/autoindex on;/autoindex off;/' /etc/nginx/sites-available/default
else
  sed -i 's/autoindex off;/autoindex on;/' /etc/nginx/sites-available/default
fi

# Démarrage PHP-FPM
service php7.3-fpm start

# Démarrage Nginx
nginx -g "daemon off;"
