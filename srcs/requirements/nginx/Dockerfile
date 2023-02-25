FROM debian:buster

RUN apt-get update -y

RUN apt-get install nginx -y && \
    apt-get install openssl -y

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/ssl/certs/ahocine.crt \
    keyout /etc/ssl/private/ahocine.key \
    -subj "/C=FR"

COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443 9000

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
