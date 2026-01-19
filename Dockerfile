FROM debian:buster

LABEL maintainer="Amani Layouni"

RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i '/stretch-updates/d' /etc/apt/sources.list

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
    nginx \
    mariadb-server \
    php7.3-fpm \
    php7.3-mysql \
    php7.3-mbstring \
    php7.3-zip \
    php7.3-gd \
    php7.3-curl \
    php7.3-xml \
    wget \
    curl \
    openssl

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    mv wordpress /var/www/html/wordpress && \
    rm latest.tar.gz

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz && \
    tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz && \
    mv phpMyAdmin-5.0.4-all-languages /var/www/html/phpmyadmin && \
    rm phpMyAdmin-5.0.4-all-languages.tar.gz

RUN chown -R www-data:www-data /var/www/html/

# Bonus ENV autoinDEX (si tu veux le point)
ENV AUTOINDEX=on

COPY init_mysql.sh /tmp/init_mysql.sh
RUN chmod +x /tmp/init_mysql.sh

COPY wp-config.php /var/www/html/wordpress/wp-config.php
COPY config.inc.php /var/www/html/phpmyadmin/config.inc.php
COPY nginx.conf /etc/nginx/sites-available/default

COPY start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh

COPY index.php /var/www/html/index.php

EXPOSE 80
CMD ["/tmp/start.sh"]
