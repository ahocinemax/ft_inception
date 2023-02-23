FROM debian:buster

ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE

RUN apt-get update && apt-get upgrade -y && \
    apt-get install mariadb-server -y

RUN service mysql start && \
    mysql -e "CREATE DATABASE ${MYSQL_DATABASE}; \
    CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'; \
    GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%'; \
    FLUSH PRIVILEGES;"

EXPOSE 3306

ENTRYPOINT [ "mysqld", "--bind-address=0.0.0.0" ]