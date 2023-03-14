
if [ ! -d "/var/lib/mysql/${WORDPRESS_DB_NAME}" ]
then
    service mysql start
    mysql -e "CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB_NAME};"
    mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${WORDPRESS_DB_NAME}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -e "FLUSH PRIVILEGES;"
    mysql -e "SET PASSWORD FOR root@localhost = PASSWORD('$MYSQL_ROOT_PASSWORD');"
    sleep 4
    mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown
fi

exec mysqld_safe