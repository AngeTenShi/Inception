FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl

EXPOSE 443

RUN mkdir -p /etc/nginx/ssl && \
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/anggonza.pem \
        -keyout /etc/nginx/ssl/anggonza.key \
        -subj "/C=FR/ST=France/O=42/CN=anggonza/"

COPY conf/default.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
