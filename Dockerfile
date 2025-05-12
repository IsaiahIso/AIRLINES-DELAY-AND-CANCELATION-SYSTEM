# Use PHP with Apache
FROM php:8.1-apache

# Copy all project files into the Apache root directory
COPY . /var/www/html/

# Enable Apache's mod_rewrite (important for .htaccess or routing)
RUN a2enmod rewrite

# Install PHP extensions (uncomment if needed)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Expose the web server port
EXPOSE 80
