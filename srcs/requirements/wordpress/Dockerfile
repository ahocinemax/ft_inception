FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install php-fpm php-mysql -y && \
    apt-get install wget -y && \
    service php7.3-fpm start && \
    service php7.3-fpm stop

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

COPY ./tools /tmp

RUN chmod +x /tmp/conf.sh

EXPOSE 3306 9000

CMD ["bash", "/tmp/conf.sh"]
