FROM debian:buster

RUN apt-get update && apt-get install -y nginx && apt-get install -y openssl

RUN mkdir -p /etc/nginx/ssl && \
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/anggonza.pem \
        -keyout /etc/nginx/ssl/anggonza.key \
        -subj "/C=FR/ST=France/O=42/CN=anggonza/"
EXPOSE 443

COPY conf/nginx.conf /etc/nginx/http.d

CMD ["nginx", "-g", "daemon off;"]
