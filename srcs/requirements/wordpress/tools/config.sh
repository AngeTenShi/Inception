curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root
wp config create --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --allow-root
wp core install --url=anggonza.42.fr --title="Mon site WordPress" --admin_user=admin --admin_password=legrospassword42 --admin_email=aggonza@42.fr --allow-root
