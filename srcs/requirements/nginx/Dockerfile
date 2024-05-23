# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: joaoped2 <joaoped2@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/19 11:14:41 by joaoped2          #+#    #+#              #
#    Updated: 2024/05/23 11:15:08 by joaoped2         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Operating System used on the container
FROM debian:bullseye

# Let's Expose the port for nginx to run on
EXPOSE 443

# Check for updates and install the necessary files
# to install nginx and openssl successfully
RUN apt update && apt upgrade -y
RUN apt install nginx openssl libssl-dev -y

# We first copy the configuration file of nginx to the container
COPY ./conf/nginx.conf /etc/nginx/conf.d

# Create Path to the ssl certificate and
# generate a self signed certificate
RUN mkdir etc/nginx/ssl
RUN openssl req -x509 -new -newkey rsa:2048 -nodes \
                -out etc/nginx/ssl/joaoped2_42_fr.csr \
                -keyout etc/nginx/ssl/joaoped2_42_fr.key \
                -subj "/C=PT/ST=Porto/L=Porto/O=42/OU=joaoped2/CN=joaoped2.42.fr"


RUN service nginx restart
# Let's create a folder for nginx to store runtime files
# I use mkdir -p so if the folder already exists it ignores
# the process of creating it and doesn't return an error
RUN mkdir -p run/nginx

# The default command of the nginx image which is executed when you run the container
# is set to CMD ["nginx", "-g", "daemon off;"]. When you run the attach command your
# terminal attaches to the nginx process.
CMD ["nginx", "-g", "daemon off;"]
