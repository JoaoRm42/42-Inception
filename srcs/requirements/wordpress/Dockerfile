# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: joaoped2 <joaoped2@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/10 11:15:41 by joaoped2          #+#    #+#              #
#    Updated: 2024/05/23 11:15:49 by joaoped2         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Operating System used on the container
FROM debian:bullseye

# Let's Expose the port for Wordpress to run on
EXPOSE 9000

# Copy the WP Setup to the container
COPY ./tools/script.sh /tmp/script.sh

# Install necessary dependencies
RUN apt update && apt install -y \
    wget \
    mariadb-client \
    php7.4 \
    php-fpm \
    php-mysql \
    curl

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Download and setup WordPress
RUN wget https://wordpress.org/wordpress-6.5.3.tar.gz -P /var/www \
    && tar -xzf /var/www/wordpress-6.5.3.tar.gz -C /var/www \
    && rm /var/www/wordpress-6.5.3.tar.gz \
    && chown -R www-data:www-data /var/www/wordpress

# Copy configuration files
COPY ./conf/wp-config.php /var/www/wordpress/wp-config.php
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Create necessary directories
RUN mkdir /run/php && chown -R www-data:www-data /run/php

# Make the script executable
RUN chmod +x /tmp/script.sh

ENTRYPOINT [ "sh", "/tmp/script.sh" ]
