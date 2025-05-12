 # Use PHP with Apache
FROM php:8.1-apache

# Set the Apache DocumentRoot to /var/www/html/home
ENV APACHE_DOCUMENT_ROOT=/var/www/html/home

# Update Apache's default site config to use new DocumentRoot
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/000-default.conf

# Copy all project files into Apache root
COPY . /var/www/html/

# Enable mod_rewrite
RUN a2enmod rewrite

# Install PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Expose the default port
EXPOSE 80
