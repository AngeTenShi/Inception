FROM alpine:3.14

RUN apk add mariadb mariadb-client && rm -rf /var/cache/apk/*

EXPOSE 3306

COPY conf/my.cnf /var/lib/mysql/my.cnf
COPY tools/script.sh script.sh


LABEL version="1.0"
LABEL description="MariaDB Server"

CMD ["sh", "script.sh"]