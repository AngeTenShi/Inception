all: build

build: 
		docker-compose --env-file srcs/.env -f srcs/docker-compose.yml up --build --detach

up:
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml up

down:
		docker-compose -f srcs/docker-compose.yml --env-file srcs/.env down

ps:
	docker-compose -f srcs/docker-compose.yml ps

clean:
						@rm -rf $(NAME)
						@echo "$(YELLOW)Files has been removed."

re:                     clean all

.PHONY:         all clean re
