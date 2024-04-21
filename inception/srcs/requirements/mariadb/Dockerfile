FROM	alpine:3.18.4

RUN		apk update; apk add mariadb; rm -rf /var/cache/apk/*
COPY	conf/install.sh /usr/local/bin/install_mariadb
RUN		chmod +x /usr/local/bin/install_mariadb

RUN		mkdir -p /run/mysqld;\
		chown -R mysql:mysql /run/mysqld ;\
		chown -R mysql /var/lib/mysql;\
		sed -i "s/#bind-address/bind-address/" /etc/my.cnf.d/mariadb-server.cnf;\
		sed -i "s/skip-networking/#skip-networking/" /etc/my.cnf.d/mariadb-server.cnf

ENTRYPOINT ["install_mariadb"]