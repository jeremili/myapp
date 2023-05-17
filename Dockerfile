FROM php:8.2-apache

WORKDIR /var/www/html/

COPY ./config/vhost.conf /etc/apache2/sites-available

COPY ./app/index.html .

COPY ./app/phpinfo.php .

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli && service apache2 start && service apache2 start && a2dissite 000-default && a2ensite vhost && service apache2 restart

VOLUME /var/www/html

ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]