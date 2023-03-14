all: build

build: 
		docker-compose -f srcs/docker-compose.yml up --build -d

up:
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml up

down:
		docker-compose -f srcs/docker-compose.yml --env-file srcs/.env down

ps:
	docker-compose -f srcs/docker-compose.yml ps

clean: down
	docker system prune -f

re:                     clean all

.PHONY:         all clean re
