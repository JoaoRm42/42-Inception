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

# Check for updates and install the necessary files
# to install Wordpress successfully
RUN apt update && apt upgrade -y
#PHP-fpm is a version PHP that talks to the outside world 
#with a protocol (a style of communication) called FastCGI
#PHP-mysql provides the MySQL module(s) for PHP
RUN apt install wget mariadb-client php7.4-fpm php7.4-mysql -y
#WP-CLI is the official command-line interface for WordPress.
#It lets you manage your WordPress site, themes, and plugins
#from the terminal, which is often a more convenient way for
#moderate to advanced WordPress users (or developers) to work
#with WordPress sites.
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /var/www/wordpress
RUN chown -R root:root /var/www/wordpress

# Copy the WP Setup to the container
COPY ./tools/script.sh /
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

#An ENTRYPOINT instruction is used to set executables
#that will always run when the container is initiated
ENTRYPOINT [ "sh", "/script.sh" ]