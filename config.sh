if [ ! -f ./wp-config.php ]; then
	# Check if the database is running
	while ! mysqladmin ping -h mariadb --silent; do
		sleep 1
	done
	#!/bin/bash

# Step 1: Install WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Step 2: Change to the web root directory
cd /var/www/html

# Step 3: Download and install WordPress
wp core download --allow-root
wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --dbprefix=wp_ --allow-root
wp core install --url="anggonza.42.fr" --title="Your Site Title" --admin_user="$WORDPRESS_USER_NAME" --admin_password="$WORDPRESS_ADMIN_PASSWORD" --admin_email="user@42.fr" --skip-email --allow-root

wp user create "$WORDPRESS_USER_NAME" "user@42.fr" --role=author --user_pass="$WORDPRESS_USER_PASSWORD" --allow-root

fi

exec "$@"
