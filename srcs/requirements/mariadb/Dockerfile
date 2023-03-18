FROM    debian:buster

RUN     apt update -y \
        && apt upgrade -y \
        && apt install mariadb-server -y \
        && apt install mariadb-client -y

COPY    ./conf/mariadb.cnf      /etc/mysql/mariadb.cnf
COPY    ./tools/script.sh       /etc/mysql/script.sh

RUN     chmod -R 755 /etc/mysql/script.sh
RUN     mkdir -p /run/mysqld \
        && chown mysql:mysql /run/mysqld 

EXPOSE 3306

ENTRYPOINT ["bash", "/etc/mysql/script.sh"]

CMD ["mysqld"]