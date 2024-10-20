# Dockerfile
FROM amazonlinux:2023.5.20241001.1

RUN dnf update -y && \
    dnf install -y nginx \
    vim \
    openssl \
    php8.3 \
    php8.3-bcmath \
    php8.3-cli \
    php8.3-common \
    php8.3-dba \
    php8.3-dbg \
    php8.3-devel \
    php8.3-embedded \
    php8.3-enchant \
    php8.3-ffi \
    php8.3-fpm \
    php8.3-gd \
    php8.3-gmp \
    php8.3-intl \
    php8.3-ldap \
    php8.3-mbstring \
    php8.3-modphp \
    php8.3-mysqlnd \
    php8.3-odbc \
    php8.3-opcache \
    php8.3-pdo \
    php8.3-pgsql \
    php8.3-process \
    php8.3-pspell \
    php8.3-snmp \
    php8.3-soap \
    php8.3-sodium \
    php8.3-tidy \
    php8.3-xml \
    php8.3-zip \
    mariadb105

RUN curl -fsSL https://rpm.nodesource.com/setup_20.x | bash
RUN dnf install -y nodejs \
    npm

RUN mkdir -p /run/php-fpm && \
    chown -R nginx:nginx /run/php-fpm && \
    chmod 770 /run/php-fpm
    
# Install Composer globally
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

# Set up working directory
WORKDIR /usr/share/nginx/html/

COPY src /usr/share/nginx/html/

COPY web/www.conf /etc/php-fpm/www.conf

# Copy the entrypoint script
COPY web/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose PHP-FPM on port 9000 and 5173
EXPOSE 9000 5173

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["php-fpm", "-F"]