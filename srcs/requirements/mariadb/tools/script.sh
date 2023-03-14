if [ -d /var/lib/mysql ] ; then
    mysql_install_db
fi

mysql -h localhost -e "CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB_NAME};"
mysql -h localhost -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -h localhost -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%';"
mysql -h localhost -e "FLUSH PRIVILEGES;"
mysql -h localhost -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

exec "mysqld"