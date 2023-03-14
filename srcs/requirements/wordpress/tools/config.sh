if [ ! -f /var/www/html/wp-admin ]; then
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
  chmod +x wp-cli.phar && \
  mkdir -p /var/html/www && \
  mv wp-cli.phar /usr/local/bin/wp && \
  wp core download --allow-root && \
  wp config create --dbname=wordpress --dbuser=anggonza --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --allow-root && \
  wp core install --url=anggonza.42.fr --title="Mon site WordPress" --admin_user=anggonza --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=anggonza@42.fr --skip-email --allow-root
  wp config set WP_DEBUG true --raw --allow-root
  wp config set WP_DEBUG_DISPLAY true --raw --allow-root
  wp config set WP_DEBUG_LOG true --raw --allow-root
fi

exec "$@"