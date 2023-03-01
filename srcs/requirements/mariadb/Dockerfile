FROM debian:buster

ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_ROOT_PASSWORD

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY ./config/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./config/init.sql /etc/mysql/conf.d/

RUN service mysql start && \
    mysql < /etc/mysql/conf.d/init.sql && \
    rm -f /etc/mysql/conf.d/init.sql

EXPOSE 3306

ENTRYPOINT [ "mysqld" ]