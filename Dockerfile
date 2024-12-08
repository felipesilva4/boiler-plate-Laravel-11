FROM php:8.2-fpm

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 777 /var/www/html


# Instalar dependências do sistema para PHP e extensões necessárias
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libpq-dev \
    zip \
    unzip \
    git \
    curl \
    cron \
    gnupg2 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Instalar extensões do PHP
RUN docker-php-ext-install pdo pdo_pgsql mbstring exif pcntl bcmath gd

# Definir o usuário e grupo para o PHP-FPM
RUN sed -i -e 's/user = www-data/user = nome_do_usuario/g' /usr/local/etc/php-fpm.d/www.conf \
 && sed -i -e 's/group = www-data/group = nome_do_grupo/g' /usr/local/etc/php-fpm.d/www.conf

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Obter a última versão do Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Instalar Node.js e npm
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
 && apt-get install -y nodejs


WORKDIR /var/www

RUN mkdir -p /var/www/vendor && chown -R www-data:www-data /var/www/vendor

RUN chown -R www-data:www-data /var/www

USER www-data

EXPOSE 9000
CMD ["php-fpm"]
