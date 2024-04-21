FROM	debian:bookworm

RUN		apt update; apt install -y curl php-fpm php-mysql mariadb-client; apt clean -y;
        
COPY conf/wpscript.sh /usr/local/bin/install_wordpress
RUN chmod +x /usr/local/bin/install_wordpress
RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x /usr/local/bin/wp

WORKDIR /var/www/http

ENTRYPOINT	["install_wordpress"]