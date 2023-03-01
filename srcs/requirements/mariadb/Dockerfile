FROM debian:buster

ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_ROOT_PASSWORD

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY ./config/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./config/init.sql /var/www/

RUN service mysql start && \
    mysql < /var/www/init.sql && \
    rm -f /var/www/init.sql

EXPOSE 3306

ENTRYPOINT [ "mysqld", "--defaults-file=/etc/mysql/mariadb.conf.d/50-server.cnf" ]