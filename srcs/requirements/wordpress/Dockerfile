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

# Easy configuration with cli
RUN apt update && apt install wget -y

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Check for updates and install the necessary files
# to install Wordpress successfully
RUN apt update && apt upgrade -y
RUN apt install -y \
    curl \
    tar \
    mariadb-client \
    php7.4-cli \
    php7.4-fpm \
    php7.4-mysql \ 
    php7.4-json \
    php7.4-opcache \
    php7.4-mbstring \
    php7.4-xml \
    php7.4-cgi \
    php-pear \
    php7.4-zip \
    php-net-socket \
    php7.4-common \
    php7.4-gd php7.4-curl \
    php-xml-util \
    php7.4-gettext \
    php7.4-bcmath

RUN mkdir /var/www
RUN mkdir /var/www/wordpress
#RUN apt install mariadb-client php7.4-cli php7.4-json php7.4-opcache php7.4-mbstring php7.4-xml php7.4-cgi php7.4-zip php7.4-common php7.4 php7.4-fpm php7.4-mysql -y
# RUN wget https://wordpress.org/wordpress-6.5.3.tar.gz -P /var/www
# RUN cd /var/www && tar -xzf wordpress-6.5.3.tar.gz && rm wordpress-6.5.3.tar.gz
#COPY ./conf/wp-config.php /var/www/wordpress
RUN chown -R root:root /var/www/wordpress

# Copy the WP Setup to the container
COPY ./tools/script.sh /var/www/wordpress/script.sh
COPY conf/php-fpm.conf /etc/php7/php-fpm.conf

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

ENTRYPOINT [ "sh", "/var/www/wordpress/script.sh" ]

