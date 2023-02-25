FROM debian:buster

RUN apt-get update; apt-get install mariadb-server -y
EXPOSE 3306

COPY conf/my.cnf /var/lib/mysql/my.cnf
COPY tools/script.sh script.sh


LABEL version="1.0"
LABEL description="MariaDB Server"

CMD ["sh", "script.sh"]