FROM php:5.6-apache
MAINTAINER genrich @team

COPY php.ini /usr/local/etc/php/
RUN apt-get update \
  && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libxml2-dev libicu-dev \
  && docker-php-ext-install mysql pdo_mysql mysqli gd iconv zip mcrypt soap intl

RUN yes | pecl install xdebug-2.5.5 \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.show_error_trace=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_connect_back=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_port = 9000" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_host = dockerhost" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.scream = 0" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.show_local_vars = 1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.idekey = PHPSTORM" >> /usr/local/etc/php/conf.d/xdebug.ini 

COPY ./host.conf  /etc/apache2/sites-available/
COPY ./servername.conf  /etc/apache2/conf-available/
COPY ./server.crt /var/www/cert/server.crt
COPY ./server.key /var/www/cert/server.key

RUN a2enmod rewrite 
RUN a2enmod ssl

WORKDIR /etc/apache2/sites-available/
RUN a2ensite host

WORKDIR /etc/apache2/conf-available/
RUN a2enconf servername

RUN service apache2 restart

