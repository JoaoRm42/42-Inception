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


INITIALIZE: CREATE_FILES DOCKER_UP IP_DOMAIN


CREATE_FILES: 
	mkdir -p /home/joaoped2/Desktop/inception_data /home/joaoped2/Desktop/inception_data/WP_V /home/joaoped2/Desktop/inception_data/MDB_V

DOCKER_UP:
	sudo docker compose -f ./srcs/docker-compose.yml build --no-cache

IP_DOMAIN:
	sudo grep -Fq "joaoped2.42.fr" /etc/hosts || sudo sed -it '/127\.0\.0\.1/ s/$$/ joaoped2.42.fr/' /etc/hosts