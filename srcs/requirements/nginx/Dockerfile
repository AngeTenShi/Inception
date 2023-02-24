FROM alpine:3.14

RUN apk update && \
    apk add nginx && \
    adduser -D -g 'www' www && \
    mkdir /www && \
    chown -R www:www /var/lib/nginx && \
    chown -R www:www /www

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]