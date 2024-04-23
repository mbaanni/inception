FROM        alpine:3.12 AS TLS
RUN         apk update; apk add openssl
WORKDIR     /etc/ssl/private/
RUN         openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -sha256 -days 365 -nodes -subj "/C=MA/ST=Tanger-Tetouan/L=Martil/O=inception/CN=mbaanni.42.fr"

FROM        alpine:3.12
RUN         apk update; apk add nginx
RUN         mkdir /run/nginx/
COPY        conf/default /etc/nginx/nginx.conf
COPY        --from=TLS /etc/ssl/private/ /etc/ssl/private/

ENTRYPOINT  ["nginx"]
CMD         ["-g", "daemon off;"]