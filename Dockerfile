FROM alpine:latest
MAINTAINER Prashant Vyas

RUN apk update \
    && apk upgrade \
    && apk --update --no-cache add bind openrc \
    && apk add apache2 php5-apache2 \
    && mkdir /run/apache2 \
    && echo "ServerName prashant.com" >> /etc/apache2/httpd.conf

COPY index.php /var/www/localhost/htdocs/index.php

EXPOSE 80

ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
