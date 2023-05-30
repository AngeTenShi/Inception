if [[ ! -d /var/lib/mysql/wordpress ]]
then
  service mysql start;
  mysql -h localhost -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS \`${WORDPRESS_DB_NAME}\`;"

  mysql -h localhost -p$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

  mysql -h localhost -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON \`${WORDPRESS_DB_NAME}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

  mysql -h localhost -p$MYSQL_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

  mysql -h localhost -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

  mysqladmin -h localhost -u root -p$MYSQL_ROOT_PASSWORD shutdown
fi

exec "$@"
