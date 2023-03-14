all: build

build: 
		docker-compose -f srcs/docker-compose.yml up --build

up:
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml up

down:
		docker-compose -f srcs/docker-compose.yml --env-file srcs/.env down

ps:
	docker-compose -f srcs/docker-compose.yml ps

clean: down
	docker system prune -af

re:                     clean all

.PHONY:         all clean re
