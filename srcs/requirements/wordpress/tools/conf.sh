#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ];
then
    wget        https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
    mv          wp-cli.phar /usr/local/bin/wp;
    chmod       +x /usr/local/bin/wp;
    mkdir -p    /var/www/html/wordpress;
    cd          /var/www/html/wordpress;
    wp          core download --allow-root;
    mv          /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php;
    sed -i      "s|database_name_here|$MYSQL_DATABASE|" /var/www/html/wordpress/wp-config.php;
    sed -i      "s|username_here|$MYSQL_USER|" /var/www/html/wordpress/wp-config.php;
    sed -i      "s|password_here|$MYSQL_PASSWORD|" /var/www/html/wordpress/wp-config.php;
    sed -i      "s|localhost|$MYSQL_HOST|" /var/www/html/wordpress/wp-config.php;
    sed -i      "s|$WP_URL|"$WP_URL"|" /var/www/html/wordpress/wp-config.php;
    sed -i      "s|define('WP_DEBUG', false);|define('WP_DEBUG', true);|" /var/www/html/wordpress/wp-config.php;
    wp          core install --allow-root --url=$WP_URL \
                --title=$WP_SITE_TITLE \
                --admin_user=$WP_ADMIN \
                --admin_password=$WP_ADMIN_PASSWORD \
                --admin_email=$WP_ADMIN_EMAIL;
    wp          user create --allow-root\
                $WP_USER_LOGIN $WP_USER_EMAIL \
                --user_pass=$WP_USER_PASSWORD;
    chown -R    www-data:www-data /var/www/html;
fi

php-fpm7.3 -F --nodeamonize;
