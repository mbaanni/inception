FROM	alpine:3.18.4 AS TLS

RUN		apk update; apk add openssl

WORKDIR	/etc/ssl/private/

RUN		openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 3650 -nodes\
			-subj "/C=MA/ST=Tanger-Tetouan/L=Martil/O=1337/OU=1337MED/CN=inception"

FROM	alpine:3.18.4

RUN		apk update; apk add nginx; rm -rf /var/cache/apk/*
COPY	conf/default /etc/nginx/http.d/default.conf
COPY	--from=TLS /etc/ssl/private/ /etc/ssl/private/

CMD ["-g", "daemon off;"]
ENTRYPOINT ["nginx"]