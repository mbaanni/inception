#! /bin/sh

if [ ! -d  /var/lib/mysql/mysql ]; then
	mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
	mariadbd --user=mysql --bootstrap <<-EOF
		USE mysql;
		FLUSH PRIVILEGES ;
		GRANT ALL ON *.* TO 'root'@'%' identified by '$DATABASE_ROOT_PASS' WITH GRANT OPTION ;
		SET PASSWORD FOR 'root'@'%' = PASSWORD('$DATABASE_ROOT_PASS');
		FLUSH PRIVILEGES ;
		CREATE DATABASE $DATABASE_NAME;
		CREATE USER '$DATABASE_USER'@'%' IDENTIFIED BY '$DATABASE_PASS';
		GRANT ALL ON wordpress.* TO '$DATABASE_USER'@'%';
		FLUSH PRIVILEGES ;
		EOF
else
    echo "MariaDB is already installed"
fi

exec mariadbd --user=mysql --console