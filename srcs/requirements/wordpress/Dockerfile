FROM debian:buster

RUN apt-get update -y && apt-get install -y php-mysql php-fpm default-mysql-client wget curl && \
    wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && \
    mkdir -p /var/www/html && \
    cp -r wordpress/* /var/www/html && chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html/

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY tools/config.sh config.sh

EXPOSE 9000

RUN mkdir -p /run/php

ENTRYPOINT [ "sh", "config.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]