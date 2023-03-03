FROM debian:buster

RUN apt-get update -y; apt-get install mariadb-server mariadb-client -y
    
EXPOSE 3306

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/script.sh script.sh
COPY tools/config.sql config.sql

RUN service mysql start && mysql < config.sql

CMD mysqld --datadir=/var/lib/mysql
