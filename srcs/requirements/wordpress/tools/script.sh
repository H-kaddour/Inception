#!/bin/bash

#sleep 6
mkdir /var/www
mkdir /var/www/html

#echo "<?php phpinfo(); ?>" > /var/www/html/index.php

#apt-get update && apt-get install -y curl
apt-get update && apt-get install -y curl php php-{fpm,mysql}

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --path=/var/www/html --allow-root

#here i should change the database file
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PW --dbhost=$DB_HOST_WP --path=/var/www/html --allow-root --skip-check

#here i should create the root user and another use and setup the wp
wp core install --path=/var/www/html --url=$URL --title="Inception" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PW --admin_email=$WP_ADMIN_EMAIL --allow-root
#here the user
wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PW --path=/var/www/html --allow-root

#service php7.3-fpm start

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
mkdir /run/php
/usr/sbin/php-fpm7.3 --nodaemonize
