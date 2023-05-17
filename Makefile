PATH = /home/hkaddour/data
FILE = srcs/docker-compose.yml
EXEC = /usr/local/bin

all: up

up:
	$(EXEC)/docker-compose -f $(FILE) build
	$(EXEC)/docker-compose -f $(FILE) up -d

build:
	$(EXEC)/docker-compose -f $(FILE) build

run:
	$(EXEC)/docker-compose -f $(FILE) up -d

down:
	$(EXEC)/docker-compose -f $(FILE) down 

fclean:
	/usr/bin/sudo /usr/bin/rm -rf $(PATH)/wordpress/* $(PATH)/mariadb/*

.PHONY: all up down build run fclean
