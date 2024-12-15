FROM gghtrt520/rocky:9.3

RUN dnf install -y https://rpms.remirepo.net/enterprise/remi-release-9.rpm \
    && dnf module reset php \
    && dnf module enable php:remi-8.3 -y \
    && dnf install -y \
        php \
        php-cli \
        php-fpm \
        php-mysqlnd \
        php-zip \
        php-devel \
        php-gd \
        php-mcrypt \
        php-mbstring \
        php-curl \
        php-xml \
        php-pear \
        php-bcmath \
        php-json \
        php-redis \
        php-imagick \
        php-pgsql \
        php-grpc \
        php-swoole

COPY supervisord.conf /etc/supervisord.conf

RUN php -i && php -m && php -v

RUN mkdir -p /run/php-fpm

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]