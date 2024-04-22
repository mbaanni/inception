FROM	alpine:3.18.4

RUN		apk update; apk add python3
RUN mkdir -p /var/www/http/

COPY ./conf/  /var/www/http/

WORKDIR /var/www/http/

ENTRYPOINT ["python3"]
CMD ["-m", "http.server", "9000"]