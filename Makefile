# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: joaoped2 <joaoped2@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/23 11:13:53 by joaoped2          #+#    #+#              #
#    Updated: 2024/05/23 11:41:18 by joaoped2         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: INITIALIZE


INITIALIZE: CREATE_FILES IP_DOMAIN DOCKER_UP


CREATE_FILES: 
	mkdir -p /home/joaoped2/data

DOCKER_IMAGE_BUILD:
	sudo docker compose -f ./srcs/docker-compose.yml build --no-cache

IP_DOMAIN:
	sudo sed -i '/^127.0.0.1/ {/joaoped2.42.fr/! s/localhost/localhost joaoped2.42.fr/}' /etc/hosts

DOCKER_UP: CREATE_FILES DOCKER_IMAGE_BUILD
	sudo docker compose -f ./srcs/docker-compose.yml up -d --no-build

start:
	sudo docker compose -f ./srcs/docker-compose.yml up -d --no-build

stop:
	sudo docker compose -f ./srcs/docker-compose.yml stop

clean: stop
	sudo docker compose -f ./srcs/docker-compose.yml down
	sudo docker volume rm srcs_mariadb srcs_wordpress
	sudo rm -rf /home/joaoped2/data
	sudo docker system prune -af --volumes

re: clean INITIALIZE 