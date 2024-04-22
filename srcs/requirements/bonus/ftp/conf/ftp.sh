#! /bin/sh

if [ ! $(cat /etc/passwd | grep "$FTP_USER:") ] ; then
    sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf

    mkdir -p /var/run/vsftpd/empty

    useradd ${FTP_USER}
    echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd

    usermod -d /var/www/http/ ${FTP_USER}
fi

exec vsftpd /etc/vsftpd.conf