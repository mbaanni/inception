#!/bin/sh

while ! mariadb -hmariadb -u$DATABASE_USER -p$DATABASE_PASS $DATABASE_NAME --silent 2> /dev/null; do
	sleep 1;
done

if [ ! -f /var/www/http/wp-config.php ]; then
    sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/8.2/fpm/pool.d/www.conf
    mkdir -p /var/www/http
    wp core download --locale=en_US --allow-root
    wp config create --dbname=$DATABASE_NAME --dbuser=$DATABASE_USER --dbpass=$DATABASE_PASS --dbhost=mariadb --allow-root
    wp core install --url=$WORDPRESS_URL --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASS --admin_email=$WORDPRESS_ADMIN_EMAIL --allow-root
    wp theme activate twentytwentytwo  --allow-root
    wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASS --role=editor --allow-root
    wp option set comment_previously_approved 0 --allow-root

    chown -R www-data:www-data /var/www/http/
    chmod -R 755 /var/www/http/
else
    echo "Wordpress is already installed"
fi

exec php-fpm8.2 -F