FROM debian:buster

RUN apt-get update -y

RUN apt-get install nginx -y && \
    apt-get install openssl -y

RUN mkdir -p /etc/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/ssl/certs/ahocine.crt \
    -keyout /etc/ssl/private/ahocine.key \
    -subj "/C=FR"

COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443 9000

# Important while using 'yml' file
# Allow background running
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
