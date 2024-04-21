FROM	alpine:3.18.4

RUN apk update; apk add wget php-fpm php-session php-mysqli
RUN sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /etc/php81/php-fpm.d/www.conf;

COPY	./conf/adminer.sh /usr/local/bin/adminer
RUN		chmod +x /usr/local/bin/adminer

ENTRYPOINT ["adminer"]