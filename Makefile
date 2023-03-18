all: build

build:
		@mkdir -p /home/anggonza/data/mariadb
		@mkdir -p /home/anggonza/data/wordpress
		docker-compose --env-file srcs/.env -f srcs/docker-compose.yml up --build -d

up:
		docker-compose --env-file srcs/.env -f srcs/docker-compose.yml up

down:
		docker-compose -f srcs/docker-compose.yml --env-file srcs/.env down

ps:
		docker-compose -f srcs/docker-compose.yml ps

clean:
						@rm -rf /home/anggonza/data/*
						docker system prune -af
						@echo "$(YELLOW)Files has been removed."

re:                     clean all

.PHONY:         all clean re
