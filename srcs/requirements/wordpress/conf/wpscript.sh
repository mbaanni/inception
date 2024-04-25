#!/bin/sh


while ! mariadb -hmariadb -u$DATABASE_USER -p$DATABASE_PASS $DATABASE_NAME --silent 2> /dev/null; do
	sleep 1;
done

if [ ! -f /var/www/http/wp-config.php ]; then
    wp core download --locale=en_US --allow-root
    wp config create --dbname=$DATABASE_NAME --dbuser=$DATABASE_USER --dbpass=$DATABASE_PASS --dbhost=mariadb --allow-root
    wp core install --url=$WORDPRESS_URL --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASS --admin_email=$WORDPRESS_ADMIN_EMAIL --allow-root
    wp theme activate twentytwentythree  --allow-root
    wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASS --role=editor --allow-root
    wp option set comment_previously_approved 0 --allow-root

    wp config set WP_REDIS_HOST redis --allow-root
    wp config set WP_REDIS_PORT 6379 --allow-root
    wp config set WP_REDIS_DATABASE 0 --allow-root
    wp config set WP_CACHE true --allow-root
    
    wp plugin update --all --allow-root
    wp plugin install redis-cache --activate --allow-root
    wp redis enable --allow-root
    chmod -R o+w /var/www/http/
    chown -R www-data:www-data /var/www/http/
fi
exec php-fpm8.2 -F