# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jariza-o <jariza-o@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/01 17:13:14 by jariza-o          #+#    #+#              #
#    Updated: 2024/07/01 18:51:04 by jariza-o         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
		@sudo mkdir -p ~/data/mariadb
		@sudo mkdir -p ~/data/wordpress
		@docker compose -f ./srcs/docker-compose.yml up

re:
		@rm -rf ~/data/mariadb/*
		@rm -rf ~/data/wordpress/*
		@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
		@docker compose -f ./srcs/docker-compose.yml down

clean: down
		@rm -rf ~/data/mariadb
		@rm -rf ~/data/wordpress

fclean:
		@docker stop $$(docker ps -qa)
		@docker system prune --all --force --volumes
		@docker network prune --force
		@docker volume prune --force
		@docker volume rm $(docker volume ls -q)
		@rm -rf ~/data/wordpress
		@rm -rf ~/data/mariadb

logs:
		@docker compose -f ./srcs/docker-compose.yml logs

.PHONY: all re down clean fclean logs