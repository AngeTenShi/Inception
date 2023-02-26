#!/bin/sh

if [ ! -d "/var/lib/mysql" ]; then
  chown -R mysql:mysql /var/lib/mysql && \
  chmod -R 777 /var/lib/mysql && \
  if [ ! -d "/run/mysqld" ]; then
    mkdir /run/mysqld && \
    chown mysql:mysql /run/mysqld && \
    chmod -R 777 /run/mysqld
  fi
  mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

mysqld_safe

