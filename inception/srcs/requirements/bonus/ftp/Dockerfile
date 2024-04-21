FROM	debian:bookworm

RUN		apt update; apt install -y vsftpd
		
COPY	./conf/ftp.sh /usr/local/bin/ftp
RUN		chmod +x /usr/local/bin/ftp

ENTRYPOINT ["ftp"]