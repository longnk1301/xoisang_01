FROM ubuntu:16.04

# Install, PHP
RUN apt-get clean && apt-get -y update && apt-get install -y locales curl software-properties-common git \
  && locale-gen en_US.UTF-8
RUN LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y --force-yes php7.1-bcmath php7.1-bz2 php7.1-cli php7.1-common php7.1-curl \
    php7.1-cgi php7.1-dev php7.1-fpm php7.1-gd php7.1-gmp php7.1-imap php7.1-intl \
    php7.1-json php7.1-ldap php7.1-mbstring php7.1-mcrypt php7.1-mysql \
    php7.1-odbc php7.1-opcache php7.1-pgsql php7.1-phpdbg php7.1-pspell \
    php7.1-readline php7.1-recode php7.1-soap php7.1-sqlite3 \
    php7.1-tidy php7.1-xml php7.1-xmlrpc php7.1-xsl php7.1-zip \
    php-tideways php-mongodb

RUN apt-get -y --force-yes install nginx supervisor

# install nodejs, npm, bower
# Install Nodejs
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g gulp-cli bower eslint babel-eslint eslint-plugin-react yarn

RUN apt-get update
RUN apt-get -y install git vim curl
RUN apt-get -y install supervisor
RUN npm install -g bower
RUN npm install --global gulp-cli
RUN apt-get install -y ruby-full rubygems
RUN gem install sass

# Install "php-curl"
RUN apt-get -y install php-curl

# Install PM2
RUN npm install -g pm2

# We want the "add-apt-repository" command
RUN apt-get update && apt-get install -y software-properties-common

# Install "ffmpeg"
RUN add-apt-repository ppa:mc3man/trusty-media
RUN apt-get install -y ffmpeg

# RUN pecl install mongodb
#ADD conf.d/mongodb.ini /etc/php/7.0/apache2/conf.d/30-mongodb.ini
#ADD conf.d/mongodb.ini /etc/php/7.0/cli/conf.d/30-mongodb.ini
#ADD conf.d/mongodb.ini /etc/php/7.0/mods-available//mongodb.ini

# Install Composer, PHPCS and Framgia Coding Standard,
# PHPMetrics, PHPDepend, PHPMessDetector, PHPCopyPasteDetector
WORKDIR ~/.composer/vendor/squizlabs/php_codesniffer/src/Standards/

RUN curl -s http://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && composer global require 'squizlabs/php_codesniffer=3' \
        'phpmetrics/phpmetrics' \
        'pdepend/pdepend' \
        'phpmd/phpmd' \
        'sebastian/phpcpd' \
    && cd ~/.composer/vendor/squizlabs/php_codesniffer/src/Standards/ \
    && git clone https://github.com/wataridori/framgia-php-codesniffer.git Framgia

# Create symlink
RUN ln -s /root/.composer/vendor/bin/phpcs /usr/bin/phpcs \
    && ln -s /root/.composer/vendor/bin/pdepend /usr/bin/pdepend \
    && ln -s /root/.composer/vendor/bin/phpmetrics /usr/bin/phpmetrics \
    && ln -s /root/.composer/vendor/bin/phpmd /usr/bin/phpmd \
    && ln -s /root/.composer/vendor/bin/phpcpd /usr/bin/phpcpd

RUN apt-get install -y libpng16-dev


# Install framgia-ci-tool
RUN curl -o /usr/bin/framgia-ci https://raw.githubusercontent.com/framgia/ci-report-tool/master/dist/framgia-ci \
    && chmod +x /usr/bin/framgia-ci

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get -y install libpng16-dev

WORKDIR /var/www/html

# Expose nginx.
EXPOSE 80 443

COPY conf.d/default.conf /etc/nginx/sites-available/default
COPY conf.d/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Default command
CMD ["/usr/bin/supervisord"]
