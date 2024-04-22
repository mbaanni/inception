#!/bin/sh

if [ ! -f /var/www/http/adminer/index.php ]; then
    mkdir -p /var/www/http/adminer;
    wget -O /var/www/http/adminer/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-en.php;
fi

exec php-fpm81 -F