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

all: DOCKER_UP


INITIALIZE: CREATE_FILES DOCKER_UP IP_DOMAIN


CREATE_FILES: 
	mkdir -p /home/joaoped2/Desktop/inception_data /home/joaoped2/Desktop/inception_data/WP_V /home/joaoped2/Desktop/inception_data/MDB_V

DOCKER_IMAGE_BUILD:
	sudo docker compose -f ./srcs/docker-compose.yml build --no-cache

IP_DOMAIN:
	sudo grep -Fq "joaoped2.42.fr" /etc/hosts || sudo sed -it '/127\.0\.0\.1/ s/$$/ joaoped2.42.fr/' /etc/hosts

DOCKER_UP: CREATE_FILES DOCKER_IMAGE_BUILD IP_DOMAIN
	sudo docker compose -f ./srcs/docker-compose.yml up -d --no-build

DOCKER_DW:
	sudo docker compose -f ./srcs/docker-compose.yml down

DOCKER_CLEAN: DOCKER_DW
	sudo rm -rf /home/joaoped2/Desktop/inception_data
	sudo docker system prune -af --volumes