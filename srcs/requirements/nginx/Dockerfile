FROM        alpine:3.12 AS TLS
RUN         apk update; apk add openssl
WORKDIR     /etc/ssl/private/
RUN         openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout server.key -out server.cert -subj "/C=MA/ST=Tanger-Tetouan/L=Martil/O=inception/CN=mbaanni.42.fr"

FROM        alpine:3.12
RUN         apk update; apk add nginx; mkdir -p /run/nginx/
COPY        --from=TLS /etc/ssl/private/ /etc/ssl/private/
COPY        conf/default /etc/nginx/conf.d/default.conf

ENTRYPOINT  ["nginx"]
CMD         ["-g", "daemon off;"]