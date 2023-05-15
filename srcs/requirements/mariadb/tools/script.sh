#!/bin/bash

service mysql start

echo "create database $DB_NAME default character set utf8 collate utf8_unicode_ci;" > mysql_conf
echo "create user '$DB_USER'@'%' identified by '$DB_PW';" >> mysql_conf
echo "grant all privileges on $DB_NAME.* TO '$DB_USER'@'%';" >> mysql_conf
echo "flush privileges;" >> mysql_conf

#working just fine
#echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > mysql_conf 
##set root with the password 1234
#echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_PW';" >> mysql_conf 
##echo "ALTER USER 'root'@'%' IDENTIFIED BY '$DB_PW';" >> mysql_conf 
##Creates a user named younes with the password 1234 and grants them access from any host
#echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PW';" >>  mysql_conf
##Grants all privileges on the word_db database to the younes use
#echo "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%';" >> mysql_conf
##reloads the privileges from the grant tables in the MySQL database
#echo "FLUSH PRIVILEGES;" >> mysql_conf 

#cat < mysql_conf

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

#bash
mysql < mysql_conf

kill `cat /var/run/mysqld/mysqld.pid`

mysqld_safe
