 # Use PHP with Apache
FROM php:8.1-apache

# Set the Apache DocumentRoot to /var/www/html (root of your project in the container)
ENV APACHE_DOCUMENT_ROOT=/var/www/html

# Update Apache's default site config to use the new DocumentRoot
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/000-default.conf

# Copy all project files from your local project directory into the container's /var/www/html
COPY ./ /var/www/html/

# Enable mod_rewrite for URL rewriting
RUN a2enmod rewrite

# Install necessary PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Set proper permissions for the /auth, /home, and /styles directories
RUN chmod -R 755 /var/www/html/auth /var/www/html/home /var/www/html/styles

# Expose port 80 for the Apache server
EXPOSE 80
