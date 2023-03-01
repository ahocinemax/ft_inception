FROM debian:buster

ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_ROOT_PASSWORD

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server

RUN service mysql start && \
    mysql -e "CREATE DATABASE ${MYSQL_DATABASE}; \
    CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; \
    GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%'; \
    FLUSH PRIVILEGES; \
    SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}');"

EXPOSE 3306

ENTRYPOINT [ "mysqld", "--bind-address=0.0.0.0" ]