#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[39m'

#WP
WP=/usr/local/bin/wp/wp-cli.phar

# Config Wordpress
    if [ ! -d "/run/php" ]; then
        mkdir -p "/run/php"
    fi

    if [ ! -e "/var/www/wordpress/wp-config.php" ]; then
        echo "${BLUE}Configuring Wordpress ${NC}"
        ${WP} config create --allow-root --dbname=$MYSQL_DATABASE_NAME --dbuser=$MYSQL_USER \
                        --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME:3306 \
                        --path='/var/www/wordpress/'
        ${WP} core install     --url=$DOMAIN_NAME --title=$WORDPRESS_SITE_TITLE --admin_user=$WORDPRESS_ROOT_USER --admin_password=$WORDPRESS_ROOT_PASSWORD --admin_email=$WORDPRESS_ROOT_EMAIL --allow-root --path='/var/www/wordpress/'
        #${WP} user create      --allow-root --role=author $WORDPRESS_ROOT_USER $WORDPRESS_ROOT_EMAIL --user_pass=$WORDPRESS_ROOT_PASSWORD --path='/var/www/wordpress/' # Puedo Poner >> log.txt # MODIFICAR ESTO BIEN
        echo "${GREEN}WordPress Configured${NC}"
    fi

php-fpm7.4 -F