NAME	=	inception

CONTAINERS	=	nginx wordpress mariadb

IMAGES	=	nginx:custom wordpress:custom mariadb:custom

VOLUMES =	srcs_db_data srcs_wp_data

COMPOSE	=	/home/ahocine/.docker/cli-plugins/docker-compose -f srcs/docker-compose.yml

# Colors
RED		=	\033[0;31m
GREEN	=	\033[0;32m
YELLOW	=	\033[0;33m
BLUE	=	\033[0;34m
PURPLE	=	\033[0;35m
CYAN	=	\033[0;36m
WHITE	=	\033[0;37m
RESET	=	\033[0m

up:
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down

start:
	$(COMPOSE) start

restart:
	$(COMPOSE) restart

fclean:	down
	-docker volume rm $(VOLUMES)
	-docker rmi -f $(IMAGES)
	-docker system prune -a -f --volumes

re:	fclean up

.PHONY:	up down fclean re