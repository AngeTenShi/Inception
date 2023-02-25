#!/bin/sh

DIR="/var/lib/mysql"
if [ -d "$DIR" ]; then
  chown -R mysql:mysql /var/lib/mysql && \
  chmod -R 777 /var/lib/mysql && \
  mkdir /run/mysqld && \
  chown mysql:mysql /run/mysqld && \
  chmod -R 777 /run/mysqld && \
  mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

mysqld_safe
