
all: build

build:
	@sudo mkdir -p /home/mbaanni/data/wordpress /home/mbaanni/data/mariadb
	@sudo docker compose -f srcs/docker-compose.yml up -d --build

start:
	@sudo docker compose -f srcs/docker-compose.yml -d up

stop:
	@sudo docker compose -f srcs/docker-compose.yml stop

clean:
	@sudo docker compose -f srcs/docker-compose.yml down -v
	@sudo rm -rf /home/mbaanni/data/

fclean:
	@sudo docker compose -f srcs/docker-compose.yml down -v
	@sudo docker system prune -af
	@sudo rm -rf /home/mbaanni/data/

re: stop start
