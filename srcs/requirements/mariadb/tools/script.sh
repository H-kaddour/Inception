#!/bin/bash

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > mysql_conf 
echo "create user '$DB_USER'@'%' identified by '$DB_PW';" >> mysql_conf
echo "grant all privileges on $DB_NAME.* TO '$DB_USER'@'%';" >> mysql_conf
echo "flush privileges;" >> mysql_conf

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

mysql < mysql_conf

kill `cat /var/run/mysqld/mysqld.pid`

mysqld_safe
