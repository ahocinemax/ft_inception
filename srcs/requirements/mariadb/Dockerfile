FROM debian:buster

ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_ROOT_PASSWORD

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY ./config/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN service mysql start && \
    mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE}; \
    CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; \
    GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%'; \
    FLUSH PRIVILEGES; \
    ALTER USER 'root'@'localhost' IDENTIFIED by '${MYSQL_ROOT_PASSWORD}';"

EXPOSE 3306

ENTRYPOINT [ "mysqld", "--defaults-file=/etc/mysql/mariadb.conf.d/50-server.cnf" ]