# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: joaoped2 <joaoped2@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/30 11:14:22 by joaoped2          #+#    #+#              #
#    Updated: 2024/05/23 11:15:32 by joaoped2         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Operating System used on the container
FROM debian:bullseye

# Let's Expose the port for mariadb to run on
EXPOSE 3306

# Check for updates and install the necessary files
# to install mariadb successfully
RUN apt update && apt upgrade -y
RUN apt install mariadb-server -y

# I used this example file of 50-server.cnf
# https://exampleconfig.com/view/mariadb-ubuntu18-04-etc-mysql-mariadb-conf-d-50-server-cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the script of the configuration of the database
COPY ./tools/script.sh /tmp/script.sh

ENTRYPOINT [ "sh", "/tmp/script.sh" ]