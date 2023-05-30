if [ ! -f /var/www/html/wp-config.php ]; then
	# Check if the database is running
	while ! mysqladmin ping -h mariadb --silent; do
		sleep 1
	done

	mkdir -p /var/www/html && \
	cd /var/www/html && \

	# Download and install WordPress
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \

	wp core download --allow-root && \

	wp config create --dbname=wordpress --dbuser=ange --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --allow-root && \

	wp core install --url=ange.42.fr --title="Mon site WordPress" --admin_user=ange --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=ange@42.fr --skip-email --allow-root && \

	wp user create $WORDPRESS_USER_NAME "user@42.fr" --role=author --user_pass=$WORDPRESS_USER_PASSWORD --allow-root
fi

exec "$@"
