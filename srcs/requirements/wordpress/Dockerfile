FROM	debian:bookworm

RUN		apt update; apt install -y curl php-fpm php-mysql php-redis mariadb-client; apt clean -y;
        
RUN sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/8.2/fpm/pool.d/www.conf
RUN mkdir -p /var/www/http
RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x /usr/local/bin/wp
COPY conf/wpscript.sh /usr/local/bin/install_wordpress
RUN chmod +x /usr/local/bin/install_wordpress
WORKDIR /var/www/http

ENTRYPOINT	["install_wordpress"]