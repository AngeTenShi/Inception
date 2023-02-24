FROM alpine:3.14

RUN apk add mariadb mariadb-client && rm -rf /var/cache/apk/*

EXPOSE 3306

COPY conf/my.cnf /etc/mysql/my.cnf

RUN mkdir /run/mysqld && \
    chown mysql:mysql /run/mysqld && \
    chmod 777 /run/mysqld && \
    mysql_install_db --user=mysql --datadir=/var/lib/mysql && \
    /usr/bin/mysqld_safe --datadir='/var/lib/mysql' && \
    echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql

EXPOSE 3306

CMD mysqld_safe --datadir='/var/lib/mysql'
