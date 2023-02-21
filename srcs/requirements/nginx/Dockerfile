FROM debian:buster

RUN apt-get update -y

RUN apt-get install nginx -y && \
    apt-get install openssl -y

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -sha256 \
    -out /etc/ssl/certs/ahocine.crt \
    keyout /etc/ssl/private/ahocine.key \
    -subj "/C=FR"

COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443 9000

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
